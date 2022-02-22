CREATE DATABASE `northwind_dw` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE Northwind_DW;

CREATE TABLE northwind_dw.`dim_customers` (
  `customer_key` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_key`),
  KEY `city` (`city`),
  KEY `company` (`company`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `state_province` (`state_province`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;



CREATE TABLE `dim_employees` (
  `employee_key` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `business_phone` varchar(25) DEFAULT NULL,
  `home_phone` varchar(25) DEFAULT NULL,
  `fax_number` varchar(25) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_key`),
  KEY `city` (`city`),
  KEY `company` (`company`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `state_province` (`state_province`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;


DROP TABLE `dim_products`;
CREATE TABLE `dim_products` (
  `product_key` int NOT NULL AUTO_INCREMENT,
  `product_code` varchar(25) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `standard_cost` decimal(19,4) DEFAULT '0.0000',
  `list_price` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `reorder_level` int DEFAULT NULL,
  `target_level` int DEFAULT NULL,
  `quantity_per_unit` varchar(50) DEFAULT NULL,
  `minimum_reorder_quantity` int DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_key`),
  KEY `product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;



CREATE TABLE `dim_shippers` (
  `shipper_key` int NOT NULL AUTO_INCREMENT,
  `company` varchar(50) DEFAULT NULL,
  `address` longtext,
  `city` varchar(50) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `zip_postal_code` varchar(15) DEFAULT NULL,
  `country_region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`shipper_key`),
  KEY `city` (`city`),
  KEY `company` (`company`),
  KEY `zip_postal_code` (`zip_postal_code`),
  KEY `state_province` (`state_province`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

DROP TABLE `fact_orders`;
CREATE TABLE `fact_orders` (
`order_id` integer NOT NULL,
`employee_id` tinyint NOT NULL,
`customer_id` tinyint NOT NULL,
`product_id` tinyint NOT NULL,
`shipper_id` tinyint DEFAULT NULL,
`ship_name` varchar(50) DEFAULT NULL,
`ship_address`longtext,
`ship_city`varchar(50) DEFAULT NULL,
`ship_state_province`varchar(50) DEFAULT NULL,
`ship_zip_postal_code`varchar(15) DEFAULT NULL,
`ship_country_region` varchar(50) DEFAULT NULL,
`quantity`decimal(19,4) DEFAULT '0.0000',
`order_date` DATETIME,
`shipped_date` DATETIME,
`unit_price` decimal(19,4) NOT NULL DEFAULT '0.0000',
`discount`int DEFAULT NULL,
`shipping_fee`decimal(19,4) NOT NULL DEFAULT '0.0000',
`taxes` decimal(19,4) NOT NULL DEFAULT '0.0000',
`payment_type`varchar(50) DEFAULT NULL,
`paid_date`DATETIME,
`tax_rate` int DEFAULT NULL,
`order_status` varchar(50) DEFAULT NULL,
`order_details_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

