<section class="card">
	<header class="card-header">
		<i class="fa fa-users"></i> Data Presensi siswa
	</header>
	<div class="card-block">
		<form action="<?=site_url('page/presencedays')?>" method="POST">
			<div class="row">
				<div class="col-sm-4">
					<div class="form-group">
						<select class="form-control" name="id_class">
							<option value="0">Pilih kelas</option>
							<?php
								foreach ($dclass as $value) {
									if ($selclass == $value->id_class) {
										$sc = "selected";
									} else {
										$sc = "";
									}
									echo '<option value="'.$value->id_class.'" '.$sc.'>'.$value->class_name.'</option>';
								}
							?>
						</select>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group">
						<div class='input-group date'>
							<input id="logdate" name="logdate" type="text" value="<?=$seldate?>" class="form-control">
							<span class="input-group-addon">
								<i class="font-icon font-icon-calend"></i>
							</span>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<button type="submit" class="btn btn-success"><i class="fa fa-search"></i> Cari</button>
				</div>
			</div>
		</form>

		<div class="box-typical-body">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="text-align:center;">NIS</th>
							<th style="text-align:center; width:25%;">Nama Siswa</th>
							<th style="text-align:center;">Kehadiran</th>
							<th style="text-align:center;">Pencatatan</th>
							<th style="text-align:center;">Sumber</th>
						</tr>
					</thead>

					<tbody>
						<?php //echo "<pre>";print_r($siswa); 
							echo $data;
						?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

<script>
	function updatePresence(nis = null, obj = null) {
		$(function() {
			var nval = $('select#'+obj).val();
			if (nval != 'null') {
				var dval = $('#logdate').val();
				var vdata = "nis="+nis+"&presence_res=website"+"&presence_type="+nval+"&presence_log="+dval;
				$.ajax({
					url: "<?=base_url('PresenceCtrl/onlineupdater')?>",
					type: "post",
					data: vdata,
					beforeSend: function(b) {
						$('select#'+obj).attr('disabled','disabled');
					},
					success: function(r) {
						try {
							var res = JSON.parse(r);
							if (res.log == '1') {
								var message = "Update kehadiran siswa dengan nis "+res.nis+" berhasil";
								var type = 1;
							} else {
								var message = "Update kehadiran siswa dengan nis "+res.nis+" gagal";
								var type = 2;
							}
							setTimeout(function(){	
								notieAlert(type,message,2);
							},300);
							$('div#log'+nis).html(res.time);
							$('div#res'+nis).html(res.res);
							$('div#out'+nis).html(res.out);
						} catch (e) {
							setTimeout(function(){
                				swal({
                  					title: "Koneksi sukses",
                  					text: "Status kehadiran berhasil diperbarui",
                  					type: "success",
                  					button: true,
                				});
            				},1200);
						}
						$('select#'+obj).removeAttr('disabled');
						$("select#"+obj+" option[value='null']").remove();
					},
					error: function(e) {
						setTimeout(function(){
                			swal({
                  				title: "Koneksi gagal",
                  				text: "Status kehadiran gagal diperbarui",
                  				type: "warning",
                  				button: true,
                			});
            			},1200);
						$('select#'+obj).removeAttr('disabled');
					}
				});
			}
		});
		//console.log(dval);
	}

	function horepulang(id = null, obj = null) {
		$(function() {
			$.ajax({
				url: "<?=base_url('PresenceCtrl/pulangonline')?>",
				type: "post",
				data: "idpresence="+id,
				beforeSend: function(b) {
					$('button#'+obj).attr('disabled','disabled');
				},
				success: function(r) {
					try {
						var res = JSON.parse(r);
						if (res.sts == "ok") {
							var type = 1;
							var message = "Update kehadiran berhasil";
							setTimeout(function(){	
								notieAlert(type,message,2);
							},300);
						} else {
							var type = 2;
							var message = "Update kehadiran gagal";
							setTimeout(function(){	
								notieAlert(type,message,2);
							},300);
						}
						$('#'+obj).closest('div').html(res.log);
					} catch (e) {
						var type = 3;
						var message = "Ops, ada masalah koneksi...";
						setTimeout(function(){	
							notieAlert(type,message,2);
						},300);
					}
					$('button#'+obj).removeAttr('disabled');
				},
				error: function(e) {
					var type = 3;
					var message = "Ops, ada masalah koneksi...";
					setTimeout(function(){	
						notieAlert(type,message,2);
					},300);
					$('button#'+obj).removeAttr('disabled');
				}
			})
		})
	}
</script>