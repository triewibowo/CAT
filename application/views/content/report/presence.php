<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">Laporan Absensi
        <!-- <a href="#add" data-toggle="modal" class="btn btn-info btn-circle btn-sm"><i class="feather feather-plus"></i></a></h6> -->
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">Laporan Absensi</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:10px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
                <form action="<?= site_url('page/presencereport') ?>" method="POST">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>Kelas</label>
                                <select class="form-control" name="id_class" required>
                                    <?php foreach ($dataClass as $row => $value): ?>
                                        <option value="<?= $value->id_class ?>"><?= $value->class_name ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label>Dari</label>
                                <input type="text" readonly class="form-control" name="from" value="<?= date('Y-m-d') ?>" id="datapicker">
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label>Sampai</label>
                                <input type="text" readonly class="form-control" name="until" value="<?= date('Y-m-d') ?>" id="datepicker2">
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>&nbsp;</label>
                                <button type="submit" class="btn btn-block btn-primary"><i class="feather feather-search"></i>&nbsp; Cari</button>
                            </div>
                        </div>
                    </div><!-- / Row -->
                </form>
            </div><!-- / BODY -->
        </div><!-- / BG -->
    </div><!-- / WIDGET -->
</div>
<?php if (isset($post)): ?>
    <div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
        <div class="widget-holder widget-full-height col-md-12">
            <div class="widget-bg">
                <div class="widget-body">
                    <legend>Laporan absensi kelas : <b><?= $classChoosed->class_name ?></b> Periode : <b><?= $post['from'] ?></b> sampai <b><?= $post['until'] ?></b></legend>
                    <table class="table table-bordered table-hover" data-toggle="datatables">
                        <thead>
                            <tr>
                                <th style="width:5%">#</th>
                                <th>NIS</th>
                                <th>Nama</th>
                                <th>Masuk</th>
                                <th>Izin</th>
                                <th>Sakit</th>
                                <th>Alpa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($dataStudent as $row => $value): ?>
                                <tr>
                                    <td><?= $row + 1 ?></td>
                                    <td><?= $value->student_nis ?></td>
                                    <td><?= $value->student_name ?></td>
                                    <td><?= $value->presence['attend'] ?></td>
                                    <td><?= $value->presence['leave'] ?></td>
                                    <td><?= $value->presence['sick'] ?></td>
                                    <td><?= $value->presence['alpha'] ?></td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                </div><!-- / BODY -->
            </div><!-- / BG -->
        </div>
    </div>
<?php endif ?>