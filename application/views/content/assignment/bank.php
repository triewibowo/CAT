<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
      <h6 class="page-title-heading mr-0 mr-r-5">Tambah Soal</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">Bank Soal</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
 <div class="widget-holder widget-full-height col-md-12">
    <div class="widget-bg">
        <div class="widget-body">
            <div class="row">
                <div class="col-sm-4">
                    <div class="input-group">
                        <select id="isub" class="form-control">
                            <option value="null">Pilih subtest</option>
                            <?php
                                foreach ($msSubtest as $s) {
                                    if ($s->id_sub == $sub) {
                                        $sl = 'selected';
                                    } else {
                                        $sl = '';
                                    }
                                    echo "<option value='$s->id_sub' $sl>$s->sub_name</option>";
                                }
                            ?>
                        </select>
                        <div class="input-group-addon"><i class="feather feather-filter"></i></div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="input-group">
                        <label for="startDate" class="sr-only">Start Date:</label>
                        <input type="date" id="startDate" class="form-control" placeholder="Start Date">
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="input-group">
                        <label for="endDate" class="sr-only">End Date:</label>
                        <input type="date" id="endDate" class="form-control" placeholder="End Date">
                    </div>
                </div>
                <div class="col-sm pt-2">
                    <a href="#" class="float-left" id="resetFilter">
                        Reset
                    </a>
                </div>
                <div class="col-sm-2">
                    <a href="#" class="btn btn-info btn-sm float-right" onclick="applyFilter()"><i class="feather feather-filter"></i>  Terapkan Filter</a>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm">
                    <a href="<?= site_url('page/create_question_type') ?>" class="btn btn-success btn-sm float-right"><i class="feather feather-plus"></i> Create</a>
                </div>
            </div>
            <table class="table table-striped table-responsive" data-toggle="datatables">
                <thead class="bg-primary-gradient">
                    <tr>
                        <th style="width:5%">#</th>
                        <th style="width:10%">Pelajaran</th>
                        <th>Pertanyaan</th>
                        <th style="width:15%">Subtes</th>
                        <th style="width:10%; text-align:center">Jenis</th>
                        <th style="width:10%; text-align:center">Dibuat</th>
                        <th style="width:10%; text-align:center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($dataQuestion as $row => $value): ?>
                        <tr>
                            <td><?= $row + 1 ?></td>
                            <td><?= ($value->lesson) ? $value->lesson->lesson_name : '' ?></td>
                            <td><?= $value->question_ ?></td>
                            <td><?= ($value->subtest) ? $value->subtest->sub_name : '' ?></td>
                            <td align=center><?= ($value->type) ? $value->type->type_name : '' ?></td>
                            <td align=center><?= date('d-M-Y', strtotime($value->question_created)) ?></td>
                            <td align=center>
                                <a title="Edit Soal" href="<?= site_url('page/edit_question/'.$value->id_question.'/'.$value->id_type) ?>" class="btn btn-success btn-sm"><i class="feather feather-eye"></i></a>
                                <a title="Hapus Ujian" href="#delete<?= $row ?>" data-toggle="modal" class="btn btn-danger btn-sm"><i class="feather feather-trash"></i></a>
                            </td>
                        </tr>
                        <!-- MODAL DELETE -->
                        <div class="modal modal-danger fade" id="delete<?= $row ?>">
                            <div class="modal-dialog modal-md">
                                <div class="modal-content">
                                    <div class="modal-header text-inverse">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Anda yakin ingin menghapus data ini?</h4>
                                    </div>
                                    <div class="modal-footer" style="padding:10px">
                                        <a href="<?= site_url('AssignmentCtrl/deleteQuestion/'.$value->id_question) ?>" class="btn btn-outline-danger btn-block"><i class="feather feather-check-square"></i> Ya, Hapus data ini!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endforeach ?>
                                       
                </tbody>
            </table>
        </div>
        <!-- /.widget-body -->
    </div>
    <!-- /.widget-bg -->
</div>
</div>

<script>
	 function applyFilter() {
        const isubValue = document.getElementById('isub').value;
        const startDateValue = document.getElementById('startDate').value;
        const endDateValue = document.getElementById('endDate').value;

        // Modify this function based on your requirements
        // For example, redirect to the filtered URL
        window.location = `<?=base_url('page/bank')?>/?isub=${isubValue}&start_date=${startDateValue}&end_date=${endDateValue}`;
    }

     // Tangani klik pada tombol reset
     $('#resetFilter').on('click', function (event) {
        event.preventDefault();

        // Reset nilai tanggal ke null
        $('#startDate, #endDate').val('');

        // Reset nilai isub ke default (misalnya, 'null')
        $('#isub').val('null');

        // Tambahkan logika lain untuk mereset nilai filter yang lain jika diperlukan

        // Simpan atau terapkan logika reset lainnya di sini
        applyFilter();
    });
</script>