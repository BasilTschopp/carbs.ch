<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FoodController;
use App\Http\Controllers\InfoController;

Route::get('/', [FoodController::class, 'getCategories']);
Route::get('/info', [InfoController::class, 'info']);
Route::get('/Categories', [FoodController::class, 'getCategories']);
Route::get('/Items', [FoodController::class, 'getItems']);
Route::get('/AjaxFoodItems', [FoodController::class, 'ajaxItems']);
Route::get('/AjaxFoodServings', [FoodController::class, 'ajaxServings']);