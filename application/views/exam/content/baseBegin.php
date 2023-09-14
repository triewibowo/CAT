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

<div class="panel panel-info">
	<div class="panel-heading" style="background-color:#13C3E3">
		<div class="row">
			<div class="col-sm-8">
				<h3 class="panel-title" style="color:white">
					<i class="fa fa-edit"></i> <span id="title-ujian" style="display: inline-block; color:white">:</span> 
				</h3>
			</div>
			<div class="col-sm-4" style="padding-top:7px">
				<span class="pull-right">
					<div class="text-center">
						<p id="minutes" style="display: inline-block; color:white; font-size:16px"></p>
						<span style="display: inline-block; color:white">:</span>
						<p id="seconds" style="display: inline-block; color:white; font-size:16px"></p>
					</div>
				</span>
				<span class="pull-right"><i style="color:white; font-size:22px" class="fa fa-clock-o"></i> &nbsp;</span>
			</div>
		</div><!-- / Row -->
	</div>
	<div class="panel-body">
		<legend><i class="fa fa-list"></i> List Soal</legend>
		<div class="progress">
			<div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax=""></div>
			<div class="progress-bar-value">0%</div>
		</div>
		<div class="container" height="100%">
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<div class="panel">
						<div class="panel-body" style="padding: 1.5rem 5rem;background-color:#fbfbfb">
							<!-- SOAL -->
							<h3 style="margin-bottom:45px;" id="question-title"></h3>
							<img src="image.jpg" id="image-question" alt="Image description" style="width:902px; height:350px; margin-bottom:45px;">
							<!-- <p style="font-size:12px; margin-bottom:10px" class="container mb-0">Read the sentence carefully then choose the most correct answer.</p> -->
							<div id="question-container" class="cat-question">
							<div id="question" style="margin-bottom:35px;"></div>
							<hr>
							<div id="answer-options" class="cat-answer container"></div><br>
							<div class="center-button">
								<button id="next-button" onclick="nextQuestion()"><span style="font-size:12px; font-weight:600">Next</span></button>
							</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
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

	<!-- MODAL START -->
	<div class="modal fade" id="start">
		<div class="modal-dialog " style="width:35%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Selamat mengerjakan...</h4>
				</div>
				<div class="modal-body">
					<p>Perhatikan langkah dibawah ini!</p>
					<ul>
						<li>Siapkan perangkat anda dengan baik</li>
						<li>Soal tidak dapat diulang dan dilewati</li>
						<li>Pastikan untuk mengerjakan tepat waktu</li>
						<li>Bila waktu habis maka soal akan dilanjutkan ke Sub Tes selanjutnya, dst</li>
					</ul>
					<small>Jawablah dengan keyakinan anda sendiri</small>
				</div>
				<div class="modal-footer">
					<button id="start" class="btn btn-primary btn-flat btn-block"><i class="fa fa-check-square"></i> Ya, Mulai!</button>
				</div>
			</div>
		</div>
	</div>

