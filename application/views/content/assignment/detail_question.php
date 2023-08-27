<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">Rincial Soal</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <?php if ($bank): ?>
                <li class="breadcrumb-item"><a href="<?= site_url('page/bank') ?>">Bank Soal</a></li>
            <?php else: ?>
                <li class="breadcrumb-item"><a href="<?= site_url('page/assignments') ?>">List Ujian</a></li>
                <li class="breadcrumb-item"><a href="<?= site_url('page/list_question/'.$dataAssignment->id_assignment) ?>">List Soal</a></li>
            <?php endif ?>
            <li class="breadcrumb-item active">Rincial Soal</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<style type="text/css">
    .line {
        width: 100%;
        min-height: 1px;
        border-bottom: 1px solid #E9E9E9;
        margin: 10px 0px;
    }
    .bigLine {
        width: 100%;
        border-bottom: 1px solid black;
        min-height: 2px;
    }
    .audio {
        margin-top:20px;
        background-color: black;
        width: 100% !important;
    }
</style>
<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
                <legend>Pertanyaan</legend>
                <div class="question_">
                    <div class="row">
                        <?php if ($dataQuestion->question_image != ''): ?>
                            <div class="col-sm-8">
                        <?php else: ?>
                            <div class="col-sm-12">
                        <?php endif; ?>
                            <?= $dataQuestion->question_ ?>
                            <div class="line"></div>
                            <?php if ($dataQuestion->question_sound != ''): ?>
                                <a href="#playMusic" data-toggle="modal" class="btn btn-sm btn-outline-primary"><i class="feather feather-music"></i>&nbsp; Mainkan Suara</a>
                                <div class="modal modal-primary fade" id="playMusic">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title text-inverse">Mainkan Suara</h4>
                                            </div>
                                            <div class="modal-body">
                                                <audio class="audio" src="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$dataQuestion->question_sound) ?>" type="audio/mp3"></audio>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php endif ?>
                        </div>
                        <?php if ($dataQuestion->question_image != ''): ?>
                            <div class="col-sm-4">
                                <a data-fancybox="gallery" href="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$dataQuestion->question_image) ?>"><img src="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$dataQuestion->question_image) ?>" class="img-thumbnail"></a>
                            </div>
                        <?php endif ?>
                    </div><!-- / Row -->
                </div><!-- / Question -->
                <br />
                <div class="bigLine"></div>
                <legend>Jawaban</legend>
                <div class="option_">
                    <?php foreach ($dataQuestion->options as $row => $value): ?>
                        <div class="row" style="margin-bottom:20px;border-bottom:1px solid #E9E9E9">
                            <div class="col-sm-1">
                                <center><?php $i = $row; include "numberToChar.php"; ?></center>
                            </div>
                            <div class="col-sm-11">
                                <div class="row">
                                    <?php if ($value->option_image != ''): ?>
                                        <div class="col-sm-9">
                                    <?php else : ?>
                                        <div class="col-sm-12">
                                    <?php endif; ?>
                                        <?php if ($value->option_true == 1): ?>
                                            <div class="alert alert-success" style="padding:5px">
                                                Jawaban Benar
                                            </div>
                                        <?php endif ?>
                                        <?= $value->option_ ?>
                                    </div>
                                    <?php if ($value->option_image != ''): ?>
                                        <div class="col-sm-3">
                                            <a data-fancybox="gallery" href="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$value->option_image) ?>"><img src="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$value->option_image) ?>" class="img-thumbnail"></a>
                                        </div>
                                    <?php endif ?>
                                </div><!-- / Row -->
                            </div>
                        </div><!-- / Row -->
                    <?php endforeach ?>
                </div>
            </div><!-- / BODY -->
        </div><!-- / BG -->
    </div>
</div>