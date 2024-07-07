<?php 

// Close database connection if open
if (isset($Connection)) {
	$Connection->close(); 
}

// No footer for ajax pages
if (strpos($url, 'ajax') == false) {
    echo "</body>";
    echo "</html>";
 } 

?>