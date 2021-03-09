<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SepetController extends Controller
{
    /*
    public function __construct(){ //controller icinde middleware
         $this->middleware('auth');
     }*/

    public function index(){
        return view('/sepet');
    }
}
