<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">Hasil Ujian</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">Hasil Ujian</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:0px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
                <form action="<?= site_url('page/results') ?>" method="POST">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label>Nama Pelajaran</label>
                            <select class="form-control" name="id_lesson" id="id_lesson" onchange="find(this.value)">
                                <option value="0">-- Pilih Pelajaran --</option>
                                <?php foreach ($dataLessons as $row => $value): ?>
                                    <option value="<?= $value->id_lesson ?>"><?= $value->lesson_name ?></option>
                                <?php endforeach ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label>Kelas</label>
                            <select class="form-control" name="id_class" id="id_class" readonly></select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label>Tipe Ujian</label>
                            <select class="form-control" name="assignment_type" id="assignment_type" readonly></select>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label>&nbsp;</label>
                            <button id="buttonSubmit" type="submit" class="btn btn-outline-primary btn-block"><i class="feather feather-search"></i> Cari</button>
                        </div>
                    </div>
                </div><!-- / Row -->
                </form>
            </div><!-- / BODY -->
        </div><!-- / BG -->
    </div>
</div>

<?php if (isset($dataAssignments)): ?>
     <div class="row">
        <div class="col-sm-4">
            <div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
                <div class="widget-holder widget-full-height col-md-12">
                    <div class="widget-bg">
                        <div class="widget-body">
                            <p style="font-weight:bold">Hasil Ujian : <?= $dataLesson->lesson_name.' - '.$post['assignment_type'].' || Kelas : '.$dataClass->class_name ?></p>
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>KKM</th>
                                        <th>Dibuat</th>
                                        <th>Penulis</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $no = 1; foreach ($dataAssignments as $row => $value): ?>
                                        <tr>
                                            <td><?= $no ?></td>
                                            <td><?= $value->assignment_kkm ?>%</td>
                                            <td><?= $value->assignment_created ?></td>
                                            <td><?= $value->assignment_author ?></td>
                                            <td><button type="button" onclick="openBox('<?= $row ?>')" class="btn btn-primary btn-sm btn-block">Lihat</button></td>
                                        </tr>
                                    <?php $no++; endforeach ?>
                                </tbody>
                            </table>
                        </div><!-- / BODY -->
                    </div><!-- / BG -->
                </div><!-- / WIDGET HOLDER -->
            </div><!-- / WIDGET LIST -->
        </div><!-- / Col -->
        <div class="col-sm-8">
            <div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
                <div class="widget-holder widget-full-height col-md-12">
                    <div class="widget-bg">
                        <div class="widget-body">
                            <?php foreach ($dataAssignments as $r => $v): ?>
                                <div id="boxResult<?= $r ?>">
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <legend>
                                                KKM : <?= $v->assignment_kkm ?>%
                                            </legend>
                                        </div>
                                        <div class="col-sm-4" style="text-align:right">
                                            <a href="<?= site_url('page/result_pdf/'.$v->id_assignment.'/'.$dataClass->id_class) ?>" target="_blank" class="pull-right btn btn-danger btn-sm"><i class="feather feather-download"></i>&nbsp; Download Pdf</a>
                                        </div>
                                    </div><!-- / Row -->
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>NIS</th>
                                                <th>Nama Siswa</th>
                                                <th>Benar</th>
                                                <th>Salah</th>
                                                <th>Nilai</th>
                                                <th style="width:13%">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $n = 1; foreach ($v->students as $rStudent => $vStudent): ?>
                                                <tr>
                                                    <td><?= $n ?></td>
                                                    <td><?= $vStudent->student_nis ?></td>
                                                    <td><?= $vStudent->student_name ?></td>
                                                    <?php if ($vStudent->result): ?>
                                                        <td><?= $vStudent->result->result_true ?> Soal</td>
                                                        <td><?= $vStudent->result->result_false ?> Soal</td>
                                                        <td><?= $vStudent->result->result_score ?>%</td>
                                                        <td>
                                                            <?php if ($vStudent->result->result_score < $v->assignment_kkm): ?>
                                                                <button type="button" class="btn btn-danger btn-sm btn-block">GAGAL</button>
                                                            <?php else: ?>
                                                                <button type="button" class="btn btn-success btn-sm btn-block">LULUS</button>
                                                            <?php endif ?>
                                                        </td>
                                                    <?php else: ?>
                                                        <td><center>Belum Mengerjakan</center></td>
                                                        <td><center>Belum Mengerjakan</center></td>
                                                        <td><center>Belum Mengerjakan</center></td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-sm btn-block">Belum Mengerjakan</button>
                                                        </td>
                                                    <?php endif ?>
                                                </tr>
                                            <?php $n++; endforeach ?>
                                        </tbody>
                                    </table>
                                </div>
                            <?php endforeach ?>
                        </div><!-- / BODY -->
                    </div><!-- / BG -->
                </div><!-- / WIDGET HOLDER -->
            </div><!-- / WIDGET LIST -->
        </div>
    </div><!-- / Row -->
    <script type="text/javascript">
        $(function(){
            closeBoxes();
        });
        function closeBoxes() {
            var count = '<?= count($dataAssignments); ?>';
            for (var i = 0; i < count; i++) {
                $("#boxResult"+i).hide();
            };
        }
        function openBox(row) {
            closeBoxes();
            $("#boxResult"+row).show();
        }
    </script>
<?php endif ?>

<script type="text/javascript">
    function find(value) {
        $("#buttonSubmit").html('Sedang mencari...');
        $("#buttonSubmit").prop('disabled',true);
        $.ajax({
            url : '<?= site_url("MasterCtrl/findTypeAndClassForReport/'+value+'") ?>',
            type : 'GET',
            success:function(res){
                if (res === 'failure') {
                    swal({
                        title : 'Oooppss!',
                        text : 'Tidak ditemukan laporan sesuai data yang dipilih',
                        timer : 3000,
                        button : true,
                        type : 'error'
                    });
                } else {
                    var callback = $.parseJSON(res);
                    _type = '';
                    $.each(callback.dataType,function(i,v){
                        _type += '<option value="'+v.assignment_type+'">'+v.assignment_type+'</option>';
                    });
                    _class = '';
                    $.each(callback.dataClass,function(i,v){
                        _class += '<option value="'+v.id_class+'">'+v.class_name+'</option>';
                    });
                    // INJECT //
                    setTimeout(function(){
                        $("#buttonSubmit").html('<i class="feather feather-search"></i> Cari');
                        $("#buttonSubmit").prop('disabled',false);
                        $("#assignment_type").html(_type);
                        $("#id_class").html(_class);
                    },700);
                };
            }
        });
    }
</script>