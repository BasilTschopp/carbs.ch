<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {

    public function up(): void {

        Schema::create('food_category_parent', function (Blueprint $table) {
            $table->bigIncrements('ParentID');
            $table->integer('Order');
        });

        Schema::create('food_category_child', function (Blueprint $table) {
            $table->bigIncrements('ChildID');
            $table->integer('ParentID');
            $table->integer('Order');
        });

        Schema::create('food_item', function (Blueprint $table) {
            $table->bigIncrements('ItemID');
            $table->integer('CategoryChildID');
            $table->string('Unit', 2);
            $table->boolean('Active');
        });

        Schema::create('food_nutrival', function (Blueprint $table) {
            $table->bigIncrements('NutrivalID');
            $table->decimal('FoodID', 3, 1);
            $table->decimal('Carbs', 3, 1);
            $table->decimal('Sugar', 3, 1);
            $table->decimal('Fibers', 3, 1);
            $table->decimal('Fat', 3, 1);
        });

        Schema::create('food_serving', function (Blueprint $table) {
            $table->bigIncrements('ServingID');
            $table->integer('ItemID');
            $table->integer('ServingSize');
        });

        Schema::create('translation_category_parent', function (Blueprint $table) {
            $table->id();
            $table->integer('ParentID');
            $table->integer('LanguageID');
            $table->string('CategoryParentName', 50);
        });

        Schema::create('translation_category_child', function (Blueprint $table) {
            $table->id();
            $table->integer('ChildID');
            $table->integer('LanguageID');
            $table->string('CategoryChildName', 50);
        });

        Schema::create('translation_food', function (Blueprint $table) {
            $table->id();
            $table->integer('FoodID');
            $table->integer('LanguageID');
            $table->string('FoodName', 50);
        });

        Schema::create('translation_serving', function (Blueprint $table) {
            $table->id();
            $table->integer('ServingID');
            $table->integer('LanguageID');
            $table->string('ServingName', 50);
        });

        Schema::create('language', function (Blueprint $table) {
            $table->bigIncrements('LanguageID');
            $table->string('LanguageAbbreviation', 3);
            $table->string('LanguageName', 50);
            $table->boolean('Active');
        });

        $this->ImportFoodCategoryParentCSV();
        $this->ImportFoodCategoryChildCSV();
        $this->ImportTranslationCategoryParentCSV();
        $this->ImportTranslationCategoryChildCSV();
        $this->ImportLanguageCSV();


    }

    private function ImportFoodCategoryParentCSV(): void {

        $csvFilePath = base_path('database/data/food_category_parent.csv');

        if (($handle = fopen($csvFilePath, 'r')) !== false) {

            fgetcsv($handle); //skip the first line

            while (($data = fgetcsv($handle, 1000, ',')) !== false) {
    
                DB::table('food_category_parent')->insert([
                    'ParentID' => $data[0],
                    'Order' => $data[1],
                ]);
            }

            fclose($handle);
        }
    }

    private function ImportFoodCategoryChildCSV(): void {

        $csvFilePath = base_path('database/data/food_category_child.csv');

        if (($handle = fopen($csvFilePath, 'r')) !== false) {

            fgetcsv($handle); //skip the first line

            while (($data = fgetcsv($handle, 1000, ',')) !== false) {
    
                DB::table('food_category_child')->insert([
                    'ChildID' => $data[0],
                    'ParentID' => $data[1],
                    'Order' => $data[2],
                ]);
            }

            fclose($handle);
        }
    }

    private function ImportTranslationCategoryParentCSV(): void {

        $csvFilePath = base_path('database/data/translation_category_parent.csv');

        if (($handle = fopen($csvFilePath, 'r')) !== false) {

            fgetcsv($handle); //skip the first line

            while (($data = fgetcsv($handle, 1000, ',')) !== false) {
    
                DB::table('translation_category_parent')->insert([
                    'ParentID' => $data[1],
                    'LanguageID' => $data[2],
                    'CategoryParentName' => $data[3],
                ]);
            }

            fclose($handle);
        }
    }

    private function ImportTranslationCategoryChildCSV(): void {

        $csvFilePath = base_path('database/data/translation_category_child.csv');

        if (($handle = fopen($csvFilePath, 'r')) !== false) {

            fgetcsv($handle); //skip the first line

            while (($data = fgetcsv($handle, 1000, ',')) !== false) {
    
                DB::table('translation_category_child')->insert([
                    'ChildID' => $data[1],
                    'LanguageID' => $data[2],
                    'CategoryChildName' => $data[3],
                ]);
            }

            fclose($handle);
        }
    }

    private function ImportLanguageCSV(): void {

        $csvFilePath = base_path('database/data/language.csv');

        if (($handle = fopen($csvFilePath, 'r')) !== false) {

            fgetcsv($handle); //skip the first line

            while (($data = fgetcsv($handle, 1000, ',')) !== false) {
    
                DB::table('language')->insert([
                    'LanguageID' => $data[0],
                    'LanguageAbbreviation' => $data[1],
                    'LanguageName' => $data[2],
                    'Active' => $data[3],
                ]);
            }

            fclose($handle);
        }
    }

    public function down(): void {

        Schema::dropIfExists('food_category_parent');
        Schema::dropIfExists('food_category_child');

        Schema::dropIfExists('food_item');
        Schema::dropIfExists('food_nutrival');
        Schema::dropIfExists('food_serving');
        Schema::dropIfExists('translation_category_parent');
        Schema::dropIfExists('translation_category_child');
        Schema::dropIfExists('translation_food');
        Schema::dropIfExists('translation_serving');
        Schema::dropIfExists('translation_unit');
        Schema::dropIfExists('language');

    }

};