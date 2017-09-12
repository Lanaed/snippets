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

<!-- Display Address (filtered by customer) Table -->
<div>
	<table>
		<tr>
			<td>Address Table</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>Street</td>
			<td>City</td>
			<td>State</td>
			<td>Country</td>
			<td>Zip Code</td>
		</tr>
<!--PHP Goes here -->
<?php
if(!($stmt = $mysqli->prepare("SELECT address.a_id, address.a_street, address.a_city, address.a_state, address.a_country, address.a_zip FROM address
INNER JOIN customers ON customers.c_fk_billingaddress = address.a_id
WHERE customers.c_id = ?"))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}

if(!($stmt->bind_param("i",$_POST['customerkey']))){
	echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
if(!$stmt->bind_result($id, $street, $city, $state, $country, $zip)){
	echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
while($stmt->fetch()){
 	echo "<tr>\n<td>\n" . $id . "\n</td>\n<td>\n" . $street . "\n</td>\n<td>\n" . $city . "\n</td>\n<td>\n" .
 	 $state . "\n</td>\n<td>\n" . $country . "\n</td>\n<td>\n" . $zip . "\n</td>\n</tr>";
}
$stmt->close();
?>		
	</table>
</div>

</body>
</html>