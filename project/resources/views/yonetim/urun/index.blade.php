@extends('yonetim.layouts.master')
@section('title','Məhsul İdarəetməsi')
@section('content')

    <h1 class="page-header">Məhsul İdarəetməsi</h1>
    <h3 class="sub-header">Məhsul Siyahısı</h3>
    <div class="well">
        <div class="btn-group pull-right">
            <a href="{{ route('yonetim.urun.yeni') }}" class="btn btn-primary">Yeni</a>
        </div>
        <form method="post" action="{{ route('yonetim.urun') }}" class="form-inline">
            @csrf
            <div class="form-group">
                <label for="aranan">Axtar</label>
                <input type="text" class="form-control form-control-sm" name="aranan" id="aranan" placeholder="Məhsul Axtar..." value="{{ old('aranan') }}">
            </div>
            <button type="submit" class="btn btn-primary">Axtar</button>
            <a href="{{ route('yonetim.urun') }}" class="btn btn-primary">Təmizlə</a>
        </form>
    </div>
    @include('layouts.partials.alerts')
    <div class="table-responsive">
        <table class="table table-hover table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>No</th>
                <th>Məhsul Şəkli</th>
                <th>Slug</th>
                <th>Məhsul Adı</th>
                <th>Qiyməti</th>
                <th>Qeydiyyat Tarixi</th>
                <th>Əməliyyatlar</th>
            </tr>
            </thead>
            <tbody>
            @if (count($list) == 0)
                <tr><td colspan="7" class="text-center">Məhsul tapılmadı!</td></tr>
            @endif
            @foreach ($list  as $i =>$entry )

                <tr>
                    <td>{{ ++$i }}</td>
                    <td class="text-center">
                    <img src="{{ $entry->detay->urun_resmi!=null ? asset('uploads/urunler/' . $entry->detay->urun_resmi) : 'http://via.placeholder.com/120x120?text=UrunResmi' }}" style="width: 120px;">
                    </td>
                    <td>{{ $entry->slug }}</td>
                    <td>{{ $entry->urun_adi }}</td>
                    <td>{{ $entry->fiyati }}</td>
                    <td>{{ $entry->olusturulma_tarihi }}</td>
                    <td style="width: 100px">
                        <a href="{{ route('yonetim.urun.duzenle', $entry->id) }}" class="btn btn-xs btn-success" data-toggle="tooltip" data-placement="top" title="Dəyiş">
                            <span class="fa fa-pencil"></span>
                        </a>
                        <a href="{{ route('yonetim.urun.sil', $entry->id) }}" class="btn btn-xs btn-danger" data-toggle="tooltip" data-placement="top" title="Sil" onclick="return confirm('Əminsiniz?')">
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
