<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-6">Eticaret Yazılımı &copy; 2017</div>
            <div class="col-md-6 text-right"><a href="http://www.uzaktankurs.com">Uzaktan Kurs</a></div>
        </div>
    </div>
</footer>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/js/app.js"></script>
<script>

    setTimeout(function(){
        $('.alert').slideUp("slow");
    }, 3000);

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $('.urun-adet-artir, .urun-adet-azalt').on('click', function () {

        var id = $(this).attr('data-id');
        var myAdet = $(this).attr('data-adet');

        $.ajax({
            type: 'PATCH',
            url : '/sepet/guncelle/' + id,
            data : { adet: myAdet } ,
            success : function () {
                window.location.href = '/sepet';
            }
        });
    });
</script>
