<!-- Page Title Area -->
<form action="<?= site_url('AssignmentCtrl/update') ?>" method="POST">
<input type="hidden" name="id_assignment" value="<?= $dataAssignment->id_assignment ?>">
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <!-- <h6 class="page-title-heading mr-0 mr-r-5">Buat Soal</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p> -->
        <div class="row">
            <div class="col-sm-3">
                <a href="#save" data-toggle="modal" class="btn btn-info btn-sm"><i class="feather feather-check-square"></i>&nbsp; Simpan!</a>
                <a href="#classes" data-toggle="modal" class="btn btn-success btn-sm"><i class="feather feather-home"></i>&nbsp; Kelas</a>
            </div>
            <div class="col-sm-3">
                <label class="d-flex flex-md-row flex-column align-items-center cursor-pointer">
                    <input type="checkbox" <?php if($dataAssignment->show_report == 1): echo "checked"; endif; ?> name="show_report" class="js-switch" data-color="#8253eb" data-size="small">
                    <span class="text-muted mr-l-20 d-inline-block">Tampilkan Hasil</span>
                </label>
            </div>
            <div class="col-sm-3">
                <label class="d-flex flex-md-row flex-column align-items-center cursor-pointer">
                    <input type="checkbox" <?php if($dataAssignment->show_analytic == 1): echo "checked"; endif; ?> name="show_analytic" class="js-switch" data-color="#8253eb" data-size="small">
                    <span class="text-muted mr-l-20 d-inline-block">Analisis Soal</span>
                </label>
            </div>
        </div><!-- / Row -->
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/assignments') ?>">List Ujian</a></li>
            <li class="breadcrumb-item active">Ubah Ujian</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
                <!-- FOR FORM BEFORE -->
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Mata Pelajaran</label>
                                <select class="form-control" name="id_lesson">
                                    <?php foreach ($dataLessons as $rLesson => $vLesson): ?>
                                        <option <?php if($vLesson->id_lesson == $dataAssignment->id_lesson): echo "selected"; endif; ?> value="<?= $vLesson->id_lesson ?>"><?= $vLesson->lesson_name ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Tipe Ujian</label>
                                        <input type="text" class="form-control" name="assignment_type" required placeholder="ex: UTS / UAS" value="<?= $dataAssignment->assignment_type ?>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Urutkan Soal</label>
                                        <?php $order = [['val'=>'asc','name'=>'Urutkan Terlama'],['val'=>'desc','name'=>'Urutkan Terbaru'],['val'=>'random','name'=>'Acak Soal']] ?>
                                        <select class="form-control" name="assignment_order">
                                            <?php foreach ($order as $vOrder): ?>
                                                <option <?php if($vOrder['val'] == $dataAssignment->assignment_order) : echo "selected"; endif; ?> value="<?= $vOrder['val'] ?>"><?= $vOrder['name'] ?></option>
                                            <?php endforeach ?>
                                        </select>
                                    </div>
                                </div>
                            </div><!-- / Row -->
                        </div>
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Nilai KKM</label>
                                        <input type="number" class="form-control" name="assignment_kkm" required placeholder="ex: 50" value="<?= $dataAssignment->assignment_kkm ?>">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Durasi Ujian (menit)</label>
                                        <input type="number" class="form-control" name="assignment_duration" required placeholder="Durasi Ujian (menit)" value="<?= $dataAssignment->assignment_duration ?>">
                                    </div>
                                </div>
                            </div><!-- / Row -->
                            <div class="form-group">
                                <label>Penulis Ujian</label>
                                <input type="text" class="form-control" name="assignment_author" required placeholder="Penulis Ujian" value="<?= $dataAssignment->assignment_author ?>">
                            </div>
                        </div>
                    </div><!-- / Row -->
                    <!-- MODAL CLASSES --> 
                    <div class="modal fade modal-success" id="classes">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title text-inverse">Pilih Kelas</h4>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width:5%">#</th>
                                                <th>Nama Kelas</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($dataClasses as $vClass): ?>
                                                <?php
                                                    $val = false;
                                                    foreach ($dataAssignment->classes as $Row => $value) {
                                                        if ($value->id_class == $vClass->id_class) {
                                                            $val = true;
                                                        }
                                                    }
                                                ?>
                                                <tr>
                                                    <td><input type="checkbox" <?php if($val): echo "checked"; endif; ?> name="id_class[]" value="<?= $vClass->id_class ?>"></td>
                                                    <td><?= $vClass->class_name ?></td>
                                                </tr>
                                            <?php endforeach ?>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-success btn-block" data-dismiss="modal">Simpan!</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- MODAL SAVE -->
                    <div class="modal fade modal-info" id="save">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title text-inverse">Apa anda sudah yakin dengan data ini ?</h4>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-outline-info btn-block">Ya, Simpan dan lanjutkan!</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div><!-- /.widget-body -->
        </div><!-- /.widget-bg -->
    </div>
</div>