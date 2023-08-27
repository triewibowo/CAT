<div class="x-hnavigation">
    <div class="x-hnavigation-logo">
        <center>
            <h3 style="margin-top:30px">Ujian Online</h3>
        </center>
    </div>
    <ul>
        <li class="">
            <a href="<?= site_url('exam/lists') ?>">List Ujian</a>
        </li>
        <li class="">
            <a href="<?= site_url('exam/history') ?>">Riwayat Ujian</a>
        </li>                
    </ul>
    
    <div class="x-features">
        <div class="x-features-nav-open">
            <span class="fa fa-bars"></span>
        </div>
        <div class="pull-right">
            <div class="x-features-profile">
                <img src="<?= base_url('assets/images/students/'.$this->session->userdata('globalStudent')->student_photo) ?>">
                <ul class="xn-drop-left animated zoomIn">
                    <li><a href="<?= site_url('exam/change_password') ?>" data-toggle="modal"><span class="fa fa-lock"></span> Ubah Password</a></li>
                    <li><a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span> Keluar</a></li>
                </ul>
            </div>
        </div>
    </div>                        
</div>
