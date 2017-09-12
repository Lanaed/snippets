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

<!-- Show mtm_Manufacturers_Products Table -->
<div>
	<table>
		<tr>
			<td>Shipments Filtered By Product Results</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>Product ID</td>
			<td>Manufacturer ID</td>
			<td>Quantity</td>
		</tr>
<!--PHP Goes here -->
<?php
if(!($stmt = $mysqli->prepare("SELECT mtm_products_manufacturers.pm_id, products.p_name, 
	manufacturers.ma_name, mtm_products_manufacturers.pm_quantity FROM mtm_products_manufacturers 
	INNER JOIN manufacturers ON manufacturers.ma_id = mtm_products_manufacturers.pm_fk_manufacturer
	INNER JOIN products ON products.p_id = mtm_products_manufacturers.pm_fk_product WHERE products.p_id = ?"))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!($stmt->bind_param("i",$_POST['productkey']))){
	echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
if(!$stmt->bind_result($id, $product, $manufacturer, $quantity)){
	echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
while($stmt->fetch()){
 	echo "<tr>\n<td>\n" . $id . "\n</td>\n<td>\n" . $product . "\n</td>\n<td>\n" . $manufacturer . 
 	"\n</td>\n<td>\n" . $quantity . "\n</td>\n</tr>";
}
$stmt->close();
?>		
	</table>
</div>



</body>
</html>