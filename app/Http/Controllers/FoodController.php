<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FoodItems;
use App\Models\FoodServings;

class FoodController extends Controller {

    public function getItems() {

        $Items = FoodItems::all();

        foreach ($Items as $Item) {
            $ServingIds = explode(',', $Item->ServingID);
            $Item->ServingCount = count($ServingIds);
        }

        return view('food/items', compact('Items'));

    }

    public function ajaxItems(Request $request) {

        $ItemID = $request->query('id');
        $Item   = FoodItems::find($ItemID);

        return view('ajax/food-items', compact('Item'));

    }

    public function ajaxServings(Request $request) {

        $ItemID          = $request->query('id');
        $Item            = FoodItems::find($ItemID); 
        $ServingIDs      = explode(',', $Item->ServingID);
        $Servings        = FoodServings::whereIn('id', $ServingIDs)->get();
        
        return view('ajax/food-servings', compact('Servings'));

    }
}