<script type="text/javascript">
    $(function(){
        $("#teacher_photo").on("change", function() {
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
<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <!-- <h6 class="page-title-heading mr-0 mr-r-5">Tambah Guru</h6> -->
        <a href="#classes" data-toggle="modal" class="btn btn-success btn-sm"><i class="feather feather-home"></i>&nbsp; Pilih Kelas</a>
        <a href="#lessons" data-toggle="modal" class="btn btn-warning btn-sm"><i class="feather feather-edit"></i>&nbsp; Pilih Pelajaran</a>
        <a href="#save" data-toggle="modal" class="btn btn-info btn-sm"><i class="feather feather-check-square"></i>&nbsp; Simpan</a>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/teachers') ?>">Data Guru</a></li>
            <li class="breadcrumb-item active">Ubah Guru</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
               <form action="<?= site_url('MasterCtrl/teacher_update') ?>" method="POST" enctype="multipart/form-data">
                  <input type="hidden" name="id_teacher" value="<?= $dataTeacher->id_teacher ?>">
                   <div class="row">
                       <div class="col-md-6">
                           <div class="form-group">
                               <label>Nama Lengkap</label>
                               <input type="text" class="form-control" name="teacher_name" placeholder="Nama Lengkap" required value="<?= $dataTeacher->teacher_name ?>">
                           </div>
                           <div class="form-group">
                               <label>Username</label>
                               <input type="text" class="form-control" name="teacher_username" placeholder="Username" required value="<?= $dataTeacher->teacher_username ?>">
                           </div>
                           <div class="form-group">
                               <label>Password</label>
                               <input type="password" class="form-control" name="teacher_password" placeholder="Boleh Dikosongkan">
                           </div>
                           <div class="form-group">
                               <label>Email</label>
                               <input type="email" class="form-control" name="teacher_email" placeholder="info@youremail.com" value="<?= $dataTeacher->teacher_email ?>">
                           </div>
                           <div class="form-group">
                               <label>Nomor Telepon</label>
                               <input type="number" class="form-control" name="teacher_phone" placeholder="Nomor Telepon" value="<?= $dataTeacher->teacher_phone ?>">
                           </div>
                           <div class="form-group">
                               <label>Alamat</label>
                               <input type="text" class="form-control" name="teacher_address" placeholder="Alamat" value="<?= $dataTeacher->teacher_address ?>">
                           </div>
                       </div>
                       <div class="col-md-6">
                            <div class="form-group">
                                <label>Foto Guru</label>
                                <input type="file" name="teacher_photo" id="teacher_photo" class="form-control">
                                <div class="imagePreview" id="imagePreview" style="background:url('<?= base_url('assets/images/teachers/'.$dataTeacher->teacher_photo) ?>');background-size:cover;background-position:center center"></div>
                            </div>
                       </div>
                   </div><!-- / Row -->

                   <!-- MODAL CLASSESS -->
                   <div class="modal modal-success fade" id="classes">
                       <div class="modal-dialog">
                           <div class="modal-content">
                               <div class="modal-header text-inverse">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                   <h4 class="modal-title">Pilih Kelas</h4>
                               </div>
                               <div class="modal-body">
                                   <table class="table table-stripped table-hover">
                                       <thead>
                                           <tr>
                                               <th style="width:5%">#</th>
                                               <th>Nama Kelas</th>
                                           </tr>
                                       </thead>
                                       <tbody>
                                            <?php foreach ($dataClasses as $rowClass => $valueClass): ?>
                                              <?php
                                                $classActive = '';
                                                foreach ($dataTeacher->classes as $_rowClass => $_valueClass) {
                                                  if ($valueClass->id_class == $_valueClass->id_class) {
                                                    $classActive = 'checked';
                                                  }
                                                }
                                              ?>
                                               <tr>
                                                   <td><input type="checkbox" <?= $classActive ?> name="id_class[]" value="<?= $valueClass->id_class ?>"></td>
                                                   <td><?= $valueClass->class_name ?></td>
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
                   </div> <!-- / END MODAL CLASSES -->

                   <!-- MODAL LESSONS -->
                   <div class="modal modal-warning fade" id="lessons">
                       <div class="modal-dialog">
                           <div class="modal-content">
                               <div class="modal-header text-inverse">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                   <h4 class="modal-title">Pilih Pelajaran</h4>
                               </div>
                               <div class="modal-body">
                                   <table class="table table-stripped table-hover">
                                       <thead>
                                           <tr>
                                               <th style="width:5%">#</th>
                                               <th>Nama Pelajaran</th>
                                           </tr>
                                       </thead>
                                       <tbody>
                                            <?php foreach ($dataLessons as $rowLesson => $valueLesson): ?>
                                              <?php
                                                $lessonActive = '';
                                                foreach ($dataTeacher->lessons as $_rowLesson => $_valueLesson) {
                                                  if ($valueLesson->id_lesson == $_valueLesson->id_lesson) {
                                                    $lessonActive = 'checked';
                                                  }
                                                }
                                              ?>
                                               <tr>
                                                   <td><input type="checkbox" <?= $lessonActive ?> name="id_lesson[]" value="<?= $valueLesson->id_lesson ?>"></td>
                                                   <td><?= $valueLesson->lesson_name ?></td>
                                               </tr>
                                            <?php endforeach ?>
                                       </tbody>
                                   </table>
                               </div>
                               <div class="modal-footer">
                                   <button type="button" class="btn btn-outline-warning btn-block" data-dismiss="modal">Simpan!</button>
                               </div>
                           </div>
                       </div>
                   </div><!-- / END MODAL LESSONS -->

                   <!-- MODAL SAVE -->
                   <div class="modal modal-info fade" id="save">
                       <div class="modal-dialog">
                           <div class="modal-content">
                               <div class="modal-header text-inverse">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                   <h4 class="modal-title">Apa anda sudah yakin dengan data ini ?</h4>
                               </div>
                               <div class="modal-footer">
                                   <button type="submit" class="btn btn-outline-info btn-block">Ya, Simpan dan lanjutkan!</button>
                               </div>
                           </div>
                       </div>
                   </div><!-- / END MODAL SAVE -->

               </form>
            </div>
            <!-- /.widget-body -->
        </div>
        <!-- /.widget-bg -->
    </div>
</div>