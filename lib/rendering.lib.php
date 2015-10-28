<?php
	/*
	 * renderingMap is an associative array that defines what
	 * renderingAction should follow after a certain action.
	 * 
	 * The process is a PHP function that is executed via the
	 * eval function. The functionality for rendering is very similar 
	 * to processCurrentAction in lib/processing.lib.php
	 * 
	 * updated by DIRN on 09-06-2015
	 */
   
	// define renderingMap
	$renderingMap["showCustomers"]			='displayAllCustomers();';
	$renderingMap['displayAddCustomer']		='displayAddCustomer();';
	$renderingMap["displayEditCustomer"]	='displayEditCustomer();';
	$renderingMap["deleteCustomer"] 		='deleteCustomer();';
   	$renderingMap[$config['defaultaction']]	='displayHome();';		//ref: inc/general.inc.php
	
	function renderCurrentAction(){
		global $renderingMap, $config; // as defined in this file and configuration-file
				
		if(isset($renderingMap[getCurrentAction()])){
			eval($renderingMap[getCurrentAction()]);
		} else {
		    eval($renderingMap[$config['defaultaction']]);
            log_message("No mapping for requested rendering/process. ". getCurrentAction() . " Redirecting to defaultaction.");
		}
        
       }

?>