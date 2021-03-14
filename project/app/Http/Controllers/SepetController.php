<?php

namespace App\Http\Controllers;

use App\Models\Sepet;
use App\Models\SepetUrun;
use App\Models\Urun;
use Cart;
use Illuminate\Http\Request;

class SepetController extends Controller
{
    /*
    public function __construct(){ //controller icinde middleware
         $this->middleware('auth');
     }*/

    public function index(){
        return view('/sepet');
    }

    public function ekle()
    {
        $urun = Urun::find(request('id'));
        $cartItem = Cart::add($urun->id, $urun->urun_adi, 1, $urun->fiyati, ['slug' => $urun->slug]);
        if (auth()->check()) {
            $aktif_sepet_id = session('aktif_sepet_id');
            if(!isset($aktif_sepet_id)){
                $aktif_sepet = Sepet::create([
                    'kullanici_id' => auth()->id()
                ]);
                $aktif_sepet_id = $aktif_sepet->id;
                session()->put('aktif_sepet_id', $aktif_sepet_id);
            }
            SepetUrun::updateOrCreate(
                ['sepet_id' => $aktif_sepet_id, 'urun_id' => $urun->id],
                ['adet' => $cartItem->qty, 'fiyati' => $urun->fiyati, 'durum' => 'Beklemede']
            );
            return redirect()->route('sepet')
                ->with('mesaj', 'Urun sepete eklendi')
                ->with('mesaj_turu', 'success');
        }
    }
    public function kaldir($rowId){
        if (auth()->check()) {
            $aktif_sepet_id = session('aktif_sepet_id');
            $cartItem = Cart::get($rowId);
            SepetUrun::where('sepet_id', $aktif_sepet_id)->where('urun_id', $cartItem->id)->delete();
        }

        Cart::remove($rowId);
        return redirect()->route('sepet')
            ->with('mesaj','Urun sepetten kaldirildi')
            ->with('mesaj_turu','success');
    }
    public function bosalt(){
        if (auth()->check()) {
            $aktif_sepet_id = session('aktif_sepet_id');
            SepetUrun::where('sepet_id', $aktif_sepet_id)->delete();
        }
        Cart::destroy();
        return redirect()->route('sepet')
            ->with('mesaj','Sepet bosalttildi')
            ->with('mesaj_turu','success');
    }
    public function guncelle($rowId){
        if (auth()->check()) {
            $aktif_sepet_id = session('aktif_sepet_id');
            $cartItem = Cart::get($rowId);

            if (request('adet') == 0)
                SepetUrun::where('sepet_id', $aktif_sepet_id)->where('urun_id', $cartItem->id)
                    ->delete();
            else
                SepetUrun::where('sepet_id', $aktif_sepet_id)->where('urun_id', $cartItem->id)
                    ->update(['adet' => request('adet')]);
        }
        Cart::update($rowId, request('adet'));

        session()->flash('mesaj_turu', 'success');
        session()->flash('mesaj', 'Adet bilgisi güncellendi');

        return response()->json(['success' => true]);
    }
}




/*  public function giris(){
    $this->validate(request(),[
        'email' => 'required|email',
        'sifre' => 'required'
    ]);

    if (auth()->attempt(['email'=>request('email'),'password'=>request('sifre')], request()->has('benihatirla'))){
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
    }}
*/




