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
	function displayAllCustomers() {
		log_message("Backtrace: displayAllCustomers() called. ");
		global $db_conn; #references connection to the database
		
		$field='Wcode'; #default sort column
		
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
				case "Wcode":
					$field = 'Wcode';
					break;
				case "Naam":
					$field='Naam';
					break;
				case "Adres":
					$field='Adres';
					break;
				case "Plaats":
					$field='Plaats';
					break;
				case "Telefoonnr":
					$field='Plaats';
					break;
				default:
					$field='JobID';
			}
		}

        // initializes a statement and return an object for use
        // with mysqli_stmt_prepare
		$stmt = mysqli_stmt_init($db_conn);
        
        // the query that should be parsed
		$sql = "SELECT * FROM `winkel` ORDER BY $field $sort";
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
			<h1>Customers</h1>
			<br/>
			<input type="button" onclick="document.location.href='?action=displayAddCustomer';" value="Add Customer" />
			<br/>
			<br/>
			<table>
				<tr>
					<th>Wcode <br/> <?php echo parseSorting("showCustomers","Wcode",$field,$sort); ?></th>
					<th>Name <br/> <?php echo parseSorting("showCustomers","Naam",$field,$sort); ?></th>
					<th>Address <br/> <?php echo parseSorting("showCustomers","Adres",$field,$sort); ?></th>
					<th>Place <br/> <?php echo parseSorting("showCustomers","Plaats",$field,$sort); ?></th>
					<th>Phone number <br/> <?php echo parseSorting("showCustomers","Telefoonnr",$field,$sort); ?></th>
					<th>Action</th>
				</tr>

				<?php 
				$count=1;
				while($row = mysqli_fetch_assoc($result)) {
					$count++;
					?>
					<tr <?php if($count%2==0)echo "class=\"highlight\" "; ?>>
						<td><?php echo $row['Wcode'];?></td>
						<td><?php echo $row['Naam'];?></td>
						<td><?php echo $row['Adres'];?></td>
						<td><?php echo $row['Plaats'];?></td>
						<td><?php echo $row['Telefoonnr'] ?></td>
						<td>
							<a href="index.php?action=displayEditCustomer&amp;id=<?php echo $row['Wcode'];?>">Edit</a>|<a class="delete" href="javascript:confirmAction('Are you sure?', 'index.php?action=deleteCustomer&amp;id=<?php echo $row['Wcode'];?>');">Remove</a>
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
	function displayAddCustomer() {
		?>
		<h1>Add Customer</h1>
		<form method="post" action="index.php?action=addCustomer">
			<table>
				<tr>
					<td>Name:</td>
					<td><input type="text" name="Naam" /></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><input type="text" name="Adres" /></td>
				</tr>
				<tr>
					<td>Place:</td>
					<td><input type="text" name="Plaats" /></td>
				</tr>
				<tr>
					<td>Phone Number:</td>
					<td><input type="text" name="Telefoonnr" /></td>
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
	
	function displayEditCustomer() {
		global $db_conn;
		$stmt = mysqli_stmt_init($db_conn);
		$sql = "SELECT * FROM `Winkel` WHERE `Wcode` = ? ";
		if(!mysqli_stmt_prepare($stmt,$sql)){
			print "Failed to prepare statement\n";
		}else{
			mysqli_stmt_bind_param($stmt, "s", $_GET['id']);
			mysqli_execute($stmt);
			$result = mysqli_stmt_get_result($stmt);
			mysqli_stmt_close($stmt);
			if($row = mysqli_fetch_assoc($result)) {?>

			<h1>Edit Job</h1>
			<form method="post" action="index.php?action=updateCustomer">
				<table>
					<tr>
						<td>Name:</td>
						<td><input type="text" name="Naam" value="<?php echo $row['Naam'];?>" /></td>
					</tr>
					<tr>
						<td>Address:</td>
						<td><input type="text" name="Adres" value="<?php echo $row['Adres'];?>" /></td>
					</tr>
					<tr>
						<td>Place:</td>
						<td><input type="text" name="Plaats" value="<?php echo $row['Plaats'];?>" /></td>
					</tr>
					<tr>
						<td>Phone Number:</td>
						<td><input type="text" name="Telefoonnr" value="<?php echo $row['Telefoonnr'];?>" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Save" /></td>
					</tr>
				</table>
				<input type="hidden" name="Wcode" value="<?php echo $row['Wcode'];?>" />
			</form>
			<?php
		}
		else {
			die("No Data could be found");
		}
	}
}
?>