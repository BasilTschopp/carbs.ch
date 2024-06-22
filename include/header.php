<?php
$CurrentPage = basename($_SERVER['PHP_SELF'], ".php");
?>

<!DOCTYPE html>
<html lang='de'>
    
<head>
   <title>carbs.ch</title>
   <meta charset='UTF-8'>
   <meta name='viewport' content='width=device-width, initial-scale=1.0 maximum-scale=1.0, user-scalable=no'>
   <link rel="stylesheet" href="style/css/general.css">
   <link rel="stylesheet" href="style/css/items.css">
   <script src='scripts/jquery-3.7.1.min.js'></script>
   <script src='scripts/items.js'></script>
</head>

<body>

<div class='FixedHeaderContainer'>
   <?php
   if ($CurrentPage == 'index') {
      echo "<input type='text' id='ItemSearchInput' placeholder='Suchen' user-scalable='no'>";
      echo "<a href='info.php'><img src='style/icons/info.svg' class='NavigationIcon'></a>";
   } elseif ($CurrentPage == 'info') {
      echo "<a href='index.php'><img src='style/icons/back.svg' class='NavigationIcon'></a>";
   }
   ?>
</div>