INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (200,'Invoice','PDF Report',3,100,0,'modules/bms/report/invoices_pdfinvoice.php','This report will gerneate and display an invoice in PDF format (which can be printed or saved).  The PDF file will contain one page per invoice.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (201,'Work Order','PDF Report',3,100,20,'modules/bms/report/invoices_pdfworkorder.php','This report will gerneate and display a work order  in PDF format (which can be printed or saved).  The PDF file will contain one page per work order.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (202,'Packing List','PDF Report',3,100,0,'modules/bms/report/invoices_pdfpackinglist.php','This report will gerneate and display an invoice packing list in PDF format (which can be printed or saved).  The PDF file will contain one page per invoice packing list.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (203,'Labels - Folder','PDF Report',2,50,0,'modules/bms/report/clients_folderlabels.php','Avery 5160 or compatible (3x10) Instructor Folder labels. \r\n\r\n **MAKE SURE when printing the pdf file, to TURN OFF the option \"shrink oversized pages to paper size\".**',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (204,'Labels - Mailing','PDF Report',2,50,0,'modules/bms/report/clients_mailinglabels.php','Avery 5160 or compatible (3x10) Instructor Folder labels. \r\n\r\n **MAKE SURE when printing the pdf file, to TURN OFF the option \"shrink oversized pages to paper size\".**',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (205,'Labels - Shipping','PDF Report',2,50,0,'modules/bms/report/clients_shippinglabels.php','Avery 5160 or compatible (3x10) Instructor Folder labels. \r\n\r\n **MAKE SURE when printing the pdf file, to TURN OFF the option \"shrink oversized pages to paper size\".**',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (206,'Labels - Shipping','PDF Report',3,60,0,'modules/bms/report/invoices_shippinglabels.php','Avery 5160 or compatible (3x10) Instructor Folder labels. \r\n\r\n **MAKE SURE when printing the pdf file, to TURN OFF the option \"shrink oversized pages to paper size\".**',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (207,'Totals - Custom','report',3,50,30,'modules/bms/report/invoices_totals.php','Creater your own custom invoice totaling report, specify groupings, totals, averages and whether to display summary, invoice, and invoice detail information.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (208,'Totals - Amt. w/  Invoices','report',3,50,30,'modules/bms/report/invoices_totals_amtwinv.php','Basic totals report. Shows invoice total, subtotal and amount due fields  and displaying indidivdual invoice information.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (209,'Totals - Amt. w/ Invoices + Line Items','report',3,50,30,'modules/bms/report/invoices_totals_amtwinvlineitems.php','Basic totals report. Shows invoice total, subtotal and amount due fields  and displaying indidivdual invoice and line item information.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (210,'Totals - Grouped by Acct. Manager','report',3,50,30,'modules/bms/report/invoices_totals_acctmngers.php','Totals report grouping by client account manager',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (211,'Totals - Grouped by Shipping Method','report',3,50,30,'modules/bms/report/invoices_totals_shippingmethod.php','Totals report including shipping ammount grouped by shipping method',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (212,'Totals - Grouped by Payment Method','report',3,50,30,'modules/bms/report/invoices_totals_payment.php','Totals report grouped by payment method.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (213,'Totals - Grouped by Invoice Lead Source','report',3,50,30,'modules/bms/report/invoices_totals_leadsource.php','Totals - Grouped by invoice lead source',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (214,'Quote','PDF Report',3,100,20,'modules/bms/report/invoices_pdfquote.php','PDF report for quote.  Does not include amount due.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (215,'Sales History','report',4,100,30,'modules/bms/report/products_saleshistory.php','Sales History for product including costs, average price and quantities.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (216,'Purchase History','report',2,10,0,'modules/bms/report/clients_purchasehistory.php','Client purchase history',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (217,'Totals - Custom','report',5,50,30,'modules/bms/report/lineitems_totals.php','Creat your own custom line item  totaling report, specify groupings, totals, averages and whether to display summary, invoice, and invoice detail information.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (218,'Totals - Product Categories','report',5,50,30,'modules/bms/report/lineitems_totals_productcategories.php','Totals report grouped first by product category and then by product.',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (219,'Totals - Product','report',5,50,30,'modules/bms/report/lineitems_totals_products.php','Totals report grouped by product displaying line items',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (220,'Totals - Lead Source','report',5,50,30,'modules/bms/report/lineitems_totals_leadsource.php','Totals grouped by invoice lead source and product',1,NOW(),1,NOW());
INSERT INTO `reports` (`id`, `name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES (221,'Client Notes Summary','PDF Report',2,10,0,'modules/bms/report/clients_notesummary.php','Print all notes associated with he client and any notes associated with client invoices.',1,NOW(),1,NOW());
INSERT INTO `reports` (`name`, `type`, `tabledefid`, `displayorder`, `roleid`, `reportfile`, `description`, `createdby`, `creationdate`, `modifiedby`, `modifieddate`) VALUES ('Totals - Tax', 'report', '3', '50', '30', 'modules/bms/report/invoices_totals_tax.php', 'Tax Totals', 1, NOW(), 1, NOW());