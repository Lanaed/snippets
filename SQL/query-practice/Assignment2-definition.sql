#Ethan Spiro
#CS 275
#Assignment 2
#File: Assignment2-definition.sql

-- For part one of this assignment you are to make a database with the following specifications and run the following queries
-- Table creation queries should immedatley follow the drop table queries, this is to facilitate testing on my end

-- Create a table called category with the following properties:
-- id - an auto incrementing integer which is the primary key
-- name - a varchar with a maximum length of 255 characters, cannot be null
-- subcategory - a carchar with a maximum length of 255 characters
-- the combinatino of a name and subcategory must be unique


DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`subcategory` varchar(255),
	PRIMARY KEY (`id`),
	UNIQUE (`name`, `subcategory`)
) ENGINE=InnoDB;

-- Create a table called operating_system with the following properties:
-- id - an auto incrementing integer which is the primary key
-- name - a varchar of maximum length 255, cannot be null
-- version - a varchar of maximum length 255, cannot be null
-- name version combinations must be unique
DROP TABLE IF EXISTS `operating_system`;

CREATE TABLE `operating_system` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`version` varchar(255) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE (`name`, `version`)
) ENGINE=InnoDB;

-- Create a table called device with the following properties:
-- id - an auto incrementing integer which is the primary key
-- cid - an integer which is a foreign key reference to the category table
-- name - a varchar of maximum length 255 which cannot be null
-- received - a date type (you can read about it here http://dev.mysql.com/doc/refman/5.0/en/datetime.html)
-- isbroken - a boolean
DROP TABLE IF EXISTS `device`;

CREATE TABLE `device` (
	`id` int NOT NULL AUTO_INCREMENT,
	`cid` int NOT NULL,
	`name` varchar(255) NOT NULL,
	`received` date,
	`isbroken` boolean,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`cid`) REFERENCES category(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Create a table called os_support with the following properties, this is a table representing a many-to-many relationship
-- between devices and operating systems:
-- did - an integer which is a foreign key reference to device
-- osid - an integer which is a foreign key reference to operating_system
-- notes - a text type
-- The primary key is a combination of did and osid
DROP TABLE IF EXISTS `os_support`;

CREATE TABLE `os_support` (
	`did` int NOT NULL,
	`osid` int NOT NULL,
	`notes` text,
	PRIMARY KEY (`did`, `osid`),
	FOREIGN KEY (`did`) REFERENCES device(id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (`osid`) REFERENCES operating_system(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- insert the following into the category table:
-- name: phone
-- subcategory: NULL

INSERT INTO category(name, subcategory)
VALUES ('phone', NULL);

-- name: phone
-- subcategory: maybe a tablet?

INSERT INTO category(name, subcategory)
VALUES ('phone', 'maybe a tablet?');

-- name: tablet
-- subcategory: but kind of a laptop

INSERT INTO category(name, subcategory)
VALUES ('tablet', 'but kind of a laptop');

-- name: tablet
-- subcategory: ereader

INSERT INTO category(name, subcategory)
VALUES ('tablet', 'ereader');

-- insert the folowing into the operating_system table:
-- name: Android
-- version: 1.0

INSERT INTO operating_system(name, version)
VALUES ('Android', '1.0');

-- name: Android
-- version: 2.0

INSERT INTO operating_system(name, version)
VALUES ('Android', '2.0');

-- name: iOS
-- version: 4.0

INSERT INTO operating_system(name, version)
VALUES ('iOS', '4.0');

-- insert the following devices instances into the device table (you should use a subquery to set up foriegn keys referecnes, no hard coded numbers):
-- cid - reference to name: phone subcategory: 'maybe a tablet'
-- name - Samsung Atlas
-- received - 1/2/1970, format is year-month-day for this data type
-- isbroken - True, boolean true is 1 false is 0

INSERT INTO device(cid, name, received, isbroken)
VALUES ((SELECT id FROM category WHERE name = 'phone' AND subcategory = 'maybe a tablet?'), 'Samsung Atlas', 1970-1-2, 1);

-- cid - reference to name: phone subcategory: NULL
-- name - Nokia
-- received - 5/6/1999
-- isbroken 

INSERT INTO device(cid, name, received, isbroken)
VALUES ((SELECT id FROM category WHERE name = 'phone' AND subcategory IS NULL), 'Nokia', 1999-5-6, 0);

-- cid - reference to name: tablet subcategory: ereader
-- name - jPad
-- received - 11/18/2005
-- isbroken - False

INSERT INTO device(cid, name, received, isbroken)
VALUES ((SELECT id FROM category WHERE name = 'tablet' AND subcategory = 'ereader'), 'jPad', 2005-11-18, 0);

-- insert the following into the os_support table using subqueries to look up data as needed:
-- device: Samsung Atlas
-- os: Android 1.0
-- notes: Works poorly

INSERT INTO os_support(did, osid, notes)
VALUES ((SELECT id FROM device WHERE name = 'Samsung Atlas'), (SELECT id FROM operating_system WHERE name = 'Android' AND version = '1.0'), 'Works poorly');

-- device: Samsung Atlas
-- os: Android 2.0
-- notes: 

INSERT INTO os_support(did, osid)
VALUES ((SELECT id FROM device WHERE name = 'Samsung Atlas'), (SELECT id FROM operating_system WHERE name = 'Android' AND version = '2.0'));

-- device: jPad
-- os: iOS 4.0
-- notes: 

INSERT INTO os_support(did, osid)
VALUES ((SELECT id FROM device WHERE name = 'jPad'), (SELECT id FROM operating_system WHERE name = 'iOS' AND version = '4.0'));