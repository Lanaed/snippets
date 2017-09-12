<!-- Display mtm_Order_Products php -->


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

<!-- Display mtm_Order_Products -->
<div>
	<table>
		<tr>
			<td>Order Details Table</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>Quantity</td>
			<td>Order ID</td>
			<td>Product ID</td>
		</tr>
<?php
if(!($stmt = $mysqli->prepare("SELECT mtm_orders_products.op_id, mtm_orders_products.op_quantity, orders.o_id, 
	products.p_name FROM mtm_orders_products 
	INNER JOIN orders ON orders.o_id = mtm_orders_products.op_fk_order
	INNER JOIN products ON products.p_id = mtm_orders_products.op_fk_product"))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
if(!$stmt->bind_result($id, $quantity, $order, $product)){
	echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
while($stmt->fetch()){
 	echo "<tr>\n<td>\n" . $id . "\n</td>\n<td>\n" . $quantity . "\n</td>\n<td>\n" . $order . 
 	"\n</td>\n<td>\n" . $product . "\n</td>\n</tr>";
}
$stmt->close();
?>		
	</table>
</div>


</body>
</html>