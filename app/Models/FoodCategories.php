<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FoodCategories extends Model {

    protected $table = 'food_categories';

    public function parentCategory() {
        return $this->belongsTo(FoodParentCategories::class, 'ParentID', 'id');
    }
}