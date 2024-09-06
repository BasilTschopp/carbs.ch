#### About
A web application for calculating carbohydrates and other nutrients in meals. Since estimating the weight of portion sizes can often be challenging, common portion sizes are pre-set. Additionally, Type 1 diabetics can use the factor to directly calculate their insulin dosage.

#### Source Information
General nutritional values per 100g or 100ml for the foods are from [Naehrwertdaten.ch](https://naehrwertdaten.ch). Product-specific nutritional values are from the producer's website. The portion sizes come from various non-proprietary sources.

#### Framework and Library
[Laravel PHP Framework](https://laravel.com) and the [jQuery Library](https://jquery.com).

#### Database
The food data is stored as CSV files in the database/data folder and is automatically loaded into the database after the structure is created by using php artisan migrate.
