<?php

	/**
	 * This function adds a new record to the table Jobs	 *
	 */
	function addJob() {
		global $db_conn;
		$redirectlocation ="index.php?action=jobs";
		$add_to_error_log = true;
		//add_to_message_stack('addJob function executed', $add_to_error_log);

		$stmt = mysqli_stmt_init($db_conn);
		$sql = "INSERT INTO jobs (JobTitle, MinSalary, MaxSalary) VALUES  (?,?,?)";
		if(!mysqli_stmt_prepare($stmt,$sql)){
			print "Failed to prepare statement\n";
		}else{
			mysqli_stmt_bind_param($stmt,"sdd",$_POST['JobTitle'],$_POST['MinSalary'],$_POST['Maxsalary']);
			mysqli_execute($stmt);
			mysqli_stmt_close($stmt);
		}
		
		
		immediate_redirect_to($redirectlocation); // return to jobs
	}
	
	/**
	 * This function updates record with ID $_POST['JobID']
	 */
	
	function updateJob() {

		global $db_conn;
		$redirectlocation ="index.php?action=jobs";
		$stmt = mysqli_stmt_init($db_conn);
		$sql = "UPDATE `jobs` SET `JobTitle` = ?,`MinSalary` = ?, `MaxSalary` = ? WHERE `JobID` = ?";

		if(!mysqli_stmt_prepare($stmt,$sql)){
			print "Failed to prepare statement\n";
		}else{
			mysqli_stmt_bind_param($stmt,"sddi",$_POST['JobTitle'],$_POST['MinSalary'],$_POST['Maxsalary'],$_POST['JobID']);
			mysqli_execute($stmt);
			mysqli_stmt_close($stmt);
		}
		immediate_redirect_to($redirectlocation); // return to jobs
	}
	
	/**
	 * This function removes record with id $_GET[ID'] from the table Jobs
	 */	
	function deleteJob() {
		global $db_conn;
		$redirectlocation ="index.php?action=jobs";
		
		$stmt = mysqli_stmt_init($db_conn);global $db_conn;
		$sql = "DELETE FROM `jobs` WHERE `JobID` = ?";
		if(!mysqli_stmt_prepare($stmt,$sql)){
			print "Failed to prepare statement\n";
		}else{
			mysqli_stmt_bind_param($stmt, "i",$_GET['id']);
			mysqli_execute($stmt);
			mysqli_stmt_close($stmt);
		}
		
		immediate_redirect_to($redirectlocation); // return to jobs
	}

	?>