<!-- Page Title Area -->
<!-- <form action="<?= site_url('AssignmentCtrl/create') ?>" method="POST"> -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <!-- <h6 class="page-title-heading mr-0 mr-r-5">Buat Soal</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p> -->
        <div class="row">
            <div class="col-sm-3">
                <a href="#save" data-toggle="modal"  class="btn btn-info btn-sm"><i class="feather feather-check-square"></i>&nbsp; Simpan!</a>
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
                <div id="formContainer" class="row mb-2">
                <!-- Form elements will be generated here -->
                </div>

                <div class="tab row" style="margin: 0 0">
                    <button class="tablinks col-6" id="kategoriTab"><b>Kategori</b></button>
                    <button class="tablinks col-6" id="classTab"><b>Kelas</b></button>
                </div>

                <div id="kategori" class="tabcontent">
                    <div class="row mb-1">
                        <div class="form-group col-6">
                            <label for="classTest">Kategori Ujian</label>
                        </div>
                        <div class="col-6">
                            <button class="btn btn-primary btn-sm float-right" id="addLeftRowBtn">Tambah Kategori</button>
                        </div>
                    </div>
                    <table class="table table-bordered table-striped table-responsive" id="kategoriTest">
                        <thead>
                            <tr>
                                <th width=5% style="text-align:center">No</th>
                                <th>Nama Kategori</th>
                                <th width=5% style="text-align:center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>

                <div id="class" class="tabcontent">
                    <div class="row mb-1">
                        <div class="form-group col-6">
                            <label for="classTest">Kelas</label>
                        </div>
                        <div class="col-6">
                            <button class="btn btn-primary btn-sm float-right" id="addRightRowBtn">Tambah kelas</button>
                            <label class="d-flex flex-md-row flex-column align-items-center cursor-pointer float-right mr-3 pt-1">
                                <input type="checkbox" name="public" id="public" class="js-switch" data-color="#8253eb" data-size="small">
                                <span class="text-muted mr-l-20 d-inline-block">Seluruh Siswa</span>
                            </label>
                        </div>
                    </div>
                    <table class="table table-bordered table-striped table-responsive" id="classTest">
                        <thead>
                            <tr>
                                <th width=5% style="text-align:center">No</th>
                                <th>Nama Kelas</th>
                                <th width=5% style="text-align:center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Pilih Data</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" id="modalBody">
                                <!-- Checkbox akan ditambahkan secara dinamis di sini -->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                                <!-- <button type="button" class="btn btn-primary" id="saveDataBtn">Simpan</button> -->
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
                                <button id="submitTest" class="btn btn-outline-info btn-block">Ya, Simpan dan lanjutkan!</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- </form> -->
            </div><!-- /.widget-body -->
        </div><!-- /.widget-bg -->
    </div>
</div>

