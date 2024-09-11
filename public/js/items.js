$(document).ready(function() {

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

function SearchItems() {

  ClosePreviosItem();

  var SearchText = $('#ItemSearchInput').val().toLowerCase();

  $('.ItemSelection').each(function(){
    var ItemTitle = $(this).text().toLowerCase();
    ItemTitle.includes(SearchText) ? $(this).show(): $(this).hide();
  });
}

function ClosePreviosItem() {
  if ($('#ItemTitlesContainer').find(".Open").length) {
    $('.ItemSelection').removeClass('Open');
    $('.ItemSelection').removeClass('MediumFont');
    $('.ItemSelection .ItemIcon[src*="down.svg"]').attr('src', '../icons/right.svg');
  } 
  $('#ItemContainer').css("display", "none");
}

function OpenItem(ItemID) {

  var SelectionID = '#Selection' + ItemID;
  var FactorValue = $("#SliderFactor").val();

  ClosePreviosItem();
  ScrollToTop(SelectionID);

  $(ItemContainer).insertAfter(SelectionID);
  $(SelectionID).addClass('MediumFont');
  $(SelectionID).addClass('Open');
  $(SelectionID).find(".ItemIcon").attr("src", "../icons/down.svg");

  $('#ItemContainer').css("display", "block");
  $('#SliderSize').val(100);

  GetItemData(ItemID, function(ItemData) {

    var ItemCarbs = ItemData.Carbs;
    var Servings  = ItemData.ServingIDs;

    $('#ItemID').text(ItemID);
    $('#ItemCarbs').text(ItemCarbs);
    $("#ItemBoxThird").empty();

    CalcItem(ItemID, 100, FactorValue);

    if (Servings) {

      $("#ItemBoxThird").append("<p class='NutritionalValuesTitle'>Berechne</p>");

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

function CalcItem(ItemID, Size, Factor) {

  GetItemData(ItemID, function(ItemData) {

    var ItemCarbs     = ItemData.Carbs;
    var ItemSugar     = ItemData.Sugar;
    var ItemFibers    = ItemData.Fibers;
    var ItemFat       = ItemData.Fat;
    var Unit          = ItemData.Unit;
    var CalcCarbs     = (Size / 100 * ItemCarbs).toFixed(1);
    var CalcSugar     = (Size / 100 * ItemSugar).toFixed(1);
    var CalcFibers    = (Size / 100 * ItemFibers).toFixed(1);
    var CalcFat       = (Size / 100 * ItemFat).toFixed(1);
    var OutputUnits   = 'g/' + Size + Unit;
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

function fetchData(Endpoint, ItemID, callback) {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var responseData = JSON.parse(this.responseText);
      callback(responseData);
    }
  };

  var BaseUrl = window.location.hostname === 'localhost' ? 'http://localhost:8000' : 'https://www.carbs.ch';
  var URL     = BaseUrl + Endpoint + "?id=" + ItemID;

  xmlhttp.open("GET", URL, true);
  xmlhttp.send();
}

function GetItemData(ItemID, callback) {
  fetchData("/AjaxFoodItems", ItemID, callback);
}

function GetServingData(ItemID, callback) {
  fetchData("/AjaxFoodServings", ItemID, function(ArrayServingData) {
    for (var i = 0; i < ArrayServingData.length; i++) {
      callback(ArrayServingData[i]);
    }
  });
}

function UpdateLabel(ID, Value) {
  $(ID).text(Value);
}

function ScrollToTop(Div) {
  $([document.documentElement, document.body]).animate({
    scrollTop: $(Div).offset().top - 50
  }, 700);
}