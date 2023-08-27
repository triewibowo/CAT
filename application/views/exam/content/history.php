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
            <table class="table datatable table-condensed">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Pelajaran - Tipe</th>
                        <th>KKM</th>
                        <th>Lama Ujian</th>
                        <th>Soal</th>
                        <th>Penulis</th>
                        <th>Dikumpulkan</th>
                        <th style="width:5%">Hasil Ujian</th>
                    </tr>
                </thead>
                <tbody>
                	<?php foreach ($dataAssignments as $row => $value): ?>
	                    <tr>
	                        <td><?= $row + 1 ?></td>
	                        <td><?= $value->lesson_name.' - '.$value->assignment_type ?></td>
	                        <td><?= $value->assignment_kkm ?>%</td>
	                        <td><?= $value->assignment_duration ?> Menit</td>
	                        <td><?= $value->totalQuestion ?> Soal</td>
	                        <td><?= $value->assignment_author ?></td>
	                        <td><?= $value->resultCreated ?></td>
	                        <td>
	                        	<?php if ($value->show_report == 1): ?>
	                        		<a href="<?= site_url('exam/report/'.$value->id_assignment) ?>" class="btn btn-primary"><i class="fa fa-file"></i> Lihat</a>
	                        	<?php else: ?>
	                        		<center>
	                        			<i>Tidak diperbolehkan</i>
	                        		</center>
	                        	<?php endif ?>
	                        </td>
	                    </tr>
                	<?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
</div>