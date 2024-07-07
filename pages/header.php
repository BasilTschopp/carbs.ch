<?php
$url = $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];

// Load configuration for each page
include '../configuration.php';

// Load classes based on page type
if (strpos($url, 'info.php') !== false) {
    include '../classes/db-connection.php';
    include '../classes/info.php';
} else if (strpos($url, 'food.php') !== false || strpos($url, 'ajax') !== false  ) {
    include '../classes/db-connection.php';
    include '../classes/food.php';
}

// Output head and body only if not an ajax page
if (strpos($url, 'ajax') === false) {
?>
<!DOCTYPE html>
<html lang='de'>
<head>
    <title>carbs.ch</title>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>
    <link rel="stylesheet" href="../public/css/general.css">
    <link rel="stylesheet" href="../public/css/items.css">
    <script src='../public/scripts/jquery-3.7.1.min.js'></script>
    <script src='../public/scripts/items.js'></script>
</head>
<body>
    <div class='FixedHeaderContainer'>
        <?php
        // Display back button for info page
        if (strpos($url, 'info.php') !== false) {
            echo "<a href='index.php'><img src='../public/images/back.svg' class='NavigationIcon'></a>";
        // Display search field and info icon for food page
        } elseif (strpos($url, 'food.php') !== false) {
            echo "<input type='text' id='ItemSearchInput' placeholder='Suchen' user-scalable='no'>";
            echo "<a href='info.php'><img src='../public/images/info.svg' class='NavigationIcon'></a>";
        }
        ?>
    </div>
<?php } ?>
