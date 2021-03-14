<?php

namespace App\Http\Controllers;
use App\Mail\KullaniciKayitMail;
use App\Models\Kullanici;
use App\Models\Sepet;
use App\Models\SepetUrun;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Cart;



class KullaniciController extends Controller
{
    public function __construct(){ //controller icinde middleware
        $this->middleware('guest')->except('oturumukapat');
    }

    public function kaydol_form(){
        return view('kullanici/kaydol');
    }
    public function giris_form(){
       return view('kullanici/oturumac');
    }


    public function giris()
    {
        $this->validate(request(),[
            'email' => 'required|email',
            'sifre' => 'required'
        ]);

        if (auth()->attempt(['email'=>request('email'),'password'=>request('sifre')], request()->has('benihatirla'))) {
            request()->session()->regenerate();
            $aktif_sepet_id = Sepet::firstOrCreate(['kullanici_id' => auth()->id()])->id;
            session()->put('aktif_sepet_id', $aktif_sepet_id);

            if (Cart::count() > 0) {
                foreach (Cart::content() as $cartItem) {
                    SepetUrun::updateOrCreate(
                        ['sepet_id' => $aktif_sepet_id, 'urun_id' => $cartItem->id],
                        ['adet' => $cartItem->qty, 'fiyati' => $cartItem->price, 'durum' => 'Beklemede']
                    );
                }
                Cart::destroy();
                $sepetUrunler = SepetUrun::with('urun')->where('sepet_id', $aktif_sepet_id)->get();
                foreach ($sepetUrunler as $sepetUrun) {
                    Cart::add($sepetUrun->urun->id, $sepetUrun->urun->urun_adi, $sepetUrun->adet, $sepetUrun->fiyati, ['slug' => $sepetUrun->urun->slug]);
                }

                return redirect()->intended('/');
            }
            else{
                $errors=['email','Hatali giris'];
                return back()->with($errors);
            }
        }
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

    public function oturumukapat(){
        Auth::logout();
        request()->session()->flush();
        request()->session()->regenerate();
        return redirect()->to('/');
    }
}
