@include('includes.header')

<div class='FixedHeaderContainer'>
    <input type='text' id='ItemSearchInput' placeholder='Suchen' user-scalable='no'>
</div>

<article>

    <!-- Loop to create item titles -->
    <div id='ItemTitlesContainer'>

        @foreach($Items as $Item)

            <div id='Selection{{ $Item->id }}' class='ItemSelection' onclick='OpenItem({{ $Item->id }})'>
            <img src="{{ asset('icons/right.svg')}}" class='ItemIcon' title='Open' alt='Item'>
            <div class='ItemName'>{{ $Item->ItemName }}</div>
            <div class='ItemCountServings'>{{ $Item->ServingCount }}</div>
            </div>

        @endforeach

    </div>

   <!-- Single item container that is moved under the corresponding title -->
   <div id='ItemContainer'>

        <!-- Helper fields for the calculation with Javascript -->
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

@include('includes.footer')