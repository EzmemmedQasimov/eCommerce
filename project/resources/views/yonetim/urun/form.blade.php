@extends('yonetim.layouts.master')
@section('title', 'Məhsul İdarəetməsi')
@section('content')
    <h1 class="page-header">Məhsul İdarəetməsi</h1>

    <form method="post" action="{{ route('yonetim.urun.kaydet', $entry->id) }}" enctype="multipart/form-data">
        @csrf

        <div class="pull-right">
            <button type="submit" class="btn btn-primary">
                {{ $entry->id > 0 ? "Güncəllə" : "Əlavə Et" }}
            </button>
        </div>
        <h3 class="sub-header">
            Məhsul {{ $entry->id > 0 ? "Güncəllə" : "Əlavə Et" }}
        </h3>

        @include('layouts.partials.errors')
        @include('layouts.partials.alerts')
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="urun_adi">Məhsul Adı</label>
                    <input type="text" class="form-control" id="urun_adi" name="urun_adi" placeholder="Məhsul Adı" value="{{ old('urun_adi', $entry->urun_adi) }}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="slug">Slug</label>
                    <input type="hidden" name="original_slug" value="{{ old('slug', $entry->slug) }}">
                    <input type="text" class="form-control" id="slug" name="slug" placeholder="Slug" value="{{ old('slug', $entry->slug) }}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="aciklama">Açıqlama</label>
                    <textarea class="form-control" id="aciklama" name="aciklama" placeholder="Açıqlama">{{ old('urun_adi', $entry->urun_adi) }}</textarea>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="fiyati">Qiyməti</label>
                    <input type="text" class="form-control" id="fiyati" name="fiyati" placeholder="Qiyməti" value="{{ old('fiyati', $entry->fiyati) }}">
                </div>
            </div>
        </div>
        <div class="checkbox">
            <label>
                <input type="hidden" name="goster_slider" value="0">
                <input type="checkbox" name="goster_slider" value="1" {{ old('goster_slider', $entry->detay->goster_slider) ? 'checked' : '' }}> Slider'da Göstər
            </label>
            <label>
                <input type="hidden" name="goster_gunun_firsati" value="0">
                <input type="checkbox" name="goster_gunun_firsati" value="1" {{ old('goster_gunun_firsati', $entry->detay->goster_gunun_firsati) ? 'checked' : '' }}> Günün Fürsətində Göstər
            </label>
            <label>
                <input type="hidden" name="goster_one_cikan" value="0">
                <input type="checkbox" name="goster_one_cikan" value="1" {{ old('goster_one_cikan', $entry->detay->goster_one_cikan) ? 'checked' : '' }}> Önə Çıxanlarda Göstər
            </label>
            <label>
                <input type="hidden" name="goster_cok_satan" value="0">
                <input type="checkbox" name="goster_cok_satan" value="1" {{ old('goster_cok_satan', $entry->detay->goster_cok_satan) ? 'checked' : '' }}> Çok Satılan Məhsullarda Göstər
            </label>
            <label>
                <input type="hidden" name="goster_indirimli" value="0">
                <input type="checkbox" name="goster_indirimli" value="1" {{ old('goster_indirimli', $entry->detay->goster_indirimli) ? 'checked' : '' }}> Endirimli Məhsullarda Göstər
            </label>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="kategoriler">Kategoriyalar</label>
                    <select class="form-control" name="kategoriler[]" id="kategoriler" multiple>
                        @foreach($kategoriler as $kategori)
                        <option value="{{ $kategori->id }}"
                            {{ collect(old('kategoriler', $urun_kategorileri))->contains($kategori->id) ? 'selected': '' }}>{{ $kategori->kategori_adi }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>
        <div class="form-group">
            @if ($entry->detay->urun_resmi!=null)
                <img src="/uploads/urunler/{{ $entry->detay->urun_resmi }}" style="height: 100px; margin-right: 20px;" class="thumbnail pull-left">
            @endif
            <label for="urun_resmi">Məhsul Şəkli</label>
            <input type="file" id="urun_resmi" name="urun_resmi">
        </div>
    </form>

@endsection

@section('head')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
@endsection
@section('footer')
    <script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
     <script>
         $(function () {
             $('#kategoriler').select2({
                 placeholder: 'Məhsul kategoriyasını seçin'
             });
             CKEDITOR.replace( 'aciklama',{
                 language: 'en',
                 uiColor: '#9AB8F3',
                 filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
                 filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token=',
                 filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
                 filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token='});
        });
    </script>
@endsection

