@extends('yonetim.layouts.master')
@section('title','Yönetim Kategori')
@section('content')

    <h1 class="page-header">Kategori Yönetimi</h1>
    <h3 class="sub-header">Kategori Listesi</h3>
    <div class="well">
        <div class="btn-group pull-right">
            <a href="{{ route('yonetim.kategori.yeni') }}" class="btn btn-primary">Yeni</a>
        </div>
        <form method="post" action="{{ route('yonetim.kategori') }}" class="form-inline">
            {{ csrf_field() }}
            <div class="form-group">
                <label for="aranan">Ara</label>
                <input type="text" class="form-control form-control-sm" name="aranan" id="aranan" placeholder="Ad, Slug Ara..." value="{{ old('aranan') }}">
                <label for="ust_id">Üst Kategori</label>
                <select name="ust_id" id="ust_id" class="form-control">
                    <option value="">Seçiniz</option>
                    @foreach($anakategoriler as $kategori)
                        <option value="{{ $kategori->id }}" {{ old('ust_id') == $kategori->id ? 'selected' : '' }}>{{ $kategori->kategori_adi }}</option>
                    @endforeach
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Ara</button>
            <a href="{{ route('yonetim.kategori') }}" class="btn btn-primary">Temizle</a>
        </form>
    </div>
    @include('layouts.partials.alerts')
    <div class="table-responsive">
        <table class="table table-hover table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>#</th>
                <th>Ust Kategori Adi</th>
                <th>Slug</th>
                <th>Kategori Adi</th>>
                <th>Kayıt Tarihi</th>
                <th>Islemler</th>
            </tr>
            </thead>
            <tbody>
            @if(count($list) == 0))
                <tr><td colspan="6" class="text-center">Kayit Bulunamadi!</td></tr>
            @endif
            @foreach ($list as $entry)

                <tr>
                    <td>{{ $entry->id }}</td>
                    <td>{{ $entry->ust_kategori->kategori_adi }}</td>
                    <td>{{ $entry->slug }}</td>
                    <td>{{ $entry->kategori_adi }}</td>
                    <td>{{ $entry->olusturulma_tarihi }}</td>
                    <td style="width: 100px">
                        <a href="{{ route('yonetim.kategori.duzenle', $entry->id) }}" class="btn btn-xs btn-success" data-toggle="tooltip" data-placement="top" title="Düzenle">
                            <span class="fa fa-pencil"></span>
                        </a>
                        <a href="{{ route('yonetim.kategori.sil', $entry->id) }}" class="btn btn-xs btn-danger" data-toggle="tooltip" data-placement="top" title="Sil" onclick="return confirm('Emin misiniz?')">
                            <span class="fa fa-trash"></span>
                        </a>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>

            {{ $list->links() }}
    </div>



@endsection
