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
                    <a id="add-student" class="btn btn-success btn-sm float-right" style="color: #ffffff;"><i class="feather feather-plus"></i> Tambah siswa</a>
                </div>
            </div>
            <table class="table table-striped table-responsive" data-toggle="datatables">
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
							<button type="button" class="close" aria-hidden="true" id="close-student">&times;</button>
							<h4 class="modal-title">Tambah siswa</h4>
						</div>
						<div class="modal-body">
						<table class="table table-striped table-responsive" id="student-table">
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
						<div class="modal-footer">
						<a id="tambah" class="btn btn-primary btn-sm float-right" style="color: #ffffff;"><i class="feather feather-plus"></i>Tambah</a>					
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
	var selectedData 	= [];
	var students 		= [];
	var assignment 		= [];
	let idAssignment 	= <?php echo json_encode($idAssignment); ?>;
	let idStudents 		= <?php echo json_encode($idStudents); ?>;
	function populateTable(data) {
		var tableBody = $('#student-table tbody');

		// Clear existing rows
		tableBody.empty();
		selectedData.length = 0;

		// Populate table with data
		$.each(data, function(index, student) {
			// Cek apakah id_student termasuk dalam excludedIds
			if (idStudents.indexOf(student.id_student) == -1) {
				var key = index + 1;
				var row = '<tr>' +
					'<td>' + key + '</td>' +
					'<td>' + student.student_name + '</td>' +
					'<td>' + student.student_nis + '</td>' +
					'<td>' + student.class_name + '</td>' +
					'<td align="center"><input type="checkbox" class="select-checkbox" name="selectedStudents" value="' + student.id_student + '"></td>' +
					'</tr>';
				tableBody.append(row);
			}
		});

		var dataTable = $('#student-table').DataTable();

		if (dataTable) {
			// DataTable sudah diinisialisasi sebelumnya, hentikan dan hapus
			dataTable.destroy();
		}

		// Inisialisasi DataTable
		$('#student-table').DataTable({
			lengthChange: false
		});

		// Add event listener to checkbox
		$('#student-table tbody').on('change', '.select-checkbox', function() {
			var isChecked = $(this).is(':checked');
			var idValue = $(this).val();

			// Cek apakah data dengan ID yang sama sudah ada di dalam selectedData
			var existingDataIndex = selectedData.findIndex(s => s.id === idValue);

			if (isChecked && existingDataIndex === -1) {
				// Checkbox is checked, dan data belum ada di dalam selectedData, tambahkan data
				selectedData.push({
					id: idValue,
					name: data.find(s => s.id_student === idValue).student_name,
					nis: data.find(s => s.id_student === idValue).student_nis,
					class: data.find(s => s.id_student === idValue).class_name,
				});
			} else if (!isChecked && existingDataIndex !== -1) {
				// Checkbox is unchecked, dan data sudah ada di dalam selectedData, hapus data
				selectedData.splice(existingDataIndex, 1);
			}

			// Use 'selectedData' array as needed
			console.log(selectedData);
		});
	}

	// Sample data (replace it with your actual data)
	$('#add-student').on('click', function() {
        $('#add').modal('show');
		students = [];
		selectedData = [];
    
		// Call the function with the sample data
		getAssignmentAndStudent().then(() => {
			populateTable(students);
		});
	});

	$('#close-student').on('click', function() {
		$('.select-checkbox').prop('checked', false);
		selectedData = [];
		console.log(selectedData);
        $('#add').modal('hide');
	});

	function getAssignmentAndStudent(status) {
		return new Promise(function(resolve, reject) {
			$.ajax({
				url: '<?= base_url('AssignmentCtrl/getAssignmentAndStudent/') ?>' + idAssignment,
				method: 'GET',
				data: {
					id: idAssignment,
					id_student_except: idStudents
				},
				dataType: 'json',
				success: function(response) {
					assignment = response.assignment;
					students = response.students;
					resolve(); // Menggunakan resolve() untuk menandakan bahwa operasi telah selesai
				},
				error: function(xhr, status, error) {
					console.log('Error:', error);
					reject(error); // Menggunakan reject() untuk menandakan bahwa operasi gagal
				}
			});
		});
	}

	$('#tambah').on('click', function() {
		return new Promise(function(resolve, reject) {
			$.ajax({
				url: '<?= base_url('AssignmentCtrl/addStudentAssignment/') ?>',
				method: 'POST',
				data: {
					student: JSON.stringify(selectedData),
					assignment: JSON.stringify(assignment),
				},
				dataType: 'json',
				success: function(response) {
					console.log(response);
					resolve(); // Menggunakan resolve() untuk menandakan bahwa operasi telah selesai
				},
				error: function(xhr, status, error) {
					console.log(error);
					 // Mengambil response dari objek xhr
					var responseText = xhr.responseText;
					reject(error); // Menggunakan reject() untuk menandakan bahwa operasi gagal
				}
			});
		})
		.then(function() {
			// Menampilkan SweetAlert saat berhasil
			swal({
				title: 'Berhasil',
				text: 'Data siswa berhasil ditambahkan.',
				type: 'success',
				allowOutsideClick: false,
				confirmButtonText: 'OK!',
			})
				.then(async (result) => {
					// Reload halaman
					location.reload();
			});
		})
		.catch(function(error) {
			// Menampilkan SweetAlert saat berhasil
			swal({
				title: 'Gagal',
				text: 'Terjadi kesalahan saat menambahkan data siswa.',
				type:'error',
				allowOutsideClick: false,
				confirmButtonText: 'OK!',
			})
				.then(async (result) => {
					// Reload halaman
					location.reload();
			});
		});
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