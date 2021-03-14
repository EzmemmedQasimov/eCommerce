<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/',[App\Http\Controllers\AnasayfaController::class, 'index'])->name('anasayfa');
Route::get('/kategori/{slug_kategoriadi}',[App\Http\Controllers\KategoriController::class, 'index'])->name('kategori');
Route::get('/urun/{slug_urunadi}',[App\Http\Controllers\UrunController::class, 'index'])->name('urun');
Route::post('/ara',[App\Http\Controllers\UrunController::class,'ara'])->name('urun_ara');
Route::get('/ara',[App\Http\Controllers\UrunController::class,'ara'])->name('urun_ara');

Route::group(['prefix'=>'sepet'], function(){
    Route::get('/',[App\Http\Controllers\SepetController::class,'index'])->name('sepet');//->middleware('auth');
    Route::post('/ekle',[App\Http\Controllers\SepetController::class,'ekle'])->name('sepet.ekle');
    Route::delete('/kaldir/{rowId}',[App\Http\Controllers\SepetController::class,'kaldir'])->name('sepet.kaldir');
    Route::delete('/bosalt',[App\Http\Controllers\SepetController::class,'bosalt'])->name('sepet.bosalt');
    Route::patch('/guncelle/{rowid}',[App\Http\Controllers\SepetController::class,'guncelle'])->name('sepet.guncelle');
});



Route::group(['middleware'=>'auth'],function (){
    Route::get('/odeme',[App\Http\Controllers\OdemeController::class,'index'])->name('odeme');
    Route::get('/siparisler',[App\Http\Controllers\SiparislerController::class,'index'])->name('siparisler');
    Route::get('/siparisler/{id}',[App\Http\Controllers\SiparislerController::class,'detay'])->name('siparis');
});

Route::group(['prefix'=>'kullanici'], function(){
    Route::get('/kaydol',[App\Http\Controllers\KullaniciController::class,'kaydol_form'])->name('kullanici.kaydol');
    Route::post('/kaydol',[App\Http\Controllers\KullaniciController::class,'kaydol']);
    Route::get('/oturumac',[App\Http\Controllers\KullaniciController::class,'giris_form'])->name('kullanici.oturumac');
    Route::post('/oturumac',[App\Http\Controllers\KullaniciController::class,'giris']);
    Route::post('/oturumukapat',[App\Http\Controllers\KullaniciController::class,'oturumukapat'])->name('kullanici.oturumukapat');
    Route::get('aktiflestir/{anahtar}',[App\Http\Controllers\KullaniciController::class,'aktiflestir'])->name('aktiflestir');
});


Route::get('test/mail',function (){
    return new App\Mail\KullaniciKayitMail();
});

