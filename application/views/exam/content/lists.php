<style type="text/css">
	table.table tbody tr td {
		background-color: transparent !important;
	}
</style>
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">List Ujian</h3>
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
                        <th style="width:5%"></th>
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
	                        <td>
	                        	<a href="#question<?= $row ?>" data-toggle="modal" class="btn btn-primary"><i class="fa fa-pencil"></i> Ujian</a>
	                        </td>
	                    </tr>
	                    <!-- MODAL -->
	                    <div class="modal fade" id="question<?= $row ?>">
	                    	<div class="modal-dialog" style="width:30%">
	                    		<div class="modal-content">
	                    			<div class="modal-header">
	                    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    				<h4 class="modal-title">Anda sudah siap ingin melaksanakan ujian ?</h4>
	                    			</div>
	                    			<div class="modal-footer">
	                    				<a href="<?= site_url('exam/begin/'.$value->id_assignment) ?>" class="btn btn-primary btn-block">Ya, Saya siap!</a>
	                    			</div>
	                    		</div>
	                    	</div>
	                    </div>
                	<?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
</div>