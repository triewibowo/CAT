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
        <h6 class="page-title-heading mr-0 mr-r-5">List Laporan Ujian per Siswa</h6>
        <p class="page-title-description mr-0 d-none d-md-inline-block"></p>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<?= site_url() ?>">Dashboard</a></li>
            <li class="breadcrumb-item active">Report Ujian per Siswa</li>
        </ol>
    </div>
</div><!-- /.page-title -->

<div class="widget-list row" style="margin-top:10px;margin-bottom:80px">
 <div class="widget-holder widget-full-height col-md-12">
    <div class="widget-bg">
        <div class="widget-body">
            <table class="table table-striped table-hover datatable table-condensed">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nama Siswa</th>
                        <th>Nama Ujian</th>
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
	                        <td>
                                <table>
                                    <tr>
                                        <td class="p-0"><?= $value->student->student_name ?></td>
                                    </tr>
                                    <tr>
                                        <td class="p-0" style="font-weight:400; font-size:12px; color:#a3a3a3"><?= $value->student->student_nis ?> - <?= $value->student->class_name ?></td>
                                    </tr>
                                </table>
                            </td>
	                        <td>
                                <table>
                                    <tr>
                                        <td class="p-0"><?= $value->assignment->assignment_name ?></td>
                                    </tr>
                                    <tr>
                                        <td class="p-0" style="font-weight:400; font-size:12px; color:#a3a3a3"><?= $value->assignment->assignment_type ?> - <?= $value->assignment->assignment_author ?></td>
                                    </tr>
                                </table>
                            </td>
	                        <td align="center"><?= $value->total_questions ?></td>
	                        <td align="center"><i class="fa fa-check-circle" style="color:#5cb85c"></i> <?= $value->total_correct ?></td>
	                        <td align="center"><i class="fa fa-minus-circle" style="color:#d9534f"></i> <?= $value->total_false ?></td>
	                        <td align="center"><?= $value->points ?> Pts</td>
							<td align="center">
                                <?php if ($value->status == 2): ?>
                                    <span class="badge bg-success">Success</span>
                                <?php elseif ($value->status == 1): ?>
                                    <span class="badge bg-info">Proses</span>
                                <?php else: ?>
                                    <span class="badge bg-warning">Belum</span>
                                <?php endif; ?>
                            </td>
	                        <td>
								<a href="#categories<?= $row ?>" data-toggle="modal" class="btn btn-primary btn-sm"><i class="fa fa-eye"></i> Detail</a>
	                        </td>
	                    </tr>

						<!-- MODAL -->
						<div class="modal fade" id="categories<?= $row ?>">
								<div class="modal-dialog  modal-lg" >
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title">Riwayat Ujian <?= $value->assignment->assignment_name ?></h4>
										</div>
										<div class="modal-body">
											<!-- <div class="row" style="margin-bottom:15px">
												<div class="col-sm-4">
													Tipe Ujian :
													<span style="font-weight: 900;"><?= $value->assignment->assignment_type ?></span>
												</div>
												<div class="col-sm-4" style="text-align: center;">
													Sisa Waktu :
													<span style="font-weight: 900;"><?= number_format($value->duration, 1) ?> Menit</span>
												</div>
												<div class="col-sm-4" style="text-align: right;">
													Status :
													<span style="font-weight: 900;">
														<?php if ($value->status == 0): ?>
															<span class="badge badge-circle bg-warning"></span> Baru
														<?php elseif ($value->status == 1): ?>
															<span class="badge badge-circle bg-primary"></span>Lanjutkan
														<?php elseif ($value->status == 2): ?>
															<span class="badge badge-circle bg-success"></span>Selesai
														<?php endif; ?>
													</span>
												</div>
											</div> -->
										
										
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
															<div style="font-weight: 900;">Kategori - <?= $category->category->cat_name ?></div>
														</div>
														<div class="col-sm-3">
															<!-- <span class="badge bg-primary rounded-pill"><?= number_format($totalCategoryTimer, 1) ?> Menit</span>
															<?php if ($category->status == 0): ?>
																<span class="badge bg-warning">Baru</span>
															<?php elseif ($category->status == 1): ?>
																<span class="badge bg-primary">Lanjutkan</span>
															<?php elseif ($category->status == 2): ?>
																<span class="badge bg-success">Selesai</span>
															<?php endif; ?> -->
														</div>
													</li>
													<div class="collapse" id="collapseExample<?= $category->id_acat ?>">
														<?php foreach ($category->subtests as $key => $sub): ?>
															<?php 
																$totalCategoryTimer += $sub->timer;
															?>
														<li class="list-group-item striped-li row" data-toggle="collapse" data-target="#collapseExampleList<?= $sub->id ?>" aria-expanded="false" aria-controls="collapseExampleList" style="border:1px dashed #5cb85c">
															<div class="col-sm-9" style="margin-left: 20px;">
																<div><b>Subtes - <?= $sub->subtest->sub_name ?></b></div>
																<!-- <?php if ($category->status == 0): ?>
																	<span class="badge badge-circle bg-warning"></span><span style="font-weight:600; font-size:10px;">Baru</span>
																<?php elseif ($category->status == 1): ?>
																	<span class="badge badge-circle bg-primary"></span><span style="font-weight:100; font-size:10px;">Lanjutkan</span>
																<?php elseif ($category->status == 2): ?>
																	<span class="badge badge-circle bg-success"></span><span style="font-weight:100; font-size:10px;">Selesai</span>
																<?php endif; ?> -->
															</div>
															<div class="col-sm-2">
																<!-- <div style="font-weight:600; font-size:10px"><?= number_format($sub->timer, 1) ?> Menit</div> -->
																<div style="font-weight:100; font-size:10px">Sisa Soal <?= $sub->total_soal ?>/<?= $sub->qty_soal ?></div>
															</div>
														</li>
														<div class="collapse" id="collapseExampleList<?= $sub->id ?>" style="margin-top:1em">
														<?php foreach ($sub->assign_answers as $key => $assign): ?>
															<div class="row"  style="margin-bottom:2em">
																<div class="col-sm-12" style="padding-left:3em">
																	<div class="row">
																		<div class="col-sm-10">
																			<p><strong><?= $key+1 ?>. <?= $assign->question->question_ ?></strong></p>
																		</div>
																		<div class="col-sm-2">
																			<?php if ($assign->is_true == 1): ?>
																				<span class="badge badge-circle bg-success"></span><span style="font-weight:600; font-size:10px;">Benar</span>
																			<?php else: ?>
																				<span class="badge badge-circle bg-danger"></span><span style="font-weight:600; font-size:10px;">Salah</span>
																			<?php endif; ?>
																		</div>
																	</div>
																	<?php if ($assign->question->id_type == 1): ?>
																		<?php if (count($assign->answers) > 0): ?>
																			<?php if ($assign->answers[0]->answer_id == 1): ?>
																				<ul class="list-group">
																					<li class="list-group-item" style="padding-left:1.2em; border-bottom:1px solid #E5E5E5 !important">Benar</li>
																				</ul>
																			<?php else: ?>
																				<ul class="list-group">
																					<li class="list-group-item" style="padding-left:1.2em; border-bottom:1px solid #E5E5E5 !important">Salah</li>
																				</ul>
																			<?php endif; ?>
																		<?php else: ?>
																			<small style="padding-left:1.2em">Tidak Menjawab</small>
																		<?php endif; ?>
																	<?php elseif ($assign->question->id_type == 2): ?>
																		<?php if (count($assign->answers) > 0): ?>
																			<ul class="list-group">
																				<li class="list-group-item" style="padding-left:1.2em; border-bottom:1px solid #E5E5E5 !important"><?= $assign->rel_answer->option_ ?></li>
																			</ul>
																		<?php else: ?>
																			<small style="padding-left:1.2em">Tidak Menjawab</small>
																		<?php endif; ?>
																	<?php elseif ($assign->question->id_type == 3): ?>
																		<?php if (count($assign->answers) > 0): ?>
																			<ul class="list-group">
																				<li class="list-group-item" style="padding-left:1.2em; border-bottom:1px solid #E5E5E5 !important"><?= $assign->answers[0]->answer_text ?></li>
																			</ul>
																		<?php else: ?>
																			<small style="padding-left:1.2em">Tidak Menjawab</small>
																		<?php endif; ?>
																	<?php elseif ($assign->question->id_type == 4): ?>
																		<?php if (count($assign->answers) > 0): ?>
																			<?php forEach ($assign->rel_answer as $key => $rel): ?>
																				<ul class="list-group">
																					<li  class="list-group-item" style="padding-left:1.2em; border-bottom:1px solid #E5E5E5 !important"><?= $rel->option_ ?></li>
																				</ul>
																			<?php endforeach; ?>
																		<?php else: ?>
																			<small style="padding-left:1.2em">Tidak Menjawab</small>
																		<?php endif; ?>
																	<?php elseif ($assign->question->id_type == 5): ?>
																		<?php if (count($assign->answers) > 0): ?>
																			<?php forEach ($assign->rel_answer as $key => $rel): ?>
																				<div class="row">
																					<div class="col-sm-6">
																						<ul class="list-group">
																							<li class="list-group-item" style="padding-left:1.2em; border-bottom:1px solid #E5E5E5 !important"><?= $rel->option_ ?></li>
																						</ul>
																					</div>
																					<div class="col-sm-6">
																						<ul class="list-group">
																							<li class="list-group-item" style="padding-left:1.2em; border-bottom:1px solid #E5E5E5 !important"><?= $rel->option->answer_ ?></li>
																						</ul>
																					</div>
																				</div>
																			<?php endforeach; ?>
																		<?php else: ?>
																			<small style="padding-left:1.2em">Tidak Menjawab</small>
																		<?php endif; ?>
																	<?php endif; ?>
																	<hr>
																</div>
															</div>
															<?php endforeach; ?>
														</div>
														<?php endforeach; ?>
													</div>
												<?php endforeach; ?>
											</ul>
										</div>
										<!-- <div class="modal-footer">
											<?php if($value->status != 2): ?>
												<a href="<?= site_url('exam/beginExam/'.$value->id_abegin) ?>" class="btn btn-primary btn-block">Ya, Saya siap!</a>
											<?php endif; ?>
										</div> -->
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


