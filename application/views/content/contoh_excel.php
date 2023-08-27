<?php 
    header("Content-type: application/octet-stream");
    header("Content-disposition: attachement; filename=namafile.xls");
    header("Pragma: no-cache");
    header("Expires: 0");
?>
<style type="text/css">
	.header {
		text-align:center
	}
	table.table {
		border-collapse: collapse;
		width: 100%;
	}
	table.table thead tr th,
	table.table tbody tr td {
		padding: 5px;
	}
</style>
<div class="header">
	<h2>SMK Tinta Emas Indonesia</h2>
	<p>
		Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />
		Email : admin@sekolah.com | Telepon : (021) 123 1233
	</p>
</div>
<hr />
<table class="table" border="1">
	<thead>
		<tr>
			<th style="width:5%">#</th>
			<th>Nama</th>
			<th>Umur</th>
		</tr>
	</thead>
	<tbody>
		<?php $no =1; foreach ($dataAdmin as $row => $value): ?>
			<tr>
				<td><?= $no ?></td>
				<td><?= $value['nama'] ?></td>
				<td><?= $value['umur'] ?> Tahun</td>
			</tr>
		<?php $no++; endforeach ?>
	</tbody>
</table>