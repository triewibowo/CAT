<script type="text/javascript">
	$(function(){
	  var el = $('video, audio');
      if(!el.length) return;
      el.each(function() {
        var $this = $(this);
        if( this.unifato === undefined )
          this.unifato = {};
        $this.mediaelementplayer({
          pluginPath: 'https://cdnjs.com/libraries/mediaelement/',
          shimScriptAccess: 'always'
        });
        if( this.tagName === 'VIDEO' ) {
          $this.on('playing', function() {
            $this.closest('.mejs__container').addClass('mejs__video--playing');
          });
          $this.on('ended', function() {
            $this.closest('.mejs__container').removeClass('mejs__video--playing');
          });
        }
        this.unifato.mediaelementplayer = $this.data('mediaelementplayer');
      });
	});
</script>
<link rel="stylesheet" href="<?= base_url('assets/fancy/jquery.fancybox.min.css') ?>" type="text/css" media="screen" />
<style type="text/css">
	.boxWhite {
		width: 100%;
		padding: 10px;
		min-height: 100px;
		background-color: white;
		border: 1px solid black;
		border-radius: 6px;
	}
	p.number {
		font-size: 20px;
		margin-top: -5px;
		color: black;
	}
	.is-countdown {
		background-color: transparent;
		border: none;
	}
	.is-countdown .countdown-row .countdown-section {
		font-size: 15px;
		font-weight: bold;
		color: white;
	}
	.is-countdown .countdown-row .countdown-section:first-child {
		margin-right: 10px;
	}
	.is-countdown .countdown-row .countdown-section:last-child {
		margin-left: 10px;
	}
	.btn-own {
		background-color: #119AE1;
		border-color: #119AE1;
		color: white;
	}
	.btn-own:hover {
		background-color: #119AE1;
		border-color: #119AE1;
		color: white;
	}
	.btn-own:visited {
		background-color: #119AE1;
		border-color: #119AE1;
		color: white;
	}
	.line {
		border-bottom: 1px solid black;
		width: 100%;
		min-height: 2px;
		margin:10px 0px;
	}
</style>
<script type="text/javascript">
	$(function(){
		var D = '<?= $dataAssignment->assignment_duration ?>';
		var divide = '<?= $long ?>';
		var clean = D - parseInt(divide);
		if (parseInt(clean) < 1) {
			timesUp();
		} else {
			var duration = parseInt(clean * 60);
			$("#countdown").countdown({
				until: duration, format: 'HMS',
				onExpiry: timesUp,
			});
		};
	});
	function timesUp() {
		var data = $('form').serialize();
		var showReport = '<?= $dataAssignment->show_report ?>';
		$.ajax({
			url : '<?= site_url("exam/calculate") ?>',
			type : 'POST',
			data : data,
			success:function(res) {
				swal({
	                title: 'Oooppss waktu telah berakhir!',
	                type: 'error',
	                text: 'Jawaban anda akan disimpan secara otomatis.',
	                timer: 3000,
	                showConfirmButton: false
	            });
				setTimeout(function(){	
					if (parseInt(showReport) == 1) {
						window.location.href = "<?= site_url('exam/report/'.$dataAssignment->id_assignment) ?>";
					} else {
						window.location.href = "<?= site_url('exam') ?>";
					}
				},3000);
			}
		});
	}
</script>

<div class="panel panel-info">
	<div class="panel-heading" style="background-color:#13C3E3">
		<div class="row">
			<div class="col-sm-8">
				<h3 class="panel-title" style="color:white">
					<i class="fa fa-edit"></i> Ujian : <?= $dataAssignment->assignment_type.' - '.$dataAssignment->lesson_name ?>
				</h3>
			</div>
			<div class="col-sm-4">
				<span class="pull-right"><div id="countdown"></div></span>
				<span class="pull-right"><i style="color:white" class="fa fa-clock-o"></i> &nbsp;</span>
			</div>
		</div><!-- / Row -->
	</div>
	<div class="panel-body">
		<legend><i class="fa fa-list"></i> List Soal</legend>
		<?php foreach($dataAssignment->questions as $rBottom => $vBottom): ?>
			<button id="buttonNavigation<?= $rBottom ?>" onclick="openQuestion('<?= $rBottom ?>')" type="button" style="margin-bottom:5px" class="btn btn-flat btn-default"><?= $rBottom + 1 ?></button>
		<?php endforeach ?>
	</div>
</div>

