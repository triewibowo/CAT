<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">Data Kelas</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">Kelas</li>
        </ol>
    </div>
</div><!-- /.page-title -->
<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
 <div class="widget-holder widget-full-height col-md-12">
    <div class="widget-bg">
        <div class="widget-body">
            <div class="row mb-3">
                <div class="col-sm"></div>
                <div class="col-sm-2">
                    <a href="#add" data-toggle="modal" class="btn btn-success float-right btn-sm"><i class="feather feather-plus"></i> Create</a>
                </div>
            </div>
			<table class="table table-striped table-responsive" data-toggle="datatables">
                <thead class="bg-primary-gradient">
                    <tr>
                        <th style="width:7%">#</th>
                        <th>Nama Kelas</th>
                        <th>Dibuat</th>
                        <th style="width:15%">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($dataClasses as $row => $value): ?>
                        <tr>
                            <td><?= $row + 1 ?></td>
                            <td><?= $value->class_name ?></td>
                            <td><?= $value->class_created ?></td>
                            <td>
                                <a href="#edit<?= $row ?>" data-toggle="modal" class="btn btn-primary btn-sm"><i class="feather feather-edit"></i></a>
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
                                        <a href="<?= site_url('MasterCtrl/classes/'.$value->id_class) ?>" class="btn btn-outline-danger btn-block"><i class="feather feather-check-square"></i> Ya, Hapus data ini!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- MODAL EDIT -->
                        <div class="modal modal-primary fade" id="edit<?= $row ?>">
                            <div class="modal-dialog modal-md">
                                <div class="modal-content">
                                    <div class="modal-header text-inverse">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Ubah Kelas</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="<?= site_url('MasterCtrl/classes') ?>" method="POST">
                                            <input type="hidden" name="id_class" value="<?= $value->id_class ?>">
                                            <div class="form-group">
                                                <label>Nama Kelas</label>
                                                <input type="text" class="form-control" name="class_name" placeholder="Nama Kelas" required value="<?= $value->class_name ?>">
                                            </div>
                                    </div>
                                    <div class="modal-footer" style="padding:10px">
                                        <button type="submit" class="btn btn-outline-primary btn-block"><i class="feather feather-check-square"></i> Simpan!</button>
                                    </div>
                                    </form>
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
<!-- MODAL -->
<div class="modal modal-success fade" id="add">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header text-inverse">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Tambah Kelas</h4>
            </div>
            <div class="modal-body">
                <form action="<?= site_url('MasterCtrl/classes') ?>" method="POST">
                    <div class="form-group">
                        <label>Nama Kelas</label>
                        <input type="text" class="form-control" name="class_name" placeholder="Nama Subtes" required>
                    </div>
            </div>
            <div class="modal-footer" style="padding:10px">
                <button type="submit" onclick="return confirm('Anda yakin ?')" class="btn btn-outline-success btn-block"><i class="feather feather-check-square"></i> Simpan!</button>
            </div>
            </form>
        </div>
    </div>
</div>

<style>
    .select2-container--default .select2-selection--multiple{
        border-color: #e4e9f0;
    }

    .select2-container--default.select2-container--focus .select2-selection--multiple{
        border-color: #8253eb;
        padding-top: 10px;
    }
</style>