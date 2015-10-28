<?php
	/*
	 * processingMap is an associative array that defines what
	 * process should follow after a certain action.
	 * 
	 * The process is a PHP function that is executed via the
	 * eval function. The function takes on whatever session 
	 * variables are available (via $_SESSION or $_POST) and
	 * redirects via index.php to render a result page to the
	 * user. 
	 */
    //log_message("Start loading processing.lib");
    
	$processingMap[$config['defaultaction']]='';
	$processingMap["addCustomer"]		='addCustomer();';	  // ref: processing/template.pcs.php
	$processingMap["deleteCustomer"]	='deleteCustomer();';
	$processingMap["updateCustomer"]	='updateCustomer();';  
	
		
	function processCurrentAction(){
		global $processingMap; // defined in this file
			
		// retrieve command from $_GET and execute
    	if(isset($processingMap[getCurrentAction()])){
    		log_message("Processing action request: ".getCurrentAction());
    		//execute command as defined in above mapping;	
    		eval($processingMap[getCurrentAction()]);
    	} else {
    	    log_message("No mapping for requested action/process: ". getCurrentAction());
    	}
       
			
	}
    //log_message("Finished loading processing.lib");
?>