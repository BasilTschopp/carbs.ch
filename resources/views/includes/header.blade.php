<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Carbs.ch</title>
        <link href="{{ asset('css/custom-general.css') }}" rel="stylesheet" type="text/css">
        <link href="{{ asset('css/custom-food.css') }}" rel="stylesheet" type="text/css">
        <script src="{{ asset('js/jquery-3.7.1.min') }}"></script>
        <script src="{{ asset('js/items.js') }}"></script>
    </head>

    <nav>
        <div class="NavContainer">
            <div class="NavBox">INFO</div>
            <div class="NavBox">CARBS</div>
            <div class="NavBox">LOGIN</div>
        </div>
    </nav>