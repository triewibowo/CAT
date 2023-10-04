<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">Dashboard</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
    </div>
</div><!-- /.page-title -->
<style type="text/css">
    .boxDash {
        width: 100%;
        min-height: 130px;
        text-align: center;
        padding-top: 40px;
        border-radius: 6px;
        font-size: 25px;
        color: white;
    }
    .boxDash.green { background-color: #077A1F; }
    .boxDash.blue { background-color: #0F1FBC; }
    .boxDash.red { background-color: #C60013; }
    .boxDash.purple { background-color: #A004BC; }
</style>
<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
            <div class="snippets bootdey">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="mini-stat clearfix bg-facebook rounded">
                                <span class="mini-stat-icon"><i class="feather feather-users"></i></span>
                                <div class="mini-stat-info">
                                    <span class="subtitle"><?php echo $totalStudent ?></span>
                                    Total Siswa
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="mini-stat clearfix bg-twitter rounded">
                                <span class="mini-stat-icon"><i class="feather feather-info"></i></span>
                                <div class="mini-stat-info">
                                    <span class="subtitle"><?php echo $totalQuestion ?></span>
                                    Total Soal
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="mini-stat clearfix bg-googleplus rounded">
                                <span class="mini-stat-icon"><i class="feather feather-edit"></i></span>
                                <div class="mini-stat-info">
                                    <span class="subtitle"><?php echo $totalExam ?></span>
                                    Total Ujian
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="mini-stat clearfix bg-bitbucket rounded">
                                <span class="mini-stat-icon"><i class="feather feather-check"></i></span>
                                <div class="mini-stat-info">
                                    <span class="subtitle"><?php echo $totalExamActive ?></span>
                                    Total Ujian Aktif
                                </div>
                            </div>
                        </div>        
                    </div>
                </div>
                <div class="row" style="margin-top: 1em;">
                    <div class="col-sm-6">
                        <div class="card-dashboard">
                            <h5>Judul Card</h5>
                            <canvas id="myChart1" width="200" height="200"></canvas>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card-dashboard">
                            <h5>Judul Card</h5>
                            <canvas id="myChart2" width="200" height="200"></canvas>
                        </div>
                    </div>
                </div>
                <!-- / Row -->
                
            </div><!-- / BODY -->
        </div><!-- / BG -->
    </div><!-- / HOLDER -->
</div>

<script>
    // Ambil referensi ke elemen <canvas>
    var ctx1 = document.getElementById('myChart1').getContext('2d');
    var ctx2 = document.getElementById('myChart2').getContext('2d');

    // Data untuk grafik
    var data = {
        labels: ['label 1', 'label 1', 'label 1', 'label 1', 'label 1', 'label 1', 'label 1'],
        datasets: [{
            label: 'Contoh Data',
            data: [20, 50, 30, 23, 89,23, 32],
            tension: 0.5,
            fill: false,
            backgroundColor: ['rgb(0, 0, 0)', 'blue', 'green'], // Warna batang
        }]
    };

    // Konfigurasi grafik
    var options = {
        responsive: true, // Grafik akan menyesuaikan ukuran layar
        maintainAspectRatio: false, // Memungkinkan perubahan aspek grafik
    };

    // Buat objek grafik
    var myChart1 = new Chart(ctx1, {
        type: 'line', // Jenis grafik (bar, line, pie, dll.)
        data: data, // Data yang akan digunakan
        options: options // Konfigurasi grafik
    });

    // Buat objek grafik
    var myChart2 = new Chart(ctx2, {
        type: 'bar', // Jenis grafik (bar, line, pie, dll.)
        data: data, // Data yang akan digunakan
        options: options // Konfigurasi grafik
    });

</script>

<style>
    .rounded {
        -webkit-border-radius: 3px !important;
        -moz-border-radius: 3px !important;
        border-radius: 3px !important;
    }

    .mini-stat {
        padding: 15px;
        margin-bottom: 20px;
    }

    .mini-stat-icon {
        width: 60px;
        height: 60px;
        display: inline-block;
        line-height: 65px;
        text-align: center;
        font-size: 30px;
        background: none repeat scroll 0% 0% #EEE;
        border-radius: 100%;
        float: left;
        margin-right: 10px;
        color: #337ab7;
    }

    .mini-stat-info {
        font-size: 12px;
        padding-top: 2px;
    }

    .subtitle {
        color: white;
    }

    .mini-stat-info span {
        display: block;
        font-size: 30px;
        font-weight: 600;
        margin-bottom: 5px;
        margin-top: 7px;
    }

    /* ================ colors =====================*/
    .bg-facebook {
        background-color: #3b5998 !important;
        border: 1px solid #3b5998;
        color: white;
    }

    .fg-facebook {
        color: #3b5998 !important;
    }

    .bg-twitter {
        background-color: #00a0d1 !important;
        border: 1px solid #00a0d1;
        color: white;
    }

    .fg-twitter {
        color: #00a0d1 !important;
    }

    .bg-googleplus {
        background-color: #db4a39 !important;
        border: 1px solid #db4a39;
        color: white;
    }

    .fg-googleplus {
        color: #db4a39 !important;
    }

    .bg-bitbucket {
        background-color: #205081 !important;
        border: 1px solid #205081;
        color: white;
    }

    .fg-bitbucket {
        color: #205081 !important;
    }

    .card-dashboard {
        background-color: rgba(255, 255, 255, 0.1); /* Warna latar belakang putih dengan tingkat transparansi 0.7 */
        border: 1px solid #ccc; /* Garis tepi card */
        padding: 0px 20px 80px 20px; /* Ruang dalam card */
        border-radius: 10px; /* Sudut card yang membulat */
        max-height: 500px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Efek bayangan card */
        text-align: left; /* Pusatkan teks dalam card */
    }
</style>