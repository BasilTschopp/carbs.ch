<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {

    public function up(): void {

        Schema::create('food_items', function (Blueprint $table) {
            $table->id();
            $table->integer('CategoryID');
            $table->string('ItemName');
            $table->integer('Carbs');
            $table->integer('Sugar');
            $table->integer('Fibre');
            $table->integer('Fat');
            $table->integer('UnitID');
            $table->string('ServingID');
            $table->integer('Inactive');
        });

        $this->ImportFoodItemsCSV();

        Schema::create('food_servings', function (Blueprint $table) {
            $table->id();
            $table->string('ServingName');
            $table->integer('ServingSize');
        });

        $this->ImportFoodServingsCSV();

        Schema::create('food_units', function (Blueprint $table) {
            $table->id();
            $table->string('UnitName');
        });

        $this->ImportFoodUnitsCSV();


    }

    private function ImportFoodItemsCSV(): void {

        $csvFilePath = base_path('database/data/food_items.csv');

        if (($handle = fopen($csvFilePath, 'r')) !== false) {

            fgetcsv($handle); //skip the first line

            while (($data = fgetcsv($handle, 1000, ',')) !== false) {
    
                DB::table('food_items')->insert([
                    'CategoryID' => $data[1],
                    'ItemName' => $data[2],
                    'Carbs' => $data[3],
                    'Sugar' => $data[4],
                    'Fibre' => $data[5],
                    'Fat' => $data[6],
                    'UnitID' => $data[7],
                    'ServingID' => $data[8],
                    'Inactive' => $data[9],
                ]);
            }

            fclose($handle);
        }
    }

    private function ImportFoodServingsCSV(): void {

        $csvFilePath = base_path('database/data/food_servings.csv');

        if (($handle = fopen($csvFilePath, 'r')) !== false) {

            fgetcsv($handle); //skip the first line

            while (($data = fgetcsv($handle, 1000, ',')) !== false) {
    
                DB::table('food_servings')->insert([
                    'ServingName' => $data[1],
                    'ServingSize' => $data[2],
                ]);
            }

            fclose($handle);
        }
    }

    private function ImportFoodUnitsCSV(): void {

        $csvFilePath = base_path('database/data/food_units.csv');

        if (($handle = fopen($csvFilePath, 'r')) !== false) {

            fgetcsv($handle); //skip the first line

            while (($data = fgetcsv($handle, 1000, ',')) !== false) {
    
                DB::table('food_units')->insert([
                    'UnitName' => $data[1],
                ]);
            }

            fclose($handle);
        }
    }



    public function down(): void {

        Schema::dropIfExists('food_items');
        Schema::dropIfExists('food_servings');
        Schema::dropIfExists('food_units');
        
    }

};
