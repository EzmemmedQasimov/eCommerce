<?php

namespace App\Http\Controllers;
use App\Mail\KullaniciKayitMail;
use App\Models\Kullanici;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;



class KullaniciController extends Controller
{
    public function kaydol_form(){
        return view('kullanici/kaydol');
    }
    public function giris_form(){
       return view('kullanici/oturumac');
    }
    public function giris(){
        $this->validate(request(),[
            'email' => 'required|email',
            'sifre' => 'required'
        ]);
    }
    public function kaydol()
    {
        $this->validate(request(),[
            'adsoyad' => 'required|min:3|max:60',
            'email' => 'required|unique:kullanici|email',
            'sifre' => 'required|confirmed'
        ]);

        $kullanici = Kullanici::create([
            'adsoyad'=>request('adsoyad'),
            'email'=>request('email'),
            'sifre'=>Hash::make(request('sifre')),
            'aktivasyon_anahtari'=>Str::random(60),
            'aktif_mi'=>0

        ]);

        Mail::to(request('email'))->send(new KullaniciKayitMail($kullanici));



        Auth::login($kullanici);

        return redirect()->route('anasayfa');
    }

    public function aktiflestir($anahtar)
    {
        $kullanici = Kullanici::where('aktivasyon_anahtari',$anahtar)->first();
        if(!is_null($kullanici)){
            $kullanici->aktivasyon_anahtari = null;
            $kullanici->aktif_mi = 1;
            $kullanici->save();
            return redirect()->to('/')
                ->with('mesaj','Kullanici kaydiniz aktiflesdirildi')
                ->with('mesaj_turu','success');
        }
        else{
            return redirect()->to('/')
                ->with('mesaj','Kullanici kaydiniz aktiflesdirelemedi')
                ->with('mesaj_turu','warning');
        }
    }
}
