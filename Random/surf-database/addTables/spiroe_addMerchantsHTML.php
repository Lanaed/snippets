<!-- Merchnats Table -->

<html>

<?php
//Turn on error reporting
ini_set('display_errors', 'On');
//Connects to the database
$mysqli = new mysqli("oniddb.cws.oregonstate.edu","spiroe-db","IpSbKscFycbrsn3d","spiroe-db");
if(!$mysqli || $mysqli->connect_errno){
	echo "Connection error " . $mysqli->connect_errno . " " . $mysqli->connect_error;
	}
?>

<body>

<div>
	<form method="post" action="spiroe_addMerchants.php">

		<fieldset>
			<legend>Merchants</legend>
			<p>Name: <input type="text" name="name" /></p>
			<p>Phone: <input type="text" name="phone" /></p>
			<p>Email: <input type="text" name="email" /></p>
			<p> Salesman Last Name: <input type="text" name="slname" /></p>
			<p>Physical Address: <select name="physicaladdress" />
				<?php
					if(!($stmt = $mysqli->prepare("SELECT * FROM address"))){
						echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
					}
					if(!$stmt->execute()){
						echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					if(!$stmt->bind_result($id, $street, $city, $state, $country, $zip)){
						echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					while($stmt->fetch()){
						echo '<option value=" '. $id . ' "> ' . '  ' . $street . '  ' . $city . '  ' . $state . '  ' . $country . '  ' . $zip . '</option>\n';
					}
					$stmt->close();
				?>
			</p>
		</select>
		</fieldset>

		<!-- add button -->
		<p>
			<input type="submit" name="addMerchant" value="Add New Merchant"/>
		</p>
	</form>
</div>

</body>
</html>