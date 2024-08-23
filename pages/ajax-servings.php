<?php
include '../configuration.php';
include '../classes/db-connection.php';
include '../classes/food.php';

if (isset($_GET['id'])) {
    // Überprüfen und Bereinigen des ID-Wertes
    $ItemID = htmlspecialchars($_GET['id'], ENT_QUOTES, 'UTF-8');

    // Stellen Sie sicher, dass die ID eine Ganzzahl ist
    if (filter_var($ItemID, FILTER_VALIDATE_INT)) {
        $ArrayItems = array();
        $dbFood = new dbFood();
        $dbServings = $dbFood->dbServings($ItemID);

        while ($row = mysqli_fetch_assoc($dbServings)) {
            $ArrayItems[] = $row;
        }

        header('Content-Type: application/json');
        echo json_encode($ArrayItems);
    } else {
        // Wenn die ID keine gültige Ganzzahl ist
        echo "Invalid ID parameter.";
    }
} else {
    echo "ID parameter is not set in the URL.";
}

include 'footer.php';
?>
