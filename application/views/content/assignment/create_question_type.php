<script type="text/javascript">
    $(function(){
        $("#question_image").on("change", function() {
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
<div class="row page-title clearfix" style="margin-top:-10px">

    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/assignments') ?>">List Ujian</a></li></li>
            <li class="breadcrumb-item active">Jenis Pertanyaan</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
                <h6>Pilih Jenis Pertanyaan : </h6>
           <style>
    .button-container {
        display: flex;
        flex-wrap: wrap;
        gap: 10px; /* Jarak antar tombol */
    }
</style>

<div class="button-container">
   
    <?php
    $availableColors = ['primary', 'secondary', 'success', 'danger', 'warning', 'info'];
    $usedColors = [];

    foreach ($dataType as $row => $value) {
        $randomIndex = array_rand($availableColors);
        $randomColor = $availableColors[$randomIndex];
        ?>
         <div class="dropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   <?php echo $value->type_name; ?>
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
   <?php
   echo '<a href="' . site_url('page/create_question_var/' . $value->id_type) . '" ><i class="feather feather-plus"></i> Buat Soal</a>';

   ?>
    <a href="<?php echo base_url().'page/download_temp?type=' . $value->id_type ?>" class="dropdown-item btn btn-success btn-xs">
        <i class="feather feather-arrow-down"></i> Download Template
    </a>
    <form id="uploadForm" method="post" enctype="multipart/form-data" action="<?php echo site_url('AssignmentCtrl/import_excel'); ?>">
        <input type='file' name="userfile" accept=".xlsx, .xls" style="display:none">
        <button class="dropdown-item btn btn-info btn-xs" onclick="document.getElementsByName('userfile')[0].click(); return false;">
            <i class="feather feather-arrow-down"></i> Upload Soal
        </button>
    </form>
    </div>
</div>

<?php
        // Tambahkan warna ke tombol dan hapus dari daftar availableColors


        // Simpan warna yang telah digunakan
        $usedColors[] = $randomColor;

        // Hapus warna yang sudah digunakan dari daftar availableColors
        unset($availableColors[$randomIndex]);

        // Reset kembali kunci array setelah menghapus elemen
        $availableColors = array_values($availableColors);
    }

    // Kembalikan warna yang sudah digunakan ke daftar availableColors
    $availableColors = array_merge($availableColors, $usedColors);
    ?>
</div>

            </div><!-- / BODY -->
        </div><!-- / BG -->
    </div>
</div>

<script>
    document.getElementsByName('userfile')[0].addEventListener('change', function() {
        document.getElementById('uploadForm').submit();
    });
</script>
