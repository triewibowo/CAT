<!-- Page Title Area -->
<form action="<?= site_url('AssignmentCtrl/create') ?>" method="POST">
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <!-- <h6 class="page-title-heading mr-0 mr-r-5">Buat Soal</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p> -->
        <div class="row">
            <div class="col-sm-3">
                <a href="#save" data-toggle="modal" class="btn btn-info btn-sm"><i class="feather feather-check-square"></i>&nbsp; Simpan!</a>
                <!-- <a href="#classes_kat" data-toggle="modal" class="btn btn-Primary btn-sm"><i class="feather feather-home"></i>&nbsp; Kategori</a> -->
                <!-- <a href="#classes" data-toggle="modal" class="btn btn-success btn-sm"><i class="feather feather-home"></i>&nbsp; Subtes</a> -->
            </div>
            <div class="col-sm-3">
                <!-- <label class="d-flex flex-md-row flex-column align-items-center cursor-pointer">
                    <input type="checkbox" name="show_report" class="js-switch" data-color="#8253eb" data-size="small">
                    <span class="text-muted mr-l-20 d-inline-block">Tampilkan Hasil</span>
                </label> -->
            </div>
            <div class="col-sm-3">
                <!-- <label class="d-flex flex-md-row flex-column align-items-center cursor-pointer">
                    <input type="checkbox" name="show_analytic" class="js-switch" data-color="#8253eb" data-size="small">
                    <span class="text-muted mr-l-20 d-inline-block">Analisis Soal</span>
                </label> -->
            </div>
            <div class="col-sm-3">
                <label class="d-flex flex-md-row flex-column align-items-center cursor-pointer">
                    <input type="checkbox" name="public" id="public" class="js-switch" data-color="#8253eb" data-size="small">
                    <span class="text-muted mr-l-20 d-inline-block">Seluruh Siswa</span>
                </label>
            </div>
        </div><!-- / Row -->
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item"><a href="<?= site_url('page/assignments') ?>">List Ujian</a></li>
            <li class="breadcrumb-item active">Buat Ujian</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
    <div class="widget-holder widget-full-height col-md-12">
        <div class="widget-bg">
            <div class="widget-body">
                <!-- FOR FORM BEFORE -->
                    <div class="row">
                        <div class="col-sm-4 mb-2">
                            <a href="#classes_kat" data-toggle="modal" class="btn btn-outline-primary btn-block"><i class="feather feather-home"></i>&nbsp; Pilih Kategori</a>
                        </div>
                        <div class="col-sm-4 mb-2">
                        <a href="#classes" data-toggle="modal" class="btn btn-outline-success btn-block group_siswa"><i class="feather feather-users"></i>&nbsp; Pilih Group Siswa</a>
                        </div>
                        <div class="col-sm-4">
                            <!-- <h5 class="mt-2 float-right text-primary"><i class="feather feather-clock"></i>&nbsp; Durasi Tes <b>0 Menit</b></p> -->
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>Nama Tes</label>
                                <input type="text" class="form-control" name="assignment_name" required >
                            </div>
                            <!-- <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Tipe Ujian</label>
                                        <input type="text" class="form-control" name="assignment_type" required placeholder="ex: UTS / UAS">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Urutkan Soal</label>
                                        <?php $order = [['val'=>'asc','name'=>'Urutkan Terlama'],['val'=>'desc','name'=>'Urutkan Terbaru'],['val'=>'random','name'=>'Acak Soal']] ?>
                                        <select class="form-control" name="assignment_order">
                                            <?php foreach ($order as $vOrder): ?>
                                                <option value="<?= $vOrder['val'] ?>"><?= $vOrder['name'] ?></option>
                                            <?php endforeach ?>
                                        </select>
                                    </div>
                                </div>
                            </div>/ Row -->
                        </div>
                        <div class="col-sm-4">
                            <!-- <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Nilai KKM</label>
                                        <input type="number" class="form-control" name="assignment_kkm" required placeholder="ex: 50">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Durasi Ujian (menit)</label>
                                        <input type="number" class="form-control" name="assignment_duration" required placeholder="Durasi Ujian (menit)">
                                    </div>
                                </div>
                            </div>/ Row -->
                            <div class="form-group">
                                <label>Penulis Ujian</label>
                                <input type="text" class="form-control" name="assignment_author" required placeholder="Penulis Ujian">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label>Tipe Ujian</label>
                                <input type="text" class="form-control" name="assignment_type" required placeholder="ex: UTS / UAS">
                            </div>
                        </div>
                        <!-- <div class="col-sm-3">
                            <div class="form-group">
                                <label>Password Ujian</label>
                                <input type="text" class="form-control" name="password" required placeholder="Password">
                            </div>
                        </div> -->
                        <!-- <div class="col-sm-6">
                            <p id="selectedClasses"></p>
                        </div> -->
                    </div><!-- / Row -->
                    <!-- MODAL CLASSES --> 
                    <div class="modal fade modal-success" id="classes">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title text-inverse">Pilih Kelas</h4>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width:5%">#</th>
                                                <th>Nama Kelas</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($dataClasses as $vClass): ?>
                                                <tr>
                                                    <td>
                                                    <input type="checkbox" class="classCheckbox" data-id="<?= $vClass->id_class ?>" data-name="<?= $vClass->class_name ?>" name="id_class[]" value="<?= $vClass->id_class ?>">
                                                    </td>
                                                    <td><?= $vClass->class_name ?></td>
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
                    </div>

                     <!-- MODAL CLASSES KATEGORI --> 
                     <div class="modal fade modal-success" id="classes_kat">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title text-inverse">Pilih Kategori</h4>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width:5%">#</th>
                                                <th colspan=4>Nama Kategori</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($dataCategories as $key => $category): ?>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" name="category[<?= $category->id_cat ?>][id]" class="category-checkbox" data-id="<?= $category->id_cat ?>" data-name="<?= $category->cat_name ?>" value="<?= $category->id_cat ?>" onchange="categoryView(this)">
                                                    </td>
                                                    <td colspan=4>
                                                        <label><?= $category->cat_name ?></label><br>
                                                        <small id="error-message-cat" style="color:red"></small>
                                                    </td>
                                                    <td>
                                                        <input type="number" class="form-control" name="category[<?= $category->id_cat ?>][order]" placeholder="Urutan" disabled style="height:35px;" id="catInput" onchange="categoryView(this)">
                                                    </td>
                                                </tr>
                                                <?php foreach ($category->subtest as $kc => $subcategory): ?>
                                                    <?php if ($subcategory->id_cat == $category->id_cat): ?>
                                                        <tr class="subcategory subcategory-<?= $category->id_cat ?>" style="display: none;">
                                                            <td></td>
                                                            <td>
                                                                <input type="checkbox" name="category[<?= $category->id_cat ?>][sub][<?= $kc ?>][id]" class="subcategory-checkbox" data-id="<?= $subcategory->id_sub ?>"  data-name="<?= $subcategory->sub_name ?>" value="<?= $subcategory->id_sub ?>" onchange="categoryView(this)">
                                                            </td>
                                                            <td width="45%">
                                                                <small><?= $subcategory->sub_name ?></small><br>
                                                                <small>* Soal yang tersedia berjmlah <?= $subcategory->question ?></small><br>
                                                                <small id="error-message" style="color:red"></small>
                                                            </td>
                                                            <td>
                                                                <input type="number" class="form-control" name="category[<?= $category->id_cat ?>][sub][<?= $kc ?>][order]" placeholder="Urutan" disabled style="height:35px;" onchange="categoryView(this)" id="subInput">
                                                            </td>
                                                            <td>
                                                            <input type="number" class="form-control" name="category[<?= $category->id_cat ?>][sub][<?= $kc ?>][question_qty]" placeholder="Jumlah" disabled style="height:35px;" onchange="categoryView(this)" id="subQtyInput">
                                                            </td>
                                                            <td>
                                                                <input type="number" class="form-control" name="category[<?= $category->id_cat ?>][sub][<?= $kc ?>][timer]" placeholder="Waktu" disabled style="height:35px;" onchange="categoryView(this)" id="subInput">
                                                            </td>
                                                        </tr>
                                                    <?php endif; ?>
                                                <?php endforeach; ?>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-success btn-block" data-dismiss="modal">Simpan!</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- MODAL SAVE -->
                    <div class="modal fade modal-info" id="save">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title text-inverse">Apa anda sudah yakin dengan data ini ?</h4>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-outline-info btn-block">Ya, Simpan dan lanjutkan!</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div><!-- /.widget-body -->
        </div><!-- /.widget-bg -->
    </div>
