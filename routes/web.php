<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FoodController;
use App\Http\Controllers\InfoController;

Route::get('/', [FoodController::class, 'getCategories']);
Route::get('/info', [InfoController::class, 'info']);
Route::get('/getCategories', [FoodController::class, 'getCategories']);
Route::get('/getItems', [FoodController::class, 'getItems']);
Route::get('/Categories', [FoodController::class, 'getCategories']);
Route::get('/Items', [FoodController::class, 'getItems']);
Route::get('/entryFood', [FoodController::class, 'entryFood']);
Route::post('/insertFood', [FoodController::class, 'insertFood']);
Route::get('/AjaxFoodItems', [FoodController::class, 'ajaxItems']);
Route::get('/AjaxFoodServings', [FoodController::class, 'ajaxServings']);