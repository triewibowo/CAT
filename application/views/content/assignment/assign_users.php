<style type="text/css">
    .switchery {
        
    }
    .switchery-small {
        
    }
    .list-group-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
</style>
<!-- Page Title Area -->
<div class="row page-title clearfix" style="margin-top:-10px">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">List Siswa Yang Mengikuti Ujian</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">List Siswa Yang Mengikuti Ujian</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
 <div class="widget-holder widget-full-height col-md-12">
    <div class="widget-bg">
        <div class="widget-body">
		    <div class="row mb-3">
                <div class="col-sm"></div>
                <div class="col-sm-2">
                    <a id="add-student" class="btn btn-success btn-sm float-right"><i class="feather feather-plus"></i> Tambah siswa</a>
                </div>
            </div>
            <table class="table table-striped table-hover datatable table-condensed">
                <thead>
                    <tr>
                        <th style="text-align: center;">#</th>
                        <th>Nama Siswa</th>
                        <th style="text-align: center;">NIS</th>
                        <th style="text-align: center;">Kelas</th>
                        <th style="text-align: center;">Nama Ujian</th>
                        <th style="text-align: center;">Tipe Ujian</th>
                        <th style="text-align: center;">Status</th>
                    </tr>
                </thead>
                <tbody>
                	<?php foreach ($dataAssignment as $row => $value): ?>
	                    <tr>
	                        <td align="center"><?= $row + 1 ?></td>
                            <td align="left"><?= $value->student->student_name ?></td>
                            <td align="center"><?= $value->student->student_nis ?></td>
                            <td align="center"><?= $value->student->class_name ?></td>
							<td align="center"><?= $value->assignment->assignment_name ?></td>
							<td align="center"><?= $value->assignment->assignment_type ?></td>
							<td align="center">
                                <?php if ($value->status == 2): ?>
                                    <span class="badge bg-success">Success</span>
                                <?php elseif ($value->status == 1): ?>
                                    <span class="badge bg-info">Proses</span>
                                <?php else: ?>
                                    <span class="badge bg-warning">Belum</span>
                                <?php endif; ?>
                            </td>
	                    </tr>
                	<?php endforeach ?>
                </tbody>
            </table>
			<!-- MODAL -->
			<div class="modal fade" id="add">
				<div class="modal-dialog  modal-lg" >
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title">Tambah siswa</h4>
						</div>
						<div class="modal-body">
						<table class="table" id="student-table">
							<thead>
								<tr>
									<th></th>
									<th>Nama</th>
									<th>NIS</th>
									<th>Kelas</th>
									<th style="text-align: center;">
										<!-- <input type="checkbox" id="selectAll"> -->
										Pilih
									</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						</div>
					</div>
				</div>
			</div>
        </div>
        <!-- /.widget-body -->
    </div>
    <!-- /.widget-bg -->
</div>
</div>


<script type="text/javascript">
	// Function to populate the table
	function populateTable(data) {
			var tableBody = $('#student-table tbody');

			// Clear existing rows
			tableBody.empty();

			// Populate table with data
			$.each(data, function(index, student) {
				var key = index + 1
				var row = '<tr>' +
					'<td>' + key + '</td>' +
					'<td>' + student.name + '</td>' +
					'<td>' + student.nis + '</td>' +
					'<td>' + student.class + '</td>' +
					'<td align="center"><input type="checkbox" name="selectedStudents" value="' + student.nis + '"></td>' +
					'</tr>';
				tableBody.append(row);
			});
		}
	// Sample data (replace it with your actual data)
	$('#add-student').on('click', function() {
        $('#add').modal('show');
    
		var students = [
				{ name: 'John Doe', nis: '12345', class: '10A' },
				{ name: 'Jane Doe', nis: '67890', class: '11B' },
				// Add more data as needed
			];
		// Call the function with the sample data
		populateTable(students);
	});

</script>

<style>
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