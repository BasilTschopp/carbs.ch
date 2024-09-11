<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class FoodItems extends Model {

    public static function getItems() {
        return DB::table('food_items')->where('Active', 1)->orderBy('ItemName', 'asc')->get();
    }

    public static function getItemsByCategory($CategoryID) { 
        return DB::table('food_items')->where('Active', 1)->where('CategoryID', $CategoryID)->orderBy('ItemName', 'asc')->get();
    }

    public static function getCategoryName($CategoryID) { 
        return DB::table('food_categories')->where('id', $CategoryID)->pluck('CategoryName')->first();
    }

    public static function getSpecificItem($ItemID) {
        return DB::table('food_items')->where('id', $ItemID)->first();
    }

    public static function getServings(array $ServingIDs) {
        return DB::table('food_servings')->whereIn('id', $ServingIDs)->get();   
    }  
}