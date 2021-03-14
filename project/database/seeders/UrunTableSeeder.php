<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\Urun;
use App\Models\UrunDetay;

class UrunTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

         DB::statement('SET FOREIGN_KEY_CHECKS=0');

        for($i=0;$i<30;$i++){
        $urun_adi = '1Something';
            Urun::truncate();
           $urun = Urun::create([
                'urun_adi'=>$urun_adi,
                'slug'=> Str::slug('3 Laravel 8 Framework','-'),
                'fiyati'=> '7.62',
                'aciklama'=>'1m typesettingIp sum is stypeset tingimply dummy text of
                the prit ypesetting nting and  industry. Lorem'
            ]);

           $detay = $urun->detay()->create([
               'goster_slider'=>rand(0,1),
               'goster_gunun_firsati'=>rand(0,1),
               'goster_one_cikan'=>rand(0,1),
               'goster_cok_satan'=>rand(0,1),
               'goster_indirimli'=>rand(0,1)
           ]);
        }
         DB::statement('SET FOREIGN_KEY_CHECKS=1');
    }
}
