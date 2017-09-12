<!-- Order Details Table -->

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
	<form method="post" action="spiroe_addOrderDetails.php">

		<fieldset>
			<legend>Order Details</legend>
			<p>Quantity: <input type="text" name="quantity" /></p>
			<p>Order #: <select name="order" />
				<?php
					if(!($stmt = $mysqli->prepare("SELECT o_id, o_id FROM orders"))){
						echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
					}
					if(!$stmt->execute()){
						echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					if(!$stmt->bind_result($id, $id2)){
						echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					while($stmt->fetch()){
						echo '<option value=" '. $id . ' "> ' . '  ' . $id2 .'</option>\n';
					}
					$stmt->close();
				?>
			</select>
			</p>
			<p>Product in Order: <select name="product" />
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
						echo '<option value=" '. $id . ' "> ' . '  ' . $name . '</option>\n';
					}
					$stmt->close();
				?>
			</select>
			</p>
		</fieldset>

		<!-- add button -->
		<p>
			<input type="submit" name="addOrderDetails" value="Add New Order Detail"/>
		</p>
	</form>
</div>

</body>
</html>