<!-- JAVASCRIPT -->
<script type="text/javascript">
	$(document).ready(function() {
		console.log('start');
        $('#start').modal('show');
    });
	
	// VARIABLE
	var duration;
	var timer;
	var totalSeconds;
	var examUpdate	= [];
	var category 	= [];
	var subtest		= [];
	var question	= [];
	var params		= [];
	var level 		= 3;
	var answer_user = [];
	let qty 		= 0;
	let id_begin 	= <?php echo json_encode($dataAssignments->id_abegin); ?>;

	if (examUpdate.length == 0) {
		exams = <?php echo json_encode($dataAssignments->assignment); ?>;
	}else{
		exams = examUpdate;
	}

	var progressBar = $(".progress-bar");
  	progressBar.attr("aria-valuemax", exams.total_soal);
	progressBar.css("width", 60 + "%");

	var progressValue = $(".progress-bar-value");
    progressValue.text(60 + "%");
	progressBar.attr("aria-valuenow", 60);
	
	function rollSubtest(){
		exams.categories.forEach(exam => {
			if(exam.status != 2 && category.length <= 0){
				category = exam;
				exam.subtests.forEach(sub => {
					console.log(sub);
					if(sub.status != 2 && subtest.length == 0){
						subtest = sub;
						duration = parseInt(sub.timer);
					}
				});
			}
		});
		params = {
			'subtest'	: subtest,
			'id_sub' 	: subtest.id_subtest,
			'level' 	: level,
			'qty'		: qty,
			'id_begin'	: id_begin
		};
		timer = setInterval(setTime, 1000);
		totalSeconds = duration * 60;
		var title_ujian = document.getElementById("title-ujian");
		title_ujian.innerHTML = "Ujian : " + category.category.cat_name + ' - ' + subtest.subtest.sub_name;
	}

	function pad(val) {
        var valString = val + "";
        if (valString.length < 2) {
            return "0" + valString;
        } else {
            return valString;
        }
    }

	function setTime() {
        var minutesLabel = document.getElementById("minutes");
        var secondsLabel = document.getElementById("seconds");
        --totalSeconds;
        secondsLabel.innerHTML = pad(totalSeconds % 60);
        minutesLabel.innerHTML = pad(parseInt(totalSeconds / 60));
        if(totalSeconds == 0){
            clearInterval(timer);
        }
    }

	function nextQuestion(){
		qty += 1;
		checkAnswer(answer_user);
		params = {
			'subtest'	: subtest,
			'id_sub' 	: subtest.id_subtest,
			'level' 	: level,
			'qty'		: qty,
			'id_begin'	: id_begin
		};
		console.log(params);
		console.log(qty + "-" +subtest.qty_soal);
		getQuestion();
	}

	function getQuestion(status) {
		return new Promise(function(resolve, reject) {
			$.ajax({
			url: '<?= base_url('exam/getQuestion/') ?>',
			method: 'POST',
			data: {
				question: JSON.stringify(params)
			},
			dataType: 'json',
			success: function(response) {
				question = response.data;
				examUpdate = response.exams;
				subtest.status = response.subtest;
				console.log(exams);
				if(response.subtest_status == true){
					location.reload();
				}else{
					showQuestion();
				}
				resolve(); // Menggunakan resolve() untuk menandakan bahwa operasi telah selesai
			},
			error: function(xhr, status, error) {
				console.log(error);
				reject(error); // Menggunakan reject() untuk menandakan bahwa operasi gagal
			}
			});
		});
	}

	$('#start').on('click', function() {
        // set interval for every second
		rollSubtest();
		getQuestion();
        $('#start').modal('hide');
    });

	// SOAL DAN JAWABAN
	function showQuestion(){
		// Mendapatkan elemen dari HTML
		const questionElement = $('#question');
		const answerOptionsElement = $('#answer-options');
		const previousButtonElement = $('#previous-button');
		const nextButtonElement = $('#next-button');
	
		$('#answer-options').show();
		questionElement.text(question.question_);
	
		if (question.question_image) {
		    $('#image-question').show();
		    $('#image-question').attr('src', question.question_image);
		}else{
		    $('#image-question').hide();
		}
	
		// Menampilkan opsi jawaban
		answerOptionsElement.empty();

		if (question.id_type == 2) {
			for (let i = 0; i < question.answer.length; i++) 
			{
				const answerOption = $('<div class="form-check radio mb-3">');
				const input = $('<input type="radio">')
				.addClass('custom-radio form-check-input')
				.attr('name', 'answer')
				.attr('id', 'answer'+i)
				.attr('value', i)
				.on('change', () => inputAnswer(question.answer[i].id_option));
				const label = $('<label class="form-check-label mb-0" style="padding-left:0px !important">')
				.attr('for', 'answer'+i)
				.text(question.answer[i].option_);

				if (question.answer[i].option_image) {
					const img = $('<img style="width:300px; height:190px; margin-left:3rem">')
						.attr('src', question.answer[i].option_image)
						.addClass('answer-image');
					answerOption.append(input).append(img).append(label);

					// Mengaitkan label dengan input radio
					label.on('click', () => input.prop('checked', true));
					img.on('click', () => input.prop('checked', true));
				}else{
					answerOption.append(input).append(label);
					label.on('click', () => input.prop('checked', true));
				}

				answerOptionsElement.append(answerOption);
			}

    	}else if (question.id_type == 1){
			for (let i = 0; i < 2; i++) {
				const answerOption = $('<div class="form-check radio mb-3">');
				const input = $('<input type="radio">')
					.addClass('custom-radio form-check-input')
					.attr('name', 'answer')
					.attr('id', 'answer' + i)
					.attr('value', i)
					.on('change', () => inputAnswer(i)); // Gantilah 'inputAnswer' dengan fungsi yang sesuai

				const label = $('<label class="form-check-label mb-0" style="padding-left:0px !important">')
					.attr('for', 'answer' + i)
					.text(i === 1 ? 'Benar' : 'Salah'); // Mengganti opsi dengan 'Benar' dan 'Salah'

				answerOption.append(input).append(label);

				answerOptionsElement.append(answerOption);
			}
		}else if (question.id_type == 4){
			for (let i = 0; i < question.answer.length; i++) 
        	{
				const answerOption = $('<div class="form-check mb-3">');
				const input = $('<input type="checkbox">')
					.addClass('form-check-input')
					.addClass('custom-radio')
					.attr('name', 'answer' + question.id_question)
					.attr('id', 'answer' + i)
					.attr('value', question.answer[i].id_option)
					.on('change', () => inputAnswer(question.answer[i].id_option));
				const label = $('<label class="form-check-label" style="margin-left: 10px; font-weight:400 !important">')
					.attr('for', 'answer' + i)
					.text(question.answer[i].option_);

				if (question.answer[i].option_image) {
					const img = $('<img style="width:300px; height:190px; margin-left:3rem">')
						.attr('src', question.answers[i].option_image)
						.addClass('answer-image');
					answerOption.append(img).append(input).append(label);
				} else {
					answerOption.append(input).append(label);
				}
					answerOptionsElement.append(answerOption);
        	}
		}else if (question.id_type == 3){
			const answerOption = $('<div class="form-check mb-3 pl-0" style="width:30%">');
			const input = $('<input type="text" style="font-size:13px;">')
				.addClass('form-control')
				.attr('name', 'answer-match-text' + question.id_question)
				.attr('placeholder', 'Jawaban')
				.attr('id', 'answer')
				.on('input', () => inputAnswer(question.answer[0].answer)); // Gunakan 'input' event untuk memantau perubahan nilai input

				answerOption.append(input);
				answerOptionsElement.append(answerOption);
		}else if (question.id_type == 5){
			const optionText = question;

			for (let i = 0; i < optionText.answer.length; i++) 
			{
				const label = $('<label class="d-block">')
				.text(optionText.answer[i].option_ + ' - ');

				const select = $('<select style="width:50%; font-size:12px">')
				.addClass('custom-select')
				.attr('name', 'answer-match-' + optionText.id_question)
				.append(
					$('<option selected disabled style="font-size:12px">')
					.text('Select answer...')
				);

				for (let j = 0; j < optionText.match.length; j++) {
					const option = $('<option style="font-size:12px">')
					.attr('value', optionText.match[j].id_option)
					.text(optionText.match[j].answer_);

					select.append(option);
				}

				select.on('change', () => {
					const selectedValue = select.val(); // Mendapatkan nilai terpilih dari <select>
					const answer = {
						index: optionText.answer[i].id_option,
						id: selectedValue,
						indexLoop:i
					};
					checkAnswer(answer);
				});

				label.append(select);
				answerOptionsElement.append(label);
			}
		}
	}

	function inputAnswer(id){
		if (question.id_type == 1 || question.id_type == 2) {
			answer_user = id;
		}
		else if (question.id_type == 4) {
			const selectedAnswers = [];

			// Dapatkan semua input yang dicentang
			const checkboxes = $(`input[name="answer${question.id_question}"]:checked`);
			checkboxes.each(function () {
				let answer = question.answer.find(answer => answer.id_option == $(this).val());
				selectedAnswers.push(answer);
			});

			answer_user = selectedAnswers;

		}else if (question.id_type == 3){
			let user_input = $(`input[name="answer-match-text${question.id_question}"]`).val(); // Mendapatkan nilai input teks
			answer_user = user_input;
		}
	}

	function checkAnswer(input){
		if (question.id_type == 2) {
			let check_answer = question.answer.find(answer => answer.id_option == input);
			if (check_answer.option_true == 1) {
				if (level < 5) {
					level += 1;
				}
				console.log("benar")
			}else{
				if (level > 1) {
					level -= 1;
				}
				console.log("salah")
			}
		}
		else if (question.id_type == 1) {
			let check_answer = question.answer[0].option_true;
			if (check_answer == input) {
				if (level < 5) {
					level += 1;
				}
				console.log("benar")
			}else{
				if (level > 1) {
					level -= 1;
				}
				console.log("salah")
			}
		}
		else if (question.id_type == 4) {
			const selectedAnswers = [];
			var answer_true = [];

			question.answer.forEach(element => {
				if (element.option_true == 1) {
					answer_true.push(element)
				}
			});

			const hasilValidasi = majemukValidationAnswer(answer_true, answer_user);

			if (hasilValidasi) {
				if (level < 5) {
					level += 1;
				}
				console.log("benar")
			}else{
				if (level > 1) {
					level -= 1;
				}
				console.log("salah")
			}

		}else if (question.id_type == 3){// Mendapatkan nilai input teks
			let check_answer = question.answer[0].answer;

			if (answer_user == check_answer) {
				if (level < 5) {
					level += 1;
				}
				console.log("benar")
			}else{
				if (level > 1) {
					level -= 1;
				}
				console.log("salah")
			}
		}

	}
	
	function majemukValidationAnswer(arr1, arr2) {
		if (arr1.length !== arr2.length) {
			return false; // Jika panjang array berbeda, langsung kembalikan false
		}

		// Urutkan array berdasarkan id sebelum membandingkannya
		arr1.sort((a, b) => a.id_option - b.id_option);
		arr2.sort((a, b) => a.id_option - b.id_option);

		return arr1.every((item, index) => item.id_option === arr2[index].id_option);
	}
</script>
<script src="<?= base_url('assets/fancy/jquery.fancybox.min.js') ?>" type="text/javascript"></script>
<style>
	.cat-question{
		font-size: 14px;
		font-weight: 500;
	}

	.cat-answer{
		font-size: 13px;
	}

	.custom-radio {
		/* Ubah ukuran komponen radio */
		transform: scale(1.1);
		margin-right: 0.5rem;
		/* Tambahkan gaya lain yang diinginkan */
	}

	#next-button{
		height: 32px;
		width: 130px;
		left: 198px;
		top: 505px;
		border-radius: 6px;
		background: #1F3DBD;
		color: white;
	}

	.center-button {
		display: flex;
		justify-content: center; /* Ini akan menjadikan konten di tengah secara horizontal */
		align-items: center; /* Ini akan menjadikan konten di tengah secara vertikal */
		height: 100%; /* Sesuaikan dengan tinggi yang Anda inginkan */
	}

</style>