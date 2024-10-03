<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FoodCategoryChild extends Model {

    protected $table = 'food_category_child';

    public function parentCategory() {
        return $this->belongsTo(FoodCategoryParent::class, 'ParentID', 'id');
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

}