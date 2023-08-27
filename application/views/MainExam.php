<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title><?= $title ?></title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- <link rel="icon" href="favicon.ico" type="image/x-icon"> -->
        <!-- END META SECTION -->
        
        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="<?= base_url('exam-assets/css/theme-default.css') ?>">
        <link href="<?= base_url('assets/mediaelement/mmp.min.css') ?>" rel="stylesheet" type="text/css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mediaelement/4.1.3/mediaelementplayer.min.css" rel="stylesheet" type="text/css">
        <link href="<?= base_url('assets/sweetalert/swal.css') ?>" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="<?= base_url('exam-assets') ?>/js\plugins\jquery\jquery.min.js"></script>
        <script src="<?= base_url('assets/countdown/js/jquery.plugin.min.js') ?>"></script>
        <script src="<?= base_url('assets/countdown/js/jquery.countdown.js') ?>"></script>

        <!-- EOF CSS INCLUDE -->                           
        <style type="text/css">
            .myContainer {
                width: 100%;
                margin-top: 80px;
                background-color: #F3EEEE;
                min-height: 400px;
                padding: 10px 50px;
            }
        </style>
    </head>
    <body class="x-dashboard">
        <script type="text/javascript">
            // $(function(){
            //     setTimeout(function(){
            //         $("#messageTimeout").hide(200);
            //     },4000);
            // });
        </script>
        <!-- <?php if ($this->session->flashdata('text')): ?>
            <div class="alert alert-<?= $this->session->flashdata('type'); ?>" style="border-radius:0px" id="messageTimeout">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <center><strong><?= $this->session->flashdata('title'); ?></strong> <?= $this->session->flashdata('text'); ?></center>
            </div>
        <?php endif ?> -->
        <script type="text/javascript">
            $(function(){
                var title = '<?= $this->session->flashdata("title") ?>';
                var text = '<?= $this->session->flashdata("text") ?>';
                var type = '<?= $this->session->flashdata("type") ?>';
                if (title) {
                    swal({
                      title: title,
                      text: text,
                      type: type,
                      button: true,
                    });
                };
            });
        </script>
        <!-- START PAGE CONTAINER -->
        <div class="page-container">            
            <!-- PAGE CONTENT -->
            <div class="page-content" style="background:#F3EEEE;">
                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">
                    
                    <!-- NAVBAR -->
                    <?php $this->load->view($navbar); ?>
                    <!-- END NAVBAR -->
                   
                    <div class="">
                    
                        <div class="myContainer">
                            <?php $this->load->view($content); ?>
                        </div>

                    </div>
                    <div class="x-content-footer" style="color:black;background-color:white">
                        Copyright © <?= date('Y') ?>. All rights reserved.
			<a target="_blank" href="https://alamkoding.blogspot.com">
			Blog
			</a>
|			
<a target="_blank" href="https://www.youtube.com/channel/UC5mdwFaMt42KXVH6Vi-e5iA">
			Youtube
			</a>
                    </div>
                </div>
                <!-- END PAGE CONTENT WRAPPER -->                                
            </div>            
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->

        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Keluar <strong>Aplikasi</strong> ?</div>
                    <div class="mb-content">
                        <p>Apa anda yakin ingin keluar dari aplikasi?</p>                    
                        <p>Pencet tombol tidak jika untuk membatalkan proses ini.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="<?= site_url('exam/logout') ?>" class="btn btn-success btn-lg">Ya</a>
                            <button class="btn btn-default btn-lg mb-control-close">Tidak</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MESSAGE BOX-->


        <script type="text/javascript" src="<?= base_url('exam-assets') ?>/js\plugins\jquery\jquery-ui.min.js"></script>
        <script type="text/javascript" src="<?= base_url('exam-assets') ?>/js\plugins\bootstrap\bootstrap.min.js"></script>
        <script type="text/javascript" src="<?= base_url('exam-assets') ?>/js\plugins\datatables\jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="<?= base_url('exam-assets') ?>/js\plugins.js"></script>        
        <script type="text/javascript" src="<?= base_url('exam-assets') ?>/js\actions.js"></script>
        <script src="<?= base_url('assets/sweetalert/swal.min.js') ?>"></script>
        <script src="<?= base_url('assets/mediaelement/mmp.min.js') ?>"></script>
    </body>
</html>






