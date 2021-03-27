<div class="list-group">
    <a href="{{ route('yonetim.anasayfa') }}" class="list-group-item">
        <span class="fa fa-fw fa-dashboard"></span> Admin Panel
    </a>
    <a href="{{ route('yonetim.urun') }}" class="list-group-item">
        <span class="fa fa-fw fa-cubes"></span> Məhsullar
        <span class="badge badge-dark badge-pill pull-right">{{ $istatistikler['urun_sayi'] }}</span>
    </a>
    <a href="{{ route('yonetim.kategori') }}" class="list-group-item">
        <span class="fa fa-fw fa-folder"></span> Kategoriyalar
        <span class="badge badge-dark badge-pill pull-right">{{ $istatistikler['kategori_sayi'] }}</span>
    </a>
    <a href="#" class="list-group-item">
        <span class="fa fa-fw fa-comment"></span> Məhsul Yorumları
    </a>
    <a href="#" class="list-group-item collapsed" data-target="#mnu_kategori_urunleri" data-toggle="collapse" data-parent="#sidebar"><span class="fa fa-fw fa-folder"></span> Kategoriya Məhsulları<span class="caret arrow"></span></a>
    <div class="list-group collapse" id="mnu_kategori_urunleri">
        <a href="#" class="list-group-item">Category</a>
        <a href="#" class="list-group-item">Category</a>
    </div>
    <a href="{{ route('yonetim.kullanici') }}" class="list-group-item">
        <span class="fa fa-fw fa-users"></span> İstifadəçilər
        <span class="badge badge-dark badge-pill pull-right">{{ $istatistikler['user_sayi'] }}</span>
    </a>
    <a href="" class="list-group-item">
        <span class="fa fa-fw fa-shopping-cart"></span> Sifarişlər

    </a>
    <a href="#" class="list-group-item collapsed" data-target="#mnu_raporlar" data-toggle="collapse" data-parent="#sidebar"><span class="fa fa-fw fa-pie-chart"></span> Hesabatlar<span class="caret arrow"></span></a>
    <div class="list-group collapse" id="mnu_raporlar">
        <a href="#" class="list-group-item">Çok Satılan Məhsullar</a>
        <a href="#" class="list-group-item">Günlere Görə Satışlar</a>
    </div>
    <a href="#" class="list-group-item">
        <span class="fa fa-fw fa-gear"></span> Sayt Tənzimləmələri
    </a>
</div>