<script>
    // VARIABLE
    var	dataCategories 			= <?php echo json_encode($dataCategories); ?>;
    $(document).ready(function() {
        // Fungsi untuk menampilkan tab yang dipilih
        $('.tablinks').click(function() {
            var tabId = $(this).attr('id');
            $('.tabcontent').hide();
            $('#' + tabId.substring(0, tabId.length - 3)).show();
            $('.tablinks').removeClass('active');
            $(this).addClass('active');
        });

        // Menampilkan tab pertama secara default
        $('#kategori').show();
        $('#kategoriTab').addClass('active');
        // Create form elements using jQuery
        var formContainer = $('#formContainer');
        
        // Create input field for name
        var name            = $('<div class="form-group">')
                                .append($('<label for="name">Nama Tes</label>'))
                                .append($('<input type="text" class="form-control" name="assignment_name">'))
                                .append($('<span class="error" id="nameError"></span>'));
        var nameTesInput    = $('<div class="col-sm-4">').append(name);
        
        // Create input field for name
        var author          = $('<div class="form-group">')
                                .append($('<label for="name">Penulis Ujian</label>'))
                                .append($('<input type="text" class="form-control" name="assignment_author" required placeholder="Penulis Ujian">'))
                                .append($('<span class="error" id="nameError"></span>'));
        var authorInput     = $('<div class="col-sm-4">').append(author);
        
        // Create input field for name
        var type            = $('<div class="form-group">')
                                .append($('<label for="name">Tipe Ujian</label>'))
                                .append($('<input type="text" class="form-control" name="assignment_type" required placeholder="ex: UTS / UAS">'))
                                .append($('<span class="error" id="nameError"></span>'));
        var typeInput       = $('<div class="col-sm-4">').append(type);
        
        // Append input fields to form container
        formContainer.append(nameTesInput);
        formContainer.append(authorInput);
        formContainer.append(typeInput);

        var dataArrayInput = [];

        // Fungsi untuk membuat tabel berdasarkan data array
        function createTableCategory(dataArray) {
            var tableBody = $('#kategoriTest tbody');
            tableBody.empty(); // Kosongkan isi tbody sebelum menambahkan baris baru

            $.each(dataArray, function(index, item) {
                // Tambahkan baris baru ke dalam tabel utama
                var row = $('<tr>');
                row.append('<td align=center>' + (index + 1) + '</td>'); // Nomor urut
                row.append('<td>' + item.cat_name + '</td>'); // Nama
                row.append('<td><button class="deleteBtn">Hapus</button></td>'); // Nama
                row.append('<td class="subtestData" style="display: none;">' + JSON.stringify(item.subtest) + '</td>'); // Menyimpan data subtest sebagai string JSON
                row.attr('id', item.id_cat); // Tambahkan id dari item
                tableBody.append(row); // Tambahkan baris ke dalam tbody

                // Cek apakah ada sub-item
                if (item.subtest && item.subtest.length > 0) {
                    // Jika ada sub-item, buat daftar (list)
                    var subList = $('<ul class="sortable-list"></ul>'); // Buat daftar (list) untuk sub-item

                    // Loop untuk menambahkan sub-item ke dalam daftar
                    $.each(item.subtest, function(subIndex, subItem) {
                        var listItem = $('<li></li>'); // Buat elemen <li>
                        listItem.data('subItem', subItem); // Tambahkan objek subItem sebagai data ke elemen <li>
                        listItem.text(subItem.sub_name); // Tambahkan teks sub_name ke elemen <li>
                        subList.append(listItem); // Tambahkan item daftar ke dalam daftar
                    });

                    // Tambahkan daftar ke dalam baris utama
                    row.append($('<td colspan="2"></td>').append(subList)); // Kolom terakhir mengambil 2 kolom

                    // Aktifkan fungsi pengurutan dengan drag-and-drop menggunakan jQuery UI Sortable
                    subList.sortable({
                        axis: 'y', // Hanya mengizinkan pengurutan vertikal (per baris)
                        containment: 'parent', // Batasan area pengurutan hanya pada daftar (list) tersebut
                        cursor: 'move', // Ubah kursor menjadi ikon move saat menyeret
                        stop: function(event, ui) {
                            updateSubtestOrder(row.attr('id'), subList); // Panggil fungsi untuk memperbarui urutan data subtest
                        }
                    });
                } else {
                    // Jika tidak ada sub-item, tambahkan pesan "Tidak ada sub-item"
                    row.append('<td colspan="3">Tidak ada sub-item</td>');
                }
            });
        }

        // Panggil fungsi createTable untuk membuat tabel saat halaman dimuat
        createTableCategory(dataArrayInput);

        // Tambah baris di tabel kiri
        $('#addLeftRowBtn').click(function() {
            displayModalData(dataCategories, '#kategoriTest tbody');
        });

        // Tambah baris di tabel kanan
        $('#addRightRowBtn').click(function() {
            displayModalData(data, '#classTest tbody');
        });

        // Hapus baris
        $('#kategoriTest, #classTest').on('click', '.deleteBtn', function() {
            var deletedItemId = $(this).closest('tr').attr('id'); // Ambil nilai ID dari elemen <tr>
            $(this).closest('tr').remove();

            // Hapus item terkait dari dataArrayInput
            var index = dataArrayInput.findIndex(item => item.id_cat == deletedItemId);
           
            if (index !== -1) {
                dataArrayInput.splice(index, 1);
            }

            // Perbarui nomor urutan untuk semua baris setelah baris yang dihapus
            $('#kategoriTest tbody tr').each(function(i) {
                $(this).find('td:first').text(i + 1);
            });
        });

        // Fungsi untuk menampilkan data dalam modal dengan tabel
        function displayModalData(dataArray, targetTable) {
            $('#modalBody').empty(); // Bersihkan konten modal sebelum menambahkan data baru

            // Buat tabel
            var table = $('<table class="table table-striped table-bordered table-responsive" data-toggle="datatables"></table>');
            var thead = $('<thead></thead>');
            var tbody = $('<tbody></tbody>');

            // Tambahkan header tabel
            thead.append('<tr><th style="text-align:left">Nama</th><th width=5% style="text-align:center">Aksi</th></tr>');
            table.append(thead);

            // Tambahkan data ke dalam baris tabel
            $.each(dataArray, function(index, value) {
                // Periksa apakah value sudah ada dalam dataArrayInput
                if (dataArrayInput.findIndex(item => item.id_cat === value.id_cat) === -1) {
                    var row = $('<tr></tr>');
                    row.append('<td align=left>' + value.cat_name + '</td>'); // Nama
                    var addButton = $('<button class="addBtn">Add</button>'); // Tombol "Add"
                    addButton.click(function() {
                        // Ketika tombol "Add" ditekan, tambahkan data ke dalam targetTable
                        addDataToTable(value, targetTable);
                        // Sembunyikan modal setelah data ditambahkan
                        $('#myModal').modal('hide');
                    });
                    row.append('<td align=center></td>').find('td:last').append(addButton); // Menambahkan tombol "Add" ke dalam baris
                    tbody.append(row);
                }
            });

            table.append(tbody);
            $('#modalBody').append(table);
            $('#myModal').modal('show');
            // $('#saveDataBtn').data('targettable', targetTable); // Simpan target tabel pada tombol Simpan
        }

        // Ketika tombol Submit pada modal ditekan
        $('#submitTest').click(function() {
            console.log(dataArrayInput);
        });

        // Fungsi untuk menambahkan data ke dalam tabel
        function addDataToTable(value, targetTable) {
           // var selectedData = [];
            dataArrayInput.push(value);
            // var targetTable = $(this).data('targettable');
            // addDataToTable(selectedData, targetTable, );
            createTableCategory(dataArrayInput);
            $('#myModal').modal('hide');
        }

        // Mengaktifkan fungsi pengurutan dengan drag-and-drop menggunakan jQuery UI
        $('#kategoriTest tbody').sortable({
            axis: 'y', // Hanya mengizinkan pengurutan vertikal (per baris)
            containment: 'parent', // Batasan area pengurutan hanya pada tabel
            cursor: 'move', // Ubah kursor menjadi ikon move saat menyeret
            stop: function(event, ui) {
                updateRowNumbers();
                updateDataArray();
            }
        }).disableSelection(); // Menonaktifkan pilihan teks saat menyeret

        // Fungsi untuk memperbarui nomor urutan dalam setiap baris tabel
        function updateRowNumbers() {
            $('#kategoriTest tbody tr').each(function(index) {
                $(this).find('td:first').text(index + 1);
            });
        }

        // Fungsi untuk memperbarui urutan dataArrayInput sesuai dengan urutan baris dalam tabel
        function updateDataArray() {
            dataArrayInput = []; // Kosongkan dataArrayInput
            $('#kategoriTest tbody tr').each(function() {
                var id = $(this).attr('id');
                var name = $(this).find('td:nth-child(2)').text(); // Ambil nama dari kolom kedua
                var subtest = JSON.parse($(this).find('td.subtestData').text()); // Ambil data subtest dari elemen dengan kelas subtestData

                dataArrayInput.push({ id_cat: id, cat_name: name, subtest: subtest }); // Tambahkan data lengkap ke dataArrayInput
            });
        }

        // Fungsi untuk memperbarui urutan data subtest
        function updateSubtestOrder(categoryId, subList) {
            var newSubtestOrder = [];
            // Ambil urutan sub-item yang baru setelah diurutkan
            subList.find('li').each(function() {
                var subItemData = $(this).data('subItem'); // Ambil data subItem dari data setiap elemen <li>
                newSubtestOrder.push(subItemData); // Tambahkan objek subItem ke dalam array urutan baru
            });
            // Update posisi data subtest dalam dataArrayInput berdasarkan urutan baru
            var categoryIndex = dataArrayInput.findIndex(item => item.id_cat === categoryId);
            if (categoryIndex !== -1) {
                dataArrayInput[categoryIndex].subtest = newSubtestOrder;
            }
        }
    });
</script>

<style>
    .tab {
        overflow: hidden;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
    }

    .tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 16px;
        transition: 0.3s;
        color: #aaa;
    }

    .tab button:hover {
        background-color: #3182ce;
        color: #fff;
    }

    .tab button.active {
        background-color: #4299e1;
        color: #fff;
    }

    .tabcontent {
        display: none;
        padding: 6px 12px;
        border: 1px solid #4299e1;
        border-top: none;
    }

</style>