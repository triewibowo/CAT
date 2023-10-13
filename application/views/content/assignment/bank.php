<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
      <h6 class="page-title-heading mr-0 mr-r-5">Tambah Soal</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">Bank Soal</li>
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
                    <a href="<?= site_url('page/create_question_type') ?>" class="btn btn-success btn-sm float-right"><i class="feather feather-plus"></i> Create</a>
                </div>
            </div>
            <table class="table table-striped table-responsive" data-toggle="datatables">
                <thead class="bg-primary-gradient">
                    <tr>
                        <th style="width:5%">#</th>
                        <th style="width:10%">Pelajaran</th>
                        <th>Pertanyaan</th>
                        <th style="width:15%">Subtes</th>
                        <th style="width:10%; text-align:center">Jenis</th>
                        <th style="width:10%; text-align:center">Dibuat</th>
                        <th style="width:10%; text-align:center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($dataQuestion as $row => $value): ?>
                        <tr>
                            <td><?= $row + 1 ?></td>
                            <td><?= ($value->lesson) ? $value->lesson->lesson_name : '' ?></td>
                            <td><?= $value->question_ ?></td>
                            <td><?= ($value->subtest) ? $value->subtest->sub_name : '' ?></td>
                            <td align=center><?= ($value->type) ? $value->type->type_name : '' ?></td>
                            <td align=center><?= date('d-M-Y', strtotime($value->question_created)) ?></td>
                            <td align=center>
                                <a title="Edit Soal" href="<?= site_url('page/edit_question/'.$value->id_question.'/'.$value->id_type) ?>" class="btn btn-success btn-sm"><i class="feather feather-eye"></i></a>
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
                                        <a href="<?= site_url('AssignmentCtrl/deleteQuestion/'.$value->id_question) ?>" class="btn btn-outline-danger btn-block"><i class="feather feather-check-square"></i> Ya, Hapus data ini!</a>
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