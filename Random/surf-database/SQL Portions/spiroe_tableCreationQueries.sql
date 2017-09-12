# Ethan Spiro
# CS 275


# Table Creation Queries

SET FOREIGN_KEY_CHECKS = 0;

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Address Table
# id, street, city, state, country, zip
# primary key = id
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
	`a_id` int NOT NULL AUTO_INCREMENT,
	`a_street` varchar(255) NOT NULL,
	`a_city` varchar(255) NOT NULL,
	`a_state` varchar(255),
	`a_country` varchar(255) NOT NULL,
	`a_zip` int,
	PRIMARY KEY (`a_id`)
) ENGINE=InnoDB;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Customers Table
# id, first name, last name, email, phone, payment type, card number, exp month, exp day, billing address
# primary key = id
# foreign key = billing address
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
	`c_id` int NOT NULL AUTO_INCREMENT,
	`c_fname` varchar(255) NOT NULL,
	`c_lname` varchar(255) NOT NULL,
	`c_email` varchar(255) NOT NULL,
	`c_phone` int NOT NULL,
	`c_paymenttype` varchar(255) NOT NULL,
	`c_cardnumber` bigint NOT NULL,
	`c_expmonth` int NOT NULL,
	`c_expyear` int NOT NULL,
	`c_fk_billingaddress` int NOT NULL,
	PRIMARY KEY (`c_id`),
	FOREIGN KEY (`c_fk_billingaddress`) REFERENCES address(a_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Merchants Table
# id, phone, email, salesman last name, store name, physical address
# primary key = id
# foreign key = physical address of merchant headquarters
DROP TABLE IF EXISTS `merchants`;
CREATE TABLE `merchants` (
	`me_id` int NOT NULL AUTO_INCREMENT,
	`me_name` varchar(255) NOT NULL,
	`me_phone` int NOT NULL,
	`me_email` varchar(255) NOT NULL,
	`me_slname` varchar(255),
	`me_fk_physicaladdress` int NOT NULL,
	PRIMARY KEY (`me_id`),
	FOREIGN KEY (`me_fk_physicaladdress`) REFERENCES address(a_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Orders Table
# id, delivery method, shipping $, tax $, total $, weight, date, customer, merchant, address
# primary key = id
# foreign key = customer, merchant, shipping address of order
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
	`o_id` int NOT NULL AUTO_INCREMENT,
	`o_deliverymethod` varchar(255) NOT NULL,
	`o_shippingcost` decimal(10, 2) NOT NULL,
	`o_tax` decimal(10, 2) NOT NULL,
	`o_totalcost` decimal(10, 2) NOT NULL,
	`o_weight` decimal(10, 2) NOT NULL,
	`o_date` date NOT NULL,
	`o_fk_customer` int, # null if it's a merchant order
	`o_fk_merchant` int, # null if it's a customer order
	`o_fk_shippingaddress` int, # null if its a local pickup
	PRIMARY KEY (`o_id`),
	FOREIGN KEY (`o_fk_customer`) REFERENCES customers(c_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (`o_fk_merchant`) REFERENCES merchants(me_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (`o_fk_shippingaddress`) REFERENCES address(a_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Products Table
# id, name, msrp, buy price, quantity in stock, category
# primary key = id
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
	`p_id` int NOT NULL AUTO_INCREMENT,
	`p_name` varchar(255) NOT NULL,
	`p_msrp` decimal(10, 2) NOT NULL,
	`p_buyprice` decimal(10,2) NOT NULL,
	`p_quantity` int NOT NULL,
	`p_description` text,
	`p_category` varchar(255),
	PRIMARY KEY (`p_id`)
) ENGINE=InnoDB;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# mtm_Orders_Products Table (order details table)
# id, product id, order id, quantity, price
# primary key = id
# foreign key = product id, order id
DROP TABLE IF EXISTS `mtm_orders_products`;
CREATE TABLE `mtm_orders_products` (
	`op_id` int NOT NULL AUTO_INCREMENT,
	`op_quantity` int NOT NULL,
	`op_fk_order` int NOT NULL,
	`op_fk_product` int NOT NULL,
	PRIMARY KEY (`op_id`),
	FOREIGN KEY (`op_fk_order`) REFERENCES orders(o_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (`op_fk_product`) REFERENCES products(p_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Manufacturers Table
# id, name, phone, email, address
# primary key = id
# foreign key = address
DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
	`ma_id` int NOT NULL AUTO_INCREMENT,
	`ma_name` varchar(255) NOT NULL,
	`ma_phone` int NOT NULL,
	`ma_email` varchar(255) NOT NULL,
	`ma_fk_physicaladdress` int NOT NULL,
	PRIMARY KEY (`ma_id`),
	FOREIGN KEY (`ma_fk_physicaladdress`) REFERENCES address(a_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# mtm_Products_Manufacturers Table
# id, manufacturer id, product id
# primary key = id
# foreign id = manufacturer id, product id
DROP TABLE IF EXISTS `mtm_products_manufacturers`;
CREATE TABLE `mtm_products_manufacturers` (
	`pm_id` int NOT NULL AUTO_INCREMENT,
	`pm_fk_product` int NOT NULL,
	`pm_fk_manufacturer` int NOT NULL,
	`pm_quantity` int,
	PRIMARY KEY (`pm_id`),
	FOREIGN KEY (`pm_fk_product`) REFERENCES products(p_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (`pm_fk_manufacturer`) REFERENCES manufacturers(ma_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

SET FOREIGN_KEY_CHECKS = 1;