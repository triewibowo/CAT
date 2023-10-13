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

        $("#imagePreview").css({
            "background-image": "url(<?php echo base_url() ?>" + 'assets/images/assignments/' + <?php echo json_encode($dataQuestion->question_image) ?> + ")",
            "background-size": "cover",
            "background-position": "center center"
        });
    });
</script>
<form action="<?= site_url('AssignmentCtrl/edit_question/' . $dataQuestion->id_question) ?>" method="POST" enctype="multipart/form-data">
<div class="row page-title clearfix" style="margin-top:-10px">
<div class="page-title-left">
        <!-- <h6 class="page-title-heading mr-0 mr-r-5">Tambah Soal</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p> -->
        <a href="<?= site_url('page/bank') ?>" class="btn btn-primary btn-sm"><i class="feather feather-arrow-left"></i>&nbsp; Kembali</a>
        <a href="#save" data-toggle="modal" class="btn btn-info btn-sm"><i class="feather feather-check-square"></i>&nbsp; Simpan!</a>
    </div>
    <div class="page-title-left">
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/assignments') ?>">Pilihan Berganda</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/bank/') ?>">List Soal</a></li>
            <li class="breadcrumb-item active">Tambah Soal</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
            <div class="row">
            <input type="hidden" name="id_type" value="4">
                    <div class="col-lg-4">
                   <div class="form-group">
                                <label>Jenis Sub Tes</label>
                                <select class="form-control" name="id_sub">
                                    <?php foreach ($dataSub as $rsub => $vsub): ?>
                                        <option value="<?= $vsub->id_sub ?>" <?= ($vsub->id_sub == $dataQuestion->id_sub) ? 'selected' : '' ?>><?= $vsub->sub_name ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Pelajaran</label>
                                <select class="form-control" name="id_lesson">
                                    <?php foreach ($dataLesson as $rlesson => $vlesson): ?>
                                        <option value="<?= $vlesson->id_lesson ?>" <?= ( $vlesson->id_lesson == $dataQuestion->id_lesson) ? 'selected' : '' ?>><?= $vlesson->lesson_name ?></option>
                                    <?php endforeach ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Level Soal</label>
                                <select class="form-control" name="id_level">
                                    <?php foreach ($dataLevel as $rlevel => $vlevel): ?>
                                        <option value="<?= $vlevel->level_value ?>" <?= ( $vlevel->level_value == $dataQuestion->question_level) ? 'selected' : '' ?>><?= $vlevel->level_name ?></option>
                                    <?php endforeach ?>
                                </select>
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
                    <textarea data-toggle="tinymce" name="question_" data-plugin-options='{ "height": 300 }'></textarea>
                    <br />
                    <div class="row">
                        <div class="col-sm-2">
                            <a href="#imageQuestion" data-toggle="modal" class="btn btn-outline-primary btn-block btn-sm"><i class="feather feather-image"></i> Unggah Gambar</a>
                        </div>
                        <div class="col-sm-2">
                            <a href="#soundQuestion" data-toggle="modal" class="btn btn-outline-success btn-block btn-sm"><i class="feather feather-music"></i> Unggah Suara</a>
                        </div>
                    </div><!-- / Row -->

                    <script>
                        tinymce.init({
                            selector: "textarea[name='question_']",
                            height: 100,
                            setup: function (editor) {
                                editor.on("init", function () {
                                    editor.setContent(`<?php echo html_entity_decode($dataQuestion->question_); ?>`);
                                });
                            }
                        });
                    </script>
                </div><!-- / Question_ -->
                <!-- END QUESTION -->

                <div class="line"></div>

                <!-- OPTION -->
                <div class="row">
                    <div class="col-sm-9">
                        <legend>
                            Jawaban 
                            <a href="javascript:;;" onclick="hideShowAnswer()"><i id="iconAnswer" class="feather feather-chevron-down"></i></a>
                        </legend>
                    </div>
                    <div class="col-sm-3" style="text-align:right">
                        <button title="Tambah 1 Jawaban" type="button" onclick="cloneAnswer()" class="btn btn-info btn-circle"><i class="feather feather-plus"></i></button>
                    </div>
                </div><!-- / Row -->
                <script type="text/javascript">
                    var b = 1;
                    function hideShowAnswer() {
                        if (b === 1) {
                            $("#option_").hide(200);
                            $("#iconAnswer").removeClass('feather-chevron-down');
                            $("#iconAnswer").addClass('feather-chevron-up');
                            b = 0;
                        } else {
                            $("#option_").show(200);
                            $("#iconAnswer").removeClass('feather-chevron-up');
                            $("#iconAnswer").addClass('feather-chevron-down');
                            b = 1;
                        };
                    }
                </script>
                <style type="text/css">
                    .chooseAnswer {
                        width: 100%;
                        height: 150px;
                        background-color: #737373;
                        cursor: pointer;
                        border-radius: 4px;
                        color: white;
                        font-size: 35px;
                        text-align: center;
                        padding-top: 40px;
                    }
                    .chooseAnswer.active {
                        background-color: #32B61C;
                    }
                    textarea.form-control {
                        /*border-color:black !important;*/
                    }
                </style>
                <input type="hidden" id="totalAnswer" name="totalAnswer" value="0">
                <input type="hidden" id="choosedAnswer" name="choosedAnswer[]" value="0">
                <input type="hidden" id="JSONanswer" name="JSONanswer">
                <script type="text/javascript">
                    var JSONanswer = [];
                    $(function(){
                        var initAnswer = { row : 0 };
                        JSONanswer.push(initAnswer);
                        $("#JSONanswer").val(JSON.stringify(JSONanswer));
                    });
                </script>
                <div id="option_">
                    <?php for ($i=0; $i < 1 ; $i++) : ?>
                        <script type="text/javascript">
                            $(function(){
                                var c = '<?= $i ?>';
                                $("#option_image"+c).on("change", function() {
                                    var files = !!this.files ? this.files : [];
                                    if (!files.length || !window.FileReader) {
                                        $("#imagePreview"+c).css("background", "transparent");
                                    }; // no file selected, or no FileReader support
                                    if (/^image/.test( files[0].type)){ // only image file
                                        var reader = new FileReader(); // instance of the FileReader
                                        reader.readAsDataURL(files[0]); // read the local file
                                    
                                        reader.onloadend = function(){ // set image data as background of div
                                        $("#imagePreview"+c).css({"background-image" : "url("+this.result+")","background-size" : "cover","background-position" : "center center"});
                                        }
                                    }
                                });
                            });

                            $(document).ready(function() {
                                var data_answer = <?php echo json_encode($dataQuestion->answer); ?>;
                                data_answer.forEach((answer, index) => {
                                    if (index > 0) {
                                        cloneAnswer();
                                    }
                                    if (answer.option_true == 1) {
                                        chooseAnswer(index)
                                    }
                                    if (data_answer[index]){ // only image file
                                    $("#imagePreview" + index).css({
                                        "background-image": "url(<?php echo base_url() ?>" + 'assets/images/assignments/' + data_answer[index].option_image + ")",
                                        "background-size": "cover",
                                        "background-position": "center center"
                                    });
                                }
                                });
                            });
                        </script>
                        <div class="row" id="rowAnswer">
                            <div class="col-sm-1">
                                <div id="chooseAnswer<?= $i ?>" class="chooseAnswer" onclick="chooseAnswer('<?= $i ?>')"><?php include "numberToChar.php"; ?></div>
                            </div>
                            <div class="col-sm-11">
                                <input type="hidden" name="option_<?= $i ?>[id]" value="<?= $dataQuestion->answer[$i]->id_option ?>">
                                <textarea class="form-control" style="height:150px" name="option_<?= $i ?>[name]" data-toggle="tinymce"></textarea>
                                <a style="margin-top:10px" href="#answerImage<?= $i ?>" data-toggle="modal" class="btn btn-sm btn-outline-primary"><i class="feather feather-image"></i>&nbsp; Unggah Gambar</a>
                            </div>
                            <script>
                                tinymce.init({
                                    selector: "textarea[name='option_<?= $i ?>[name]']",
                                    height: 100,
                                    setup: function (editor) {
                                        editor.on("init", function () {
                                            editor.setContent(`<?php echo html_entity_decode($dataQuestion->answer[$i]->option_); ?>`);
                                        });
                                    }
                                });
                            </script>
                        </div><!-- / Row -->
                        <br />
                        <!-- MODAL IMAGE -->
                        <div class="modal modal-primary fade" id="answerImage<?= $i ?>">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title text-inverse">Unggah Gambar (max. 2mb)</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <input type="file" name="option_image<?= $i ?>" id="option_image<?= $i ?>" class="form-control">
                                            <div id="imagePreview<?= $i ?>" class="imagePreview"></div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-primary btn-block" data-dismiss="modal">Simpan!</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endfor; ?>
                    <script type="text/javascript">
                        function cloneAnswer() {
                            var data_answer = <?php echo json_encode($dataQuestion->answer); ?>;
                            // TOTAL ANSWER //
                            var totalAnswer = $("#totalAnswer").val();
                            totalAnswer++;
                            $("#totalAnswer").val(totalAnswer);
                            // JSON ANSWER //
                            var newInit = { row : totalAnswer };
                            JSONanswer.push(newInit);
                            $("#JSONanswer").val(JSON.stringify(JSONanswer));
                            // FOR ANSWER //
                            var _html = '';
                            var alph = alphabet(totalAnswer);
                            _html += '<div class="row" id="rowAnswer'+totalAnswer+'">';
                                _html += '<div class="col-sm-1">';
                                    _html += '<div id="chooseAnswer'+totalAnswer+'" class="chooseAnswer" onclick="chooseAnswer(\'' + totalAnswer + '\')"><span class="forAlph">'+alph+'</span></div>';
                                _html += '</div>';
                                _html += '<div class="col-sm-11">';
                                    if (data_answer[totalAnswer]) {
                                        _html += '<input type="hidden" name="option_'+totalAnswer + '[id]' +'" value="'+ data_answer[totalAnswer].id_option+'">';
                                    }else{
                                        _html += '<input type="hidden" name="option_'+totalAnswer + '[id]' +'">';
                                    }
                                    _html += '<textarea class="form-control text-blank" style="height:150px" name="option_'+totalAnswer + '[name]' +'" id="textareaBlank'+totalAnswer+'"></textarea>';
                                    _html += '<a style="margin-top:10px" href="#answerImage'+totalAnswer+'" data-toggle="modal" class="btn btn-sm btn-outline-primary"><i class="feather feather-image"></i>&nbsp; Unggah Gambar</a>';
                                    _html += '<button type="button" style="margin-top:10px;margin-left:10px" onclick="removeAnswer(\'' + totalAnswer + '\')" class="btn btn-sm btn-outline-danger"><i class="feather feather-x"></i>&nbsp; Hapus Jawaban</a>';
                                _html += '</div>';
                            _html += '</div>'; // ROW END
                            tinymce.init({
                                selector: "textarea[name='option_" + totalAnswer + '[name]' + "']",
                                height: 100,
                                setup: function (editor) {
                                    editor.on("init", function () {
                                        editor.setContent(data_answer[totalAnswer] ? data_answer[totalAnswer].option_  : '');
                                    });
                                }
                            });
                            // FOR MODAL IMAGE //
                            _html += '<div class="modal modal-primary fade" id="answerImage'+totalAnswer+'">';
                                _html += '<div class="modal-dialog">';
                                    _html += '<div class="modal-content">';
                                        _html += '<div class="modal-header">';
                                            _html += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
                                            _html += '<h4 class="modal-title text-inverse">Unggah Gambar (max. 2mb)</h4>';
                                        _html += '</div>';
                                        _html += '<div class="modal-body">';
                                            _html += '<div class="form-group">';
                                                _html += '<input type="file" name="option_image'+totalAnswer+'" id="option_image'+totalAnswer+'" class="form-control">';
                                                _html += '<div id="imagePreview'+totalAnswer+'" class="imagePreview"></div>';
                                            _html += '</div>';
                                        _html += '</div>';
                                        _html += '<div class="modal-footer">';
                                            _html += '<button type="button" class="btn btn-outline-primary btn-block" data-dismiss="modal">Simpan!</button>';
                                        _html += '</div>';
                                    _html += '</div>';
                                _html += '</div>';
                            _html += '</div>';
                            // END MODAL IMAGE //
                            _html += '<br />';
                            $("#appendAnswer").append(_html);
                             // VALIDATION IMAGE //
                            $("#option_image"+totalAnswer).bind("change", function() {
                                var files = !!this.files ? this.files : [];
                                if (!files.length || !window.FileReader) {
                                    $("#imagePreview"+totalAnswer).css("background", "transparent");
                                }; // no file selected, or no FileReader support
                                if (/^image/.test( files[0].type)){ // only image file
                                    var reader = new FileReader(); // instance of the FileReader
                                    reader.readAsDataURL(files[0]); // read the local file
                                
                                    reader.onloadend = function(){ // set image data as background of div
                                    $("#imagePreview"+totalAnswer).css({"background-image" : "url("+this.result+")","background-size" : "cover","background-position" : "center center"});
                                    }
                                }
                            });
                            tinymce.EditorManager.execCommand('mceAddEditor',true, "textareaBlank"+totalAnswer);
                            // END VALIDATION IMAGE //
                        }
                    </script>
                    <!-- FOR APPEND ANSWER -->
                    <div id="appendAnswer"></div>
                    <!-- FOR APPEND ANSWER -->
                </div>
                <script type="text/javascript">
                    var choosedAnswerArray = [];

                    function chooseAnswer(count) {
                        $.each($(".chooseAnswer"), function(i, v) {
                            if ("chooseAnswer" + count == $(v).attr("id")) {
                            if ($(this).hasClass("active")) {
                                console.log($(v).attr("id"));
                                $(this).removeClass("active");
                            } else {
                                $("#chooseAnswer" + count).addClass("active");
                            }
                            }
                        });

                        var number = parseInt(count);

                        if (choosedAnswerArray.includes(number)) {
                            choosedAnswerArray.splice(choosedAnswerArray.indexOf(number), 1);
                        } else {
                            choosedAnswerArray.push(number);
                        }

                        console.log(choosedAnswerArray);
                        $("#choosedAnswer").val(choosedAnswerArray);
                    }
                    function removeAnswer(row) {
                        var sure = confirm('Anda yakin ingin menghapus jawaban ini ?');
                        if (sure) {
                            var choosedAnswer = $("#choosedAnswer").val();
                            var totalAnswer = $("#totalAnswer").val();
                            totalAnswer--;
                            $("#totalAnswer").val(totalAnswer);
                            if (row === choosedAnswer) {
                                chooseAnswer(0);
                            };
                            $("#rowAnswer"+row).remove();
                            // RE-PUSH JSONanswer
                            JSONanswer.splice(row,1);
                            $("#JSONanswer").val(JSON.stringify(JSONanswer));
                            recount();
                        };
                    }
                    function recount() {
                        var x = 1;
                        $.each($(".forAlph"),function(){
                            $(this).text(alphabet(x));
                            x++;
                        });
                    }
                </script>
                <!-- END OPTION -->

            </div><!-- / BODY -->
        </div><!-- / BG -->
    </div>
