<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UrunDetay extends Model
{
    protected $table="urundetay";
    public $timestamps=false;
    protected $guarded = [];

    public function urun()
    {
        return $this->belongsTo('urun');
    }
}
