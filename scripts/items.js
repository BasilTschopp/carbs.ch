/* --- Start function on input --- */
$(document).ready(function() {

    $('#ItemSearchInput').on('keyup', SearchItems);

    $('#SliderSize, #SliderFactor').change(function() {

        var ItemID = $("#ItemID").text();
        var Size   = $('#SliderSize').val();
        var Factor = $('#SliderFactor').val();

        CalcItem(ItemID, Size, Factor);
    });

    $('#SliderBolus').change(function() {

        var ItemID = $("#ItemID").text();
        var Carbs  = $("#ItemCarbs").text();
        var Factor = $('#SliderFactor').val();
        var Bolus  = $('#SliderBolus').val();
        var Size   = ((Bolus * 10) / (Carbs / 100 * Factor)).toFixed(0);

        CalcItem(ItemID, Size, Factor);
    });

    $('#SliderSize').on('input', function() {
        UpdateLabel('#SliderValueSize', $(this).val());
    });

    $('#SliderFactor').on('input', function() {
        UpdateLabel('#SliderValueFactor', $(this).val());
    });

    $('#SliderBolus').on('input', function() {
        UpdateLabel('#SliderValueBolus', $(this).val());
    });
});


/* --- Search Items ---
   1. Close opened item.
   2. Get value from search input.
   3. Loop through titles, hide if search text is not contained. 
*/
function SearchItems() {

  ClosePreviosItem();

  var SearchText = $('#ItemSearchInput').val().toLowerCase();

  $('.ItemSelection').each(function(){

      var ItemTitle = $(this).text().toLowerCase();
      ItemTitle.includes(SearchText) ? $(this).show(): $(this).hide();

  });
}

/* --- Close Previos Item ---
   1. Find titles with the class 'Open'.
   2. Remove bold medium font and class 'Open'.
*/
function ClosePreviosItem() {

  if ($('#ItemTitlesContainer').find(".Open").length) {

    $('.ItemSelection').removeClass('MediumFont');
    $('.ItemSelection').removeClass('Open');

  } 

  $('#ItemContainer').css("display", "none");

}

/* --- Open Item ---
   1. Close opened item
   2. Scroll the title to the top
   3. Insert the item container after the title
   4. Make the title font bolder
   5. Add the class 'Open' to the title
   6. Change the icon to down
   7. Show the item container
   8. Set the size slider to the default size 100
   9. Set the values for the hidden divs for easier calculation.
   10. Remove the previous portion sizes
   11. Calculate the values for the standard size 100
   12. Insert the portion sizes if available
*/
function OpenItem(ItemID) {

  var SelectionID = '#Selection' + ItemID;
  var FactorValue = $("#SliderFactor").val();

  ClosePreviosItem();
  ScrollToTop(SelectionID);

  $(ItemContainer).insertAfter(SelectionID);
  $(SelectionID).addClass('MediumFont');
  $(SelectionID).addClass('Open');
  $(SelectionID).find(".ItemIcon").attr("src", "style/icons/down.svg");

  $('#ItemContainer').css("display", "block");
  $('#SliderSize').val(100);

  GetItemData(ItemID, function(ItemData) {

    var ItemCarbs     = ItemData.Carbs;
    var CountServings = ItemData.CountServings;

    $('#ItemID').text(ItemID);
    $('#ItemCarbs').text(ItemCarbs);
    $("#ItemBoxThird").empty();

    CalcItem(ItemID, 100, FactorValue);

    if (CountServings > 0) {

      $("#ItemBoxThird").append("<p class='GreyTitle PaddingTopMedium'>Berechne</p>");

      GetServingData(ItemID, function(ServingData) {

        var ServingID    = ServingData.ID;
        var ServingTxtID = 'Serving' + ServingID;
        var ServingName  = ServingData.ServingName;
        var ServingSize  = ServingData.ServingSize;

        var ServingLink  = "<p id='Serving" + ServingTxtID + "' class='ServingLink' ";
        ServingLink     += "onclick='CalcItem(" + ItemID + "," + ServingSize + "," + FactorValue + ")';>";
        ServingLink     += ServingName;
        ServingLink     += "</p>";

        $("#ItemBoxThird").append(ServingLink);

      });
    }
  });
}

/* --- Calc Item ---
   1. Calculate the values for the item
   2. Remove the previous values
   3. Insert the new values
   4. Set the sliders to the new values
   5. Update the labels of the sliders
*/
function CalcItem(ItemID, Size, Factor) {

  GetItemData(ItemID, function(ItemData) {

    var ItemCarbs     = ItemData.Carbs;
    var ItemSugar     = ItemData.Sugar;
    var ItemFibers    = ItemData.Fibers;
    var ItemFat       = ItemData.Fat;
    var UnitName      = ItemData.UnitName;
    var CalcCarbs     = (Size / 100 * ItemCarbs).toFixed(1);
    var CalcSugar     = (Size / 100 * ItemSugar).toFixed(1);
    var CalcFibers    = (Size / 100 * ItemFibers).toFixed(1);
    var CalcFat       = (Size / 100 * ItemFat).toFixed(1);
    var OutputUnits   = 'g/' + Size + UnitName;
    var SliderFactor  = $("#SliderFactor").val();
    var CalcBolus     = CalcCarbs / 10 * SliderFactor;
    var RoundedBolus  = Math.round(CalcBolus * 10) / 10;

    $("#ItemBoxSecond").empty();
    $("#ItemBoxSecond").append("<p class='PaddingTopSmall'>" + CalcCarbs + OutputUnits + "</p>");
    $("#ItemBoxSecond").append("<p>" + CalcSugar + OutputUnits + "</p>");
    $("#ItemBoxSecond").append("<p>" + CalcFibers + OutputUnits + "</p>");
    $("#ItemBoxSecond").append("<p>" + CalcFat + OutputUnits + "</p>");

    $('#SliderSize').val(Size);
    $('#SliderBolus').val(RoundedBolus);

    UpdateLabel('#SliderValueSize', Size);
    UpdateLabel('#SliderValueBolus', RoundedBolus);

  });

}

/* --- Get Item Data ---
   Ajax request for the item data
*/
function GetItemData(ItemID, callback) {

  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {

    if (this.readyState == 4 && this.status == 200) {

      var ArrayItemData = JSON.parse(this.responseText);
      var ItemData      = ArrayItemData[0];

      callback(ItemData);
    }
  };

  xmlhttp.open("GET", "include/ajax-data-item.php?id=" + ItemID, true);
  xmlhttp.send();
}

/* --- Get Serving Data ---
   Ajax request for the serving data
*/
function GetServingData(ItemID, callback) {

  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {

    if (this.readyState == 4 && this.status == 200) {

      var ArrayServingData = JSON.parse(this.responseText);

      for (var i = 0; i < ArrayServingData.length; i++) {

        var ServingData = ArrayServingData[i];
        callback(ServingData);

      }
    }
  };

  xmlhttp.open("GET","include/ajax-data-servings.php?id=" + ItemID, true);
  xmlhttp.send();
}


function UpdateLabel(ID, Value) {

  $(ID).text(Value);

}

/* --- Scroll to Top ---
   1. Calculate the scroll position
   2. Scroll to the position
*/
function ScrollToTop(Div) {

  $([document.documentElement, document.body]).animate({
    scrollTop: $(Div).offset().top - 50
  }, 700);

}