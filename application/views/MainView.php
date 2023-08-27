<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <title><?= $title ?></title>
    <!-- CSS -->
    <link href="<?= base_url() ?>/assets\vendors\material-icons\material-icons.css" rel="stylesheet" type="text/css">
    <link href="<?= base_url() ?>/assets\vendors\feather-icons\feather.css" rel="stylesheet" type="text/css">
    <link href="<?= base_url() ?>/assets\css\style.css" rel="stylesheet" type="text/css">
    <link href="<?= base_url('assets/datatables/datatables.min.css') ?>" rel="stylesheet" type="text/css">
    <link href="<?= base_url('assets/sweetalert/swal.css') ?>" rel="stylesheet" type="text/css">
    <link href="<?= base_url('assets/switchery/switchery.min.css') ?>" rel="stylesheet" type="text/css">
    <link href="<?= base_url('assets/mediaelement/mmp.min.css') ?>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="<?= base_url('assets/fancy/jquery.fancybox.min.css') ?>">
    <link href="<?= base_url('vendor/select2/select2/dist/css/select2.min.css') ?>" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?= base_url('assets/jquery-ui-1.12.1/jquery-ui.min.css') ?>">
    <script src="<?= base_url('assets/bootstrap-wysihtml5-0.0.2/libs/js/wysihtml5-0.3.0_rc2.js') ?>"></script>
    <script data-pace-options='{ "ajax": false }' src="<?= base_url('assets/downloaded/pace.min.js') ?>"></script>
    <script src="<?= base_url('assets/downloaded/jquery.min.js') ?>"></script>
    <script src="<?= base_url('assets/tinymce/js/jquery.tinymce.min.js') ?>"></script>
    <script src="<?= base_url('assets/tinymce/js/tinymce.min.js') ?>"></script>
    <style type="text/css">
        .imagePreview {
            width: 100%;
            height: 300px;
            margin-top:10px;    
            margin-right:50px;
            background-position: center center;
            background-size: cover;
            box-shadow : 0px 1px 2px 0px black;
            -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
            -moz-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
            display: inline-block;
        }
        .form-group {
            margin-bottom: 5px;
        }
    </style>
</head>

<body class="header-dark sidebar-light sidebar-expand">
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
    <div id="wrapper" class="wrapper">
        <!-- HEADER & TOP NAVIGATION -->
        <?php $this->load->view($navbar); ?> 
        <!-- /.navbar -->
        <div class="content-wrapper">
            <!-- SIDEBAR -->
            <?php $this->load->view($sidebar); ?>
            <!-- /.site-sidebar -->
            <main class="main-wrapper clearfix" style="padding:10px">
                <?php $this->load->view($content); ?>
            </main>
        </div><!-- /.content-wrapper -->
        <!-- FOOTER -->
        <footer class="footer"><span class="heading-font-family">Copyright @ <?= date('Y') ?>. All rights reserved</span>
        </footer>
    </div> <!--/ #wrapper -->
    <!-- Scripts -->
    <script src="<?= base_url('vendor/select2/select2/dist/js/select2.min.js') ?>"></script>
    <script src="<?= base_url('assets/jquery-ui-1.12.1/jquery-ui.min.js') ?>"></script>
    <script src="<?= base_url('assets/downloaded/popper.min.js') ?>"></script>
    <script src="<?= base_url() ?>/assets\js\bootstrap.min.js"></script>
    <script src="<?= base_url('assets/downloaded/jquery.magnific-popup.min.js') ?>"></script>
    <script src="<?= base_url('assets/downloaded/metisMenu.min.js') ?>"></script>
    <script src="<?= base_url('assets/downloaded/perfect-scrollbar.jquery.js') ?>"></script>
    <script src="<?= base_url() ?>/assets\vendors\theme-widgets\widgets.js"></script>
    <script src="<?= base_url('assets/datatables/datatables.min.js') ?>"></script>
    <script src="<?= base_url('assets/sweetalert/swal.min.js') ?>"></script>
    <script src="<?= base_url('assets/switchery/switchery.min.js') ?>"></script>
    <script src="<?= base_url() ?>/assets\js\theme.js"></script>
    <script src="<?= base_url() ?>/assets\js\custom.js"></script>
    <script type="text/javascript" src="<?= base_url('assets/fancy/jquery.fancybox.min.js') ?>"></script>
    <script src="<?= base_url('assets/bootstrap-wysihtml5-0.0.2/bootstrap-wysihtml5-0.0.2.min.js') ?>" type="text/javascript"></script>
    <script type="text/javascript">
        $("#textarea-blank").wysihtml5({
            "font-styles": false, // Font styling, e.g. h1, h2, etc.
            "emphasis": false, // Italics, bold, etc.
            "lists": false, // (Un)ordered lists, e.g. Bullets, Numbers.
            "html": false, // Button which allows you to edit the generated HTML.
            "link": false, // Button to insert a link.
            "image": false, // Button to insert an image.
            "color": false, // Button to change color of font
            "blockquote": false, // Blockquote
        });
        $("#datapicker").datepicker({
            dateFormat : 'yy-mm-dd'
        });
        $("#datapicker2").datepicker({
            dateFormat : 'yy-mm-dd'
        });
        $(document).ready(function() {
            $('.select2').select2();
        });
    </script>
</body>

</html>
