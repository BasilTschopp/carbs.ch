<?php include 'header.php'; ?>

<article>

    <!-- Loop to create item titles -->
    <div id='ItemTitlesContainer'>

        <?php
        $dbFood = new dbFood();
        $ResultItems = $dbFood->dbItems();

        while ($ArrayItems = mysqli_fetch_array($ResultItems)) {

            $ItemID        = $ArrayItems['ID'];
            $ItemName      = $ArrayItems['ItemName'];
            $CountServings = $ArrayItems['CountServings'];
            $SelectionID   = 'Selection' . $ItemID;

            echo "<div id='".$SelectionID."' class='ItemSelection' onclick='OpenItem(".$ItemID.")'>";
            echo "<img src='../public/images/right.svg' title='Open' alt='Item' class='ItemIcon'>";
            echo "<div class='ItemName'>".$ItemName."</div>";
            echo "<div class='ItemCountServings'>".$CountServings."</div>";
            echo "</div>";
        }
        ?>

    </div>

    <!-- Single item container that is moved under the corresponding title -->
    <div id='ItemContainer'>

        <!-- xy -->
        <div id='ItemID' style='display: none;'></div>
        <div id='ItemCarbs' style='display: none;'></div>

        <!-- Upper Output Area -->
        <div id='ItemContainerTop'>

            <div id='ItemBoxFirst'>
                <p class='GreyTitle PaddingTopMedium'>Nährwerte</p>
                <p>Kohlenhydrate</p>
                <p>davon Zucker</p>
                <p>Nahrungsfasern</p>
                <p>Fettgehalt</p>
            </div>

            <div id='ItemBoxSecond'></div>
            <div id='ItemBoxThird'></div>

        </div>

        <!-- Lower Slider Area -->
        <div id='ItemContainerBottom'>
            <!-- Size Number -->
            <div class='SliderContainerLeft'>
                <p class='SliderTitle'>Menge</p>
                <p id='SliderValueSize' class='SliderValue'>100</p>
            </div>
            <!-- Size Slider -->
            <div class='SliderContainerRight'>
                <input type='range' id='SliderSize' class='Slider' min='0' max='500' step='5' value='1'>
            </div>
            <!-- Factor Number -->
            <div class='SliderContainerLeft'>
                <p class='SliderTitle'>Faktor</p>
                <p id='SliderValueFactor' class='SliderValue'>1</p>
            </div>
            <!-- Factor Slider -->
            <div class='SliderContainerRight'>
                <input type='range' id='SliderFactor' class='Slider' min='0.1' max='5' step='0.1' value='1'>
            </div>
            <!-- Bolus Number -->
            <div class='SliderContainerLeft'>
                <p class='SliderTitle'>Bolus</p>
                <p id='SliderValueBolus' class='SliderValue'></p>
            </div>
            <!-- Bolus Slider -->
            <div class='SliderContainerRight'>
                <input type='range' id='SliderBolus' class='Slider' min='0' max='20' step='0.1' value='1'>
            </div>
        </div>
    </div>
</article>

<?php include 'footer.php'; ?>