<?php

namespace App\Http\Controllers\Yonetim;

use App\Http\Controllers\Controller;
use App\Models\Urun;
use Illuminate\Http\Request;

class AnasayfaController extends Controller
{
    public function index(){
       $urun_sayi = Urun::count();
        return view('yonetim.anasayfa',compact(['urun_sayi']));
    }
}
