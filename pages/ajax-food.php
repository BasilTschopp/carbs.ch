<?php
include '../configuration.php';
include '../classes/db-connection.php';
include '../classes/food.php';

if(isset($_GET['id'])) {

    $ItemID     = htmlspecialchars($_GET['id'], ENT_QUOTES, 'UTF-8');

    if (filter_var($ItemID, FILTER_VALIDATE_INT)) {
        $ArrayItems = array();  
        $dbFood     = new dbFood();
        $dbItem     = $dbFood->dbItem($ItemID);

        while ($row = mysqli_fetch_assoc($dbItem)) {
            $ArrayItems[] = $row;
        }

        header('Content-Type: application/json');
        echo json_encode($ArrayItems);

    } else {

        echo "Invalid ID parameter.";
    }
    
} else {

    echo "ID parameter is not set in the URL.";
}

include 'footer.php';
?>
