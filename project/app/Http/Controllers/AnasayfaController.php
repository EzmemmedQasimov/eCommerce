<?php

namespace App\Http\Controllers;

use App\Models\Urun;
use App\Models\UrunDetay;
use App\Models\Kategori;

class AnasayfaController extends Controller
{

    public function index(){
        $kategoriler = Kategori::whereRaw('ust_id is null')->take(8)->get();
        $urun_slider = Urun::select('urun.*')
            ->join('urundetay','urundetay.urun_id','urun.id')
            ->where('urundetay.goster_gunun_firsati',1)
            ->orderBy('guncelleme_tarihi','desc')
            ->take(get_ayar('anasayfa_slider_urun_adet'))
            ->get();

        $urun_gunun_firsati = Urun::select('urun.*')
            ->join('urundetay','urundetay.urun_id','urun.id')
            ->where('urundetay.goster_gunun_firsati',1)
            ->orderBy('guncelleme_tarihi','desc')
            ->first();
        $urun_one_cikan = Urun::select('urun.*')
            ->join('urundetay','urundetay.urun_id','urun.id')
            ->where('urundetay.goster_gunun_firsati',1)
            ->orderBy('guncelleme_tarihi','desc')
            ->take(get_ayar('anasayfa_liste_urun_adet'))
            ->get();

        $urun_indirimli = Urun::select('urun.*')
            ->join('urundetay','urundetay.urun_id','urun.id')
            ->where('urundetay.goster_gunun_firsati',1)
            ->orderBy('guncelleme_tarihi','desc')
            ->take(12)
            ->get();

        $urun_cok_satan = Urun::select('urun.*')
            ->join('urundetay','urundetay.urun_id','urun.id')
            ->where('urundetay.goster_gunun_firsati',1)
            ->orderBy('guncelleme_tarihi','desc')
            ->take(8)
            ->get();
        return view('/anasayfa',compact(['kategoriler','urun_slider','urun_gunun_firsati','urun_one_cikan','urun_indirimli','urun_cok_satan']));
    }
}
