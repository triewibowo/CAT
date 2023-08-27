<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">Data Guru <a href="<?= site_url('page/teacher_add') ?>" class="btn btn-info btn-circle btn-sm"><i class="feather feather-plus"></i></a></h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">Data Guru</li>
        </ol>
    </div>
</div><!-- /.page-title -->
<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">

                <table class="table table-stripped table-responsive" data-toggle="datatables">
                    <thead>
                        <tr>
                            <th style="width:5%">#</th>
                            <th>Nama Guru</th>
                            <th>Username</th> 
                            <th>Telepon</th>
                            <th>Email</th>
                            <th>Dibuat</th>
                            <th style="width:10%">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($dataTeachers as $row => $value): ?>
                            <tr>
                                <td><?= $row + 1 ?></td>
                                <td><?= $value->teacher_name ?></td>
                                <td><?= $value->teacher_username ?></td>
                                <td><?= $value->teacher_phone ?></td>
                                <td><?= $value->teacher_email ?></td>
                                <td><?= $value->teacher_created ?></td>
                                <td>
                                    <a href="<?= site_url('page/teacher_edit/'.$value->id_teacher) ?>" class="btn btn-primary btn-sm"><i class="feather feather-edit"></i></a>
                                    <a href="#delete<?= $row ?>" data-toggle="modal" class="btn btn-danger btn-sm"><i class="feather feather-trash"></i></a>
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
                                            <a href="<?= site_url('MasterCtrl/teachers/'.$value->id_teacher) ?>" class="btn btn-outline-danger btn-block"><i class="feather feather-check-square"></i> Ya, Hapus data ini!</a>
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