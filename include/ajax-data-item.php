<?php
include 'app-config.php';
include 'db-conn.php';
include 'db-items.php';

if(isset($_GET['id'])) {

    $ItemID     = $_GET['id'];
    $ArrayItems = array();  
    $dbFood     = new dbFood();
    $dbItem     = $dbFood->dbItem($ItemID);

    while ($row = mysqli_fetch_assoc($dbItem)) {
        $ArrayItems[] = $row;
    }

    echo json_encode($ArrayItems);
    
} else {
    echo "ID parameter is not set in the URL";
}

include 'db-conn-close.php';
?>
