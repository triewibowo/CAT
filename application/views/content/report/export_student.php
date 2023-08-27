<?php 
    header("Content-type: application/octet-stream");
    header("Content-disposition: attachement; filename=Laporan-Siswa-Kelas-".$DataClass->class_name.".xls");
    header("Pragma: no-cache");
    header("Expires: 0");
?>
<style type="text/css">
    table.table {
        width: 100%;
        border-collapse: collapse;
    }
    table.table thead tr th,
    table.table tbody tr td {
        padding: 5px;
    }
</style>
<h2>
    Laporan Data Siswa Kelas : <?= $DataClass->class_name ?>
</h2>
<table class="table" border="1" cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <th style="width:5%">#</th>
            <th>Nama</th>
            <th>NIS</th>
            <th>NISN</th>
            <th>Email</th>
            <th>Telepon</th>
            <th>Nama Orang Tua</th>
            <th>Telepon Orang Tua</th>
            <th>Dibuat</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($DataStudent as $row => $value): ?>
            <tr>
                <td><?= $row + 1 ?></td>
                <td><?= $value->student_name ?></td>
                <td><?= $value->student_nis ?></td>
                <td><?= $value->student_nisn ?></td>
                <td><?= $value->student_email ?></td>
                <td><?= $value->student_phone ?></td>
                <td><?= $value->parent_name ?></td>
                <td><?= $value->parent_phone ?></td>
                <td><?= $value->student_created ?></td>
            </tr>
        <?php endforeach ?>          
    </tbody>
</table>