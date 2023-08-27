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
                <div class="row">
                    <div class="col-sm-3">
                        <div class="boxDash green">
                            <i class="feather feather-check"></i> <?= $activeAssignment ?> Ujian Aktif
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="boxDash blue">
                            <i class="feather feather-edit"></i> <?= $totalAssignment ?> Ujian Tersedia
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="boxDash red">
                            <i class="feather feather-users"></i> <?= $totalStudent ?> Siswa/i
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="boxDash purple">
                            <?php
                                if ($totalGraduated < 1 OR $totalResult < 1) {
                                    $percentage = 0;
                                } else {
                                    $percentage = ($totalGraduated / $totalResult) * 100;
                                    $percentage = ceil($percentage);
                                }
                                echo '<i class="feather feather-activity"></i> '.$percentage.'% Kelulusan';
                            ?>
                        </div>
                    </div>
                </div><!-- / Row -->
                
            </div><!-- / BODY -->
        </div><!-- / BG -->
    </div><!-- / HOLDER -->
</div>