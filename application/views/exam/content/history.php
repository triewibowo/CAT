<style type="text/css">
	table.table tbody tr td {
		background-color: transparent !important;
	}
</style>
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">Riwayat Ujian</h3>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-hover datatable table-condensed">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nama Ujian</th>
                        <th style="text-align: center;">Tipe Ujian</th>
                        <th>Penulis</th>
                        <th style="text-align: center;">Total Soal</th>
                        <th style="text-align: center;">Total Benar</th>
                        <th style="text-align: center;">Total Salah</th>
                        <th style="text-align: center;">Score (Pts)</th>
                        <th style="text-align: center;">Status</th>
                        <th style="width:5%"></th>
                    </tr>
                </thead>
                <tbody>
                	<?php foreach ($dataAssignment as $row => $value): ?>
	                    <tr>
	                        <td><?= $row + 1 ?></td>
	                        <td><?= $value->assignment->assignment_name ?></td>
	                        <td align="center"><?= $value->assignment->assignment_type ?></td>
	                        <td><?= $value->assignment->assignment_author ?></td>
	                        <td align="center"><?= $value->total_questions ?></td>
	                        <td align="center"><i class="fa fa-check-circle" style="color:#5cb85c"></i> <?= $value->total_correct ?></td>
	                        <td align="center"><i class="fa fa-minus-circle" style="color:#d9534f"></i> <?= $value->total_false ?></td>
	                        <td align="center"><?= $value->points ?> Pts</td>
							<td align="center">
								<?php if ($value->status == 2): ?>
									<span class="badge bg-success">Success</span>
								<?php endif; ?>
							</td>
	                        <td>
								<!-- <a href="#password<?= $row ?>" data-toggle="modal" class="btn btn-primary"><i class="fa fa-pencil"></i> Ujian</a> -->
	                        </td>
	                    </tr>
                	<?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<style>
	/* Tambahkan warna latar belakang striped */
	.striped-li:nth-child(even) {
		background-color: #f2f2f2; /* Warna latar belakang striped */
	}

	/* CSS untuk badge dengan lingkaran kecil */
	.badge-circle {
		display: inline-block !important;
		margin-right: 10px;
		width: 15px; /* Atur lebar badge sesuai kebutuhan */
		height: 15px; /* Atur tinggi badge sesuai kebutuhan */
		border-radius: 50%; /* Membuat badge berbentuk lingkaran */
		text-align: center;
		line-height: 20px; /* Vertically center the content (adjust according to badge height) */
		font-size: 12px; /* Atur ukuran font sesuai kebutuhan */
		color: #ffffff; /* Warna teks pada badge */
	}
</style>