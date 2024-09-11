<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FoodParentCategories;
use App\Models\FoodCategories;
use App\Models\FoodItems;

class FoodController {

    public function getCategories() {

        $ParentCategories = FoodParentCategories::with('categories')->get();

        return view('food/categories', compact('ParentCategories'));
    }

    public function getItems(Request $request) {

        $CategoryID   = $request->query('CategoryID');
        $CategoryName = FoodItems::getCategoryName($CategoryID);
        $Items        = FoodItems::getItemsByCategory($CategoryID);

        foreach ($Items as $Item) {
            $Item->ServingCount = empty($Item->ServingIDs) ? 0 : count(explode(',', $Item->ServingIDs));
        }

        return view('food/items', compact('CategoryName', 'Items'));
    }

    public function ajaxItems(Request $request) {

        $ItemID = $request->query('id');
        $Item   = FoodItems::getSpecificItem($ItemID);

        return view('ajax/food-items', compact('Item'));

    }

    public function ajaxServings(Request $request) {

        $ItemID     = $request->query('id');
        $Item       = FoodItems::getSpecificItem($ItemID); 
        $ServingIDs = explode(',', $Item->ServingIDs);
        $Servings   = FoodItems::getServings($ServingIDs);
        
        return view('ajax/food-servings', compact('Servings'));

    }
}