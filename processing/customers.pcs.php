<?php

	/**
	 * This function adds a new record to the table Jobs	 *
	 */
	function addCustomer() {
		global $db_conn;
		$redirectlocation ="index.php?action=showCustomers";
		$add_to_error_log = true;
		//add_to_message_stack('addJob function executed', $add_to_error_log);

		$stmt = mysqli_stmt_init($db_conn);
		$sql = "INSERT INTO Winkel (Naam, Adres, Plaats, Telefoonnr) VALUES  (?,?,?,?)";
		if(!mysqli_stmt_prepare($stmt,$sql)){
			print "Failed to prepare statement\n";
		}else{
			mysqli_stmt_bind_param($stmt,"ssss",$_POST['Naam'],$_POST['Adres'],$_POST['Plaats'],$_POST['Telefoonnr']);
			mysqli_execute($stmt);
			mysqli_stmt_close($stmt);
		}
		
		
		immediate_redirect_to($redirectlocation); // return to jobs
	}
	
	/**
	 * This function updates record with ID $_POST['JobID']
	 */
	
	function updateCustomer() {

		global $db_conn;
		$redirectlocation ="index.php?action=showCustomers";
		$stmt = mysqli_stmt_init($db_conn);
		$sql = "UPDATE `Winkel` SET `Naam` = ?,`Plaats` = ?, `Adres` = ?, `Telefoonnr` = ? WHERE `Wcode` = ?";

		if(!mysqli_stmt_prepare($stmt,$sql)){
			print "Failed to prepare statement\n";
		}else{
			mysqli_stmt_bind_param($stmt,"sssss",$_POST['Naam'],$_POST['Plaats'],$_POST['Adres'],$_POST['Telefoonnr'], $_GET['id']);
			mysqli_execute($stmt);
			mysqli_stmt_close($stmt);
		}
		//immediate_redirect_to($redirectlocation); // return to jobs
		echo $_GET['id'];
	}
	
	/**
	 * This function removes record with id $_GET[ID'] from the table Jobs
	 */	
	function deleteCustomer() {
		global $db_conn;
		$redirectlocation ="index.php?action=showCustomers";
		
		$stmt = mysqli_stmt_init($db_conn);global $db_conn;
		$sql = "DELETE FROM `Winkel` WHERE `Wcode` = ?";
		if(!mysqli_stmt_prepare($stmt,$sql)){
			print "Failed to prepare statement\n";
		}else{
			mysqli_stmt_bind_param($stmt, "s", $_GET['id']);
			mysqli_execute($stmt);
			mysqli_stmt_close($stmt);
		}
		
		immediate_redirect_to($redirectlocation); // return to jobs
	}

	?>