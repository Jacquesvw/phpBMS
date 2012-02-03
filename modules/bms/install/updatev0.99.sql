--settings INSERT--
INSERT INTO `settings` (`name`, `value`) VALUES ('show_payment_instructions','0');
INSERT INTO `settings` (`name`, `value`) VALUES ('invoice_paymentinstruc','Enter your payment details here');
--end settings INSERT--
--addresses ALTER--
ALTER TABLE `addresses` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `addresses` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end addresses ALTER--
--clients ALTER--
ALTER TABLE `clients` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `clients` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end clients ALTER--
--discounts ALTER--
ALTER TABLE `discounts` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `discounts` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end discounts ALTER--
--invoices ALTER--
ALTER TABLE `invoices` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `invoices` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end invoices ALTER--
--invoicestatuses ALTER--
ALTER TABLE `invoicestatuses` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `invoicestatuses` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end invoicestatuses ALTER--
--lineitems ALTER--
ALTER TABLE `lineitems` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `lineitems` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end lineitems ALTER--
--paymentmethods ALTER--
ALTER TABLE `paymentmethods` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `paymentmethods` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end paymentmethods ALTER--
--productcategories ALTER--
ALTER TABLE `productcategories` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `productcategories` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end productcategories ALTER--
--products ALTER--
ALTER TABLE `products` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `products` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end products ALTER--
--receipts ALTER--
ALTER TABLE `receipts` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `receipts` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end receipts ALTER--
--shippingmethods ALTER--
ALTER TABLE `shippingmethods` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `shippingmethods` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end shippingmethods ALTER--
--tax ALTER--
ALTER TABLE `tax` CHANGE `custom7` `custom7` tinyint(4) NOT NULL DEFAULT  '0';
ALTER TABLE `tax` CHANGE `custom8` `custom8` tinyint(4) NOT NULL DEFAULT  '0';
--end tax ALTER--