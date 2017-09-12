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

<!-- Show all manufacturers (all fields) who are based in China -->
<div>
	<table>
		<tr>
			<td>Showing Results of all Manufacturers in China</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>Name</td>
			<td>Phone</td>
			<td>Email</td>
			<td>Physical Address (street)</td>
		</tr>
<!--PHP Goes here -->
<?php
if(!($stmt = $mysqli->prepare("SELECT manufacturers.ma_id, manufacturers.ma_name, manufacturers.ma_phone, manufacturers.ma_email, address.a_street FROM manufacturers
INNER JOIN address ON address.a_id = manufacturers.ma_fk_physicaladdress
WHERE address.a_country = 'China' "))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
if(!$stmt->bind_result($id, $name, $phone, $email, $physicaladdress)){
	echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
}
while($stmt->fetch()){
 	echo "<tr>\n<td>\n" . $id . "\n</td>\n<td>\n" . $name . "\n</td>\n<td>\n" . $phone . "\n</td>\n<td>\n" .
 	 $email . "\n</td>\n<td>\n" .  $physicaladdress . "\n</td>\n</tr>";
}
$stmt->close();
?>		
	</table>
</div>


</body>
</html>