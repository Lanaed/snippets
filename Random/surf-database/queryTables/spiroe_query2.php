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

<!-- Show Customers Who Have bought a t-shirt -->
<div>
	<table>
		<tr>
			<td>Results of Customers who have bought a t-shirt</td>
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
			<td>Billing Address</td>
		</tr>
<!--PHP Goes here -->
<?php
if(!($stmt = $mysqli->prepare("SELECT customers.c_id, customers.c_fname, customers.c_lname, customers.c_email, 
	customers.c_phone, customers.c_paymenttype, customers.c_cardnumber, customers.c_expmonth, customers.c_expyear,
	address.a_street FROM address
	INNER JOIN customers ON customers.c_fk_billingaddress = address.a_id
	INNER JOIN orders ON orders.o_fk_customer = customers.c_id
	INNER JOIN mtm_orders_products ON mtm_orders_products.op_fk_order = orders.o_id
	INNER JOIN products ON products.p_id = mtm_orders_products.op_fk_product
	WHERE products.p_name = 'T-Shirt'
	GROUP BY customers.c_id"))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
if(!$stmt->bind_result($id, $fname, $lname, $email, $phone, $paymenttype, $cardnumber, $expmonth, $expyear, $billingaddress)){
	echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
while($stmt->fetch()){
 	echo "<tr>\n<td>\n" . $id . "\n</td>\n<td>\n" . $fname . "\n</td>\n<td>\n" . $lname . "\n</td>\n<td>\n" . $email . 
 	"\n</td>\n<td>\n" . $phone . "\n</td>\n<td>\n" . $paymenttype . "\n</td>\n<td>\n" . $cardnumber . "\n</td>\n<td>\n" .
  	$expmonth . "\n</td>\n<td>\n" . $expyear . "\n</td>\n<td>\n" . $billingaddress . "\n</td>\n</tr>";
}
$stmt->close();
?>		
	</table>
</div>


</body>
</html>