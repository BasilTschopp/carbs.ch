<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FoodController;

Route::get('/', [FoodController::class, 'getItems']);
Route::get('/getItems', [FoodController::class, 'getItems']);
Route::get('/AjaxFoodItems', [FoodController::class, 'ajaxItems']);
Route::get('/AjaxFoodServings', [FoodController::class, 'ajaxServings']);