</div>

<script>
  $(document).ready(function () {
        // Ketika checkbox kategori diubah
        $('.category-checkbox').change(function () {
            var categoryId = $(this).data('id');
            var subcategoryRows = $('.subcategory.subcategory-' + categoryId);
            var inputFields = $(this).closest('tr').find('input[type="number"]');

            if ($(this).is(':checked')) {
                subcategoryRows.show();
            } else {
                subcategoryRows.hide();
            }
        });

        // Ketika checkbox subcategory diubah
        $('.category-checkbox').change(function() {
            var isChecked = $(this).is(':checked');
            var inputFields = $(this).closest('tr').find('input[type="number"]');
            console.log(isChecked)
            if (isChecked) {
                inputFields.prop('disabled', false);
            } else {
                inputFields.prop('disabled', true);
            }
        });

        // Ketika checkbox subcategory diubah
        $('.subcategory-checkbox').change(function() {
            var isChecked = $(this).is(':checked');
            var inputFields = $(this).closest('tr').find('input[type="number"]');

            if (isChecked) {
                inputFields.prop('disabled', false);
            } else {
                inputFields.prop('disabled', true);
            }
        });

        // Tambahkan event listener pada perubahan checkbox
        $('input[name="public"]').change(function() {
            if ($(this).is(':checked')) {
                // Checkbox dicentang, maka sembunyikan elemen dengan class group_siswa
                $('.group_siswa').css('display', 'none');
            } else {
                // Checkbox tidak dicentang, maka tampilkan elemen dengan class group_siswa
                $('.group_siswa').css('display', 'block');
            }
        });

        // Ketika checkbox berubah (dicentang atau tidak dicentang)
        $('.classCheckbox').change(function() {
            // Inisialisasi array untuk menyimpan kelas yang dipilih
            var selectedClasses = [];

            // Loop melalui semua checkbox dengan class .classCheckbox
            $('.classCheckbox:checked').each(function() {
                // Menambahkan nilai dari checkbox yang dicentang ke dalam array
                selectedClasses.push($(this).data('name'));
            });

            // Menampilkan kelas yang dipilih dalam elemen <p>
            $('#selectedClasses').text(selectedClasses.join(', '));
        });

    });

    function categoryView(data) {
        // Dapatkan nilai checkbox yang berubah
        // var category = [];
        // var categoryValue = '';
        // var map = data.name;

        // var inputString = "category[3][id]";
        // var parts = inputString.split('[');
        // if (parts.length >= 2) {
        //     categoryValue = parts[0] + '[' + parts[1];
        // } else {
        //     console.log("Tidak dapat memisahkan string.");
        // }

        // var idValue = map.split("[")[2].split("]")[0];

        // var value = data.value
        
        // eval(categoryValue + " =" + );
        // console.log(category);
    }
