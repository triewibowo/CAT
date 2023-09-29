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
							<img src="image.jpg" id="image-question" alt="Image description" style="height:350px; margin-bottom:45px;">
							<!-- <p style="font-size:12px; margin-bottom:10px" class="container mb-0">Read the sentence carefully then choose the most correct answer.</p> -->
							<div id="question-container" class="cat-question">
							<div id="question" style="margin-bottom:15px;"></div>
							<hr>
							<div id="answer-options" class="cat-answer"></div><br>
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
					<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
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

	<!-- MODAL CATEGORY -->
	<div class="modal fade" id="continue">
		<div class="modal-dialog " style="width:35%">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
					<h4 class="modal-title">Lanjut ke subtes selanjutnya!</h4>
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
					<button id="continue" class="btn btn-primary btn-flat btn-block"><i class="fa fa-check-square"></i> Lanjutkan!</button>
				</div>
			</div>
		</div>
	</div>

	<!-- MODAL SELESAI -->
	<div class="modal fade" id="done_exam">
		<div class="modal-dialog " style="width:35%">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
					<h4 class="modal-title">Selamat!</h4>
				</div>
				<div class="modal-body">
					<p>Kamu telah selesai mengerjakan Ujian ini!</p>
				</div>
				<div class="modal-footer">
					<a href="<?= site_url('exam/lists/') ?>" class="btn btn-primary btn-block"><i class="fa fa-check-square"></i> Ok!</a>
				</div>
			</div>
		</div>
	</div>

