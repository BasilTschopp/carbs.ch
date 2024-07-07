<?php 
include 'header.php';

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

include 'footer.php';
?>