<div class="panel panel-info">
	<div class="panel-body">
		<form action="<?= site_url('exam/calculate') ?>" method="POST">
		<input type="hidden" id="totalQuestion" value="<?= count($dataAssignment->questions) ?>">
		<input type="hidden" id="questNow" value="0">
		<input type="hidden" name="id_assignment" value="<?= $dataAssignment->id_assignment ?>">
		<?php foreach ($dataAssignment->questions as $rows => $value): ?>
			<input type="hidden" name="id_question[]" value="<?= $value->id_question ?>">
			<script type="text/javascript">
				$(function(){
					// VALIDATION HIDE //
					var count = '<?= $rows ?>';
					if (count > 0) {
						$("#question"+count).hide();
					};
					// END VALIDATION HIDE //
				});
			</script>
			<div class="row" id="question<?= $rows ?>" class="globalQuestion">
				<div class="col-sm-1" style="margin-right:-50px">
					<p style="font-size:14px;margin-top:0px" class="number"><b><?= $rows + 1 ?>.</b></p>
				</div>
				<?php if ($value->question_image == ''): ?>
					<div class="col-sm-11">
						<span style="color:black !important;font-size:14px"><?= $value->question_ ?></span>
						<br />
						<?php if ($value->question_sound != ''): ?>
							<a href="#questionSound<?= $rows ?>" data-toggle="modal" class="btn btn-info pull-right"><i class="fa fa-play"></i> Putar Suara</a>
							<div class="modal fade" id="questionSound<?= $rows ?>">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title">Dengarkan baik baik</h4>
										</div>
										<div class="modal-body">
											<audio style="width:100%" src="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$value->question_sound) ?>"></audio>
										</div>
									</div>
								</div>
							</div>
							<br /><br />
						<?php endif ?>
						<div class="line"></div>
						<!-- OPTION -->
						<?php include('optionList.php') ?>
						<!-- END OPTION -->
					</div>
				<?php else: ?>
					<div class="col-sm-7">
						<span style="color:black !important;font-size:17px"><?= $value->question_ ?></span>
						<br />
						<?php if ($value->question_sound != ''): ?>
							<a href="#questionSound<?= $rows ?>" data-toggle="modal" class="btn btn-info pull-right"><i class="fa fa-play"></i> Putar Suara</a>
							<div class="modal fade" id="questionSound<?= $rows ?>">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title">Dengarkan file suara untuk menjawab pertanyaan</h4>
										</div>
										<div class="modal-body">
											<audio style="width:100%" src="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$value->question_sound) ?>"></audio>
										</div>
									</div>
								</div>
							</div>
							<br /><br />
						<?php endif ?>
						<div class="line"></div>
						<!-- OPTION -->
						<?php include('optionList.php') ?>
						<!-- END OPTION -->
					</div>
					<div class="col-sm-4">
						<a data-fancybox="gallery" href="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$value->question_image) ?>"><img src="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$value->question_image) ?>" class="img-thumbnail"></a>
					</div>
				<?php endif ?>
			</div><!-- / Row -->
		<?php endforeach ?>
		<div class="col-sm-4 col-sm-offset-8">
			<hr />
			<center>
				<button type="button" id="prev" onclick="prevQuest()" class="btn btn-flat btn-default"><i class="fa fa-arrow-left"></i> Sebelumnya</button>
				<button type="button" id="next" onclick="nextQuest()" class="btn btn-flat btn-default">Selanjutnya <i class="fa fa-arrow-right"></i></button>
				<a id="finished" href="#finish" data-toggle="modal" class="btn btn-flat btn-block btn-primary"><i class="fa fa-check-square"></i> Kumpulkan!</a>
			</center>
		</div>
		<!-- MODAL FINISH -->
		<div class="modal fade" id="finish">
			<div class="modal-dialog " style="width:35%">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Apa anda sudah yakin dengan jawaban anda ?</h4>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary btn-flat btn-block"><i class="fa fa-check-square"></i> Ya, simpan jawaban saya!</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END MODAL FINISH -->
		</form>
	</div>
</div>

<!-- JAVASCRIPT -->
<script type="text/javascript">
	$(function() {
		var tQuestion = parseInt($("#totalQuestion").val());
		if (tQuestion > 1) {
			$("#finished").hide();
			$("#prev").hide();
		} else {
			$("#finished").show();
			$("#next").hide();
			$("#prev").hide();
		};
		$("#buttonNavigation0").removeClass('btn-default');
		$("#buttonNavigation0").addClass('btn-own');
	});
	function nextQuest() {
		var questNow = parseInt($("#questNow").val());
		var total = parseInt($("#totalQuestion").val());
		questNow++;
		if (questNow >= (parseInt(total) - 1)) {
			$("#finished").show();
			$("#next").hide();
			$("#prev").hide();
		} else {
			$("#prev").show();
		};
		openQuestion(questNow);
		$("#questNow").val(questNow);
	}
		function clearButton() {
			var total = $("#totalQuestion").val();
			for (var i = 0; i <= parseInt(total); i++) {
				$("#buttonNavigation"+i).addClass('btn-default');
				$("#buttonNavigation"+i).removeClass('btn-own');
			};
		}
	function prevQuest() {
		var questNow = parseInt($("#questNow").val());
		questNow--;
		if (questNow === 0) {
			$("#finished").hide();
			$("#prev").hide();
			$("#next").show();
		} else {
			$("#finished").hide();
		};
		openQuestion(questNow);
		$("#questNow").val(questNow);
	}
	function openQuestion(rows) {
		var total = $("#totalQuestion").val();
		for (var i = 0; i <= parseInt(total); i++) {
			$("#question"+i).hide();

			// BUTTON VAL //
			if ($("#buttonNavigation"+i).hasClass('btn-success')) {

			} else {
				$("#buttonNavigation"+i).removeClass('btn-own');
				$("#buttonNavigation"+i).addClass('btn-default');
			};
		};

		// SECOND BUTTON VAL //
		if ($("#buttonNavigation"+rows).hasClass('btn-success')) {} else {
			$("#buttonNavigation"+rows).removeClass('btn-default');
			$("#buttonNavigation"+rows).addClass('btn-own');
		}
		// END SECOND BUTTON VAL //
		$("#question"+rows).show();

		// NEXT PREV VAL //
		if (parseInt(rows) === parseInt(total - 1)) {
			$("#next").hide();
			$("#prev").hide();
			$("#finished").show();
		} else if(parseInt(rows) === 0) {
			$("#finished").hide();
			$("#prev").hide();
			$("#next").show();
		} else {
			$("#finished").hide();
			$("#next").show();
			$("#prev").show();
		};
		$("#questNow").val(rows);
	}
	function answered(rows) {
		$("#buttonNavigation"+rows).removeClass('btn-default');
		$("#buttonNavigation"+rows).removeClass('btn-own');
		$("#buttonNavigation"+rows).addClass('btn-success');
	}
</script>
<script src="<?= base_url('assets/fancy/jquery.fancybox.min.js') ?>" type="text/javascript"></script>