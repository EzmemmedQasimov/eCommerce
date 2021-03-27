<?php

namespace App\Providers;

use App\Models\Kategori;
use App\Models\Kullanici;
use App\Models\Urun;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
/*
        $bitis_zamani = now()->addMinute(10);
        $istatistikler = Cache::remember('istatistikler',$bitis_zamani,function (){
            return [
                'urun_sayi' => Urun::count(),
                'kategori_sayi' => Kategori::count(),
                'user_sayi' => Kullanici::count()
            ];
        });
        View::share('istatistikler',$istatistikler); */

        View::composer(['yonetim.*'],function ($view){
            $bitis_zamani = now()->addMinute(1);
            $istatistikler = Cache::remember('istatistikler',$bitis_zamani,function (){
                return [
                    'urun_sayi' => Urun::count(),
                    'kategori_sayi' => Kategori::count(),
                    'user_sayi' => Kullanici::count()
                ];
            });
            Cache::forget('istatistikler');
            $view->with('istatistikler',$istatistikler);
        });
    }
}
