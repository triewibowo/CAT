<style type="text/css">
	.conf {
		text-align: center;
	}
	.box {
		width: 100%;
		position: relative;
		min-height: 100px;
	}
	.box .left {
		width: 50%;
		min-height: 10px;
		float: left;
	}
	.box .right {
		width: 50%;
		min-height: 10px;
		float: right;
	}
	.box .leftDown {
		width: 25%;
		min-height: 10px;
		float: left;
	}
	.box .rightDown {
		width: 70%;
		min-height: 10px;
		float: right;
	}
	table.table {
		width: 100%;
		border-collapse: collapse;
	}
	table.table thead tr th,
	table.table tbody tr td {
		padding: 5px;
	}
</style>
<center>
	<h2 class="conf">Boy Science Club</h2>
	<p class="conf">
		Jalan Raya Pondok Cipta Blok B2 No.17, Bintara, Bekasi Barat, Bintara,<br /> Bekasi Barat Kota Bekasi, Jawa Barat 17134
		<br /> 0812-9740-118
	</p>
</center>
<hr />
<div class="box">
	<div class="left">
		<table class="table">
			<tr>
				<td>Pelajaran</td>
				<td>: <?= $dataAssignment->lesson_name ?></td>
			</tr>
			<tr>
				<td>Tipe Ujian</td>
				<td>: <?= $dataAssignment->assignment_type ?></td>
			</tr>
			<tr>
				<td>Lama Ujian</td>
				<td>: <?= $dataAssignment->assignment_duration ?> Menit</td>
			</tr>
		</table>
	</div>
	<div class="right">
		<table class="table">
			<tr>
				<td>Kelas</td>
				<td>: 
					<?= $dataClass->class_name ?>
				</td>
			</tr>
			<tr>
				<td>Total Pertanyaan</td>
				<td>: <?= $dataAssignment->totalQuestion ?> Pertanyaan</td>
			</tr>
			<tr>
				<td>Pembuat Soal</td>
				<td>: <?= $dataAssignment->assignment_author ?></td>
			</tr>
		</table>
	</div>
</div>
<!-- TABLE STUDENT --> 
<div class="box" style="margin:10px 0px">
	<div class="leftDown">Laporan Nilai Siswa :</div>
	<div class="rightDown" style="text-align:right">
		KKM : <b><?= $dataAssignment->assignment_kkm ?>%</b>
	</div>
</div>
<table class="table" border="1" cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th>#</th>
			<th>NIS</th>
			<th>Nama</th>
			<th>Benar</th>
			<th>Salah</th>
			<th>Nilai</th>
			<th>Status</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($dataAssignment->students as $row => $value): ?>
			<tr>
				<td><?= $row + 1 ?></td>
				<td><?= $value->student_nis ?></td>
				<td><?= $value->student_name ?></td>
				<?php if ($value->result): ?>
					<td><?= $value->result->result_true ?> Soal</td>
					<td><?= $value->result->result_false ?> Soal</td>
					<td><?= $value->result->result_score ?>%</td>
					<td>
						<?php if ($value->result->result_score < $dataAssignment->assignment_kkm): ?>
							Gagal
						<?php else: ?>
							Lulus
						<?php endif ?>
					</td>
				<?php else: ?>
					<td>0</td>
					<td>0</td>
					<td>0 (0%)</td>
					<td>Belum Mengerjakan</td>
				<?php endif ?>
			</tr>
		<?php endforeach ?>
	</tbody>
</table>