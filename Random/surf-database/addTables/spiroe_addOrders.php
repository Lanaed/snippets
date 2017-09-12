<!-- php for adding to orders -->

<?php
//Turn on error reporting
ini_set('display_errors', 'On');
//Connects to the database
$mysqli = new mysqli("oniddb.cws.oregonstate.edu","spiroe-db","IpSbKscFycbrsn3d","spiroe-db");
if(!$mysqli || $mysqli->connect_errno){
	echo "Connection error " . $mysqli->connect_errno . " " . $mysqli->connect_error;
	}
	
if(!($stmt = $mysqli->prepare("INSERT INTO orders(o_deliverymethod, o_shippingcost, o_tax, o_totalcost, o_weight, o_date, o_fk_customer, o_fk_merchant, o_fk_shippingaddress) VALUES (?,?,?,?,?,?,?,?,?)"))){
	echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
}

//insert nulls for foreign key references if these are null
if($_POST['customer'] == 'nullcustomer') {
	$_POST['customer'] = NULL;
}
if($_POST['merchant'] == 'nullmerchant') {
	$_POST['merchant'] = NULL;
}
if($_POST['shippingaddress'] == 'nullshippingaddress') {
	$_POST['shippingaddress'] = NULL;
}

if(!($stmt->bind_param("siiiisiii",$_POST['deliverymethod'],$_POST['shippingcost'],$_POST['tax'],$_POST['totalcost'],$_POST['weight'],$_POST['date'],$_POST['customer'],$_POST['merchant'],$_POST['shippingaddress']))){
	echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
}
if(!$stmt->execute()){
	echo "Execute failed: "  . $stmt->errno . " " . $stmt->error;
} else {
	echo "Added " . $stmt->affected_rows . " rows to orders.";
}
?>