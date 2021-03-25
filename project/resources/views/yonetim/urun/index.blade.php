@extends('yonetim.layouts.master')
@section('title','Yönetim Ürün')
@section('content')

    <h1 class="page-header">Ürün Yönetimi</h1>
    <h3 class="sub-header">Ürün Listesi</h3>
    <div class="well">
        <div class="btn-group pull-right">
            <a href="{{ route('yonetim.urun.yeni') }}" class="btn btn-primary">Yeni</a>
        </div>
        <form method="post" action="{{ route('yonetim.urun') }}" class="form-inline">
            @csrf
            <div class="form-group">
                <label for="aranan">Ara</label>
                <input type="text" class="form-control form-control-sm" name="aranan" id="aranan" placeholder="Urun Ara..." value="{{ old('aranan') }}">
            </div>
            <button type="submit" class="btn btn-primary">Ara</button>
            <a href="{{ route('yonetim.urun') }}" class="btn btn-primary">Temizle</a>
        </form>
    </div>
    @include('layouts.partials.alerts')
    <div class="table-responsive">
        <table class="table table-hover table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>#</th>
                <th>Slug</th>
                <th>Ürün adı</th>
                <th>Fiyatı</th>
                <th>Kayıt Tarihi</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($list as $entry)

                <tr>
                    <td>{{ $entry->id }}</td>
                    <td>{{ $entry->slug }}</td>
                    <td>{{ $entry->urun_adi }}</td>
                    <td>{{ $entry->fiyati }}</td>
                    <td>{{ $entry->olusturulma_tarihi }}</td>
                    <td style="width: 100px">
                        <a href="{{ route('yonetim.urun.duzenle', $entry->id) }}" class="btn btn-xs btn-success" data-toggle="tooltip" data-placement="top" title="Düzenle">
                            <span class="fa fa-pencil"></span>
                        </a>
                        <a href="{{ route('yonetim.urun.sil', $entry->id) }}" class="btn btn-xs btn-danger" data-toggle="tooltip" data-placement="top" title="Sil" onclick="return confirm('Emin misiniz?')">
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
