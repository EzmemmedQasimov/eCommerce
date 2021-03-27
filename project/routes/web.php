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
Route::group(['prefix'=>'yonetim'], function (){
    Route::redirect('/','/yonetim/oturumac');
    Route::match(['get','post'],'/oturumac',[App\Http\Controllers\Yonetim\KullaniciController::class,'oturumac'])->name('yonetim.oturumac');
    Route::get('/oturumukapat',[App\Http\Controllers\Yonetim\KullaniciController::class,'oturumukapat'])->name('yonetim.oturumukapat');
    Route::group(['middleware'=>'yonetim'],function () {
        Route::get('/anasayfa', [App\Http\Controllers\Yonetim\AnasayfaController::class, 'index'])->name('yonetim.anasayfa');

        Route::group(['prefix' => 'kullanici'], function () {
            Route::match(['get', 'post'], '/', [App\Http\Controllers\Yonetim\KullaniciController::class,'index'])->name('yonetim.kullanici');
            Route::get('/yeni', [App\Http\Controllers\Yonetim\KullaniciController::class,'form'])->name('yonetim.kullanici.yeni');
            Route::get('/duzenle/{id}', [App\Http\Controllers\Yonetim\KullaniciController::class,'form'])->name('yonetim.kullanici.duzenle');
            Route::post('/kaydet/{id?}', [App\Http\Controllers\Yonetim\KullaniciController::class,'kaydet'])->name('yonetim.kullanici.kaydet');
            Route::get('/sil/{id}', [App\Http\Controllers\Yonetim\KullaniciController::class,'sil'])->name('yonetim.kullanici.sil');
        });

        Route::group(['prefix' => 'kategori'], function () {
            Route::match(['get', 'post'], '/', [App\Http\Controllers\Yonetim\KategoriController::class,'index'])->name('yonetim.kategori');
            Route::get('/yeni', [App\Http\Controllers\Yonetim\KategoriController::class,'form'])->name('yonetim.kategori.yeni');
            Route::get('/duzenle/{id}', [App\Http\Controllers\Yonetim\KategoriController::class,'form'])->name('yonetim.kategori.duzenle');
            Route::post('/kaydet/{id?}', [App\Http\Controllers\Yonetim\KategoriController::class,'kaydet'])->name('yonetim.kategori.kaydet');
            Route::get('/sil/{id}', [App\Http\Controllers\Yonetim\KategoriController::class,'sil'])->name('yonetim.kategori.sil');
        });

        Route::group(['prefix' => 'urun'], function () {
            Route::match(['get', 'post'], '/', [App\Http\Controllers\Yonetim\UrunController::class,'index'])->name('yonetim.urun');
            Route::get('/yeni', [App\Http\Controllers\Yonetim\UrunController::class,'form'])->name('yonetim.urun.yeni');
            Route::get('/duzenle/{id}', [App\Http\Controllers\Yonetim\UrunController::class,'form'])->name('yonetim.urun.duzenle');
            Route::post('/kaydet/{id?}', [App\Http\Controllers\Yonetim\UrunController::class,'kaydet'])->name('yonetim.urun.kaydet');
            Route::get('/sil/{id}', [App\Http\Controllers\Yonetim\UrunController::class,'sil'])->name('yonetim.urun.sil');
        });
    });
});


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

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'yonetim']], function () {
    \UniSharp\LaravelFilemanager\Lfm::routes();
});



