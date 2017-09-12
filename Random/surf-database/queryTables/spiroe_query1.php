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

<!-- Show all international merchants (not in usa) -->
<div>
	<table>
		<tr>
			<td>International Merchants</td>
		</tr>
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Phone</td>
			<td>Email</td>
			<td>Salesman Name</td>
			<td>Physical Address (country)</td>
		</tr>
<!--PHP Goes here -->
<?php
if(!($stmt = $mysqli->prepare("SELECT merchants.me_id, merchants.me_name, merchants.me_phone, merchants.me_email, merchants.me_slname, address.a_country FROM merchants
INNER JOIN address ON address.a_id = merchants.me_fk_physicaladdress
WHERE merchants.me_id NOT IN (
	SELECT merchants.me_id FROM merchants
	INNER JOIN address ON address.a_id = merchants.me_fk_physicaladdress
	WHERE address.a_country = 'United States')"))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
if(!$stmt->bind_result($id, $name, $phone, $email, $slname, $physicaladdress)){
	echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
while($stmt->fetch()){
 	echo "<tr>\n<td>\n" . $id . "\n</td>\n<td>\n" . $name . "\n</td>\n<td>\n" . $phone . "\n</td>\n<td>\n" .
 	 $email . "\n</td>\n<td>\n" . $slname . "\n</td>\n<td>\n" . $physicaladdress . "\n</td>\n</tr>";
}
$stmt->close();
?>		
	</table>
</div>


</body>
</html>