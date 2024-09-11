<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FoodParentCategories extends Model {

    protected $table = 'food_parent_categories';

    public function categories() {
        return $this->hasMany(FoodCategories::class, 'ParentID', 'id')->orderBy('Order', 'asc')->where('active', 1);;
    }
}