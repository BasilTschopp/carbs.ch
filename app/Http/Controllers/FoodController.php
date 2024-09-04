<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FoodItems;
use App\Models\FoodServings;

class FoodController {

    public function getItems() {

        $Items = FoodItems::getActiveItems();

        // Count the number of portion sizes
        foreach ($Items as $Item) {
            if (empty($Item->ServingIDs)) {
                $Item->ServingCount = 0;
            } else {
                $ServingIds = explode(',', $Item->ServingIDs);
                $Item->ServingCount = count($ServingIds);
            }
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
        $ServingIDs      = explode(',', $Item->ServingIDs);
        $Servings        = FoodServings::whereIn('id', $ServingIDs)->get();
        
        return view('ajax/food-servings', compact('Servings'));

    }
}