</div>

<!-- MODAL IMAGE -->
<div class="modal modal-primary fade" id="imageQuestion">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title text-inverse">Unggah Gambar (max. 2mb)</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="file" name="question_image" id="question_image" class="form-control">
                    <div id="imagePreview" class="imagePreview"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-primary btn-block" data-dismiss="modal">Simpan!</button>
            </div>
        </div>
    </div>
</div>
<!-- MODAL SOUND -->
<div class="modal modal-success fade" id="soundQuestion">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title text-inverse">Unggah Suara (max. 2mb, .mp3)</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="file" name="question_sound" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-success btn-block" data-dismiss="modal">Simpan!</button>
            </div>
        </div>
    </div>
</div>

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

<script type="text/javascript">
    function alphabet(data) {
        var callback = '';
        switch(parseInt(data)) {
            case 1 :
                callback = 'B';
            break;
            case 2 :
                callback = 'C';
            break;
            case 3 :
                callback = 'D';
            break;
            case 4 :
                callback = 'E';
            break;
            case 5 :
                callback = 'F';
            break;
            case 6 :
                callback = 'G';
            break;
            case 7 :
                callback = 'H';
            break;
            case 8 :
                callback = 'I';
            break;
            case 9 :
                callback = 'J';
            break;
            case 10:
                callback = "K";
                break;
            case 11:
                callback = "L";
                break;
            case 12:
                callback = "M";
                break;
            case 13:
                callback = "N";
                break;
            case 14:
                callback = "O";
                break;
            case 15:
                callback = "P";
                break;
            case 16:
                callback = "Q";
                break;
            case 17:
                callback = "R";
                break;
            case 18:
                callback = "S";
                break;
            case 19:
                callback = "T";
                break;
            case 20:
                callback = "U";
                break;
            case 21:
                callback = "V";
                break;
            case 22:
                callback = "W";
                break;
            case 23:
                callback = "X";
                break;
            case 24:
                callback = "Y";
                break;
            case 25:
                callback = "Z";
            break;
            default :
                callback = data;
            break;
        }
        return callback;
    }
</script>