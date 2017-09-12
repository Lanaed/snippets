<!-- Display Products php -->


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

<!-- Display Products Table -->
<div>
	<table>
		<tr>
			<td>Products Table</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>Name</td>
			<td>MSRP</td>
			<td>Buy Price</td>
			<td>Quantity</td>
			<td>Description</td>
			<td>Category</td>
		</tr>
<?php
if(!($stmt = $mysqli->prepare("SELECT products.p_id, products.p_name, products.p_msrp, products.p_buyprice, 
	products.p_quantity, products.p_description, products.p_category FROM products"))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
if(!$stmt->bind_result($id, $name, $msrp, $buyprice, $quantity, $description, $category)){
	echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
while($stmt->fetch()){
 	echo "<tr>\n<td>\n" . $id . "\n</td>\n<td>\n" . $name . "\n</td>\n<td>\n" . $msrp . "\n</td>\n<td>\n" . $buyprice . 
 	"\n</td>\n<td>\n" . $quantity . "\n</td>\n<td>\n" . $description . "\n</td>\n<td>\n" . $category . "\n</td>\n</tr>";
}
$stmt->close();
?>		
	</table>
</div>



</body>
</html>