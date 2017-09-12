<!-- Customer Table -->

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
	<form method="post" action="spiroe_addCustomers.php">

		<fieldset>
			<legend>Customers</legend>
			<p>First Name: <input type="text" name="fname" /></p>
			<p>Last Name: <input type="text" name="lname" /></p>
			<p>Email: <input type="text" name="email" /></p>
			<p>Phone: <input type="text" name="phone" /></p>
			<p>Payment Type: <select name="paymenttype"> 
				<option value="visa">Visa</option>
				<option value="mastercard">Mastercard</option>
				<option value="americanexpress">American Express</option>
			</select> </p>
			<p>Card Number: <input type="text" name="cardnumber" />
			Expiration Month: <select name="expmonth">
				<option value="01">Jan</option>
				<option value="02">Feb</option>
				<option value="03">Mar</option>
				<option value="04">Apr</option>
				<option value="05">May</option>
				<option value="06">Jun</option>
				<option value="07">Jul</option>
				<option value="08">Aug</option>
				<option value="09">Sep</option>
				<option value="10">Oct</option>
				<option value="11">Nov</option>
				<option value="12">Dec</option>
			</select>
			Expiration Year: <select name="expyear">
    			<option value="2014">2014</option>
   				<option value="2015">2015</option>
			    <option value="2016">2016</option>
			    <option value="2017">2017</option>
			    <option value="2018">2018</option>
			    <option value="2019">2019</option>
			    <option value="2020">2020</option>
			    <option value="2021">2021</option>
			    <option value="2022">2022</option>
			    <option value="2023">2023</option>
			    <option value="2024">2024</option>
				</select>
			</p>
			<p>Billing Address: <select name="billingaddress" />
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
			</select>
			</p>
		</fieldset>

		<!-- add button -->
		<p>
			<input type="submit" name="addCustomer" value="Add New Customer"/>
		</p>
	</form>
</div>

</body>
</html>