<script type="text/javascript">
    $(function(){
        // $("#textLoading").text('');
    });
    function changeStatus(idAssignment,param) {
        $.ajax({
            url : '<?= site_url("AssignmentCtrl/changeStatusAssignment/'+idAssignment+'/'+param+'") ?>',
            type : 'GET',
            success:function(res){
                return res;
            }
        });
        // return callback;
    }
    function forCheck(idAssignment) {
        if (document.getElementById("assignment_active"+idAssignment).checked == true) {
            $("#assignment_active"+idAssignment).prop("disabled",true);
            $("#textLoading"+idAssignment).text('loading');
            $.ajax({
                url : '<?= site_url("AssignmentCtrl/changeStatusAssignment/'+idAssignment+'/1") ?>',
                type : 'GET',
                success:function(res){
                    if(res === 'limit') {
                        document.getElementById("assignment_active"+idAssignment).checked = false;
                        setTimeout(function(){
                            $("#assignment_active"+idAssignment).prop("disabled",false);
                            $("#textLoading"+idAssignment).text('');
                            swal({
                              title: "Ooppss! Ujian aktif sudah 10",
                              text: "Memuat ulang dalam 2 detik",
                              type: "error",
                              timer: 2000,
                              showConfirmButton: false
                            });
                            setTimeout(function() {
                                window.location ="<?= site_url('page/assignments') ?>"
                            },2000)
                        },1200);
                    } else {
                        setTimeout(function(){
                            $("#assignment_active"+idAssignment).prop("disabled",false);
                            $("#textLoading"+idAssignment).text('');
                            swal({
                              title: "Woohoo!",
                              text: "Status ujian berhasil diubah menjadi aktif",
                              type: "success",
                              button: true,
                            });
                        },1200);
                    };
                }
            });
        } else if(document.getElementById("assignment_active"+idAssignment).checked == false) {
            $("#assignment_active"+idAssignment).prop("disabled",true);
            $("#textLoading"+idAssignment).text('loading');
            changeStatus(idAssignment,2);
            setTimeout(function(){
                $("#assignment_active"+idAssignment).prop("disabled",false);
                $("#textLoading"+idAssignment).text('');
                swal({
                  title: "Woohoo!",
                  text: "Status ujian berhasil diubah menjadi tidak aktif",
                  type: "success",
                  button: true,
                });
            },1200);
        };
    }
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