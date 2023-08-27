<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">Data Pengguna <a href="#add" data-toggle="modal" class="btn btn-info btn-circle btn-sm"><i class="feather feather-plus"></i></a></h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">Pengguna</li>
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
                        <th>Username</th>
                        <th>Nama Lengkap</th>
                        <th>Level</th>
                        <th>Dibuat</th>
                        <th style="width:10%">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($dataUsers as $row => $value): ?>
                        <tr>
                            <td><?= $row + 1 ?></td>
                            <td><?= $value->username ?></td>
                            <td><?= $value->full_name ?></td>
                            <td><?= $value->level ?></td>
                            <td><?= $value->admin_created ?></td>
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
                                        <a href="<?= site_url('MasterCtrl/users/'.$value->id_admin) ?>" class="btn btn-outline-danger btn-block"><i class="feather feather-check-square"></i> Ya, Hapus data ini!</a>
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
                                        <h4 class="modal-title">Ubah Pengguna</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="<?= site_url('MasterCtrl/users') ?>" method="POST">
                                            <input type="hidden" name="id_admin" value="<?= $value->id_admin ?>">
                                            <div class="form-group">
                                                <label>Username</label>
                                                <input type="text" class="form-control" name="username" placeholder="Username" required value="<?= $value->username ?>">
                                            </div>
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input type="password" class="form-control" name="password" placeholder="Boleh dikosongkan">
                                            </div>
                                            <div class="form-group">
                                                <label>Nama Lengkap</label>
                                                <input type="text" class="form-control" name="full_name" placeholder="Nama Lengkap" required value="<?= $value->full_name ?>">
                                            </div>
                                            <div class="form-group">
                                                <label>Level</label>
                                                <select class="form-control" name="level">
                                                    <?php $level = ['admin','staff'] ?>
                                                    <?php foreach ($level as $vLevel): ?>
                                                        <option <?php if($vLevel == $value->level): echo "selected"; endif; ?> value="<?= $vLevel ?>"><?= $vLevel ?></option>
                                                    <?php endforeach ?>
                                                </select>
                                            </div>
                                    </div>
                                    <div class="modal-footer" style="padding:10px">
                                        <button type="submit" class="btn btn-outline-info btn-block"><i class="feather feather-check-square"></i> Simpan!</button>
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
<div class="modal modal-info fade" id="add">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header text-inverse">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Tambah Pengguna</h4>
            </div>
            <div class="modal-body">
                <form action="<?= site_url('MasterCtrl/users') ?>" method="POST">
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" class="form-control" name="username" placeholder="Username" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <label>Nama Lengkap</label>
                        <input type="text" class="form-control" name="full_name" placeholder="Nama Lengkap" required>
                    </div>
                    <div class="form-group">
                        <label>Level</label>
                        <select class="form-control" name="level">
                            <option value="admin">admin</option>
                            <option value="staff">staff</option>
                        </select>
                    </div>
            </div>
            <div class="modal-footer" style="padding:10px">
                <button type="submit" onclick="return confirm('Anda yakin ?')" class="btn btn-outline-info btn-block"><i class="feather feather-check-square"></i> Simpan!</button>
            </div>
            </form>
        </div>
    </div>
</div>