<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class FoodItems extends Model {

    public static function getItems() {
        return DB::table('food_items')->where('Active', 1)->orderBy('ItemName', 'asc')->get();
    }

    public static function getCategories() {
        return DB::table('food_category_child as c')
        ->leftJoin('food_category_parent as p', 'p.ParentID', '=', 'c.ParentID')
        ->leftJoin('translation_category_child as tc', 'tc.ChildID', '=', 'c.ChildID')
        ->leftJoin('translation_category_parent as tp', 'tp.ParentID', '=', 'p.ParentID')
        ->where('tp.LanguageID', 1)
        ->where('tc.LanguageID', 1)
        ->orderBy('p.Order', 'asc')
        ->orderBy('c.Order', 'asc')
        ->select('c.ChildID', DB::raw('CONCAT(tp.CategoryParentName," - ",tc.CategoryChildName) AS CategoryName'))
        ->get();
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