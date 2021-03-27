<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="{{ route('anasayfa') }}">Laravel Eticarət</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> {{ Auth::guard('yonetim')->user()->adsoyad }}
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">Profil</a>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <a href="{{ route('yonetim.oturumukapat') }}">Çıxış</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
