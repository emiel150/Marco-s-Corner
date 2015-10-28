<?php

	/**
     * This is a template rendering function. As such it 
     * serves illustrative purposes and in general needs to
     * be configured for specific needs.
     * 
	 * This function makes a report of all the records in the 
     * Jobs table. It outputs HTML and can sort records in the
     * table based on a predefined field and sortation order.
	 */
	function displayAllJobs() {
		global $db_conn; #references connection to the database
		
		$field='JobID'; #default sort column
		
		$sort='ASC'; #default sorting order
		
		// Set the sortation order requested via the URL
		if(isset($_GET['sorting'])){
			if($_GET['sorting']=='ASC'){
				$sort='ASC';
			}else{
				$sort='DESC';
			}
		}
		
        // Set the sortation field requested by URL
        // on which soration should be applied
		if(isset($_GET['field'])){
			switch ($_GET['field']) {
				case "JobTitle":
					$field='JobTitle';
					break;
				case "MinSalary":
					$field='MinSalary';
					break;
				case "MaxSalary":
					$field='MaxSalary';
					break;
				default:
					$field='JobID';
			}
		}

        // initializes a statement and return an object for use
        // with mysqli_stmt_prepare
		$stmt = mysqli_stmt_init($db_conn);
        
        // the query that should be parsed
		$sql = "SELECT * FROM `jobs` ORDER BY $field $sort";
		if(!mysqli_stmt_prepare($stmt,$sql)){
		    // if things go wrong we sent a message to the screen    
		    add_to_message_stack("Query could not be parsed. This message is logged", true);
            // and a message to the system log. Note we do not give information
            // about SQL to the user.
            log_message("Query could not be parsed: ". $sql);
			
		}
		else{
			mysqli_stmt_execute($stmt);
			$result = mysqli_stmt_get_result($stmt);
			mysqli_stmt_close($stmt);   
		?>
			<h1>Jobs</h1>
			<br/>
			<input type="button" onclick="document.location.href='?action=addJob';" value="Add Job" />
			<br/>
			<br/>
			<table>
				<tr>
					<th>Job ID <br/> <?php echo parseSorting("jobs","JobID",$field,$sort); ?></th>
					<th>Title <br/> <?php echo parseSorting("jobs","JobTitle",$field,$sort); ?></th>
					<th>Minimum Salary <br/> <?php echo parseSorting("jobs","MinSalary",$field,$sort); ?></th>
					<th>Maximum Salary <br/> <?php echo parseSorting("jobs","MaxSalary",$field,$sort); ?></th>
					<th>Action</th>
				</tr>

				<?php 
				$count=1;
				while($row = mysqli_fetch_assoc($result)) {
					$count++;
					?>
					<tr <?php if($count%2==0)echo "class=\"highlight\" "; ?>>
						<td><?php echo $row['JobID'];?></td>
						<td><?php echo $row['JobTitle'];?></td>
						<td><?php echo $row['MinSalary'];?></td>
						<td><?php echo $row['MaxSalary'];?></td>
						<td>
							<a href="index.php?action=editJob&amp;id=<?php echo $row['JobID'];?>">Edit</a>|<a class="delete" href="javascript:confirmAction('Are you sure?', 'index.php?action=deleteJob&amp;id=<?php echo $row['JobID'];?>');">Remove</a>
						</td>
					</tr>
					<?php } ?>
				</table>
				<?php
			}
		}	


	/**
	 * This functions shows the add Job form	 *
	 */
	function displayAddJob() {
		?>
		<h1>Add Job</h1>
		<form method="post" action="index.php?action=insertJob">
			<table>
				<tr>
					<td>Title:</td>
					<td><input type="text" name="JobTitle" /></td>
				</tr>
				<tr>
					<td>Minimum Salary:</td>
					<td><input type="text" name="MinSalary" /></td>
				</tr>
				<tr>
					<td>Maximum Salary:</td>
					<td><input type="text" name="Maxsalary" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Save" /></td>
				</tr>
			</table>
		</form>
		<?php	
	}
	
	/**
	 * This functions shows the edit Jobs form
	 * This form is automatically filled with data given by ID
	 */
	
	function displayEditJob() {
		global $db_conn;
		$stmt = mysqli_stmt_init($db_conn);
		$sql = "SELECT * FROM `jobs` WHERE `JobID` =? ";
		if(!mysqli_stmt_prepare($stmt,$sql)){
			print "Failed to prepare statement\n";
		}else{
			mysqli_stmt_bind_param($stmt, "i", $_GET['id']);
			mysqli_execute($stmt);
			$result = mysqli_stmt_get_result($stmt);
			mysqli_stmt_close($stmt);
			if($row = mysqli_fetch_assoc($result)) {?>

			<h1>Edit Job</h1>
			<form method="post" action="index.php?action=updateJob">
				<table>
					<tr>
						<td>Title:</td>
						<td><input type="text" name="JobTitle" value="<?php echo $row['JobTitle'];?>" /></td>
					</tr>
					<tr>
						<td>Minimum Salary:</td>
						<td><input type="text" name="MinSalary" value="<?php echo $row['MinSalary'];?>" /></td>
					</tr>
					<tr>
						<td>Maximum Salary:</td>
						<td><input type="text" name="Maxsalary" value="<?php echo $row['MaxSalary'];?>" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Save" /></td>
					</tr>
				</table>
				<input type="hidden" name="JobID" value="<?php echo $row['JobID'];?>" />
			</form>
			<?php
		}
		else {
			die("No Data could be found");
		}
	}
}
?>