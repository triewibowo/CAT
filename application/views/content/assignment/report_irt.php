<style type="text/css">
    .switchery {
        
    }
    .switchery-small {
        
    }
    .list-group-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
</style>
<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">List Laporan Ujian</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">Report Ujian</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
 <div class="widget-holder widget-full-height col-md-12">
    <div class="widget-bg">
        <div class="widget-body">
            <!-- <div class="row mb-3">
                <div class="col-sm"></div>
                <div class="col-sm-2">
                    <a href="#add" data-toggle="modal" class="btn btn-success float-right btn-sm"><i class="feather feather-plus"></i> Create</a>
                </div>
            </div> -->
            <table class="table table-striped table-responsive" data-toggle="datatables">
                <thead class="bg-primary-gradient">
                    <tr>
                        <th>#</th>
                        <th>Pelajaran - Tipe</th>
                        <th>Penulis</th>
                        <th style="text-align:center">Dibuat</th>
                        <th style="text-align:center">Progres</th>
                        <th style="width:15%; text-align:center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($dataAssignment as $row => $value): ?>
                        <tr>
                            <td><?= $row + 1 ?></td>
                            <td><?= $value->assignment_name.' - '.$value->assignment_type ?></td>
                            <td><?= $value->assignment_author ?></td>
                            <td><?= $value->assignment_created ?></td>
                            <td align=center>
                                <?php if ($value->assignment_active == 1): ?>
                                    <span class="badge bg-success">Aktif</span>
                                <?php else: ?>
                                    <span class="badge bg-danger">Tidak Aktif</span>
                                <?php endif; ?>
                                <div class="progress" style="height:10px">
                                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="<?php echo $value->percent ?>" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $value->percent ?>%">
                                    <?php echo $value->percent ?>%
                                    </div>
                                </div>
                            </td>
                            <td align=center>
                                <a href="#categories<?= $row ?>" data-toggle="modal" class="btn btn-primary"><i class="feather feather-layers"></i></a>
                                <a href="<?= site_url('page/report_users/'.$value->id_assignment) ?>" class="btn btn-warning"><i class="feather feather-users"></i></a>
                            </td>
                        </tr>
                        <div class="modal modal-primary fade" id="categories<?= $row ?>">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title text-light">Daftar Kategori <?= $value->assignment_name.' - '.$value->assignment_type ?></h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row" style="margin-bottom:15px">
                                            <div class="col-sm-12" align=center>
                                                <small>Pilih kategori untuk export laporan IRT</small>
                                            </div>
                                        </div>
                                    
                                    
                                        <ul class="list-group list-group-flush">
                                            <?php foreach ($value->categories as $r => $category): ?>
                                                <div class="row">
                                                    <div class="col-sm-11">
                                                        <li class="list-group-item row" data-toggle="collapse" data-target="#collapseExample<?= $category->id_acat ?>" aria-expanded="false" aria-controls="collapseExample">
                                                            <div class="col-sm-11">
                                                                <div style="font-weight: 900;"><?= $category->category->cat_name ?></div>
                                                            </div>
                                                        </li>
                                                        <div class="collapse" id="collapseExample<?= $category->id_acat ?>">
                                                            <?php foreach ($category->subtests as $key => $sub): ?>
                                                            <li class="list-group-item striped-li row">
                                                                <div class="col-sm-9" style="margin-left: 20px;">
                                                                    <div><?= $sub->subtest->sub_name ?></div>
                                                                </div>
                                                            </li>
                                                            <?php endforeach; ?>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-1" style="text-align: right; padding-top: 0.8rem;">
                                                        <a title="Export Report IRT" href="<?= site_url('page/exportReportIrt/'.$value->id_assignment.'/'.$category->id_acat) ?>" class="btn btn-info btn-sm" style="float: right;"><i class="feather feather-download"></i></a>
                                                    </div>
                                                </div>
                                            <?php endforeach; ?>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>            
                    <?php endforeach ?>
                    <!-- MODAL -->
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