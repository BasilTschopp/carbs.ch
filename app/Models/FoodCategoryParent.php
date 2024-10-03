<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FoodCategoryParent extends Model {

    protected $table = 'food_category_parent';

    public function categories() {
        return $this->hasMany(FoodCategorychild::class, 'ParentID', 'id')->orderBy('Order', 'asc');;
    }
}