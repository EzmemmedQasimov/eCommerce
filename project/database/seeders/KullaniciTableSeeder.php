<?php

namespace Database\Seeders;

use App\Models\Kullanici;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class KullaniciTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        Kullanici::truncate();

        $kullanici_yonetici = Kullanici::create([
            'adsoyad'     => 'Əzməmməd Qasımov',
            'email'       => 'ezmemmed@yahoo.com',
            'sifre'       => bcrypt('123'),
            'aktif_mi'    => 1,
            'yonetici_mi' => 1
        ]);
        $faker = \Faker\Factory::create();

        for ($i = 0; $i < 50; $i++) {
            $kullanici_musteri = Kullanici::create([
                'adsoyad'     => $faker->name,
                'email'       => $faker->unique()->safeEmail,
                'sifre'       => bcrypt('123456'),
                'aktif_mi'    => 1,
                'yonetici_mi' => 0
            ]);
        }

        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
