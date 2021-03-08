@if (session()->has('mesaj'))
    <div class="alert alert-{{ session('mesaj_turu') }}">{{ session('mesaj') }}</div>
@endif
