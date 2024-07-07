<?php
$url = $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];

if (strpos($url, 'localhost') !== false) {
    // Test Environment
    header('Location: http://localhost/carbs.ch/pages/food.php');
} else {
    // Production Environment
    header('Location: https://carbs.ch/pages/food.php');
}
exit();
?>