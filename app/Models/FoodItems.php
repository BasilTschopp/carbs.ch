<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FoodItems extends Model {

    protected $FoodItems = 'food_items';

    public static function getActiveItems() {

        return self::where('active', 1)->get();

    }

}