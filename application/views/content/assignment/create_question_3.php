<script type="text/javascript">
    $(function(){
        $("#question_image").on("change", function() {
            var files = !!this.files ? this.files : [];
            if (!files.length || !window.FileReader) {
                $("#imagePreview").css("background", "transparent");
            }; // no file selected, or no FileReader support
            if (/^image/.test( files[0].type)){ // only image file
                var reader = new FileReader(); // instance of the FileReader
                reader.readAsDataURL(files[0]); // read the local file
            
                reader.onloadend = function(){ // set image data as background of div
                $("#imagePreview").css({"background-image" : "url("+this.result+")","background-size" : "cover","background-position" : "center center"});
                }
            }
        });
    });
</script>
<form action="<?= site_url('AssignmentCtrl/create_question') ?>" method="POST" enctype="multipart/form-data">
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <!-- <h6 class="page-title-heading mr-0 mr-r-5">Tambah Soal</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p> -->
        <a href="<?= site_url('page/create_question_type') ?>" class="btn btn-primary btn-sm"><i class="feather feather-arrow-left"></i>&nbsp; Kembali</a>
        <a href="#save" data-toggle="modal" class="btn btn-info btn-sm"><i class="feather feather-check-square"></i>&nbsp; Simpan!</a>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/assignments') ?>">Benar Salah</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/list_question/') ?>">List Soal</a></li>
            <li class="breadcrumb-item active">Tambah Soal</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
                  <div class="row">
                  <input type="hidden" name="id_type" value="3">
                    <div class="col-lg-3">
                   <div class="form-group">
                                <label>Jenis Sub Tes</label>
                                <select class="form-control" name="id_sub">
                                    <?php foreach ($dataSub as $rsub => $vsub): ?>
                                        <option value="<?= $vsub->id_sub ?>" selected><?= $vsub->sub_name ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label>Pelajaran</label>
                                <select class="form-control" name="id_lesson">
                                    <?php foreach ($dataLesson as $rlesson => $vlesson): ?>
                                        <option value="<?= $vlesson->id_lesson ?>" selected><?= $vlesson->lesson_name ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label>Level Soal</label>
                                <select class="form-control" name="id_level">
                                    <?php foreach ($dataLevel as $rlevel => $vlevel): ?>
                                        <option value="<?= $vlevel->level_value ?>" selected><?= $vlevel->level_name ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label>Timer</label>
                                <input type="number" class="form-control" name="timer" placeholder="Format detik" required>
                            </div>
                        </div>
                    </div>
                <legend>Pertanyaan <a href="#" onclick="hideShowQuest()"><i id="iconQuest" class="feather feather-chevron-down"></i></a></legend>
                <script type="text/javascript">
                    var i = 1;
                    function hideShowQuest() {
                        if (i === 1) {
                            $("#question_").hide(200);
                            $("#iconQuest").removeClass('feather-chevron-down');
                            $("#iconQuest").addClass('feather-chevron-up');
                            i = 0;
                        } else {
                            $("#question_").show(200);
                            $("#iconQuest").removeClass('feather-chevron-up');
                            $("#iconQuest").addClass('feather-chevron-down');
                            i = 1;
                        };
                    }
                </script>
                <style type="text/css">
                    #question_ {
                        margin-bottom: 10px;
                        width: 100%;
                        min-height: 100px;
                    }
                    .line {
                        border-bottom: 1px solid #E9E9E9;
                        width: 100%;
                        min-height: 1px;
                        margin: 10px 0px;
                    }
                </style>

                <!-- QUESTION -->
                <div id="question_">
                    <textarea data-toggle="tinymce" name="question_" data-plugin-options='{ "height": 100 }'></textarea>
                    <br />
             
                </div><!-- / Question_ -->
                <!-- END QUESTION -->

                <div class="line"></div>

                    <!-- OPTION -->
                <div class="row">
                        <legend>
                            Jawaban 
                            <a href="javascript:;;" onclick="hideShowAnswer()"><i id="iconAnswer" class="feather feather-chevron-down"></i></a>
                        </legend>
                </div><!-- / Row -->
               <div class="row">
    <div class="col-lg-4">
        <div class="form-group">
            <input type="text" class="form-control" name="answer" required >
        </div>
    </div>
</div><!-- / Row -->
<!-- MODAL SAVE -->
<div class="modal modal-info fade" id="save">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title text-inverse">Apa sudah anda yakin dengan data ini ?</h4>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-outline-info btn-block">Ya, Simpan dan lanjutkan!</button>
            </div>
        </div>
    </div>
</div>

</form>