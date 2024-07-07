<?php
include 'header.php';

if(isset($_GET['id'])) {

    $ItemID     = $_GET['id'];
    $ArrayItems = array();  
    $dbFood     = new dbFood();
    $dbItem     = $dbFood->dbItem($ItemID);

    while ($row = mysqli_fetch_assoc($dbItem)) {
        $ArrayItems[] = $row;
    }

    header('Content-Type: application/json');
    echo json_encode($ArrayItems);
    
} else {
    echo "ID parameter is not set in the URL";
}

include 'footer.php';
?>
