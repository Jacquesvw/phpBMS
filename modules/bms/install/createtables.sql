CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `shiptoname` varchar(128) DEFAULT NULL,
  `address1` varchar(128) DEFAULT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postalcode` varchar(15) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `notes` text,
  `createdby` int(10) unsigned NOT NULL,
  `creationdate` datetime NOT NULL,
  `modifiedby` int(10) unsigned DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `addresstorecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tabledefid` varchar(64) NOT NULL,
  `recordid` varchar(64) NOT NULL,
  `addressid` varchar(64) NOT NULL,
  `defaultshipto` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `primary` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createdby` int(10) unsigned NOT NULL,
  `creationdate` datetime NOT NULL,
  `modifiedby` int(10) unsigned DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `recordid` (`recordid`),
  KEY `tabledefid` (`tabledefid`),
  KEY `addressid` (`addressid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `aritems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `clientid` varchar(64) NOT NULL,
  `type` enum('invoice','credit','service charge') NOT NULL,
  `status` enum('open','closed') NOT NULL,
  `itemdate` date NOT NULL,
  `relatedid` varchar(64) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `paid` double NOT NULL DEFAULT '0',
  `aged1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `aged2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `aged3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `posted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `createdby` int(10) unsigned NOT NULL,
  `creationdate` datetime NOT NULL,
  `modifiedby` int(10) unsigned DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL DEFAULT '',
  `lastname` varchar(64) NOT NULL DEFAULT '',
  `company` varchar(128) NOT NULL DEFAULT '',
  `type` enum('prospect','client') NOT NULL DEFAULT 'prospect',
  `becameclient` date DEFAULT NULL,
  `inactive` tinyint(4) NOT NULL DEFAULT '0',
  `category` varchar(128) DEFAULT NULL,
  `homephone` varchar(25) DEFAULT NULL,
  `workphone` varchar(25) DEFAULT NULL,
  `mobilephone` varchar(25) DEFAULT NULL,
  `fax` varchar(25) DEFAULT NULL,
  `otherphone` varchar(25) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `canemail` tinyint(1) NOT NULL DEFAULT '0',
  `webaddress` varchar(128) DEFAULT NULL,
  `taxid` varchar(64) DEFAULT NULL,
  `salesmanagerid` varchar(64) DEFAULT NULL,
  `leadsource` varchar(64) DEFAULT NULL,
  `address1` varchar(128) DEFAULT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postalcode` varchar(15) DEFAULT NULL,
  `country` varchar(64) DEFAULT '',
  `comments` text,
  `paymentmethodid` varchar(64) DEFAULT NULL,
  `shippingmethodid` varchar(64) DEFAULT NULL,
  `discountid` varchar(64) DEFAULT NULL,
  `taxareaid` varchar(64) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `hascredit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `creditlimit` double DEFAULT NULL,
  `createdby` int(11) NOT NULL DEFAULT '0',
  `creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `notin` (`inactive`),
  KEY `thefirstname` (`firstname`),
  KEY `created` (`creationdate`),
  KEY `thelastname` (`lastname`),
  KEY `thecompany` (`company`),
  KEY `thetype` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `name` varchar(128) DEFAULT '',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('percent','amount') NOT NULL DEFAULT 'percent',
  `value` double NOT NULL DEFAULT '0',
  `description` text,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creationdate` datetime DEFAULT NULL,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `clientid` varchar(64) DEFAULT NULL,
  `type` enum('Quote','Order','Invoice','VOID') DEFAULT NULL,
  `iscreditmemo` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cmuuid` varchar(64) DEFAULT NULL,
  `postingsessionid` int(11) DEFAULT NULL,
  `statusid` varchar(64) DEFAULT NULL,
  `statusdate` date DEFAULT NULL,
  `readytopost` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `assignedtoid` varchar(64) DEFAULT NULL,
  `ponumber` varchar(64) DEFAULT NULL,
  `orderdate` date DEFAULT NULL,
  `invoicedate` date DEFAULT NULL,
  `requireddate` date DEFAULT NULL,
  `leadsource` varchar(64) DEFAULT NULL,
  `address1` varchar(128) DEFAULT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL,
  `postalcode` varchar(15) DEFAULT NULL,
  `country` varchar(64) DEFAULT '',
  `weborder` tinyint(1) DEFAULT '0',
  `webconfirmationno` varchar(64) DEFAULT '',
  `discountid` varchar(64) DEFAULT NULL,
  `discountamount` double NOT NULL DEFAULT '0',
  `totaltni` double DEFAULT '0',
  `taxareaid` varchar(64) DEFAULT NULL,
  `taxpercentage` double DEFAULT NULL,
  `totaltaxable` double DEFAULT '0',
  `tax` double DEFAULT '0',
  `shippingmethodid` varchar(64) DEFAULT NULL,
  `totalweight` double DEFAULT '0',
  `trackingno` varchar(64) DEFAULT NULL,
  `shipping` double DEFAULT '0',
  `totalcost` double DEFAULT '0',
  `totalti` double DEFAULT '0',
  `amountpaid` double DEFAULT '0',
  `paymentmethodid` varchar(64) DEFAULT NULL,
  `ccexpiration` blob,
  `ccnumber` blob,
  `ccverification` blob,
  `bankname` varchar(64) DEFAULT NULL,
  `checkno` varchar(32) DEFAULT NULL,
  `routingnumber` blob,
  `accountnumber` blob,
  `transactionid` varchar(64) DEFAULT NULL,
  `printedinstructions` text,
  `specialinstructions` text,
  `createdby` int(11) NOT NULL DEFAULT '0',
  `creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shiptoname` varchar(128) DEFAULT NULL,
  `shiptoaddress1` varchar(128) DEFAULT NULL,
  `shiptoaddress2` varchar(128) DEFAULT NULL,
  `shiptocity` varchar(64) DEFAULT NULL,
  `shiptostate` varchar(20) DEFAULT NULL,
  `shiptopostalcode` varchar(15) DEFAULT NULL,
  `shiptocountry` varchar(64) DEFAULT NULL,
  `billingaddressid` varchar(64) DEFAULT NULL,
  `shiptoaddressid` varchar(64) DEFAULT NULL,
  `shiptosameasbilling` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `client` (`clientid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 PACK_KEYS=0;

CREATE TABLE `invoicestatuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `setreadytopost` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `invoicedefault` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `defaultassignedtoid` varchar(64) DEFAULT NULL,
  `inactive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `priority` int(10) unsigned NOT NULL DEFAULT '0',
  `createdby` int(10) unsigned DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `modifiedby` int(10) unsigned DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `invoicestatushistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoicedefault` int(10) unsigned DEFAULT NULL,
  `invoiceid` varchar(64) NOT NULL,
  `invoicestatusid` varchar(64) NOT NULL,
  `statusdate` date DEFAULT NULL,
  `assignedtoid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `lineitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) NOT NULL DEFAULT '0',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `productid` varchar(64) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `unitcost` double DEFAULT NULL,
  `unitprice` double DEFAULT NULL,
  `unitweight` double DEFAULT NULL,
  `memo` text,
  `taxable` tinyint(4) NOT NULL DEFAULT '1',
  `createdby` int(11) NOT NULL DEFAULT '0',
  `creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  KEY `invoice` (`invoiceid`),
  KEY `product` (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `paymentmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `type` varchar(32) DEFAULT NULL,
  `priority` int(8) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `onlineprocess` tinyint(1) NOT NULL DEFAULT '0',
  `processscript` varchar(128) DEFAULT '',
  `createdby` int(11) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `postingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessiondate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `source` varchar(64) NOT NULL DEFAULT '',
  `recordsposted` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `prerequisites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `childid` varchar(64) NOT NULL,
  `parentid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `child` (`childid`),
  KEY `parent` (`parentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `productcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `parentid` varchar(64) NOT NULL DEFAULT '',
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `inactive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `webenabled` tinyint(1) NOT NULL DEFAULT '0',
  `webdisplayname` varchar(64) DEFAULT '',
  `createdby` int(11) NOT NULL DEFAULT '0',
  `creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `categoryid` varchar(64) NOT NULL DEFAULT '',
  `createdby` int(11) NOT NULL DEFAULT '0',
  `creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` varchar(255) DEFAULT NULL,
  `isoversized` tinyint(4) NOT NULL DEFAULT '0',
  `isprepackaged` tinyint(4) NOT NULL DEFAULT '0',
  `packagesperitem` double DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `partname` varchar(128) DEFAULT NULL,
  `partnumber` varchar(32) NOT NULL DEFAULT '',
  `status` varchar(32) NOT NULL DEFAULT 'In Stock',
  `unitcost` double DEFAULT '0',
  `unitofmeasure` varchar(64) DEFAULT NULL,
  `unitprice` double DEFAULT '0',
  `weight` double DEFAULT NULL,
  `webenabled` tinyint(1) NOT NULL DEFAULT '0',
  `keywords` varchar(128) DEFAULT NULL,
  `thumbnail` mediumblob,
  `thumbnailmime` varchar(128) DEFAULT NULL,
  `picture` mediumblob,
  `picturemime` varchar(128) DEFAULT NULL,
  `webdescription` text,
  `inactive` tinyint(4) NOT NULL DEFAULT '0',
  `type` enum('Inventory','Non-Inventory','Service','Kit','Assembly') NOT NULL DEFAULT 'Inventory',
  `taxable` tinyint(4) NOT NULL DEFAULT '1',
  `memo` text,
  `upc` varchar(128) DEFAULT NULL,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `thpartnum` (`partnumber`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `productstoproductcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productuuid` varchar(64) NOT NULL,
  `productcategoryuuid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productuuid` (`productuuid`),
  KEY `productcategoryuuid` (`productcategoryuuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `receiptitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receiptid` varchar(64) NOT NULL,
  `aritemid` varchar(64) NOT NULL,
  `applied` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `taxadjustment` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `receipts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `clientid` varchar(64) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `receiptdate` date NOT NULL,
  `status` enum('open','collected') NOT NULL DEFAULT 'open',
  `readytopost` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `posted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `postingsessionid` int(11) DEFAULT NULL,
  `paymentmethodid` varchar(64) NOT NULL,
  `ccnumber` blob,
  `ccexpiration` blob,
  `ccverification` blob,
  `bankname` varchar(64) DEFAULT NULL,
  `checkno` varchar(32) DEFAULT NULL,
  `routingnumber` blob,
  `accountnumber` blob,
  `transactionid` varchar(64) DEFAULT NULL,
  `paymentother` varchar(128) DEFAULT NULL,
  `memo` text,
  `createdby` int(11) NOT NULL DEFAULT '0',
  `creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedby` int(10) unsigned DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `shippingmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `inactive` tinyint(4) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `canestimate` tinyint(4) NOT NULL DEFAULT '0',
  `estimationscript` varchar(128) DEFAULT NULL,
  `createdby` int(11) NOT NULL DEFAULT '0',
  `creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedby` int(10) unsigned DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT '0',
  `inactive` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `createdby` int(11) NOT NULL DEFAULT '0',
  `creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom1` double DEFAULT NULL,
  `custom2` double DEFAULT NULL,
  `custom3` datetime DEFAULT NULL,
  `custom4` datetime DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` tinyint(4) NOT NULL DEFAULT  '0',
  `custom8` tinyint(4) NOT NULL DEFAULT  '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
