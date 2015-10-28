<?php
	/**
	 * This file contains all configuration related settings of the system.
	 * 
	 * Modified by DIRN on 10/06/2015
	 */
	 
	 // make sure error logging is turned on
	error_reporting(E_ALL);
	
	// Configurations are stored in an array.
	$config = array();
    
    // Database configuration settings
    $config['mysql']['hostname'] = "localhost";
    $config['mysql']['username'] = "root";
    $config['mysql']['password'] = "BxdEranM67860";
    $config['mysql']['database'] = "studie_week5";

    /**
     * Default application configuration settings
     */
    $config['pagetitle']        = "Marco's Corner"; // Title of the application
    $config['defaultaction']    = "home"; // Default action if none is specified
    $config['loglocation']      = 'log'; // relative path to the logfile folder. Make sure that write permissions are set.
    	
	// library files: functions that are used in multiple user functions
	require_once("lib/messages.lib.php");  // Messaging functionality. Also errorhandling.
	require_once("lib/database.lib.php"); 	// Functions to connect to the DB
	require_once("lib/general.lib.php"); 	// generic functions like DrawHeader and DrawFooter
	require_once("lib/sorting.lib.php"); 	// Sorting functions
	require_once("lib/processing.lib.php"); // Functionality to process requests
	require_once("lib/rendering.lib.php");  // Functionality to render HTML

		
	// functionality concerning processing of pages
	require_once("processing/template.pcs.php");       // contains functions to generate functionallity concerning the template page
	require_once("processing/customers.pcs.php");
    
	// functionality concerning rendering of pages
	require_once("rendering/template.rdr.php");        // contains functions to generate functionallity concerning the template page
    require_once("rendering/customers.rdr.php");	   // cointains functions to generate functionallity concerning the customers page
?>