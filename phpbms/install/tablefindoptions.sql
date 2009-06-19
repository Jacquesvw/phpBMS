INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'My Events', 'notes.type=\'EV\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}}', '0', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'Public Events', 'notes.type=\'EV\' AND notes.private=0', '8', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'Undone Events Assigned To Me', '`notes`.`type`=\'EV\' AND `notes`.`assignedtoid`=\'{{$_SESSION[\'userinfo\'][\'id\']}}\' AND `notes`.`completed`=\'0\'', '17', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'Undone Events Assigned By Me', '`notes`.`type`=\'EV\' AND `notes`.`assignedbyid`=\'{{$_SESSION[\'userinfo\'][\'id\']}}\' AND `notes`.`completed`=\'0\'', '16', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'All Viewable Events', 'notes.type=\'EV\' AND !(notes.private=1 AND notes.createdby!={{$_SESSION[\'userinfo\'][\'id\']}})', '18', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'My Events - Today', 'notes.type=\'EV\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}} AND ((notes.startdate = curdate()) OR notes.`repeat`=1)', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'My Events - Yesterday', 'notes.type=\'EV\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}} AND ((notes.startdate = date_sub(curdate(),INTERVAL 1 DAY)) OR notes.`repeat`=1)', '2', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'My Events - This Week', 'notes.type=\'EV\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}} AND ((notes.startdate = year(notes.startdate)=year(curdate()) and week(notes.startdate)=week(curdate())) OR notes.repeat=1)', '4', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'My Events - This Month', 'notes.type=\'EV\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}} AND ((notes.startdate = year(notes.startdate)=year(curdate()) and month(notes.startdate)=month(curdate())) OR notes.repeat=1)', '6', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'My Events - Tomorrow', 'notes.type=\'EV\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}} AND (notes.startdate = date_add(curdate(),INTERVAL 1 DAY) OR notes.repeat=1)', '3', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'My Events - Next Month', 'notes.type=\'EV\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}} AND ((year(notes.startdate)=year(date_add(curdate(),INTERVAL 1 MONTH)) and month(notes.startdate)=month(date_add(curdate(),INTERVAL 1 MONTH))) OR notes.repeat=1)', '7', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'My Events - Next Week', 'notes.type=\'EV\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}} AND ((notes.startdate = year(notes.startdate)=year(date_add(curdate(),INTERVAL 1 WEEK)) and week(notes.startdate)=week(date_add(curdate(),INTERVAL 1 WEEK))) OR notes.repeat=1)', '5', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'Public Events - Today', 'notes.type=\'EV\' AND notes.private=0 AND ((notes.startdate = curdate()) OR notes.repeat=1)', '9', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'Public Events - Yesterday', 'notes.type=\'EV\' AND notes.private=0 AND ((notes.startdate = date_sub(curdate(),INTERVAL 1 DAY)) OR notes.repeat=1)', '10', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'Public Events - Tomorrow', 'notes.type=\'EV\' AND notes.private=0 AND (notes.startdate = date_add(curdate(),INTERVAL 1 DAY) OR notes.repeat=1)', '11', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'Public Events - This Week', 'notes.type=\'EV\' AND notes.private=0 AND ((notes.startdate = year(notes.startdate)=year(curdate()) and week(notes.startdate)=week(curdate())) OR notes.repeat=1)', '12', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'Public Events - Next Week', 'notes.type=\'EV\' AND notes.private=0 AND ((notes.startdate = year(notes.startdate)=year(date_add(curdate(),INTERVAL 1 WEEK)) and week(notes.startdate)=week(date_add(curdate(),INTERVAL 1 WEEK))) OR notes.repeat=1)', '13', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'Public Events - This Month', 'notes.type=\'EV\' AND notes.private=0 AND ((notes.startdate = year(notes.startdate)=year(curdate()) and month(notes.startdate)=month(curdate())) OR notes.repeat=1)', '14', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:0fcca651-6c34-c74d-ac04-2d88f602dd71', 'Public Events - Next Month', 'notes.type=\'EV\' notes.private=0 AND ((year(notes.startdate)=year(date_add(curdate(),INTERVAL 1 MONTH)) and month(notes.startdate)=month(date_add(curdate(),INTERVAL 1 MONTH))) OR notes.repeat=1)', '15', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:29925e0a-c825-0067-8882-db4b57866a96', 'All Records', 'smartsearches.id!=-1', '0', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:2ad5146c-d4c0-db8e-592a-c0cc2f3c2c21', 'All Records', 'widgets.id!=-1', '0', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:2bc3e683-81f9-694a-9550-a0c7263057de', 'My Uncompleted Tasks', 'notes.type=\'TS\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}} AND completed=0', '0', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:2bc3e683-81f9-694a-9550-a0c7263057de', 'My Tasks', 'notes.type=\'TS\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}}', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:2bc3e683-81f9-694a-9550-a0c7263057de', 'Uncomplete Tasks Assigned To Me', '`notes`.`type`=\'TS\' AND `notes`.`assignedtoid`=\'{{$_SESSION[\'userinfo\'][\'id\']}}\' AND `notes`.`completed`=\'0\'', '2', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:2bc3e683-81f9-694a-9550-a0c7263057de', 'Uncomplete Tasks Assigned By Me', 'notes.type=\'NT\' and notes.assignedbyid={{$_SESSION[\'userinfo\'][\'id\']}} and notes.completed=0', '3', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:2bc3e683-81f9-694a-9550-a0c7263057de', 'Public Uncomplete Tasks', 'notes.type=\'TS\' AND notes.private=0 AND notes.completed=0', '4', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:2bc3e683-81f9-694a-9550-a0c7263057de', 'Public Tasks', '`notes`.`type`=\'TS\' AND `notes`.`private`=\'0\'', '5', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:2bc3e683-81f9-694a-9550-a0c7263057de', 'All Viewable Tasks', 'notes.type=\'TS\' AND !(notes.private=1 AND notes.createdby!={{$_SESSION[\'userinfo\'][\'id\']}})', '6', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:3f71ab66-1f84-d68b-e2a3-3ee3bb0ec667', 'entries within last day', 'log.stamp> DATE_SUB(CURDATE(),INTERVAL 1 DAY)', '0', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:3f71ab66-1f84-d68b-e2a3-3ee3bb0ec667', 'entries within last week', 'log.stamp> DATE_SUB(CURDATE(),INTERVAL 1 WEEK)', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:3f71ab66-1f84-d68b-e2a3-3ee3bb0ec667', 'all entries', 'log.id!=-1', '2', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:5c9d645f-26ab-5003-b98e-89e9049f8ac3', 'All Records', 'tabledefs.id !=0', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:7e75af48-6f70-d157-f440-69a8e7f59d38', 'All Records', 'tabs.id!=-1', '0', 'Admin');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:80b4f38d-b957-bced-c0a0-ed08a0db6475', 'All Records', 'files.id!=0', '0', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:83187e3d-101e-a8a5-037f-31e9800fed2d', 'All Records', 'menu.id!=0', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:83de284b-ef79-3567-145c-30ca38b40796', 'all records', 'scheduler.id!=0', '0', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:87b9fe06-afe5-d9c6-0fa0-4a0f2ec4ee8a', 'Active Roles', 'roles.inactive=0', '0', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:87b9fe06-afe5-d9c6-0fa0-4a0f2ec4ee8a', 'Inactive Roles', 'roles.inactive=1', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:87b9fe06-afe5-d9c6-0fa0-4a0f2ec4ee8a', 'All Records', 'roles.id!=-100', '2', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:8d19c73c-42fb-d829-3681-d20b4dbe43b9', 'All Records', 'relationships.id !=0', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:a4cdd991-cf0a-916f-1240-49428ea1bdd1', 'My Notes', 'notes.type=\'NT\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}}', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:a4cdd991-cf0a-916f-1240-49428ea1bdd1', 'All Viewable Notes and System Notes', 'notes.type=\'SM\' OR ( notes.type=\'NT\' AND !(notes.private=1 AND notes.createdby!={{$_SESSION[\'userinfo\'][\'id\']}}))', '7', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:a4cdd991-cf0a-916f-1240-49428ea1bdd1', 'Unread Notes Assigned To Me', '`notes`.`type`=\'NT\' AND `notes`.`assignedtoid`=\'{{$_SESSION[\'userinfo\'][\'id\']}}\' AND `notes`.`completed`=\'0\'', '2', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:a4cdd991-cf0a-916f-1240-49428ea1bdd1', 'Unread Notes Assigned By Me', '`notes`.`type`=\'NT\' AND `notes`.`assignedbyid`=\'{{$_SESSION[\'userinfo\'][\'id\']}}\' AND `notes`.`completed`=\'0\'', '3', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:a4cdd991-cf0a-916f-1240-49428ea1bdd1', 'System Messages', 'notes.type=\"SM\"', '4', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:a4cdd991-cf0a-916f-1240-49428ea1bdd1', 'Public Notes', 'notes.type=\'NT\' AND notes.private=0', '6', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:a4cdd991-cf0a-916f-1240-49428ea1bdd1', 'My Unread Notes', 'notes.type=\'NT\' AND notes.createdby = {{$_SESSION[\'userinfo\'][\'id\']}} AND completed=0', '0', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:a4cdd991-cf0a-916f-1240-49428ea1bdd1', 'Public Unread Notes', 'notes.type=\'NT\' AND notes.private=0 AND notes.completed=0', '5', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:afe6d297-b484-4f0b-57d4-1c39412e9dfb', 'All Users', 'users.id!=0', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:afe6d297-b484-4f0b-57d4-1c39412e9dfb', 'Revoked Users', 'users.revoked=1', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:d595ef42-db9d-2233-1b9b-11dfd0db9cbb', 'All Reports', 'reports.id != 0', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:e251524a-2da4-a0c9-8725-d3d0412d8f4a', 'All Records', 'usersearches.id != 0', '1', '');
INSERT INTO `tablefindoptions` (`tabledefid`, `name`, `search`, `displayorder`, `roleid`) VALUES ('tbld:ea159d67-5e89-5b7f-f5a0-c740e147cd73', 'All Records', 'modules.id!=0', '1', '');