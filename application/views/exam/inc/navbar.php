<div class="x-hnavigation" style="background-color:#337ab7; color:white">
    <div class="x-hnavigation-logo">
        <center>
            <h3 style="margin-top:30px; color:white">COMPUTER APTITUDE TEST</h3>
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
                <?php if ($this->session->userdata('globalStudent')->student_photo): ?>
                    <img src="<?= base_url('assets/images/students/'.$this->session->userdata('globalStudent')->student_photo) ?>">
                <?php else:?>
                    <img src="<?php echo base_url() ?>assets/images/icon-user.png">
                <?php endif; ?>
                <ul class="xn-drop-left animated zoomIn">
                    <li><a href="<?= site_url('exam/profil') ?>" data-toggle="modal"><span class="fa fa-user"></span> Profil</a></li>
                    <li><a href="<?= site_url('exam/change_password') ?>" data-toggle="modal"><span class="fa fa-lock"></span> Ubah Password</a></li>
                    <li><a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span> Keluar</a></li>
                </ul>
            </div>
        </div>
    </div>                        
</div>
