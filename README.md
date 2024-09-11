<img src="https://github.com/BasilTschopp/carbs.ch/blob/Laravel-Test/public/icons/read.png" width="40" height="40">

#### About
A web application for calculating carbohydrates and other nutrients in meals. Since estimating the weight of portion sizes can often be challenging, common portion sizes are pre-set. Additionally, Type 1 diabetics can use the factor to directly calculate their insulin dosage.

#### Source Information
General nutritional values per 100g or 100ml for the foods are from Naehrwertdaten.ch. Product-specific nutritional values are from the producer's website. The portion sizes come from various non-proprietary sources.

#### Framework and Library
Laravel PHP Framework and the jQuery Library.

#### Database
The food data is stored as CSV files in the database/data folder and is automatically loaded into the database after the structure is created by using php artisan migrate.
