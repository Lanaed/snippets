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

<!-- Display Orders Table -->
<div>
	<table>
		<tr>
			<td>Orders Filtered By Customer Results</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>Delivery Method</td>
			<td>Shipping Cost</td>
			<td>Tax</td>
			<td>Total Cost</td>
			<td>Weight</td>
			<td>Date</td>
			<td>Customer</td>
			<td>Merchant</td>
			<td>Shipping Address</td>
		</tr>
<!--PHP Goes here -->
<?php
if(!($stmt = $mysqli->prepare("SELECT orders.o_id, orders.o_deliverymethod, orders.o_shippingcost, orders.o_tax, 
	orders.o_totalcost, orders.o_weight, orders.o_date, customers.c_lname, merchants.me_name,
	address.a_street FROM orders LEFT JOIN address ON address.a_id = orders.o_fk_shippingaddress
	LEFT JOIN customers ON customers.c_id = orders.o_fk_customer
	LEFT JOIN merchants ON merchants.me_id = orders.o_fk_merchant WHERE customers.c_id = ?"))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!($stmt->bind_param("i",$_POST['customerkey']))){
	echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
if(!$stmt->bind_result($id, $deliverymethod, $shippingcost, $tax, $totalcost, $weight, $date, $customer, $merchant, $shippingaddress)){
	echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
while($stmt->fetch()){
 	echo "<tr>\n<td>\n" . $id . "\n</td>\n<td>\n" . $deliverymethod . "\n</td>\n<td>\n" . $shippingcost . "\n</td>\n<td>\n" . $tax . 
 	"\n</td>\n<td>\n" . $totalcost . "\n</td>\n<td>\n" . $weight . "\n</td>\n<td>\n" . $date . "\n</td>\n<td>\n" .
  	$customer . "\n</td>\n<td>\n" . $merchant . "\n</td>\n<td>\n" . $shippingaddress . "\n</td>\n</tr>";
}
$stmt->close();
?>		
	</table>
</div>


</body>
</html>