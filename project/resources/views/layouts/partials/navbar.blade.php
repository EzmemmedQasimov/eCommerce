<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{{route('anasayfa')}}">
                <img src="/img/logo.png">
            </a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form method="post" action="{{ route('urun_ara') }}"  class="navbar-form navbar-left">
                {{ csrf_field() }}
                <div class="input-group">
                    <input value="{{ old('aranan') }}" type="text" id="navbar-search" class="form-control" name="aranan" placeholder="Ara">
                    <span class="input-group-btn">
                            <button type="submit" class="btn btn-default">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">

                <li><a href="#"><i class="fa fa-shopping-cart"></i> Sepet <span class="badge badge-theme">5</span></a></li>

                @guest
                <li><a href="{{ route('kullanici.oturumac') }}">Oturum Aç</a></li>
                <li><a href="{{ route('kullanici.kaydol') }}">Kaydol</a></li>
                @endguest



                    @auth

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> {{ Auth::user()->adsoyad }} </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Siparişlerim</a></li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <a href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit()">Çıkış</a>
                            <form id="logout-form" action="{{ route('kullanici.oturumukapat') }}" method="post" style="display: none;">
                                @csrf
                            </form>
                        </li>

                    </ul>
                </li>

                @endauth
            </ul>
        </div>
    </div>
</nav>
