<style type="text/css">
    .switchery {
        
    }
    .switchery-small {
        
    }
</style>
<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">List Ujian <a href="<?= site_url('page/create') ?>" class="btn btn-info btn-circle btn-sm"><i class="feather feather-plus"></i></a></h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">List Ujian</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
 <div class="widget-holder widget-full-height col-md-12">
    <div class="widget-bg">
        <div class="widget-body">

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
                                            <input type="checkbox" name="assignment_active" id="assignment_active<?= $value->id_assignment ?>" checked class="js-switch" onclick="forCheck('<?= $value->id_assignment ?>')" data-color="#8253eb" data-size="small">
                                            <span id="textLoading<?= $value->id_assignment ?>" style="display:none" class="text-muted d-inline-block">&nbsp;</span>
                                        </label>
                                    <?php else: ?>
                                        <label class="d-flex flex-md-row flex-column align-items-center cursor-pointer">
                                            <input type="checkbox" name="assignment_active" id="assignment_active<?= $value->id_assignment ?>" class="js-switch" onclick="forCheck('<?= $value->id_assignment ?>')" data-color="#8253eb" data-size="small">
                                            <span id="textLoading<?= $value->id_assignment ?>" style="display:none" class="text-muted d-inline-block">&nbsp;</span>
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
        </div>
        <!-- /.widget-body -->
    </div>
    <!-- /.widget-bg -->
</div>
</div>

<script type="text/javascript">
    $(function(){
        // $("#textLoading").text('');
    });
    function changeStatus(idAssignment,param) {
        $.ajax({
            url : '<?= site_url("AssignmentCtrl/changeStatusAssignment/'+idAssignment+'/'+param+'") ?>',
            type : 'GET',
            success:function(res){
                return res;
            }
        });
        // return callback;
    }
    function forCheck(idAssignment) {
        if (document.getElementById("assignment_active"+idAssignment).checked == true) {
            $("#assignment_active"+idAssignment).prop("disabled",true);
            $("#textLoading"+idAssignment).text('loading');
            $.ajax({
                url : '<?= site_url("AssignmentCtrl/changeStatusAssignment/'+idAssignment+'/1") ?>',
                type : 'GET',
                success:function(res){
                    if(res === 'limit') {
                        document.getElementById("assignment_active"+idAssignment).checked = false;
                        setTimeout(function(){
                            $("#assignment_active"+idAssignment).prop("disabled",false);
                            $("#textLoading"+idAssignment).text('');
                            swal({
                              title: "Ooppss! Ujian aktif sudah 10",
                              text: "Memuat ulang dalam 2 detik",
                              type: "error",
                              timer: 2000,
                              showConfirmButton: false
                            });
                            setTimeout(function() {
                                window.location ="<?= site_url('page/assignments') ?>"
                            },2000)
                        },1200);
                    } else {
                        setTimeout(function(){
                            $("#assignment_active"+idAssignment).prop("disabled",false);
                            $("#textLoading"+idAssignment).text('');
                            swal({
                              title: "Woohoo!",
                              text: "Status ujian berhasil diubah menjadi aktif",
                              type: "success",
                              button: true,
                            });
                        },1200);
                    };
                }
            });
        } else if(document.getElementById("assignment_active"+idAssignment).checked == false) {
            $("#assignment_active"+idAssignment).prop("disabled",true);
            $("#textLoading"+idAssignment).text('loading');
            changeStatus(idAssignment,2);
            setTimeout(function(){
                $("#assignment_active"+idAssignment).prop("disabled",false);
                $("#textLoading"+idAssignment).text('');
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