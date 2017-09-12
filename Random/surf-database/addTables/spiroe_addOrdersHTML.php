<!-- Orders Table -->

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
	<form method="post" action="spiroe_addOrders.php">

		<fieldset>
			<legend>Orders</legend>
			<p>Delivery Method: <select name="deliverymethod">
				<option value="Local Pickup">Local Pick Up</option>
				<option value="Local Delivery">Local Delivery</option>
				<option value="Standard Delivery">Standard Delivery</option>
				<option value="International Delivery">International Delivery</option>
			</select> </p>
			<p>Shipping Cost: <input type="text" name="shippingcost" /></p>
			<p>Tax $: <input type="text" name="tax" /></p>
			<p>Total $: <input type="text" name="totalcost" /></p>
			<p>Weight: <input type="text" name="weight" /></p>
			<p>Date: <input type="text" name="date" /></p>
			<p>Customer: <select name="customer" />
					<option value="nullcustomer">None</option>
				<?php
					if(!($stmt = $mysqli->prepare("SELECT c_id, c_fname, c_lname FROM customers"))){
						echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
					}
					if(!$stmt->execute()){
						echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					if(!$stmt->bind_result($id, $fname, $lname)){
						echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					while($stmt->fetch()){
						echo '<option value=" '. $id . ' "> ' . '  ' . $fname . '  ' . $lname . '</option>\n';
					}
					$stmt->close();
				?>	
			</select>
			</p>
			<p>Merchant: <select name="merchant" />
					<option value="nullmerchant">None</option>
				<?php
					if(!($stmt = $mysqli->prepare("SELECT me_id, me_name, me_email FROM merchants"))){
						echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
					}
					if(!$stmt->execute()){
						echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					if(!$stmt->bind_result($id, $mename, $meemail)){
						echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
					}
					while($stmt->fetch()){
						echo '<option value=" '. $id . ' "> ' . '  ' . $mename . '  ' . $meemail . '</option>\n';
					}
					$stmt->close();
				?>
				</select>	
			</p>
			<p>Shipping Address: <select name="shippingaddress" />
				<option value="nullshippingaddress">None</option>
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
			<input type="submit" name="addOrder" value="Add New Order"/>
		</p>
	</form>
</div>

</body>
</html>