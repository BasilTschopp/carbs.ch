<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class InfoController {

    public function info() {

        return view('info/info-text');

    }

}