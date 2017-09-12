# Ethan Spiro
# CS275


# All Database Queries (Displaying tables, Filters, Non-dropdown queries)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Display Queries
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Display address table
# Tables: address
SELECT address.a_id, address.a_street, address.a_city, address.a_state, address.a_country, address.a_zip FROM address;

# Display customers table
# Tables: customers, address
SELECT customers.c_id, customers.c_fname, customers.c_lname, customers.c_email, customers.c_phone, customers.c_paymenttype, 
customers.c_cardnumber, customers.c_expmonth, customers.c_expyear,address.a_street FROM customers 
INNER JOIN address ON address.a_id = customers.c_fk_billingaddress;

# Display manufacturers table
# Tables: manufacturers, address
SELECT manufacturers.ma_id, manufacturers.ma_name, manufacturers.ma_phone, manufacturers.ma_email, address.a_street FROM manufacturers 
INNER JOIN address ON address.a_id = manufacturers.ma_fk_physicaladdress;

# Display merchants table
# Tables: merchants, address
SELECT merchants.me_id, merchants.me_name, merchants.me_phone, merchants.me_email, merchants.me_slname, address.a_street FROM merchants 
INNER JOIN address ON address.a_id = merchants.me_fk_physicaladdress;

# Display order details table
# Tables: mtm_order_products, orders, products
SELECT mtm_orders_products.op_id, mtm_orders_products.op_quantity, orders.o_id, products.p_name FROM mtm_orders_products 
INNER JOIN orders ON orders.o_id = mtm_orders_products.op_fk_order
INNER JOIN products ON products.p_id = mtm_orders_products.op_fk_product;

# Display orders table
# Tables: orders, address, customers, merchants
SELECT orders.o_id, orders.o_deliverymethod, orders.o_shippingcost, orders.o_tax, orders.o_totalcost, orders.o_weight, orders.o_date, customers.c_lname, 
merchants.me_name, address.a_street FROM orders 
LEFT JOIN address ON address.a_id = orders.o_fk_shippingaddress
LEFT JOIN customers ON customers.c_id = orders.o_fk_customer
LEFT JOIN merchants ON merchants.me_id = orders.o_fk_merchant;

# Display products table
# Tables: products
SELECT products.p_id, products.p_name, products.p_msrp, products.p_buyprice, products.p_quantity, products.p_description, products.p_category FROM products;

# Display shipments table
# Tables: mtm_products_manufacturers
SELECT mtm_products_manufacturers.pm_id, products.p_name, manufacturers.ma_name, mtm_products_manufacturers.pm_quantity FROM mtm_products_manufacturers 
INNER JOIN manufacturers ON manufacturers.ma_id = mtm_products_manufacturers.pm_fk_manufacturer
INNER JOIN products ON products.p_id = mtm_products_manufacturers.pm_fk_product;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Filter Queries
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Filter what orders are from what customer. Show the order and allow the user to use a drop down to select customer
# Tables: orders, customers
SELECT orders.o_id, orders.o_deliverymethod, orders.o_shippingcost, orders.o_tax, orders.o_totalcost, 
orders.o_weight, orders.o_date, customers.c_lname, merchants.me_name, address.a_street FROM orders 
LEFT JOIN address ON address.a_id = orders.o_fk_shippingaddress
LEFT JOIN customers ON customers.c_id = orders.o_fk_customer
LEFT JOIN merchants ON merchants.me_id = orders.o_fk_merchant 
WHERE customers.c_id = [?];

# Filter shipments by the manufacturer
# Tables: mtm_products_manufacturers, manufacturers, orders
SELECT mtm_products_manufacturers.pm_id, products.p_name, manufacturers.ma_name, mtm_products_manufacturers.pm_quantity FROM mtm_products_manufacturers 
INNER JOIN manufacturers ON manufacturers.ma_id = mtm_products_manufacturers.pm_fk_manufacturer
INNER JOIN products ON products.p_id = mtm_products_manufacturers.pm_fk_product 
WHERE manufacturers.ma_id = [?];

# Filter shipments by product name
# Tables: mtm_products, manufacturers, products, manufacturers
SELECT mtm_products_manufacturers.pm_id, products.p_name, manufacturers.ma_name, mtm_products_manufacturers.pm_quantity FROM mtm_products_manufacturers 
INNER JOIN manufacturers ON manufacturers.ma_id = mtm_products_manufacturers.pm_fk_manufacturer
INNER JOIN products ON products.p_id = mtm_products_manufacturers.pm_fk_product 
WHERE products.p_id = [?];

# Filter/show billing address by last name
# Tables: customers, address
SELECT address.a_id, address.a_street, address.a_city, address.a_state, address.a_country, address.a_zip FROM address
INNER JOIN customers ON customers.c_fk_billingaddress = address.a_id
WHERE customers.c_id = [?];
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Other (non-dropdown queries)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Show all international merchants (NOT IN USA). 
# Tables: address, merchant
SELECT merchants.me_id, merchants.me_name, merchants.me_phone, merchants.me_email, merchants.me_slname, address.a_street FROM merchants
INNER JOIN address ON address.a_id = merchants.me_fk_physicaladdress
WHERE merchants.me_id NOT IN (
	SELECT merchants.me_id FROM merchants
	INNER JOIN address ON address.a_id = merchants.me_fk_physicaladdress
	WHERE address.a_country = "United States"
);

# Show all Customers (all fields) who ordered a t-shirt
# Tables: Address, Customers, Orders, Order Details, Products
SELECT customers.c_id, customers.c_fname, customers.c_lname, customers.c_email, 
customers.c_phone, customers.c_paymenttype, customers.c_cardnumber, customers.c_expmonth, customers.c_expyear,
address.a_street FROM address
INNER JOIN customers ON customers.c_fk_billingaddress = address.a_id
INNER JOIN orders ON orders.o_fk_customer = customers.c_id
INNER JOIN mtm_orders_products ON mtm_orders_products.op_fk_order = orders.o_id
INNER JOIN products ON products.p_id = mtm_orders_products.op_fk_product
WHERE products.p_name = 'T-Shirt'
GROUP BY customers.c_id;

# Show all manufacturers (store) and their phone numbers and emails in china
# Tables: address, manufacturer
SELECT manufacturers.ma_id, manufacturers.ma_name, manufacturers.ma_phone, manufacturers.ma_email, address.a_street FROM manufacturers
INNER JOIN address ON address.a_id = manufacturers.ma_fk_physicaladdress
WHERE address.a_country = 'China';

# Show all customers (all fields - address) who have bought a surfboard from China
# Tables: all
SELECT customers.c_id, customers.c_fname, customers.c_lname, customers.c_email, 
customers.c_phone, customers.c_paymenttype, customers.c_cardnumber, customers.c_expmonth, customers.c_expyear FROM customers
INNER JOIN orders ON orders.o_fk_customer = customers.c_id
INNER JOIN mtm_orders_products ON mtm_orders_products.op_fk_order = orders.o_id
INNER JOIN products ON products.p_id = mtm_orders_products.op_fk_product
INNER JOIN mtm_products_manufacturers ON mtm_products_manufacturers.pm_fk_product = products.p_id
INNER JOIN manufacturers ON manufacturers.ma_id = mtm_products_manufacturers.pm_fk_manufacturer
INNER JOIN address ON address.a_id = manufacturers.ma_fk_physicaladdress
WHERE address.a_country = 'China' AND products.p_category = 'surfboard' 
GROUP BY customers.c_id;
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
