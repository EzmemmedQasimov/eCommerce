<?php

use App\Models\Ayar;
use Illuminate\Support\Facades\Cache;
if(!function_exists('get_ayar')){
    function get_ayar($anahtar){
            $tumayarlar = Cache::remember('tumayarlar',60,function(){
               return Ayar::all();
            });
        Cache::forget('tumayarlar');
            return $tumayarlar->where('anahtar',$anahtar)->first()->deger;
    }
}
