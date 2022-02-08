<?php
	$servername = "10.10.20.10";
	$username = "vagrant";
	$password = "vagrantpass";
	$db = "vagrant";

	$conn = new mysqli($servername, $username, $password, $vagrant);

	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}

	echo "Conncection Ok"
	$conn->close();
?>
