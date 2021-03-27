@extends('yonetim.layouts.master')
@section('title','Admin Panel Əsas Səhifə')
@section('content')
    <h1 class="page-header">Əsas Səhifə</h1>
    @include('sweet::alert')
    <section class="row text-center placeholders">
        <div class="col-6 col-sm-3">
            <div class="panel panel-primary">
                <div class="panel-heading">Məsul Sayı</div>
                <div class="panel-body">
                    <h4>{{ $istatistikler['urun_sayi'] }}</h4>
                    <p>ədəd</p>
                </div>
            </div>
        </div>
        <div class="col-6 col-sm-3">
            <div class="panel panel-primary">
                <div class="panel-heading">Kategoriya Sayı</div>
                <div class="panel-body">
                    <h4>{{ $istatistikler['kategori_sayi'] }}</h4>
                    <p>ədəd</p>
                </div>
            </div>
        </div>
        <div class="col-6 col-sm-3">
            <div class="panel panel-primary">
                <div class="panel-heading">İstifadəçi Sayı</div>
                <div class="panel-body">
                    <h4>{{ $istatistikler['user_sayi'] }}</h4>
                    <p>ədəd</p>
                </div>
            </div>
        </div>
        <div class="col-6 col-sm-3">
            <div class="panel panel-primary">
                <div class="panel-heading">Sifariş Sayı</div>
                <div class="panel-body">
                    <h4>12</h4>
                    <p>ədəd</p>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div>
            <canvas id="myChart"></canvas>
        </div>
    </section>
@endsection

@section('footer')
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script>
        var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            // The type of chart we want to create
            type: 'bar',

            // The data for our dataset
            data: {
                labels: ['Yanvar', 'Fevral', 'Mart', 'Aprel', 'May', 'İyun', 'İyul'],
                datasets: [{
                    label: 'Hesabatlar',
                    backgroundColor: 'rgb(255, 99, 132)',
                    borderColor: 'rgb(255, 99, 132)',
                    data: [0, 10, 5, 2, 20, 30, 45]
                }]
            },

            // Configuration options go here
            options: {}
        });
    </script>
@endsection
