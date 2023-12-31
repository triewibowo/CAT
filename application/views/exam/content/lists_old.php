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
            <table class="table table-striped table-hover datatable table-condensed">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nama Ujian</th>
                        <th>Tipe Ujian</th>
                        <th>Lama Ujian</th>
                        <th>Penulis</th>
                        <th>Password</th>
                        <th>Status</th>
                        <th style="width:5%"></th>
                    </tr>
                </thead>
                <tbody>
                	<?php foreach ($dataAssignments as $row => $value): ?>
	                    <tr>
	                        <td><?= $row + 1 ?></td>
	                        <td><?= $value->assignment->assignment_name ?></td>
	                        <td><?= $value->assignment->assignment_type ?></td>
	                        <td><?= $value->duration ?> Menit</td>
	                        <td><?= $value->assignment->assignment_author ?></td>
	                        <td><?= $value->password ?></td>
							<td>
								<?php if ($value->status == 0): ?>
									<span class="badge bg-warning">Baru</span>
								<?php elseif ($value->status == 1): ?>
									<span class="badge bg-primary">Lanjutkan</span>
								<?php endif; ?>
							</td>
	                        <td>
							<a href="#password<?= $row ?>" data-toggle="modal" class="btn btn-primary"><i class="fa fa-pencil"></i> Ujian</a>
	                        </td>
	                    </tr>
						<!-- MODAL CHECK PASSWORD -->
						<div class="modal fade" id="password<?= $row ?>">
	                    	<div class="modal-dialog" style="width:30%">
	                    		<div class="modal-content">
	                    			<div class="modal-header">
	                    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    				<h4 class="modal-title">Masukan Password Ujian <?= $value->assignment->assignment_name ?> ?</h4>
	                    			</div>
									<div class="modal-body">
										<input type="text" class="form-control" name="password<?= $row ?>" required placeholder="Password">
									</div>
	                    			<div class="modal-footer">
										<button id="checkPasswordBtn<?= $row ?>" class="btn btn-primary btn-block">Check Password</button>
										<p id="password-error<?= $row ?>" style="color: red; display:none">Password salah. Silakan coba lagi.</p>
	                    			</div>
	                    		</div>
	                    	</div>
	                    </div>
						<script>
							$(document).ready(function () {
								$('#password-error').hide();
								// Handler saat tombol "Check Password" diklik
								$('#checkPasswordBtn<?= $row ?>').click(function () {
									var inputPassword = $('input[name="password<?= $row ?>"]').val(); // Dapatkan nilai password yang dimasukkan oleh pengguna
									var expectedPassword = '<?= $value->password ?>'; // Gantilah dengan password yang seharusnya
									console.log(inputPassword)
									
									// Periksa apakah password yang dimasukkan sesuai dengan yang diharapkan
									if (inputPassword == expectedPassword) {
										console.log('password Benar');
										// Password benar, tampilkan modal selanjutnya di sini
										$('#password-error').css('display', 'none');
										$('#categories<?= $row ?>').modal('show');
										$('#password<?= $row ?>').modal('hide');
									} else {
										console.log('password Salah');
										// Password salah, tampilkan pesan kesalahan
										$('#password-error<?= $row ?>').css('display', 'block');
									}
								});
							});
						</script>
	                    <!-- MODAL -->
	                    <div class="modal fade" id="categories<?= $row ?>">
	                    	<div class="modal-dialog" style="width:50%">
	                    		<div class="modal-content">
	                    			<div class="modal-header">
	                    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    				<h4 class="modal-title">Anda sudah siap ingin melaksanakan ujian <?= $value->assignment->assignment_name ?> ?</h4>
	                    			</div>
									<div class="modal-body">
										<div class="row" style="margin-bottom:15px">
											<div class="col-sm-4">
												Tipe Ujian :
												<span style="font-weight: 900;"><?= $value->assignment->assignment_type ?></span>
											</div>
											<div class="col-sm-4" style="text-align: center;">
												Sisa Waktu :
												<span style="font-weight: 900;"><?= $value->duration ?> Menit</span>
											</div>
											<div class="col-sm-4" style="text-align: right;">
												Status :
												<span style="font-weight: 900;">
													<?php if ($value->status == 0): ?>
														<span class="badge badge-circle bg-warning"></span> Baru
													<?php elseif ($value->status == 1): ?>
														<span class="badge badge-circle bg-primary"></span>Lanjutkan
													<?php endif; ?>
												</span>
											</div>
										</div>
									
									
										<ul class="list-group list-group-flush">
											<?php foreach ($value->assignment->categories as $r => $category): ?>
												<?php $totalCategoryTimer = 0; // Inisialisasi total timer untuk kategori ?>
												<?php foreach ($category->subtests as $key => $sub): ?>
													<?php 
														$totalCategoryTimer += $sub->timer;
													?>
												<?php endforeach; ?>
												<li class="list-group-item row" data-toggle="collapse" data-target="#collapseExample<?= $category->id_acat ?>" aria-expanded="false" aria-controls="collapseExample">
													<div class="col-sm-9">
														<div style="font-weight: 900;"><?= $category->category->cat_name ?></div>
													</div>
													<div class="col-sm-3">
														<span class="badge bg-primary rounded-pill"><?= $totalCategoryTimer ?> Menit</span>
														<?php if ($category->status == 0): ?>
															<span class="badge bg-warning">Baru</span>
														<?php elseif ($category->status == 1): ?>
															<span class="badge bg-primary">Lanjutkan</span>
														<?php elseif ($category->status == 2): ?>
															<span class="badge bg-success">Selesai</span>
														<?php endif; ?>
													</div>
												</li>
												<div class="collapse" id="collapseExample<?= $category->id_acat ?>">
													<?php foreach ($category->subtests as $key => $sub): ?>
														<?php 
															$totalCategoryTimer += $sub->timer;
														?>
													<li class="list-group-item striped-li row">
														<div class="col-sm-9" style="margin-left: 20px;">
															<div><b><?= $sub->subtest->sub_name ?></b></div>
															<?php if ($category->status == 0): ?>
																<span class="badge badge-circle bg-warning"></span><span style="font-weight:600; font-size:10px;">Baru</span>
															<?php elseif ($category->status == 1): ?>
																<span class="badge badge-circle bg-primary"></span><span style="font-weight:100; font-size:10px;">Lanjutkan</span>
															<?php elseif ($category->status == 2): ?>
																<span class="badge badge-circle bg-success"></span><span style="font-weight:100; font-size:10px;">Selesai</span>
															<?php endif; ?>
														</div>
														<div class="col-sm-2">
															<div style="font-weight:600; font-size:10px"><?= $sub->timer ?> Menit</div>
															<div style="font-weight:100; font-size:10px">Sisa Soal <?= $sub->total_soal ?>/<?= $sub->qty_soal ?></div>
														</div>
													</li>
													<?php endforeach; ?>
												</div>
											<?php endforeach; ?>
										</ul>
									</div>
	                    			<div class="modal-footer">
	                    				<a href="<?= site_url('exam/beginExam/'.$value->id_abegin) ?>" class="btn btn-primary btn-block">Ya, Saya siap!</a>
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

<script>
	$(document).ready(function () {
		var passwordError = $('#password-error');
		<?php if ($password == $value->password) { ?>
			passwordError.hide(); // Sembunyikan pesan kesalahan jika password cocok
		<?php } else { ?>
			passwordError.show(); // Tampilkan pesan kesalahan jika password tidak cocok
		<?php } ?>
	});
</script>

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