<div class="row">
    <div class="col-sm-3 col-sm-offset-4">
        <div class="panel panel-info">
            <div class="panel-body">
                <form action="<?= site_url('exam/change_password') ?>" method="POST">
                    <input type="hidden" name="id_student" value="<?= $this->session->userdata('globalStudent')->id_student ?>">
                    <div class="form-group">
                        <label>Password Lama</label>
                        <input type="password" name="old_password" required class="form-control" placeholder="Password Lama">
                    </div>
                    <div class="form-group">
                        <label>Password Baru</label>
                        <input type="password" name="student_password" required class="form-control" placeholder="Password Baru">
                    </div>
                    <button type="submit" onclick="return confirm('Apa anda yakin ?')" class="btn btn-primary btn-block">Simpan!</button>
                </form>
            </div>
        </div><!-- / Panel -->
    </div><!-- / Col -->
</div><!-- / Row -->