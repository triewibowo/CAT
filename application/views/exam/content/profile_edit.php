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
<div class="container">
    <div class="main-body">
        <form action="<?= site_url('MasterCtrl/students') ?>" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="id_student" value="<?= $user->id_student ?>">
        <input type="hidden" name="exam" value="true">
        <div class="row gutters-sm">
        <div class="col-md-4 mb-3">
            <div class="card">
            <div class="card-body" style="padding-top:2rem">
                <div class="d-flex flex-column align-items-center text-center">
                    <div class="form-group">
                        <label>Foto Siswa</label>
                        <input type="file" name="student_photo" id="student_photo" class="form-control">
                        <div class="imagePreview" id="imagePreview" style="background:url('<?= base_url('assets/images/students/'.$user->student_photo) ?>');background-size:cover;background-position:center center;height:34.4rem"></div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card mb-3">
            <div class="card-body" style="padding-top:2rem">
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">Full Name</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <div class="form-group">
                        <input type="text" class="form-control" name="student_name" placeholder="Nama Lengkap" required value="<?= $user->student_name ?>">
                    </div>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">NIS</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <div class="form-group">
                        <input type="text" class="form-control" name="student_nis" placeholder="NIS" required value="<?= $user->student_nis ?>">
                    </div>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">Email</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <div class="form-group">
                        <input type="email" class="form-control" name="student_email" placeholder="info@youremail.com" value="<?= $user->student_email ?>">
                    </div>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">Phone</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <div class="form-group">
                        <input type="number" class="form-control" name="student_phone" placeholder="Nomor Telepon" value="<?= $user->student_phone ?>">
                    </div>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">Kelas</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <div class="form-group">
                        <select class="form-control" name="id_class">
                            <?php foreach ($dataClasses as $row => $value): ?>
                            <option <?php if ($value->id_class == $user->id_class): echo "selected"; endif; ?> value="<?= $value->id_class ?>"><?= $value->class_name ?></option>
                            <?php endforeach ?>
                        </select>
                    </div>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">Address</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <div class="form-group">
                        <textarea class="form-control" name="student_address" placeholder="Tulis alamat"><?= $user->student_address ?></textarea>
                    </div>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-12">
                    <a href="#save" data-toggle="modal" class="btn btn-success btn-sm"><i class="feather feather-check-square"></i>&nbsp; Simpan</a>
                </div>
                </div>
            </div>
            </div>
        </div>
        </div>
        <!-- MODAL SAVE -->
        <div class="modal modal-info fade" id="save">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header text-inverse">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Apa anda sudah yakin dengan data ini ?</h4>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info btn-block">Ya, Simpan dan lanjutkan!</button>
                    </div>
                </div>
            </div>
        </div><!-- / END MODAL SAVE -->
        </form>
    </div>
</div>

<style>
    .card {
        box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
    }

    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(0,0,0,.125);
        border-radius: .25rem;
    }

    .card-body {
        flex: 1 1 auto;
        min-height: 1px;
        padding: 1rem;
    }

    .gutters-sm {
        margin-right: -8px;
        margin-left: -8px;
    }

    .gutters-sm>.col, .gutters-sm>[class*=col-] {
        padding-right: 8px;
        padding-left: 8px;
    }
    .mb-3, .my-3 {
        margin-bottom: 1rem!important;
    }

    .bg-gray-300 {
        background-color: #e2e8f0;
    }
    .h-100 {
        height: 100%!important;
    }
    .shadow-none {
        box-shadow: none!important;
    }
</style>