<!-- JAVASCRIPT -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#image-question').hide();
		rollSubtest();
        $('#start').modal('show');
    });
	
	// VARIABLE
	var duration;
	var timer;
	var totalSeconds;
	var isTrue;
	var ready_category 	= [];
	var ready_subtest	= [];
	var ready_question	= [];
	var params			= [];
	var level 			= 3;
	var answer_user 	= [];
	let qty 			= 0;
	let begin_status 	= <?php echo json_encode($dataAssignments->status); ?>;
	let id_begin 		= <?php echo json_encode($dataAssignments->id_abegin); ?>;
	let id_student 		= <?php echo json_encode($dataAssignments->id_student); ?>;
	var	exams 			= <?php echo json_encode($dataAssignments->assignment); ?>;

	$('#start').on('click', function() {
        // set interval for every second
		getQuestion();
		updateProgress();
        $('#start').modal('hide');
    });

	$('#continue').on('click', function() {
        // set interval for every second
		getQuestion();
		updateProgress();
        $('#continue').modal('hide');
    });
	
	function rollSubtest(){
		console.log(begin_status)
		if (begin_status != 2) {
			exams.categories.forEach(exam_category => {
				if(exam_category.status != 2){
					if(ready_category.length == 0){
						ready_category = exam_category;
						exam_category.subtests.forEach(sub => {
							if(sub.status != 2){
								if (ready_subtest.length == 0) {
									ready_subtest = sub;
									qty = parseInt(sub.total_soal);
									duration = parseInt(sub.timer);
								}
							}
						});
					}
				}
			});
			params = {
				'subtest'		: ready_subtest,
				'level' 		: level,
				'qty'			: qty,
				'id_begin'		: id_begin,
				'id_student'	: id_student
			};
			timer = setInterval(setTime, 1000);
			totalSeconds = duration * 60;
			var title_ujian = document.getElementById("title-ujian");
			title_ujian.innerHTML = "Ujian : " + ready_category.category.cat_name + ' - ' + ready_subtest.subtest.sub_name;
		}else{
			$('#done_exam').modal('show');
		}
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
			params = {
				'subtest'		: ready_subtest,
				'question'		: ready_question.id_question,
				'is_true' 		: isTrue,
				'time_off' 		: true,
				'qty'			: qty,
				'duration'		: totalSeconds / 60,
				'id_begin'		: id_begin,
				'id_student'	: id_student,
				'id_category'	: ready_category.id_category
			};
			getQuestion();
        }
    }

	function nextQuestion(){
		console.log(qty)
		qty += 1;
		console.log(qty)
		checkAnswer(answer_user);
		params = {
			'subtest'		: ready_subtest,
			'question'		: ready_question.id_question,
			'is_true' 		: isTrue,
			'level' 		: level,
			'qty'			: qty,
			'duration'		: totalSeconds / 60,
			'id_begin'		: id_begin,
			'id_student'	: id_student,
			'id_category'	: ready_category.id_category
		};
		getQuestion();
		updateProgress();
	}

	function updateProgress(){
		var persentase	= (qty / ready_subtest.qty_soal) * 100;
		var progressBar = $(".progress-bar");
		progressBar.attr("aria-valuemax", ready_subtest.qty_soal);
		progressBar.css("width", Math.ceil(persentase) + "%");

		var progressValue = $(".progress-bar-value");
		progressValue.text(Math.ceil(persentase) + "%");
		progressBar.attr("aria-valuenow", persentase);
	}

	function resetProgress(){
		progressBar.attr("aria-valuemax", 0);
		progressBar.css("width", 0 + "%");

		var progressValue = $(".progress-bar-value");
		progressValue.text(0 + "%");
		progressBar.attr("aria-valuenow", 0);
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
				ready_question 			= response.data;
				exams 					= response.exams.assignment;
				id_begin 				= response.exams.id_abegin;
				id_student 				= response.exams.id_student;
				qty						= parseInt(response.subtest.total_soal);
				ready_subtest.status   	= parseInt(response.subtest.status);
				begin_status			= response.exams.status;
				if(response.subtest_status == true){
					params = [];
					ready_category 	= [];
					ready_subtest	= [];
					ready_question	= [];
					answer_user		= [];
					qty				= 0;
					rollSubtest();
					if (begin_status != 2) {
						$('#continue').modal('show');
					}
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

	// SOAL DAN JAWABAN
	function showQuestion(){
		// Mendapatkan elemen dari HTML
		const questionElement = $('#question');
		const answerOptionsElement = $('#answer-options');
		const previousButtonElement = $('#previous-button');
		const nextButtonElement = $('#next-button');

		if (ready_question == null) {
			$('#answer-options').show();
			questionElement.text("Tidak ada soal...");
		}else{
			$('#answer-options').show();
			questionElement.html(((qty == 0) ? '1' : (qty + 1)) + '. ' + ready_question.question_);
		
			if (ready_question.question_image) {
				$('#image-question').show();
				$('#image-question').attr('src', '<?php echo base_url() ?>' + "assets/images/assignments/" + ready_question.question_image);
			}else{
				$('#image-question').hide();
			}
		
			// Menampilkan opsi jawaban
			answerOptionsElement.empty();

			if (ready_question.id_type == 2) {
				for (let i = 0; i < ready_question.answer.length; i++) {
					const answerOption = $('<div class="custom-radio">')
						.addClass('form-check radio mb-3')
						.attr('data-index', i)
						.on('click', () => inputAnswer(ready_question.answer[i].id_option));

					const input = $('<input type="radio" style="margin-left: 2% !important; margin-top:2%">')
						.addClass('')
						.attr('name', 'answer')
						.attr('id', 'answer' + i)
						.attr('value', ready_question.answer[i].id_option);

					const label = $('<label class="btn btn-default btn-block mb-0" style="padding-left:40px !important; text-align:left">')
						.attr('for', 'answer' + i)
						.html(ready_question.answer[i].option_);

					if (ready_question.answer[i].option_image) {
						const img = $('<img style="height:190px; margin-bottom:1rem">')
							.attr('src', '<?php echo base_url() ?>' + "assets/images/assignments/" + ready_question.answer[i].option_image)
							.addClass('answer-image');
						
						answerOption.append(input).append(img).append(label);

						// Mengaitkan label dengan input radio
						label.on('click', () => input.prop('checked', true));
						img.on('click', () => input.prop('checked', true));
					} else {
						answerOption.append(input).append(label);
						label.on('click', () => input.prop('checked', true));
					}

					label.on('click', function() {
						// Hapus kelas "active" dari semua label sebelumnya
						$('label.btn').removeClass('active');
						
						// Tandai label yang dipilih sebagai "active"
						$(this).addClass('active');

						// Setel radio button yang sesuai sebagai "checked"
						input.prop('checked', true);

						// Panggil fungsi inputAnswer dengan nilai yang sesuai
						inputAnswer(ready_question.answer[i].id_option);
					});

					answerOptionsElement.append(answerOption);
				}
			}else if (ready_question.id_type == 1){
				for (let i = 0; i < 2; i++) {
					const answerOption = $('<div class="custom-radio form-check radio mb-3">')
						.attr('data-index', i)
						.on('click', () => inputAnswer(i));

					const input = $('<input type="radio">')
						.addClass('form-check-input')
						.attr('name', 'answer')
						.attr('id', 'answer' + i)
						.attr('value', i)
						.css('margin-left', '2%')
						.css('margin-top', '2%');

					const label = $('<label class="btn btn-default btn-block mb-0">')
						.attr('for', 'answer' + i)
						.css('padding-left', '40px')
						.css('text-align', 'left')
						.text(i === 1 ? 'Benar' : 'Salah');

					label.on('click', function () {
						// Hapus kelas "active" dari semua label sebelumnya
						$('label.btn').removeClass('active');

						// Tandai label yang dipilih sebagai "active"
						$(this).addClass('active');

						// Setel radio button yang sesuai sebagai "checked"
						input.prop('checked', true);

						// Panggil fungsi inputAnswer dengan nilai yang sesuai
						if (ready_question.answer[i]) {
							inputAnswer(ready_question.answer[i].id_option);
						}else{
							inputAnswer(null);
						}
					});

					answerOption.append(input).append(label);

					answerOptionsElement.append(answerOption);
				}
			}else if (ready_question.id_type == 4){
				for (let i = 0; i < ready_question.answer.length; i++) {
					const label = $('<label class="btn btn-default btn-block" style="text-align:left">');
					
					const input = $('<input type="checkbox" style="margin-right:2%">')
						.attr('name', 'answer' + ready_question.id_question)
						.attr('value', ready_question.answer[i].id_option)
						.addClass('custom-checkbox'); // Tambahkan kelas "custom-checkbox" untuk gaya kustom checkbox
					
					const labelText = ready_question.answer[i].option_;

					if (ready_question.answer[i].option_image) {
						const img = $('<img style="height:190px; margin-botttom:1rem">') // Menggunakan margin-right untuk memberi jarak ke kanan
							.attr('src', '<?php echo base_url() ?>' + "assets/images/assignments/" + ready_question.answer[i].option_image)
							.addClass('answer-image');
						
						label.append(img).append(input).append(labelText); // Mengubah urutan elemen
					} else {
						label.append(input).append(labelText);
					}

					label.on('click', function() {
						// Toggling checkbox ketika label diklik
						input.prop('checked', !input.prop('checked'));

						// Panggil fungsi inputAnswer dengan nilai yang sesuai
						inputAnswer(ready_question.answer[i].id_option);
						
						// Mengubah warna saat checkbox di klik
						if (input.prop('checked')) {
							label.addClass('active');
						} else {
							label.removeClass('active');
						}
					});

					answerOptionsElement.append(label);
				}
			}else if (ready_question.id_type == 3){
				const answerOption = $('<div class="form-check mb-3 pl-0" style="width:100%">');
				const input = $('<input type="text" style="font-size:13px;">')
					.addClass('form-control')
					.attr('name', 'answer-match-text' + ready_question.id_question)
					.attr('placeholder', 'Jawaban')
					.attr('id', 'answer')
					.on('input', () => inputAnswer(ready_question.answer[0].answer)); // Gunakan 'input' event untuk memantau perubahan nilai input

					answerOption.append(input);
					answerOptionsElement.append(answerOption);
			}else if (ready_question.id_type == 5){
				const optionText = ready_question;

				for (let i = 0; i < optionText.answer.length; i++) {
					const answerOption = $('<div class="row" style="margin-bottom:10px">');
					
					const label = $('<div class="col-sm-6">')
						.append($('<label class="btn btn-default btn-block" style="text-align:left">')
							.html(optionText.answer[i].option_));

					const select = $('<div class="col-sm-6">')
						.append($('<select style="width:100%; font-size:12px">')
							.addClass('form-control value-select')
							.attr('name', 'answer-match-' + optionText.answer[i].id_option)
							.append(
								$('<option selected disabled style="font-size:12px">')
								.text('Select answer...')
							)
						);

					for (let j = 0; j < optionText.match.length; j++) {
						const option = $('<option style="font-size:12px">')
							.attr('value', optionText.match[j].id_match)
							.html(optionText.match[j].answer_);

						select.find('select').append(option);
					}

					select.find('select').on('change', () => {
						const selectedValue = select.find('select').val();
						const answer = {
							answer: optionText.answer[i],
							matchAnswer: optionText.match.find(item => item.id_match == selectedValue),
							indexLoop: i
						};
						inputAnswer(answer);
					});

					answerOption.append(label);
					answerOption.append(select);
					answerOptionsElement.append(answerOption);
				}
			}
		}
	}

	function inputAnswer(id){
		if (ready_question.id_type == 1 || ready_question.id_type == 2) {
			answer_user = id;
		}
		else if (ready_question.id_type == 4) {
			const selectedAnswers = [];

			// Dapatkan semua input yang dicentang
			const checkboxes = $(`input[name="answer${ready_question.id_question}"]:checked`);
			checkboxes.each(function () {
				let answer = ready_question.answer.find(answer => answer.id_option == $(this).val());
				selectedAnswers.push(answer);
			});

			answer_user = selectedAnswers;

		}else if (ready_question.id_type == 3){
			let user_input = $(`input[name="answer-match-text${ready_question.id_question}"]`).val(); // Mendapatkan nilai input teks
			answer_user = user_input;
		}else{
			var index = -1;
			answer_user.push(id);
			// Cari indeks di mana id cocok dalam array
			if (answer_user.length > 0) {
			   index = answer_user.findIndex(item => item.answer.id_option == id.answer.id_option);
			}

			// Periksa jika id cocok ditemukan
			if (index !== -1) {
				// Hapus objek yang cocok dari array
				answer_user.splice(index, 1);
			}
		}
	}

	function checkAnswer(input){
		if (ready_question.id_type == 2) {
			let check_answer = ready_question.answer.find(answer => answer.id_option == input);
			if (check_answer.option_true == 1) {
				if (level < 5) {
					level += 1;
					isTrue = 1;
				}
				console.log("benar")
			}else{
				if (level > 1) {
					level -= 1;
					isTrue = 0;
				}
				console.log("salah")
			}
		}
		else if (ready_question.id_type == 1) {
			let check_answer = ready_question.answer[0].option_true;
			if (check_answer == input) {
				if (level < 5) {
					level += 1;
					isTrue = 1;
				}
				console.log("benar")
			}else{
				if (level > 1) {
					level -= 1;
					isTrue = 0;
				}
				console.log("salah")
			}
		}
		else if (ready_question.id_type == 4) {
			const selectedAnswers = [];
			var answer_true = [];

			ready_question.answer.forEach(element => {
				if (element.option_true == 1) {
					answer_true.push(element)
				}
			});

			const hasilValidasi = majemukValidationAnswer(answer_true, answer_user);

			if (hasilValidasi) {
				if (level < 5) {
					level += 1;
					isTrue = 1;
				}
				console.log("benar")
			}else{
				if (level > 1) {
					level -= 1;
					isTrue = 0;
				}
				console.log("salah")
			}

		}else if (ready_question.id_type == 3){// Mendapatkan nilai input teks
			let check_answer = ready_question.answer[0].answer;

			if (answer_user == check_answer) {
				if (level < 5) {
					level += 1;
					isTrue = 1;
				}
				console.log("benar")
			}else{
				if (level > 1) {
					level -= 1;
					isTrue = 0;
				}
				console.log("salah")
			}
		}else{
			var isFalse = false;
			input.forEach(element => {
				if (element.answer.match.id_match != element.matchAnswer.id_match) {
					isFalse = true;
				}
			});

			if (!isFalse) {
				if (level < 5) {
					level += 1;
					isTrue = 1;
				}
				console.log("benar")
			}else{
				if (level > 1) {
					level -= 1;
					isTrue = 0;
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
		font-size: 16px;
		font-weight: 600;
	}

	.cat-answer{
		font-size: 13px;
	}

	#next-button{
		margin-top: 3%;
		height: 32px;
		width: 100%;
		left: 198px;
		top: 505px;
		border-radius: 6px;
		background: #1F3DBD;
		color: white;
	}

	.btn.active {
		background-color: #13C3E3; /* Gantilah dengan warna yang Anda inginkan saat aktif */
		color: #fff; /* Warna teks saat aktif */
	}

	.draggable-list {
            list-style: none;
            padding: 0;
        }

        .draggable-item {
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            padding: 10px;
            margin: 5px 0;
            cursor: pointer;
        }

        .droppable-list {
            list-style: none;
            padding: 0;
        }

        .droppable-item {
            background-color: #e0e0e0;
            border: 1px solid #ccc;
            padding: 10px;
            margin: 5px 0;
        }

</style>
