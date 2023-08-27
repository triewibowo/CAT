<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">Gunakan Soal Lain</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/assignments') ?>">List Ujian</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/list_question/'.$dataAssignment->id_assignment) ?>">List Soal</a></li>
            <li class="breadcrumb-item active">Gunakan Soal Lain</li>
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
                        <th style="width:5%">#</th>
                        <th style="width:10%">Pelajaran</th>
                        <th>Pertanyaan</th>
                        <th style="width:10%">Total</th>
                        <th style="width:20%">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($dataQuestion as $row => $value): ?>
                        <tr>
                            <td><?= $row + 1 ?></td>
                            <td><?= $value->lesson_name ?></td>
                            <td><?= $value->question_ ?></td>
                            <td><?= $value->totalAnswer ?> jawaban</td>
                            <td>
                                <a title="Detail Soal" href="<?= site_url('page/detail_question/'.$value->id_assignment.'/'.$value->id_question.'/true') ?>" class="btn btn-success btn-sm">Lihat Jawaban</a>
                                <a title="Gunakan Soal Ini" onclick="return confirm('Apa anda yakin ?')" href="<?= site_url('page/reusequestion/'.$dataAssignment->id_assignment.'/'.$value->id_question) ?>" class="btn btn-info btn-sm">Gunakan Soal Ini</a>
                            </td>
                        </tr>
                    <?php endforeach ?>
                                       
                </tbody>
            </table>
        </div>
        <!-- /.widget-body -->
    </div>
    <!-- /.widget-bg -->
</div>
</div>