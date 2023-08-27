<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">Data Siswa <a href="<?= site_url('page/student_add') ?>" class="btn btn-info btn-circle btn-sm"><i class="feather feather-plus"></i></a></h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">Data Siswa</li>
        </ol>
    </div>
</div><!-- /.page-title -->
<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
				<div class="row">
                    <div class="col-sm-4">
                        <div class="input-group">
        					<select id="iclass" class="form-control" onchange="chclass(this.value)">
        						<option value="null">Pilih kelas</option>
        						<?php
        							foreach ($mclass as $c) {
        								if ($c->id_class == $cls) {
        									$s = 'selected';
        								} else {
        									$s = '';
        								}
        								echo "<option value='$c->id_class' $s>$c->class_name</option>";
        							}
        						?>
        					</select>
                            <div class="input-group-addon"><i class="feather feather-filter"></i></div>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <?php if ($cls > 0): ?>
                                <a href="<?= site_url('page/ExportStudent') ?>" onclick="return confirm('Apa anda yakin ?')" class="btn btn-success"> Export Excel</a>
                            <?php endif ?>
                        </div>
                    </div>
				</div>
	            
                <table class="table table-stripped table-responsive" data-toggle="datatables">
                    <thead>
                        <tr>
                            <th style="width:5%">#</th>
                            <th>Nama</th>
                            <th>NIS</th> 
                            <th>Kelas</th>
                            <th>Telepon</th>
                            <th>Dibuat</th>
                            <th style="width:10%">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($dataStudents as $row => $value): ?>
                            <tr>
                                <td><?= $row + 1 ?></td>
                                <td><?= $value->student_name ?></td>
                                <td><?= $value->student_nis ?></td>
                                <td><?= $value->class_name ?></td>
                                <td><?= $value->student_phone ?></td>
                                <td><?= $value->student_created ?></td>
                                <td>
                                    <a href="<?= site_url('page/student_edit/'.$value->id_student) ?>" class="btn btn-primary btn-sm"><i class="feather feather-edit"></i></a>
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
                                            <a href="<?= site_url('MasterCtrl/students/'.$value->id_student) ?>" class="btn btn-outline-danger btn-block"><i class="feather feather-check-square"></i> Ya, Hapus data ini!</a>
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

<script>
	function chclass(id) {
		window.location = "<?=base_url('page/students')?>/"+id;
	}
</script>