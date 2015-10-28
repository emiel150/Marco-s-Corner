<?php

    define('TECHERRORMESSAGE', "A technical problem prohibited succesfull completion of the request. Please contact the administrator.", TRUE);

	/**
	 * Here we setup a custom error-handler. This code originates from php.net 
	 * and is modified very little. Depending on the type of error, a custom
	 * message is added to the message stack and displayed accordingly.
	 * 
	 * Also a custom error logging file (i.e. to the file system) is defined via
	 * the error_log function 
	 */
	function fcErrorHandler($errno, $errstr, $errfile, $errline){
	    
        global $config;
		
		// log the error to the filesystem. 
		error_log(date("c",time()) . "\t" . $errstr . "\n", 3, "{$config['loglocation']}/php_".date("d-m-Y", time()) . ".log");
		
		// initialize HTML output
		$html_output = "";
		
	    if (!(error_reporting() & $errno)) {
	        // This error code is not included in error_reporting
	        return;
	    }
	
	    switch ($errno) {
	    case E_USER_ERROR:
	        $html_output .= "ERROR [$errno] $errstr";
	        $html_output .= "  Fatal error on line $errline in file $errfile";
	        $html_output .=  ", PHP " . PHP_VERSION . " (" . PHP_OS . ")";
	        $html_output .= "Aborting...";
	        add_to_message_stack($html_output);
			
			// write the custom error to filesystem.
			error_log(date("c",time()) . "\t" . "{$errno}\t". $html_output . "\n", 3, "log/php_".date("d-m-Y", time()) . ".log");
			
            // quit processing on ERRORS
			exit(1);
	        break;
	
	    case E_USER_WARNING:
	        $html_output .= "WARNING [$errno] $errstr";
	        add_to_message_stack($html_output);
			error_log(date("c",time()) . "\t" . "{$errno}\t". $html_output . "\n", 3, "log/php_".date("d-m-Y", time()) . ".log");
	        break;
	
	    case E_USER_NOTICE:
	        $html_output .= "NOTICE [$errno] $errstr";
	        add_to_message_stack($html_output);
			error_log(date("c",time()) . "\t" . "{$errno}\t". $html_output . "\n", 3, "log/php_".date("d-m-Y", time()) . ".log");
	        break;
	
	    default:
	        $html_output .= "Unknown error type: [$errno] $errstr";
			add_to_message_stack($html_output);
			error_log(date("c",time()) . "\t" . "{$errno}\t". $html_output . "\n", 3, "log/php_".date("d-m-Y", time()) . ".log");
	        break;
	    }
	
	    /* Don't execute PHP internal error handler */
	    return true;
	}
	
	/**
	 * This function generates the standard HTML header	 
	 */
	function displayHeader() {
		global $config;
	?>
		<!DOCTYPE html>
		<html>
			<head>
				<title><?php echo $config['pagetitle'] ?></title>

					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
					<meta http-equiv="X-UA-Compatible" content="IE=9" />
					<meta name="description" content="">
					<meta name="keywords" content="">
					<meta name="viewport" content="width=device-width">

					<link rel="stylesheet" type="text/css" href="assets/styling/global.css" />
					<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,400italic,500,500italic,700,700italic,300italic' rel='stylesheet' type='text/css' />
					<link href='https://fonts.googleapis.com/css?family=Lato:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css' />


					<link rel="icon" href="assets/web-gallery/favicon.ico" type="image/x-icon" />
			</head>

			<body>
			<header class="main-header">
				<div class="wrapper">
					<div class="logo"><a href="index.php">Marco's Corner</a></div>
						<!--TODO: change when logged in -->
						<span class="info"><a href="index.php?action=login"><strong>Log in</strong></a> or <a href="index.php?action=createcustomer"><strong>Become a customer</strong></a> </span>
				</div>
			</header>
	<?php
	}

	function displaySearch() { ?>
		<div class="widget">
			<div class="widget-content">
				<form action="index.php?action=products" method="">
					<div class="inline-form">
						<input type="search" placeholder="Search for a product" class="" />
						<input type="submit" value="Search" class="button green" />
					</div>
				</form>
			</div>
		</div>
	<?php }


	/**
	 * This function generates the standard HTML footer
	 */
	function displayFooter() {
		
		global $config;
        
        // add a <div> region with messages to the page.
        print_messages(); // see lib/messages.lib.php
		
	?>
				</div>
			</body>
		</html>
	<?php	
	}
	
	/**
	 * This function displays the HTML navigation bar
	 */
	function displayNavigation() {
	?>
	<nav>
		<div class="wrapper">
			<ul>
				<li>
					<a href="index.php?action=home"><i class="fa fa-home fa-fw"></i>Home</a>
				</li>
				<li>
					<a href="index.php?action=products"><i class="fa fa-product fa-fw"></i>Products</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="wrapper">
	<?php
	}

	/**
	 * This functions renders the homepage
	 */
	function displayHome() {
	?>	
		
	<?php
	 global $db_conn;
	   
       echo "<br/>";
       
	   if($db_conn->connect_error){
	       $message = "There is a problem with the current databaseconnection";    
	       echo $message;
           log_message($message);
	       
	   } else {
	       echo "<strong style=\"color: green\"> If you read this line, the application could connect to the database. </strong>";
       }
	
	}
	
	
	/**
	 * This function is determines the current action
	 * if no action is given in the url, the standard action will be taken from the config
	 *
	 */
	function getCurrentAction() {
		global $config; // in conf/config.conf.php
		
		if(isset($_GET['action'])) {
			return $_GET['action'];
		}
		else {
			return $config['defaultaction'];
		}
	}
	
	
	/**
	 * This function redirects to the given location. 
	 * Be sure to call the function before any output
	 * to HTML is generated.
	 *
	 */
	function immediate_redirect_to($redirectlocation){
		header("location: {$redirectlocation}");
		exit;
		
	}
    
    /**
     * check for given variable if value is empty
     * and appends message to the array if this is the case
     * 
     */
     function ifEmptyAddMessage(&$variable, &$errorList, $message, $addToStack){
         if(empty($variable)){
             $errorList[] = $message;
             
             if($addToStack){
                 add_to_message_stack($message,FALSE);
             }
         }
     }
?>