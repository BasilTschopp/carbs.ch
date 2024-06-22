<?php
include 'include/app-config.php';
include 'include/db-conn.php';
include 'include/db-info.php';
include 'include/header.php';

$dbInfo = new dbInfo();
$ResultInfoText = $dbInfo->dbInfoText();

echo "<article class='Padding'>";

while ($ArrayInfoText = mysqli_fetch_array($ResultInfoText)) {

    $Title = $ArrayInfoText['Title'];
    $Text  = $ArrayInfoText['Text'];

    echo "<h2>".$Title."</h2>";
    echo "<p>".$Text."</p>";
}
    
echo "</article>";

include 'include/db-conn-close.php'; 
include 'include/footer.php';

?>