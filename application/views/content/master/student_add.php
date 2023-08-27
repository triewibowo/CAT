<script type="text/javascript">
    $(function(){
        $("#student_photo").on("change", function() {
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
        <a href="#save" data-toggle="modal" class="btn btn-info btn-sm"><i class="feather feather-check-square"></i>&nbsp; Simpan</a>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/students') ?>">Data Siswa</a></li>
            <li class="breadcrumb-item active">Tambah Siswa</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
              <form action="<?= site_url('MasterCtrl/students') ?>" method="POST" enctype="multipart/form-data">
                <div class="row">
                 <div class="col-md-6">
                     <div class="form-group">
                         <label>Nama Lengkap</label>
                         <input type="text" class="form-control" name="student_name" placeholder="Nama Lengkap" required>
                     </div>
                     <div class="form-group">
                         <label>NIS</label>
                         <input type="text" class="form-control" name="student_nis" placeholder="NIS" required>
                     </div>
                     <div class="form-group">
                         <label>Password</label>
                         <input type="password" class="form-control" name="student_password" placeholder="Password" required>
                     </div>
                     <div class="row">
                       <div class="col-sm-6">
                         <div class="form-group">
                             <label>Email</label>
                             <input type="email" class="form-control" name="student_email" placeholder="info@youremail.com">
                         </div>
                       </div>
                       <div class="col-sm-6">
                         <div class="form-group">
                             <label>Nomor Telepon</label>
                             <input type="number" class="form-control" name="student_phone" placeholder="Nomor Telepon">
                         </div>
                       </div>
                     </div><!-- / Row -->
                     <div class="form-group">
                         <label>Kelas</label>
                         <select class="form-control" name="id_class">
                           <?php foreach ($dataClasses as $row => $value): ?>
                             <option value="<?= $value->id_class ?>"><?= $value->class_name ?></option>
                           <?php endforeach ?>
                         </select>
                     </div>
                 </div>
                 <div class="col-md-6">
                      <div class="form-group">
                          <label>Foto Siswa</label>
                          <input type="file" name="student_photo" id="student_photo" class="form-control">
                          <div class="imagePreview" id="imagePreview"></div>
                      </div>
                 </div>
                </div><!-- / Row -->
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