<?php
/*
 $Rev$ | $LastChangedBy$
 $LastChangedDate$
 +-------------------------------------------------------------------------+
 | Copyright (c) 2004 - 2007, Kreotek LLC                                  |
 | All rights reserved.                                                    |
 +-------------------------------------------------------------------------+
 |                                                                         |
 | Redistribution and use in source and binary forms, with or without      |
 | modification, are permitted provided that the following conditions are  |
 | met:                                                                    |
 |                                                                         |
 | - Redistributions of source code must retain the above copyright        |
 |   notice, this list of conditions and the following disclaimer.         |
 |                                                                         |
 | - Redistributions in binary form must reproduce the above copyright     |
 |   notice, this list of conditions and the following disclaimer in the   |
 |   documentation and/or other materials provided with the distribution.  |
 |                                                                         |
 | - Neither the name of Kreotek LLC nor the names of its contributore may |
 |   be used to endorse or promote products derived from this software     |
 |   without specific prior written permission.                            |
 |                                                                         |
 | THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     |
 | "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       |
 | LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A |
 | PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT      |
 | OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   |
 | SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        |
 | LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   |
 | DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   |
 | THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     |
 | (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   |
 | OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    |
 |                                                                         |
 +-------------------------------------------------------------------------+
*/

    include("../../include/session.php");

    require_once("../../include/search_class.php");

    //set the table passing stuff
    $tabledefid = 2;

    if(isset($_GET["refid"]))
        $_GET["id"]=$_GET["refid"];

    $refid = (integer) $_GET["id"];

    $securitywhere="";
    if ($_SESSION["userinfo"]["admin"]!=1 && count($_SESSION["userinfo"]["roles"])>0)
        $securitywhere=" AND files.roleid IN (".implode(",",$_SESSION["userinfo"]["roles"]).",0)";

    $whereclause="attachments.tabledefid=".$tabledefid." AND attachments.recordid=".$refid.$securitywhere;
    $backurl="../bms/clients_attachments.php";
    $base="../../";

    $refquery = "select firstname,lastname,company from clients where id=".$refid;
    $refquery = $db->query($refquery);
    $refrecord = $db->fetchArray($refquery);

    $pageTitle="Attachments: ";
    if($refrecord["company"]=="")
        $pageTitle.=$refrecord["firstname"]." ".$refrecord["lastname"];
    else
        $pageTitle.=$refrecord["company"];

    $tabgroup = "clients entry";
    $selectedtabid = "tab:19e34181-65f0-bfcf-6e09-99d0575ebd74";

    include("../base/attachments_records.php");

?>
