<!-- Shipments Table -->

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
	<form method="post" action="spiroe_addShipments.php">

		<fieldset>
			<legend>Shipments</legend>
			<p>Product: <select name="product" />
				<?php
					if(!($stmt = $mysqli->prepare("SELECT p_id, p_name FROM products"))){
						echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
					}
					if(!$stmt->execute()){
						echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					if(!$stmt->bind_result($id, $name)){
						echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					while($stmt->fetch()){
						echo '<option value=" '. $id . ' "> ' . '  ' . $name .'</option>\n';
					}
					$stmt->close();
				?>
			</select>
			</p>
			<p>Manufacturer: <select name="manufacturer" />
				<?php
					if(!($stmt = $mysqli->prepare("SELECT ma_id, ma_name FROM manufacturers"))){
						echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
					}
					if(!$stmt->execute()){
						echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					if(!$stmt->bind_result($id, $name)){
						echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					while($stmt->fetch()){
						echo '<option value=" '. $id . ' "> ' . '  ' . $name .'</option>\n';
					}
					$stmt->close();
				?>
			</select>
			</p>
			<p>Quantity: <input type="text" name="quantity" /></p>
		</fieldset>

		<!-- add button -->
		<p>
			<input type="submit" name="addShipments" value="Add New Shipment"/>
		</p>
	</form>
</div>

</body>
</html>