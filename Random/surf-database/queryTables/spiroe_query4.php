<?php
//Turn on error reporting
ini_set('display_errors', 'On');
//Connects to the database
$mysqli = new mysqli("oniddb.cws.oregonstate.edu","spiroe-db","IpSbKscFycbrsn3d","spiroe-db");
if($mysqli->connect_errno){
	echo "Connection error " . $mysqli->connect_errno . " " . $mysqli->connect_error;
	}
?>

<!DOCTYPE HTML>
<html>
<body>

<!-- Show Customers who have bought a surfboard from china -->
<div>
	<table>
		<tr>
			<td>Results of customers who have bought a surfboard from china</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>First Name</td>
			<td>Last Name</td>
			<td>Email</td>
			<td>Phone</td>
			<td>Payment Type</td>
			<td>Card Number</td>
			<td>Expiration Month</td>
			<td>Expiration Year</td>
		</tr>
<!--PHP Goes here -->
<?php
if(!($stmt = $mysqli->prepare("SELECT customers.c_id, customers.c_fname, customers.c_lname, customers.c_email, 
	customers.c_phone, customers.c_paymenttype, customers.c_cardnumber, customers.c_expmonth, customers.c_expyear FROM customers
	INNER JOIN orders ON orders.o_fk_customer = customers.c_id
	INNER JOIN mtm_orders_products ON mtm_orders_products.op_fk_order = orders.o_id
	INNER JOIN products ON products.p_id = mtm_orders_products.op_fk_product
	INNER JOIN mtm_products_manufacturers ON mtm_products_manufacturers.pm_fk_product = products.p_id
	INNER JOIN manufacturers ON manufacturers.ma_id = mtm_products_manufacturers.pm_fk_manufacturer
	INNER JOIN address ON address.a_id = manufacturers.ma_fk_physicaladdress
	WHERE address.a_country = 'China' AND products.p_category = 'surfboard' 
	GROUP BY customers.c_id"))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
if(!$stmt->bind_result($id, $fname, $lname, $email, $phone, $paymenttype, $cardnumber, $expmonth, $expyear)){
	echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
while($stmt->fetch()){
 	echo "<tr>\n<td>\n" . $id . "\n</td>\n<td>\n" . $fname . "\n</td>\n<td>\n" . $lname . "\n</td>\n<td>\n" . $email . 
 	"\n</td>\n<td>\n" . $phone . "\n</td>\n<td>\n" . $paymenttype . "\n</td>\n<td>\n" . $cardnumber . "\n</td>\n<td>\n" .
  	$expmonth . "\n</td>\n<td>\n" . $expyear .  "\n</td>\n</tr>";
}
$stmt->close();
?>		
	</table>
</div>


</body>
</html>