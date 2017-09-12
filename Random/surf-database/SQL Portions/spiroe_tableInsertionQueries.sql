# Ethan Spiro
# CS 275


# Manual Insertion Queries for Populating Tables (to populate initially for testing)

SET FOREIGN_KEY_CHECKS = 0;
# Insert addresses
INSERT INTO address(a_street, a_city, a_state, a_country, a_zip)
VALUES ('4000 Point White Drive', 'Bainbridge Island', 'WA', 'United States', 98110),
('145 S Kingsley Drive', 'Los Angeles', 'CA', 'United States', 90004),
('235 Elm Street', 'Manchester', 'NH', 'United States', 90567),
('44 Pike Street', 'Calgary', NULL, 'Canada', NULL),
('49 Pine Street', 'Santa Barbara', 'CA', 'United States', 45678),
('4400 Brown Street', 'Portland', NULL, 'United States', 12345),
('5050 Maple Street', 'San Francisco', 'CA', 'United States', 56789),
('1234 Hong Street', 'Beijing', NULL, 'China', NULL),
('5678 Blue Street', 'Perth', NULL, 'Australia', NULL),
('1010 Binary Street', 'Dunedin', NULL, 'New Zealand', NULL);

# Insert 3 Customers
INSERT INTO customers(c_fname, c_lname, c_email, c_phone, c_paymenttype, c_cardnumber, c_expmonth, c_expyear, c_fk_billingaddress)
VALUES ('Ethan', 'Spiro', 'ethanspiro@gmail.com', 2069657953, 'Visa', 4388678923456789, 12, 2017, 1),
('Bob', 'Jones', 'bjones@gmail.com', 2065687953, 'Visa', 6577778923456789, 11, 2020, 2),
('Sue', 'Greenway', 'sue@hotmail.com', 6079657953, 'Visa', 1234678923456789, 07, 2019, 3);

# Insert 3 merchants
INSERT INTO merchants(me_name, me_phone, me_email, me_slname, me_fk_physicaladdress)
VALUES ('Jacks Surfboards', 2475657899, 'jackssurf@gmail.com', 'Roberts', 4),
('Magic Seaweed', 1234567890, 'ms@gmail.com', 'Slimey', 5),
('Fools Gold', 9994567890, 'fools@gmail.com', 'Smith', 6);

# Insert 3 Orders
INSERT INTO orders(o_deliverymethod, o_shippingcost, o_tax, o_totalcost, o_weight, o_date, o_fk_customer, o_fk_merchant, o_fk_shippingaddress)
VALUES ('Local Pickup', 0, 12.00, 125.00, 8.00, '2012-12-28', 1, NULL, NULL),
('Local Delivery', 25.00, 12.00, 1100.00, 34.50, '2013-10-14', NULL, 1, 5),
('Delivery', 0, 36.00, 450.00, 18.50, '2014-09-12', 2, NULL, 4);

# Insert 5 products
INSERT INTO products(p_name, p_msrp, p_buyprice, p_quantity, p_description, p_category)
VALUES ('Longboard', 400.00, 250.00, 15, 'A board 8-10 feet', 'surfboard'),
('Funboard', 300.00, 150.00, 25, 'A board 7-9 feet', 'surfboard'),
('Shortboard', 200.00, 100.00, 45, 'A board 5-7 feet', 'surfboard'),
('T-Shirt', 20.00, 5.00, 100, 'A short sleeve shirt', 'apparel'),
('Leash', 25.00, 5.00, 40, 'A leash for a surfboard', 'accessories');

# Insert order details for all orders
INSERT INTO mtm_orders_products(op_quantity, op_fk_order, op_fk_product)
VALUES (2, 1, 2),
(1, 1, 3),
(3, 2, 2),
(2, 3, 3);

# Insert 3 manufacturers
INSERT INTO manufacturers(ma_name, ma_phone, ma_email, ma_fk_physicaladdress)
VALUES ('Beijing Export', 0055657899, 'bejexp@gmail.com', 8),
('Australia Export', 7777567890, 'aussie@gmail.com', 9),
('NZ Manufacturing Co.', 007807890, 'kiwi@gmail.com', 10);

# Insert product_manufacturer details for all products
INSERT INTO mtm_products_manufacturers(pm_fk_product, pm_fk_manufacturer, pm_quantity)
VALUES (1, 1, 20), #order 1, 2 tshirts
(2, 1, 30), #order 1, 1 longboard
(3, 1, 40),
(4, 2, 100),
(5, 3, 200);

SET FOREIGN_KEY_CHECKS = 1;