</script>

<script>
    $(document).ready(function () {
        $('#subQtyInput').on('input', function () {
            validateInputJumlah($(this));
        });
    });
    
    $(document).ready(function () {
        $('#subInput').on('input', function () {
            validateInput($(this));
        });
    });

    $(document).ready(function () {
        $('#catInput').on('input', function () {
            validateInputCat($(this));
        });
    });

    function validateInputJumlah(input) {
        var value = input.val();
        var isValid = /^\d+$/.test(value); // Memastikan hanya angka yang diizinkan

        if (!isValid) {
            $('#error-message').html('Masukkan angka saja.');
            input[0].setCustomValidity('Invalid input');
        } else {
        $('#error-message').html('');
        input[0].setCustomValidity('');
        }

        // Memastikan nilai tidak melebihi batas maksimum
        if (value > <?= $subcategory->question ?>) {
            $('#error-message').html('Nilai maksimum adalah <?= $subcategory->question ?>.');
            input[0].setCustomValidity('Invalid input');
        }
    }

    function validateInput(input) {
        var value = input.val();
        var isValid = /^\d+$/.test(value); // Memastikan hanya angka yang diizinkan

        if (!isValid) {
            $('#error-message').html('Masukkan angka saja.');
            input[0].setCustomValidity('Invalid input');
        } else {
        $('#error-message').html('');
        input[0].setCustomValidity('');
        }

        // Memastikan nilai tidak melebihi batas maksimum
        if (value > <?= $subcategory->question ?>) {
            $('#error-message').html('Nilai maksimum adalah <?= $subcategory->question ?>.');
            input[0].setCustomValidity('Invalid input');
        }
    }

    function validateInputCat(input) {
        var value = input.val();
        var isValid = /^\d+$/.test(value); // Memastikan hanya angka yang diizinkan

        if (!isValid) {
            $('#error-message-cat').html('Masukkan angka saja.');
            input[0].setCustomValidity('Invalid input');
        } else {
        $('#error-message-cat').html('');
        input[0].setCustomValidity('');
        }

        // Memastikan nilai tidak melebihi batas maksimum
        if (value > <?= $subcategory->question ?>) {
            $('#error-message-cat').html('Nilai maksimum adalah <?= $subcategory->question ?>.');
            input[0].setCustomValidity('Invalid input');
        }
    }
    </script>

<style>
  .subcategory {
    display: none;
  }
  .group_siswa {
        display: block; /* Tetapkan tampilan default jika checkbox tidak dicentang */
    }
</style>