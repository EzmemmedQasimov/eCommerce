<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Kategori;

class KategoriController extends Controller
{
    public function index($slug_kategoriadi){
        $kategori = Kategori::where('slug',$slug_kategoriadi)->firstOrFail();
        $alt_kategoriler = Kategori::where('ust_id',$kategori->id)->get();
        $urunler = $kategori->urunler()->paginate(2);
        $order = request('order');
        if ($order == 'coksatanlar') {

            $urunler = $kategori->urunler()
                ->join('urundetay', 'urundetay.urun_id', 'urun.id')
                ->orderBy('urundetay.goster_cok_satan', 'desc')
                ->paginate(3);

        } else if ($order == 'yeni') {
            $urunler = $kategori->urunler()
                ->orderByDesc('guncelleme_tarihi')
                ->paginate(3);
        } else {
            $urunler = $kategori->urunler()
                ->orderByDesc('guncelleme_tarihi')
                ->paginate(3);
        }
    return view('/kategori',compact(['kategori','alt_kategoriler','urunler']));
    }
}
