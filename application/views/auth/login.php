<!DOCTYPE html>
<html lang="en">

<head>
    <script src="<?= base_url('assets/downloaded/pace.min.js') ?>"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <title>Login </title>
    <!-- CSS -->
    <link href="<?= base_url() ?>/assets\vendors\material-icons\material-icons.css" rel="stylesheet" type="text/css">
    <link href="<?= base_url() ?>/assets\vendors\linea-icons\styles.css" rel="stylesheet" type="text/css">
    <link href="<?= base_url() ?>/assets\vendors\mono-social-icons\monosocialiconsfont.css" rel="stylesheet" type="text/css">
    <link href="<?= base_url() ?>/assets\vendors\feather-icons\feather.css" rel="stylesheet" type="text/css">
    <link href="<?= base_url('assets/sweetalert/swal.css') ?>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,900,900i" rel="stylesheet" type="text/css">
    <link href="<?= base_url() ?>/assets\css\style.css" rel="stylesheet" type="text/css">
    <script src="<?= base_url('assets/downloaded/jquery.min.js') ?>"></script>
</head>

<body class="body-bg-full profile-page">
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
	<style>
        .login-left {
            background: url('<?= base_url("assets/img/school.jpg") ?>');
            background-size: cover;
            background-position: center;
        }
    	@media(max-width:1000px) {
        	#bigOne {
            	display:none;
        	}
    	}
	</style>
    <div id="wrapper" class="row wrapper">
        <div class="row container-min-full-height">
            <div class="col-lg-8 col-md-4 p-3 login-left" id="bigOne">
                <div class="w-50"></div>
            </div>
            <div class="col-lg-4 col-md-12 login-right d-lg-flex pos-fixed pos-right text-inverse container-min-full-height" style="background-color:#2C9DE5">
                <div class="login-content px-3 w-75 text-center">
                    <img src="<?php echo base_url('assets/img/logo.png'); ?>" width="40%"/>
                    <p class="heading-font-family fw-300 letter-spacing-minus pd-b-30">COMPUTER APTITUDE TEST</p>

                    <form class="text-center" action="<?= site_url('Auth/login') ?>" method="POST">
					<div class="form-group">
						<input type="text" placeholder="Username" class="form-control form-control-line" name="username">
					</div>
					<div class="form-group">
						<input type="password" placeholder="Password" class="form-control form-control-line" name="password" value="">
					</div>
					<div class="form-group mr-b-20">
						<button class="btn btn-block btn-md btn-success text-uppercase fw-600 ripple" type="submit">Masuk <i class="feather feather-log-in"></i></button>
					</div>
					
                    </form>
                    <!-- /form -->
                </div>
                <!-- /.login-content -->
            </div>
            <!-- /.login-right -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.body-container -->
    <!-- Scripts -->
    <script src="<?= base_url('assets/sweetalert/swal.min.js') ?>"></script>
    <script src="<?= base_url() ?>/assets\js\bootstrap.bundle.min.js"></script>
    <script src="<?= base_url() ?>/assets\js\material-design.js"></script>
</body>

</html>