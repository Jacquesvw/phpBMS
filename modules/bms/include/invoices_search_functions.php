<?php
//=============================================
//functions
//=============================================

//mark orders as shipped
function mark_ashipped($theids){
	global $dblink;

	//passed variable is array of user ids to be revoked
	$whereclause=buildWhereClause($theids,"invoices.id");
	
	$querystatement = "UPDATE invoices SET invoices.status=\"Shipped\",invoices.shippeddate=Now(),modifiedby=\"".$_SESSION["userinfo"]["id"]."\" WHERE (".$whereclause.") AND (invoices.type!=\"Invoice\" or invoices.type!=\"VOID\");";
	$queryresult = mysql_query($querystatement,$dblink);
	if (!$queryresult) reportError(300,"Couldn't Mark As Shipped: ".mysql_error($dblink)." -- ".$querystatement);		
	
	$message=buildStatusMessage(mysql_affected_rows($dblink),count($theids));
	$message.=" marked as shipped.";

	return $message;
}


//mark as paid in full
function mark_aspaid($theids){
	global $dblink;

	//passed variable is array of user ids to be revoked
	$whereclause=buildWhereClause($theids,"invoices.id");
	
	$querystatement = "UPDATE invoices SET invoices.amountpaid=invoices.totalti,modifiedby=\"".$_SESSION["userinfo"]["id"]."\" WHERE (".$whereclause.") AND (invoices.type!=\"Invoice\" OR invoices.type!=\"VOID\")";
	$queryresult = mysql_query($querystatement,$dblink);
	if (!$queryresult) reportError(300,"Couldn't Mark As Paid In Full: ".mysql_error($dblink)." -- ".$querystatement);		
	
	$message=buildStatusMessage(mysql_affected_rows($dblink),count($theids));
	$message.=" marked as paid in full.";

	return $message;
}

//mark as invoice
function mark_asinvoice($theids){
	global $dblink;

	//passed variable is array of user ids to be revoked
	$whereclause=buildWhereClause($theids,"invoices.id");
	
	$querystatement = "UPDATE invoices SET invoices.type=\"Invoice\",invoices.status=\"shipped\",invoices.invoicedate=ifnull(invoices.invoicedate,Now()),modifiedby=\"".$_SESSION["userinfo"]["id"]."\" WHERE (".$whereclause.") AND (invoices.type!=\"Invoice\" OR invoices.type!=\"VOID\") AND invoices.amountpaid=invoices.totalti;";
	$queryresult = mysql_query($querystatement,$dblink);
	if (!$queryresult) reportError(300,"Could not convert to client: ".mysql_error($dblink)." -- ".$querystatement);		
	
	$message=buildStatusMessage(mysql_affected_rows($dblink),count($theids));
	$message.=" converted to invoice.";

	return $message;
}

//mark as un-invoice
function mark_asuninvoice($theids){
	global $dblink;

	//passed variable is array of user ids to be revoked
	$whereclause=buildWhereClause($theids,"invoices.id");
	
	$querystatement = "UPDATE invoices SET invoices.type=\"Order\",modifiedby=\"".$_SESSION["userinfo"]["id"]."\"  WHERE (".$whereclause.") AND (invoices.type=\"Invoice\");";
	$queryresult = mysql_query($querystatement,$dblink);
	if (!$queryresult) reportError(300,"Couldn't Reset Invoice Status: ".mysql_error($dblink)." -- ".$querystatement);		
	
	$message=buildStatusMessage(mysql_affected_rows($dblink),count($theids));
	$message.=" reset invoice status.";

	return $message;
}

//void/delete
function delete_record($theids){
	global $dblink;

	//passed variable is array of user ids to be revoked
	$whereclause=buildWhereClause($theids,"invoices.id");
	
	$querystatement = "UPDATE invoices SET invoices.type=\"VOID\",modifiedby=\"".$_SESSION["userinfo"]["id"]."\" WHERE (".$whereclause.") AND invoices.type!=\"Invoice\";";
	$queryresult = mysql_query($querystatement,$dblink);
	if (!$queryresult) reportError(300,"Couldn't Void: ".mysql_error($dblink)." -- ".$querystatement);		
	
	$message=buildStatusMessage(mysql_affected_rows($dblink),count($theids));
	$message.=" voided.";

	return $message;
}


?>