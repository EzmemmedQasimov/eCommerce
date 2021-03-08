<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SiparislerController extends Controller
{
    public function index(){
        return view('/siparisler');
    }

    public function detay($id){
        return view('/siparis');
    }
}
