<?php 
function checkForBMS(){
	global $dblink;

	$querystatement="SELECT id FROM modules WHERE name=\"bms\" ";
	$queryresult=mysql_query($querystatement,$dblink);
	if(!$queryresult) reportError(300,"Error Retrieving Module Information: ".mysql_error($dblink)."<br />".$querystatement);
	if (mysql_num_rows($queryresult)) return true; else return false;
}

function showSystemMessages(){
	global $dblink;
	
	$querystatement="SELECT notes.id,subject,content,concat(users.firstname,\" \",users.lastname) as createdby,
					date_format(notes.creationdate,\"%c/%e/%Y\") as creationdate
					FROM notes INNER JOIN users ON notes.createdby=users.id
					WHERE type=\"SM\" ORDER BY importance DESC,notes.creationdate";
					
	$queryresult=mysql_query($querystatement,$dblink);
	if(!$queryresult) reportError(300,"Error Retrieving System Messages: ".mysql_error($dblink)."<br />".$querystatement);
	
	if(mysql_num_rows($queryresult)){ 
	?>
	<div class="box">		
		<div style="float:right;cursor:pointer;cursor:hand;"><img src="<?php echo $_SESSION["app_path"]?>common/stylesheet/<?php echo $_SESSION["stylesheet"] ?>/button-up.png" align="absmiddle" alt="hide" onClick="hideSection(this,'systemMessages')" width="16" height="16" border="0" /></div>
		<h2 style="margin-top:4px;">System Messages</h2>
		<div id="systemMessages" style="margin:0px;padding:0px">
		<?php while($therecord=mysql_fetch_array($queryresult)) {
				$therecord["content"]=str_replace("\n","<br />",$therecord["content"]);
		?>
		<div>
			<a href="/Show Content" onClick="showContent(<?php echo $therecord["id"]?>);return false;">
			<?php if($therecord["content"]) {?>
			<img src="../../common/image/left_arrow.gif" width="10" height="10" border="0" id="SMG<?php echo $therecord["id"]?>" />
			<?php } else {?>
			<img src="../../common/image/spacer.gif" width="10" height="10" border="0" id="SMG<?php echo $therecord["id"]?>" />				
			<?php }?><em style="font-weight:normal;"><?php echo $therecord["creationdate"]?> <?php echo $therecord["createdby"]?></em> - <?php echo $therecord["subject"]?></a>
		</div>
		<?php if($therecord["content"]) {?>
		<div class="small SysMessageContent"  id="SMT<?php echo $therecord["id"]?>">
			<?php echo $therecord["content"]?>
		</div>			
		<?php } } ?>
		</div>
	</div>
	<?php } 
}


function showTasks($userid,$type="Tasks"){
	global $dblink;
	$querystatement="SELECT id,type,subject, completed, if(enddate < CURDATE(),1,0) as ispastdue, startdate, private, assignedbyid, assignedtoid
				FROM notes
				WHERE ";
	switch($type){
		case "Tasks":
			$querystatement.=" type=\"TS\" AND (private=0 or (private=1 and createdby=".$userid.")) AND (completed=0 or (completed=1 and completeddate=CURDATE()))";
			$querystatement.=" AND (assignedtoid is null or assignedtoid=0)";
		break;
		case "ReceivedAssignments":
			$querystatement.=" assignedtoid=".$userid." AND (completed=0 or (completed=1 and completeddate=CURDATE()))";
		break;
		case "GivenAssignments":
			$querystatement.=" assignedbyid=".$userid." AND (completed=0 or (completed=1 and completeddate=CURDATE()))";
		break;
	}
	$querystatement.=" ORDER BY importance DESC,notes.enddate DESC,notes.endtime DESC,notes.startdate DESC,notes.starttime DESC,notes.creationdate DESC";

	
	$queryresult=mysql_query($querystatement,$dblink);
	if(!$queryresult) reportError(300,"Error Retrieving System Messages: ".mysql_error($dblink)."<br />".$querystatement);
	if(mysql_num_rows($queryresult)){ 	
		while($therecord=mysql_fetch_array($queryresult)) {
		$className="task";		
		if($therecord["completed"]) 
			$className.=" taskCompleted";
		else if($therecord["ispastdue"]) 
			$className.=" taskPastDue";
		if($therecord["private"]) $className.=" taskPrivate";
		
	?>
	<div id="TS<?php echo $therecord["id"]?>" class="small <?php echo $className?>">
		<input type="hidden" id="TSprivate<?php echo $therecord["id"]?>" value="<?php echo $therecord["private"]?>"/>
		<input type="hidden" id="TSispastdue<?php echo $therecord["id"]?>" value="<?php echo $therecord["ispastdue"]?>"/>
		<input class="radiochecks" id="TSC<?php echo $therecord["id"]?>" name="TSC<?php echo $therecord["id"]?>" type="checkbox" value="1" <?php if($therecord["completed"]) echo "checked"?> onClick="checkTask(<?php echo $therecord["id"]?>,'<?php echo $therecord["type"]?>')" align="middle"/>
		<a href="<?php echo getAddEditFile(12)."?id=".$therecord["id"]?>&backurl=snapshot.php"><?php echo $therecord["subject"]?></a>
		<?php if($type!="Tasks"){?> <em>(<?php if($type=="ReceivedAssignments") $tid=$therecord["assignedbyid"]; else $tid=$therecord["assignedtoid"]; echo getUserName($tid)?>)</em><?php } ?>
	</div>
	<?php } } else {
	?><div class="small disabledtext">no <?php if($type=="Tasks") echo "tasks"; else echo "assignments"?></div><?php
	}
}



function showTodaysClients($interval="1 DAY"){
	global $dblink;
	$querystatement="SELECT id,
					clients.type, clients.city,clients.state,clients.postalcode,
					if(clients.lastname!=\"\",concat(clients.lastname,\", \",clients.firstname,if(clients.company!=\"\",concat(\" (\",clients.company,\")\"),\"\")),clients.company) as thename
					FROM clients
					WHERE creationdate>= DATE_SUB(NOW(),INTERVAL ".$interval.") 
					ORDER BY creationdate DESC LIMIT 0,50
	";
	$queryresult=mysql_query($querystatement,$dblink);
	if(!$queryresult) reportError(300,"Error Retrieving System Messages: ".mysql_error($dblink)."<br />".$querystatement);	
	if(mysql_num_rows($queryresult)){
		?><table border="0" cellpadding="0" cellspacing="0" class="smallQueryTable">
			<TR>
				<TH align="left">ID</TH>
				<TH align="left">Type</TH>
				<TH align="left" width="100%">Name</TH>
				<th nowrap align="right">City, State/Prov Zip/Postal</th>
			</TR>
		<?php 	
		while($therecord=mysql_fetch_array($queryresult)){
			$displayType=str_pad($therecord["type"],10,".",STR_PAD_RIGHT);
			$displayType=ucwords(str_replace(".","&nbsp;",$displayType));
			$displayCSZ=$therecord["city"].", ".$therecord["state"]." ".$therecord["postalcode"];
			if($displayCSZ==",  ") $displayCSZ="&nbsp;";
		?><tr onClick="document.location='<?php echo getAddEditFile(2)."?id=".$therecord["id"] ?>'">
			<TD><?php echo $therecord["id"]?></TD>
			<TD><?php echo $therecord["type"]?></TD>
			<TD><?php echo $therecord["thename"]?></TD>
			<TD align="right"><?php echo $displayCSZ?></TD>
		</tr><?php }?></table><?php
	} else {?><div class="small disabledtext">no clients/prospects entered in last day</div><?php
	}
}

function showTodaysOrders($interval="1 DAY"){
	global $dblink;
	$querystatement="SELECT invoices.id,
					invoices.status,
					if(clients.lastname!=\"\",concat(clients.lastname,\", \",clients.firstname,if(clients.company!=\"\",concat(\" (\",clients.company,\")\"),\"\")),clients.company) as thename,
					if(invoices.totalti>=0,concat(\"$\",format(invoices.totalti,2)),concat(\"-$\",format(abs(invoices.totalti),2))) as total,
					if(invoices.totalti-invoices.amountpaid>=0,concat(\"$\",format((invoices.totalti-invoices.amountpaid),2)),concat(\"-$\",format(abs(invoices.totalti-invoices.amountpaid),2))) as amtdue
					FROM invoices INNER JOIN clients ON invoices.clientid=clients.id
					WHERE invoices.creationdate>= DATE_SUB(NOW(),INTERVAL ".$interval.") AND (invoices.type=\"Order\")
					ORDER BY invoices.creationdate DESC LIMIT 0,50
	";

	$queryresult=mysql_query($querystatement,$dblink);
	if(!$queryresult) reportError(300,"Error Retrieving System Messages: ".mysql_error($dblink)."<br />".$querystatement);
	if(mysql_num_rows($queryresult)){
		?><table border="0" cellpadding="0" cellspacing="0" class="smallQueryTable">
			<TR>
				<TH align="left">ID</TH>
				<TH align="left">Status</TH>
				<TH width="100%" align="left">Name</TH>
				<th align="right">Total</th>
				<th align="right">Due</th>
			</TR>
		<?php 
		while($therecord=mysql_fetch_array($queryresult)){				
		?><tr onClick="document.location='<?php echo getAddEditFile(3)."?id=".$therecord["id"] ?>'">
			<TD><?php echo $therecord["id"]?></TD>
			<TD><?php echo $therecord["status"]?></TD>
			<TD><?php echo $therecord["thename"]?></TD>
			<TD align="right"><?php echo $therecord["total"]?></TD>
			<TD align="right"><?php echo $therecord["amtdue"]?></TD>
		</tr><?php }?>
		</table><?php
	} else {?><div class="small disabledtext">no orders entered in last day</div><?php
	}
}







function showSevenDays($userid){
	
	$theday=mktime(0,0,0);
	
	$repeatArray =getRepeatableInTime($theday,strtotime("7 days",$theday),$userid);
	
	$today="Today - (";
	$rownum=0;
	?><table border="0" cellspacing="0" cellpadding="0" width="100%"><?php
	for($i=0;$i<7;$i++){
		?><tr><td colspan=2 class="eventDayName"><?php echo $today.strftime("%A",$theday); if($today){echo ")"; $today="";}?></td></tr><?php 
		$donext=true;

		$queryresult=getEventsForDay($theday,$userid,$repeatArray[$theday]);
		if (mysql_num_rows($queryresult)){
			while($therecord=mysql_fetch_array($queryresult)){
				$times=$therecord["starttime"]."&nbsp;";
				if($therecord["endtime"]){
					$times.= "- ";
					if($therecord["startdate"]!=$therecord["enddate"])
						$times.=$therecord["fenddate"]." ";
					$times.=$therecord["endtime"]." ";								
				}
				?><tr>
					<td class="small event" nowrap valign="top"><?php echo $times?></td>
					<td class="small event" valign="top" width="100%"><a href="<?php echo getAddEditFile(12)."?id=".$therecord["id"]?>&backurl=snapshot.php"><?php echo $therecord["subject"]?></a></td>
				</tr><?php
			}
		} else {
			?><tr><td colspan=2 class="small event disabledtext">no events</td></tr><?php		
		}		
						
		$theday=strtotime("tomorrow",$theday);
	}//end for
	?></table><?php
	
}

function getRepeatableInTime($fromdate,$todate,$userid){
	global $dblink;
	
	//first we create the array
	$theday=$fromdate;
	$repeatList=false;
	while ($theday<$todate){
		$repeatList[$theday]=array();
		$theday=strtotime("tomorrow",$theday);
	}
	
	$querystatement="SELECT id,startdate,repeatdays,repeatfrequency,repeattimes,repeattype,repeatuntildate FROM notes WHERE repeat=1 AND type=\"EV\" AND (private=0 or (private=1 and createdby=".$userid."))";
	$queryresult=mysql_query($querystatement,$dblink);
	if(!$queryresult) reportError(300,"Error Retrieving Repeatable Events: ".mysql_error($dblink)."<br />".$querystatement);
	
	while($therecord=mysql_fetch_array($queryresult)){		
		$startdate=dateFromSQLDate($therecord["startdate"]);
		$repeatuntil=dateFromSQLDate($therecord["repeatuntildate"]);

		foreach($repeatList as $targetdate=>$unused){
			if($therecord["repeattimes"]!=-1 || $repeatuntil>=$targetdate){
				$rpTimes=0;				
				$testdate=$startdate;
				switch($therecord["repeattype"]){
					case "repeatDaily":
						while($testdate<$targetdate && ($therecord["repeattimes"]<=0 || $therecord["repeattimes"]>$rpTimes)){
							$testdate=strtotime($therecord["repeatfrequency"]." days",$testdate);
							if($testdate==$targetdate)
								$repeatList[$targetdate][]=$therecord["id"];
							$rpTimes++;
						}
					break;
					case "repeatYearly":
						while($testdate<$targetdate && ($therecord["repeattimes"]<=0 || $therecord["repeattimes"]>$rpTimes)){
							$testdate=strtotime($therecord["repeatfrequency"]." years",$testdate);
							if($testdate==$targetdate)
								$repeatList[$targetdate][]=$therecord["id"];
							$rpTimes++;
						}
					break;
					case "repeatMonthlybyDate":
						while($testdate<$targetdate && ($therecord["repeattimes"]<=0 || $therecord["repeattimes"]>$rpTimes)){
							$testdate=strtotime($therecord["repeatfrequency"]." months",$testdate);
							if($testdate==$targetdate)
								$repeatList[$targetdate][]=$therecord["id"];
							$rpTimes++;
						}
					case "repeatMonthlybyDay":
						$testWeekNum=ceil(strftime("%d",$startdate)/7);
						$targetLastDay=date("t",$targetdate);
						while($testdate<$targetdate && ($therecord["repeattimes"]<=0 || $therecord["repeattimes"]>$rpTimes)){
							$testdate=strtotime($therecord["repeatfrequency"]." months",$testdate);
							$targetWeekNum=ceil(strftime("%d",$targetdate)/7);
														
							if(strftime("%m %Y",$testdate)==strftime("%m %Y",$targetdate) && ($testWeekNum==$targetWeekNum || ($testWeekNum==5 && strftime("%d",$targetdate)+7>$targetLastDay)) && strftime("%A",$startdate)==strftime("%A",$targetdate))
								$repeatList[$targetdate][]=$therecord["id"];
							$rpTimes++;
						}
					case "repeatWeekly":
						while($testdate<$targetdate && ($therecord["repeattimes"]<=0 || $therecord["repeattimes"]>$rpTimes)){
							$testdate=strtotime($therecord["repeatfrequency"]." weeks",$testdate);
							
							if(strftime("%W %Y",$testdate)==strftime("%W %Y",$targetdate)){
								$dayAbbrev="";
								switch(strftime("%A",$targetdate)){
									case "Sunday":
										$dayAbbrev="s";
									break;
									case "Monday":
										$dayAbbrev="m";
									break;
									case "Tuesday":
										$dayAbbrev="t";
									break;
									case "Wednesday":
										$dayAbbrev="w";
									break;
									case "Thursday":
										$dayAbbrev="r";
									break;
									case "Friday":
										$dayAbbrev="f";
									break;
									case "Saturday":
										$dayAbbrev="a";
									break;
									
								}
								if (strpos(" ".$therecord["repeatdays"],$dayAbbrev))
									$repeatList[$targetdate][]=$therecord["id"];
							}
							$rpTimes++;
						}
					break;
				}//end switch
			}//end if
		}//end foreach (day)
	}//end while (record)
	return $repeatList;
}

function getEventsForDay($day,$userid,$repeatArray){
	global $dblink;
	
	$repeatIDs="";
	if(count($repeatArray)){
		$repeatIDs=" OR notes.id in(";
		foreach($repeatArray as $id)
			$repeatIDs.=$id.", ";
		$repeatIDs=substr($repeatIDs,0,strlen($repeatIDs)-2);
		$repeatIDs.=") ";
	}
	$querystatement="SELECT DISTINCT id,subject, startdate,enddate,
				date_format(enddate,\"%c/%e/%Y\") as fenddate,
				time_format(starttime,\"%l:%i %p\") as starttime,
				time_format(endtime,\"%l:%i %p\") as endtime
				FROM notes
				WHERE type=\"EV\" AND (startdate=\"".strftime("%Y-%m-%d",$day)."\" ".$repeatIDs.") AND (private=0 or (private=1 and createdby=".$userid.")) 
				ORDER BY notes.starttime,notes.endtime,importance DESC";

	$queryresult=mysql_query($querystatement,$dblink);
	if(!$queryresult) reportError(300,"Error Retrieving days events: ".mysql_error($dblink)."<br />".$querystatement);
	
	return $queryresult;
}
?>
