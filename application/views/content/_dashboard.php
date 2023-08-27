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
                <br />
                <legend>List Ujian</legend>
                <table class="table table-striped table-responsive" data-toggle="datatables">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Pelajaran - Tipe</th>
                        <th>KKM</th>
                        <th>Total Soal</th>
                        <th>Penulis</th>
                        <th>Dibuat</th>
                        <th style="width:10%">Aktif</th>
                        <th style="width:15%">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($dataAssignment as $row => $value): ?>
                        <tr>
                            <td><?= $row + 1 ?></td>
                            <td><?= $value->lesson_name.' - '.$value->assignment_type ?></td>
                            <td><?= $value->assignment_kkm ?>%</td>
                            <td><?= $value->totalQuestion ?> Soal</td>
                            <td><?= $value->assignment_author ?></td>
                            <td><?= $value->assignment_created ?></td>
                            <td>
                                <?php if ($value->totalQuestion < 1): ?>
                                    <center><i class="text-danger">Anda belum membuat soal</i></center>
                                <?php else: ?>
                                    <?php if ($value->assignment_active == 1): ?>
                                        <label class="d-flex flex-md-row flex-column align-items-center cursor-pointer">
                                            <input type="checkbox" name="assignment_active" id="assignment_active" checked class="js-switch" onclick="forCheck('<?= $value->id_assignment ?>')" data-color="#8253eb" data-size="small">
                                            <span id="textLoading" style="display:none" class="text-muted d-inline-block">&nbsp;</span>
                                        </label>
                                    <?php else: ?>
                                        <label class="d-flex flex-md-row flex-column align-items-center cursor-pointer">
                                            <input type="checkbox" name="assignment_active" id="assignment_active" class="js-switch" onclick="forCheck('<?= $value->id_assignment ?>')" data-color="#8253eb" data-size="small">
                                            <span id="textLoading" style="display:none" class="text-muted d-inline-block">&nbsp;</span>
                                        </label>
                                    <?php endif ?>
                                <?php endif ?>
                            </td>
                            <td>
                                <a title="Buat Soal" href="<?= site_url('page/list_question/'.$value->id_assignment) ?>" class="btn btn-success btn-sm"><i class="feather feather-layers"></i></a>
                                <a title="Ubah Data Ujian" href="<?= site_url('page/edit/'.$value->id_assignment) ?>" class="btn btn-primary btn-sm"><i class="feather feather-edit"></i></a>
                                <a title="Hapus Ujian" href="#delete<?= $row ?>" data-toggle="modal" class="btn btn-danger btn-sm"><i class="feather feather-trash"></i></a>
                            </td>
                        </tr>
                        <!-- MODAL DELETE -->
                        <div class="modal modal-danger fade" id="delete<?= $row ?>">
                            <div class="modal-dialog modal-md">
                                <div class="modal-content">
                                    <div class="modal-header text-inverse">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Anda yakin ingin menghapus data ini?</h4>
                                    </div>
                                    <div class="modal-footer" style="padding:10px">
                                        <a href="<?= site_url('AssignmentCtrl/deleteAssignment/'.$value->id_assignment) ?>" class="btn btn-outline-danger btn-block"><i class="feather feather-check-square"></i> Ya, Hapus data ini!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach ?>
                                       
                </tbody>
            </table>
            </div><!-- / BODY -->
        </div><!-- / BG -->
    </div><!-- / HOLDER -->
</div>

<script type="text/javascript">
    $(function(){
        $("#textLoading").text('');
    });
    function changeStatus(idAssignment,param) {
        $.ajax({
            url : '<?= site_url("AssignmentCtrl/changeStatusAssignment/'+idAssignment+'/'+param+'") ?>',
            type : 'GET',
            success:function(res){
                return true;
            }
        });
    }
    function forCheck(idAssignment) {
        if (document.getElementById("assignment_active").checked == true) {
            $("#assignment_active").prop("disabled",true);
            $("#textLoading").text('loading');
            changeStatus(idAssignment,1);
            setTimeout(function(){
                $("#assignment_active").prop("disabled",false);
                $("#textLoading").text('');
                swal({
                  title: "Woohoo!",
                  text: "Status ujian berhasil diubah menjadi aktif",
                  type: "success",
                  button: true,
                });
            },1200);
        } else if(document.getElementById("assignment_active").checked == false) {
            $("#assignment_active").prop("disabled",true);
            $("#textLoading").text('loading');
            changeStatus(idAssignment,2);
            setTimeout(function(){
                $("#assignment_active").prop("disabled",false);
                $("#textLoading").text('');
                swal({
                  title: "Woohoo!",
                  text: "Status ujian berhasil diubah menjadi tidak aktif",
                  type: "success",
                  button: true,
                });
            },1200);
        };
    }
</script>