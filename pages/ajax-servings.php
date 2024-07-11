<?php
include '../configuration.php';
include '../classes/db-connection.php';
include '../classes/food.php';

if(isset($_GET['id'])) {
    
    $ItemID     = $_GET['id'];
    $ArrayItems = array();
    $dbFood     = new dbFood();
    $dbServings = $dbFood->dbServings($ItemID);

    while ($row = mysqli_fetch_assoc($dbServings)) {
        $ArrayItems[] = $row;
    }
    
    header('Content-Type: application/json');
    echo json_encode($ArrayItems);

} else {
    echo "ID parameter is not set in the URL";
}

include 'footer.php';
?>