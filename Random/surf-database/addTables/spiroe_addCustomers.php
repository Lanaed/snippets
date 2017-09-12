<!-- php for adding to customers -->

<?php
//Turn on error reporting
ini_set('display_errors', 'On');
//Connects to the database
$mysqli = new mysqli("oniddb.cws.oregonstate.edu","spiroe-db","IpSbKscFycbrsn3d","spiroe-db");
if(!$mysqli || $mysqli->connect_errno){
	echo "Connection error " . $mysqli->connect_errno . " " . $mysqli->connect_error;
	}
	
if(!($stmt = $mysqli->prepare("INSERT INTO customers(c_fname, c_lname, c_email, c_phone, c_paymenttype, c_cardnumber, c_expmonth, c_expyear, c_fk_billingaddress) VALUES (?,?,?,?,?,?,?,?,?)"))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!($stmt->bind_param("sssisiiii",$_POST['fname'],$_POST['lname'],$_POST['email'],$_POST['phone'],$_POST['paymenttype'],$_POST['cardnumber'],$_POST['expmonth'],$_POST['expyear'],$_POST['billingaddress']))){
	echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $stmt->errno . " " . $stmt->error;
} else {
	echo "Added " . $stmt->affected_rows . " rows to customers.";
}
?>

