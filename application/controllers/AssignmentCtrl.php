<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use PhpOffice\PhpSpreadsheet\IOFactory;

class AssignmentCtrl extends MY_Controller {

	public function index() {
		redirect('page/assignments');
	}
	public function create() {
	// 	print_r(json_encode($classes));
	// die();
		
		try {
			if (!$this->input->post()) {
				redirect('page/create');
			}
			$classes 	= ($this->input->post('id_class') && count($this->input->post('id_class')) > 0) ? $this->input->post('id_class') : null;	
			$categories = $this->input->post('category');
			$students 	= $this->master->getAllStudentByClass($classes);
			$password	= $this->input->post('password');
			$duration	= 0;
			$total_soal	= 0;
			$data 		= $this->input->post();
			unset($data['show_report']);
			unset($data['show_analytic']);
			unset($data['id_class']);
			unset($data['category']);
			unset($data['password']);
			if (isset($data['public'])) {
				unset($data['public']);
			}
			if ($this->input->post('show_analytic')) {
				$data['show_analytic'] = 1;
			}
			if ($this->input->post('show_report')) {
				$data['show_report'] = 1;
			}
			$data['id_'] = $this->session->userdata('id_');
			$data['author_'] = $this->session->userdata('level');
			$data['assignment_created'] = date('Y-m-d H:i:s');
			$data['assignment_active'] = 1;
			$dirName = date('s').'-'.substr(sha1($data['id_']), 4,7).'-'.$data['id_'];
			if (!is_dir('assets/images/assignments/'.$dirName)) {
				mkdir('./assets/images/assignments/' . $dirName, 0777, TRUE);
			}
			$data['assignment_path'] = $dirName;
			$idAssignment = $this->assignment->insertAssignment($data);

			foreach ($categories as $key => $category) {
				$categ = [
					'id_assignment'	=> $idAssignment,
					'id_category'	=> $category['id'],
					'status'		=> 0,
				];

				$id_categories = $this->assignment->insertAssignmentCategory($categ);

				// ASSIGNMENT SUBTEST
				foreach ($category['sub'] as $k => $cat) {
					$duration += $cat['timer'];
					$total_soal += $cat['question_qty'];

					$sub = [
						'id_assignment'	=> $idAssignment,
						'id_category'	=> $id_categories,
						'id_subtest'	=> $cat['id'],
						'qty_soal'		=> $cat['question_qty'],
						'timer'			=> $cat['timer'] * 60,
						'status'		=> 0,
					];

					$this->assignment->insertAssignmentDetailSubtest($sub);
				}
			}
			
			// STUDENT //
			foreach ($students as $key => $student) {
				$input_student = [
					'id_assignment'	=> $idAssignment,
					'id_student'	=> $student->id_student,
					'duration'		=> $duration,
					'total_soal'	=> $total_soal,
					'password'		=> mt_rand(1000000, 9999999),
					'status'		=> 0
				];

				$id_begin = $this->assignment->insertBegin($input_student);

				foreach ($categories as $key => $category) {
					$categ = [
						'id_begin'		=> $id_begin,
						'id_category'	=> $category['id'],
						'status'		=> 0,
						'order'		=> $category['order'],
					];

					$id_begin_cat = $this->assignment->insertAssignmentBeginCategory($categ);

					// ASSIGNMENT SUBTEST
					foreach ($category['sub'] as $k => $cat) {

						$sub = [
							'id_begin'		=> $id_begin,
							'id_begin_cat'	=> $id_begin_cat,
							'id_subtest'	=> $cat['id'],
							'qty_soal'		=> $cat['question_qty'],
							'timer'			=> $cat['timer'] * 60,
							'status'		=> 0,
							'status'		=> 0,
							'total_soal'	=> 0,
							'order'			=> $cat['order'],
						];

						$this->assignment->insertAssignmentBeginSubtest($sub);
					}
				}
			}

			// CLASS //
			if ($classes == null) {
				$classes = $this->master->getAllClass();
			}

			foreach ($classes as $key => $class) {
				$input_class = [
					'id_assignment'	=> $idAssignment,
					'id_class'		=> $class->id_class != null ? $class->id_class : $class
				];

				$this->assignment->insertAssignmentClass($input_class);
			}

			$this->message('Selamat!','Data ujian berhasil di simpan, silahkan buat soal untuk melanjutkan','success');
			redirect('page/assignments/');
		} catch (Exception $e) {
			// Tangani pengecualian di sini
			$this->message('Error','Terjadi kesalahan: ' . $e->getMessage(),'error');
			// Redirect atau tampilkan pesan kesalahan sesuai dengan kebutuhan Anda.
			redirect('page/create');
		}
	}

	public function update() {
		if (!$this->input->post()) {
			redirect('page/assignments');
		}
		$data = $this->input->post();
		unset($data['show_report']);
		unset($data['show_analytic']);
		unset($data['id_class']);
		if ($this->input->post('show_analytic')) {
			$data['show_analytic'] = 1;
		} else {
			$data['show_analytic'] = 0;
		}
		if ($this->input->post('show_report')) {
			$data['show_report'] = 1;
		} else {
			$data['show_report'] = 0;
		}
		$this->assignment->updateAssignment($data);
		
		// CLASS //
		foreach ($this->assignment->getClassByAssignment($this->input->post('id_assignment')) as $r => $v) {
			$valDel = true;
			foreach ($this->input->post('id_class') as $row => $value) {
				if ($value == $v->id_class) {
					$valDel = false;
				}
			}
			if ($valDel) {
				$this->assignment->deleteAssignmentClassId($v->id_aclass);
			}
		}
		foreach ($this->input->post('id_class') as $_row => $_value) {
			$valIns = true;
			foreach ($this->assignment->getClassByAssignment($this->input->post('id_assignment')) as $_r => $_v) {
				if ($_v->id_class == $_value) {
					$valIns = false;
				}
			}
			if ($valIns) {
				$single = [
					'id_assignment' => $this->input->post('id_assignment'),
					'id_class' => $_value
				];
				$this->assignment->insertAssignmentClass($single);
			}
		}
		$this->message('Selamat!','Data ujian berhasil di ubah','success');
		redirect('page/edit/'.$this->input->post('id_assignment'));
	}

	public function create_question() {
		// print_r(json_encode($this->input->post()));
		// die();
		try {
			$type = $this->input->post('id_type');
		
			if ($this->input->post('question_') == '') {
				$this->message('Ooppsss','Anda belum membuat soal, pastikan anda membuat soal terlebih dahulu','error');
				redirect('page/create_question/'.$this->input->post('id_assignment'));
			}
			$dataQuestion = [
				'id_lesson' => $this->input->post('id_lesson'),
				'id_sub' 	=> $this->input->post('id_sub'),
				'id_type' 	=> $type,
				'question_' => $this->input->post('question_'),
				'timer' 	=> 0,
				'question_level' => $this->input->post('id_level'),
				'question_created' => date('Y-m-d H:i:s')
			];

			// IMAGE QUESTION //
			if (isset($_FILES['question_image']['name']) && $_FILES['question_image']['name']) {
				$this->imageConf('assignments/'.$this->input->post('assignment_path')); // Validation image
				if(!$this->upload->do_upload('question_image')) :
					$this->message('Oopppsss',$this->upload->display_errors(),'error');
					redirect('page/create_question/'.$this->input->post('id_assignment'));
				else :
					$dataUpload = $this->upload->data();
					$dataQuestion['question_image'] = str_replace(' ', '_', $dataUpload['file_name']);
					// COMPRESS IMAGE //
					$resolution = ['width' => 500, 'height' => 500];
					$this->compreesImage('assignments/'.$this->input->post('assignment_path'),$dataUpload['file_name'],$resolution);
				endif;
			} // IMAGE QUESTION //
			// SOUND QUESTION //
			if (isset($_FILES['question_sound']['name']) && $_FILES['question_sound']['name']) {
				$this->soundConf('assignments/'.$this->input->post('assignment_path')); // Validation image
				if(!$this->upload->do_upload('question_sound')) :
					$this->message('Oopppsss',$this->upload->display_errors(),'error');
					redirect('page/create_question/'.$this->input->post('id_assignment'));
				else :
					$dataUpload = $this->upload->data();
					$dataQuestion['question_sound'] = str_replace(' ', '_', $dataUpload['file_name']);
				endif;
			} // SOUND QUESTION //
			$idQuestion = $this->assignment->insertQuestion($dataQuestion);
			// FOR OPTION //
			if ($type == 1) {
				$this->optionsBenarSalah($this->input->post('answer'), $idQuestion);
			} else if ( $type == 2 || $type == 4) {
				$answers 			= json_decode($this->input->post('JSONanswer'));
				$assignment_path 	= $this->input->post('assignment_path');
				$choosedAnswer 		= $this->input->post('choosedAnswer');
				$choosedAnswer 		= explode(",", $choosedAnswer[0]);
				foreach ($answers as $row => $value) {
					$option = $this->input->post('option_'.$value->row);
					$this->optionsBerganda($value, $idQuestion, $option, $assignment_path, $choosedAnswer);
				}
			}else if ( $type == 3){
				$this->answerIsianSingkat($this->input->post('answer'), $idQuestion);
			}else if ($type == 5){
				$answers 			= json_decode($this->input->post('JSONanswer'));
				$assignment_path 	= $this->input->post('assignment_path');
				foreach ($answers as $row => $value) {
					$option = $this->input->post('option_'.$value->row);
					$answer = $this->input->post('answer_'.$value->row);
					$this->optionsMatch($value, $idQuestion, $option, $assignment_path, $answer);
				}
			}else if ($type == 6){
				$answers 			= json_decode($this->input->post('JSONanswer'));
				$assignment_path 	= $this->input->post('assignment_path');
				foreach ($answers as $row => $value) {
					$option = $this->input->post('option_'.$value->row);
					$answer = $this->input->post('answer_'.$value->row);
					print_r(json_encode($answer));
					$this->optionsBenarSalahMajemuk($value, $idQuestion, $option, $assignment_path, $answer);
				}
			}
			$this->message('Yeeayy!','Soal dan jawaban berhasil disimpan :)','success');
			redirect('page/bank/'.$this->input->post('id_assignment'));
		} catch (\Throwable $th) {
			$this->message('Error', 'Terjadi kesalahan: ' . $e->getMessage(), 'error');
        	redirect('page/bank/'.$this->input->post('id_assignment'));	
		}
	}
	public function edit_question($id) {
		// print_r(json_encode($this->input->post()));
		// die();
		try {
			$type = $this->input->post('id_type');
		
			if ($this->input->post('question_') == '') {
				$this->message('Ooppsss','Anda belum membuat soal, pastikan anda membuat soal terlebih dahulu','error');
				redirect('page/create_question/'.$this->input->post('id_assignment'));
			}
			$dataQuestion = [
				'id_question' => $id,
				'id_lesson' => $this->input->post('id_lesson'),
				'id_sub' 	=> $this->input->post('id_sub'),
				'id_type' 	=> $type,
				'question_' => $this->input->post('question_'),
				'timer' 	=> 0,
				'question_level' => $this->input->post('id_level'),
				'question_created' => date('Y-m-d H:i:s')
			];

			// IMAGE QUESTION //
			if (isset($_FILES['question_image']['name']) && $_FILES['question_image']['name']) {
				$this->imageConf('assignments/'.$this->input->post('assignment_path')); // Validation image
				if(!$this->upload->do_upload('question_image')) :
					$this->message('Oopppsss',$this->upload->display_errors(),'error');
					redirect('page/create_question/'.$this->input->post('id_assignment'));
				else :
					$dataUpload = $this->upload->data();
					$dataQuestion['question_image'] = str_replace(' ', '_', $dataUpload['file_name']);
					// COMPRESS IMAGE //
					$resolution = ['width' => 500, 'height' => 500];
					$this->compreesImage('assignments/'.$this->input->post('assignment_path'),$dataUpload['file_name'],$resolution);
				endif;
			} // IMAGE QUESTION //
			// SOUND QUESTION //
			if (isset($_FILES['question_sound']['name']) && $_FILES['question_sound']['name']) {
				$this->soundConf('assignments/'.$this->input->post('assignment_path')); // Validation image
				if(!$this->upload->do_upload('question_sound')) :
					$this->message('Oopppsss',$this->upload->display_errors(),'error');
					redirect('page/create_question/'.$this->input->post('id_assignment'));
				else :
					$dataUpload = $this->upload->data();
					$dataQuestion['question_sound'] = str_replace(' ', '_', $dataUpload['file_name']);
				endif;
			} // SOUND QUESTION //
			$idQuestion = $this->assignment->updateQuestion($dataQuestion);
			// FOR OPTION //
			if ($type == 1) {
				$this->optionsBenarSalah($this->input->post('answer'), $id, $this->input->post('id_option'));
			} else if ( $type == 2 || $type == 4) {

				$this->db->where('id_question', $id);
				$questionOption = $this->db->update('question_option', ['option_hide' => 1]);

				$answers 			= json_decode($this->input->post('JSONanswer'));
				$assignment_path 	= $this->input->post('assignment_path');
				$choosedAnswer 		= $this->input->post('choosedAnswer');
				$choosedAnswer 		= explode(",", $choosedAnswer[0]);
				foreach ($answers as $row => $value) {
					$option = $this->input->post('option_'.$value->row);
					$this->optionsBergandaUpdate($value, $id, $option, $assignment_path, $choosedAnswer);
				}

				$this->db->where('id_question', $id);
				$this->db->where('option_hide',1);
				$this->db->delete('question_option');
			}else if ( $type == 3){
				$this->answerIsianSingkat($this->input->post('answer'), $id, $this->input->post('id_option'));
			}else if ($type == 5){

				$this->db->where('id_question', $id);
				$questionOption = $this->db->update('question_match', ['option_hide' => 1]);

				$answers 			= json_decode($this->input->post('JSONanswer'));
				$assignment_path 	= $this->input->post('assignment_path');
				foreach ($answers as $row => $value) {

					$option = $this->input->post('option_'.$value->row);
					$answer = $this->input->post('answer_'.$value->row);

					$this->db->where('id_match', $answer['id']);
					$questionOption = $this->db->update('question_match_answer', ['option_hide' => 1]);

					$this->optionsMatchUpdate($value, $id, $option, $assignment_path, $answer);

					$this->db->where('id_match', $answer['id']);
					$this->db->where('option_hide',1);
					$this->db->delete('question_match_answer');
				}

				$this->db->where('id_question', $id);
				$this->db->where('option_hide',1);
				$this->db->delete('question_match');
			}else if ($type == 6){

				$this->db->where('id_question', $id);
				$questionOption = $this->db->update('question_option', ['option_hide' => 1]);

				$answers 			= json_decode($this->input->post('JSONanswer'));
				$assignment_path 	= $this->input->post('assignment_path');
				foreach ($answers as $row => $value) {

					$option = $this->input->post('option_'.$value->row);
					$answer = $this->input->post('answer_'.$value->row);

					$this->optionsBenarSalahMajemukUpdate($value, $id, $option, $assignment_path, $answer);
				}

				$this->db->where('id_question', $id);
				$this->db->where('option_hide',1);
				$this->db->delete('question_option');
			}
			$this->message('Yeeayy!','Soal dan jawaban berhasil diedit :)','success');
			redirect('page/bank/'.$this->input->post('id_assignment'));
		} catch (\Throwable $th) {
			$this->message('Error', 'Terjadi kesalahan: ' . $e->getMessage(), 'error');
        	redirect('page/bank/'.$this->input->post('id_assignment'));	
		}
	}
	public function updateQuestion() {
		if ($this->input->post('question_') == '') {
			$this->message('Ooppsss','Anda belum membuat soal, pastikan anda membuat soal terlebih dahulu','error');
			redirect('page/update_question/'.$this->input->post('id_assignment').'/'.$this->input->post('id_question'));
		}
		$dataQuestion = [
			'id_sub' => $this->input->post('id_question'),
			'id_level' => $this->input->post('id_level'),
			'question_' => $this->input->post('question_'),
			'question_created' => date('Y-m-d H:i:s')
		];
		// IMAGE QUESTION //
		if ($_FILES['question_image']['name']) {
			$this->imageConf('assignments/'.$this->input->post('assignment_path')); // Validation image
            if(!$this->upload->do_upload('question_image')) :
                $this->message('Oopppsss',$this->upload->display_errors(),'error');
            	redirect('page/update_question/'.$this->input->post('id_assignment').'/'.$this->input->post('id_question'));
            else :
            	$dataUpload = $this->upload->data();
            	$dataQuestion['question_image'] = str_replace(' ', '_', $dataUpload['file_name']);
            	// COMPRESS IMAGE //
            	$resolution = ['width' => 500, 'height' => 500];
	            $this->compreesImage('assignments/'.$this->input->post('assignment_path'),$dataUpload['file_name'],$resolution);
            endif;
		} // IMAGE QUESTION //
		// SOUND QUESTION //
		if ($_FILES['question_sound']['name']) {
			$this->soundConf('assignments/'.$this->input->post('assignment_path')); // Validation image
            if(!$this->upload->do_upload('question_sound')) :
                $this->message('Oopppsss',$this->upload->display_errors(),'error');
            	redirect('page/update_question/'.$this->input->post('id_assignment').'/'.$this->input->post('id_question'));
            else :
            	$dataUpload = $this->upload->data();
            	$dataQuestion['question_sound'] = str_replace(' ', '_', $dataUpload['file_name']);
            endif;
		} // SOUND QUESTION //
		$this->assignment->updateQuestion($dataQuestion);
		// FOR OPTION //
		foreach (json_decode($this->input->post('JSONanswer')) as $row => $value) {
			$answer = [
				'id_question' => $this->input->post('id_question'),
				'option_' => $this->input->post('option_'.$value->row),
				'option_created' => date('Y-m-d H:i:s')
			];
			if ($value->row == $this->input->post('choosedAnswer')) {
				$answer['option_true'] = 1;
			}
			// IMAGE OPTION //
			if ($_FILES['option_image'.$value->row]['name']) {
				$this->imageConf('assignments/'.$this->input->post('assignment_path')); // Validation image
	            if(!$this->upload->do_upload('option_image'.$value->row)) :
	                $this->message('Oopppsss','Unggah jawaban nomor '.($value->row + 1).' gagal, detail -> '.$this->upload->display_errors(),'error');
	            	redirect('page/update_question/'.$this->input->post('id_assignment').'/'.$this->input->post('id_question'));
	            else :
	            	$dataUpload = $this->upload->data();
	            	$answer['option_image'] = str_replace(' ', '_', $dataUpload['file_name']);
	            	// COMPRESS IMAGE //
	            	$resolution = ['width' => 500, 'height' => 500];
		            $this->compreesImage('assignments/'.$this->input->post('assignment_path'),$dataUpload['file_name'],$resolution);
	            endif;
			} // END IMAGE OPTION //
			if ($this->input->post('id_option'.$row)) {
				$answer['id_option'] = $this->input->post('id_option'.$row);
				unset($answer['option_created']);
				$this->assignment->updateOption($answer);
			} else {
				$this->assignment->insertOption($answer);
			}
		}
		$this->message('Yeeayy!','Soal dan jawaban berhasil diubah :)','success');
		redirect('page/update_question/'.$this->input->post('id_assignment').'/'.$this->input->post('id_question'));
	}

	public function optionsBenarSalah($answer, $idQuestion, $id_option = null){
		$data = [
			'id_question'    => $idQuestion,
			'option_'        => ($answer == "true") ? 'Benar' : 'Salah',
			'option_true'    => ($answer == "true") ? 1 : 0,
			'option_created' => date('Y-m-d H:i:s')
		];
	
		try {
			if ($id_option) {
				unset($data['option_created']);
				$data['option_updated'] = date('Y-m-d H:i:s');
				$data['id_option'] = $id_option;
				$updateResult = $this->assignment->updateOption($data);
				if ($updateResult === false) {
					return false; // Jika insert gagal, fungsi akan mengembalikan false
				}
			}else{
				$insertResult = $this->assignment->insertOption($data);
				if ($insertResult === false) {
					return false; // Jika insert gagal, fungsi akan mengembalikan false
				}
			}
	
			return true; // Jika insert berhasil
		} catch (Exception $e) {
			return false; // Jika terjadi kesalahan, fungsi akan mengembalikan false
		}
	}

	public function answerIsianSingkat($answer, $idQuestion, $id_option = null){
		$data = [
			'id_question'    => $idQuestion,
			'answer'        => $answer,
			'option_created' => date('Y-m-d H:i:s')
		];
	
		try {
			if ($id_option) {
				unset($data['option_created']);
				$data['option_updated'] = date('Y-m-d H:i:s');
				$data['id_option'] = $id_option;

				// print_r(json_encode($data));
				// die();
				$updateResult = $this->assignment->updateAnswer($data);
				if ($updateResult === false) {
					return false; // Jika insert gagal, fungsi akan mengembalikan false
				}
			}else{
				$insertResult = $this->assignment->insertAnswer($data);
				if ($insertResult === false) {
					return false; // Jika insert gagal, fungsi akan mengembalikan false
				}
			}
	
			return true; // Jika insert berhasil
		} catch (Exception $e) {
			return false; // Jika terjadi kesalahan, fungsi akan mengembalikan false
		}
	}

	public function optionsBerganda($value, $idQuestion, $option, $assignment_path, $choosedAnswer){

		$answer = [
			'id_question'		=> $idQuestion,
			'option_'			=> $option,
			'option_created' 	=> date('Y-m-d H:i:s')
		];

		if (in_array($value->row, $choosedAnswer)) {
			$answer['option_true'] = 1;
		}

		try {
			// IMAGE OPTION //
			if (isset($_FILES['option_image'.$value->row]['name']) && $_FILES['option_image'.$value->row]['name']) {
				$this->imageConf('assignments/'.$assignment_path); // Validation image
				if(!$this->upload->do_upload('option_image'.$value->row)) :
					$this->message('Oopppsss','Unggah jawaban nomor '.($value->row + 1).' gagal, detail -> '.$this->upload->display_errors(),'error');
					redirect('page/create_question/'.$this->input->post('id_assignment'));
				else :
					$dataUpload = $this->upload->data();
					$answer['option_image'] = str_replace(' ', '_', $dataUpload['file_name']);
					// COMPRESS IMAGE //
					$resolution = ['width' => 500, 'height' => 500];
					$this->compreesImage('assignments/'.$assignment_path,$dataUpload['file_name'],$resolution);
				endif;
			} // END IMAGE OPTION //
			$insertResult = $this->assignment->insertOption($answer);

			if ($insertResult === false) {
				return false; // Jika insert gagal, fungsi akan mengembalikan false
			}
	
			return true; // Jika insert berhasil
		} catch (Exception $e) {
			return false; // Jika terjadi kesalahan, fungsi akan mengembalikan false
		}
		
	}

	public function optionsBergandaUpdate($value, $idQuestion, $option, $assignment_path, $choosedAnswer){

		$answer = [
			'id_question'		=> $idQuestion,
			'id_option'			=> $option['id'],
			'option_'			=> $option['name'],
			'option_hide'		=> 0,
			'option_updated' 	=> date('Y-m-d H:i:s')
		];

		if (in_array($value->row, $choosedAnswer)) {
			$answer['option_true'] = 1;
		}

		try {
			// IMAGE OPTION //
			if (isset($_FILES['option_image'.$value->row]['name']) && $_FILES['option_image'.$value->row]['name']) {
				$this->imageConf('assignments/'.$assignment_path); // Validation image
				if(!$this->upload->do_upload('option_image'.$value->row)) :
					$this->message('Oopppsss','Unggah jawaban nomor '.($value->row + 1).' gagal, detail -> '.$this->upload->display_errors(),'error');
					redirect('page/create_question/'.$this->input->post('id_assignment'));
				else :
					$dataUpload = $this->upload->data();
					$answer['option_image'] = str_replace(' ', '_', $dataUpload['file_name']);
					// COMPRESS IMAGE //
					$resolution = ['width' => 500, 'height' => 500];
					$this->compreesImage('assignments/'.$assignment_path,$dataUpload['file_name'],$resolution);
				endif;
			} // END IMAGE OPTION //

			if ($answer['id_option']) {
				$insertResult = $this->assignment->updateOption($answer);
			}else{
				$answer['option_created'] = date('Y-m-d H:i:s');
				unset($data['option_updated']);
				$insertResult = $this->assignment->insertOption($answer);
			}

			if ($insertResult === false) {
				return false; // Jika insert gagal, fungsi akan mengembalikan false
			}
	
			return true; // Jika insert berhasil
		} catch (Exception $e) {
			return false; // Jika terjadi kesalahan, fungsi akan mengembalikan false
		}
		
	}

	public function optionsMatch($value, $idQuestion, $option, $assignment_path, $answerMatch){

		$answer = [
			'id_question'		=> $idQuestion,
			'option_'			=> $option,
			'option_created' 	=> date('Y-m-d H:i:s')
		];

		try {
			// IMAGE OPTION //
			if (isset($_FILES['option_image'.$value->row]['name']) && $_FILES['option_image'.$value->row]['name']) {
				$this->imageConf('assignments/'.$assignment_path); // Validation image
				if(!$this->upload->do_upload('option_image'.$value->row)) :
					$this->message('Oopppsss','Unggah jawaban nomor '.($value->row + 1).' gagal, detail -> '.$this->upload->display_errors(),'error');
					redirect('page/create_question/'.$this->input->post('id_assignment'));
				else :
					$dataUpload = $this->upload->data();
					$answer['option_image'] = str_replace(' ', '_', $dataUpload['file_name']);
					// COMPRESS IMAGE //
					$resolution = ['width' => 500, 'height' => 500];
					$this->compreesImage('assignments/'.$assignment_path,$dataUpload['file_name'],$resolution);
				endif;
			} // END IMAGE OPTION //
			$insertResult = $this->assignment->insertMatch($answer);

			if ($insertResult === false) {
				return false; // Jika insert gagal, fungsi akan mengembalikan false
			}
			
			$match = [
				'id_match'			=> $insertResult,
				'answer_'			=> $answerMatch,
				'option_true'		=> 1,
				'option_created' 	=> date('Y-m-d H:i:s')
			];

			$insertMatchResult = $this->assignment->insertMatchAnswer($match);


			if ($insertMatchResult === false) {
				return false; // Jika insert gagal, fungsi akan mengembalikan false
			}
	
			return true; // Jika insert berhasil
		} catch (Exception $e) {
			return false; // Jika terjadi kesalahan, fungsi akan mengembalikan false
		}
		
	}

	public function optionsMatchUpdate($value, $idQuestion, $option, $assignment_path, $answerMatch){

		$answer = [
			'id_question'		=> $idQuestion,
			'option_'			=> $option['name'],
			'id_option'			=> $option['id'],
			'option_hide'		=> 0,
			'option_updated' 	=> date('Y-m-d H:i:s')
		];

		try {
			// IMAGE OPTION //
			if (isset($_FILES['option_image'.$value->row]['name']) && $_FILES['option_image'.$value->row]['name']) {
				$this->imageConf('assignments/'.$assignment_path); // Validation image
				if(!$this->upload->do_upload('option_image'.$value->row)) :
					$this->message('Oopppsss','Unggah jawaban nomor '.($value->row + 1).' gagal, detail -> '.$this->upload->display_errors(),'error');
					redirect('page/create_question/'.$this->input->post('id_assignment'));
				else :
					$dataUpload = $this->upload->data();
					$answer['option_image'] = str_replace(' ', '_', $dataUpload['file_name']);
					// COMPRESS IMAGE //
					$resolution = ['width' => 500, 'height' => 500];
					$this->compreesImage('assignments/'.$assignment_path,$dataUpload['file_name'],$resolution);
				endif;
			} // END IMAGE OPTION //

			if ($answer['id_option']) {
				$insertResult = $this->assignment->updateMatch($answer);
			}else{
				$answer['option_created'] = date('Y-m-d H:i:s');
				unset($data['option_updated']);
				$insertResult = $this->assignment->insertMatch($answer);
			}

			if ($insertResult === false) {
				return false; // Jika insert gagal, fungsi akan mengembalikan false
			}
			
			$match = [
				'id_match'			=> $insertResult,
				'answer_'			=> $answerMatch['name'],
				'option_true'		=> 1,
				'option_created' 	=> date('Y-m-d H:i:s')
			];

			if ($answerMatch['id']) {
				$match['id_option'] = $answerMatch['id'];
				$match['id_match'] = $option['id'];
				$match['option_hide'] = 0;
				unset($match['option_created']);
				$match['option_updated'] = date('Y-m-d H:i:s');

				// print_r(json_encode($match));
				// die();
				$insertMatchResult = $this->assignment->updateMatchAnswer($match);
			}else{
				unset($data['option_updated']);
				$insertMatchResult = $this->assignment->insertMatchAnswer($match);
			}

			if ($insertMatchResult === false) {
				return false; // Jika insert gagal, fungsi akan mengembalikan false
			}
	
			return true; // Jika insert berhasil
		} catch (Exception $e) {
			return false; // Jika terjadi kesalahan, fungsi akan mengembalikan false
		}
		
	}

	public function optionsBenarSalahMajemuk($value, $idQuestion, $option, $assignment_path, $answerMatch){

		$answer = [
			'id_question'		=> $idQuestion,
			'option_'			=> $option,
			'option_true'		=> ($answerMatch == "true") ? 1 : 0,
			'option_created' 	=> date('Y-m-d H:i:s')
		];

		try {
			// IMAGE OPTION //
			if (isset($_FILES['option_image'.$value->row]['name']) && $_FILES['option_image'.$value->row]['name']) {
				$this->imageConf('assignments/'.$assignment_path); // Validation image
				if(!$this->upload->do_upload('option_image'.$value->row)) :
					$this->message('Oopppsss','Unggah jawaban nomor '.($value->row + 1).' gagal, detail -> '.$this->upload->display_errors(),'error');
					redirect('page/create_question/'.$this->input->post('id_assignment'));
				else :
					$dataUpload = $this->upload->data();
					$answer['option_image'] = str_replace(' ', '_', $dataUpload['file_name']);
					// COMPRESS IMAGE //
					$resolution = ['width' => 500, 'height' => 500];
					$this->compreesImage('assignments/'.$assignment_path,$dataUpload['file_name'],$resolution);
				endif;
			} // END IMAGE OPTION //
			$insertResult = $this->assignment->insertOption($answer);

			if ($insertResult === false) {
				return false; // Jika insert gagal, fungsi akan mengembalikan false
			}
	
			return true; // Jika insert berhasil
		} catch (Exception $e) {
			return false; // Jika terjadi kesalahan, fungsi akan mengembalikan false
		}
		
	}

	public function optionsBenarSalahMajemukUpdate($value, $idQuestion, $option, $assignment_path, $answerMatch){

		$answer = [
			'id_question'		=> $idQuestion,
			'option_'			=> $option['name'],
			'id_option'			=> $option['id'],
			'option_true'		=> ($answerMatch == "true") ? 1 : 0,
			'option_hide'		=> 0,
			'option_updated' 	=> date('Y-m-d H:i:s')
		];

		try {
			// IMAGE OPTION //
			if (isset($_FILES['option_image'.$value->row]['name']) && $_FILES['option_image'.$value->row]['name']) {
				$this->imageConf('assignments/'.$assignment_path); // Validation image
				if(!$this->upload->do_upload('option_image'.$value->row)) :
					$this->message('Oopppsss','Unggah jawaban nomor '.($value->row + 1).' gagal, detail -> '.$this->upload->display_errors(),'error');
					redirect('page/create_question/'.$this->input->post('id_assignment'));
				else :
					$dataUpload = $this->upload->data();
					$answer['option_image'] = str_replace(' ', '_', $dataUpload['file_name']);
					// COMPRESS IMAGE //
					$resolution = ['width' => 500, 'height' => 500];
					$this->compreesImage('assignments/'.$assignment_path,$dataUpload['file_name'],$resolution);
				endif;
			} // END IMAGE OPTION //

			if ($answer['id_option']) {
				$insertResult = $this->assignment->updateOption($answer);
			}else{
				$answer['option_created'] = date('Y-m-d H:i:s');
				unset($data['option_updated']);
				$insertResult = $this->assignment->insertOption($answer);
			}

			if ($insertResult === false) {
				return false; // Jika insert gagal, fungsi akan mengembalikan false
			}
	
			return true; // Jika insert berhasil
		} catch (Exception $e) {
			return false; // Jika terjadi kesalahan, fungsi akan mengembalikan false
		}
		
	}

	public function removeQuestion($id_question = NULL, $id_assignment = NULL) {
		if (!$id_question OR !$id_assignment) {
			redirect('page/assignments');
		}
		$dataQuestion = $this->assignment->getQuestionById($id_question);
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataQuestion OR !$dataAssignment) {
			redirect('page/assignments');
		}
		$forQuestion = [
			'id_question' => $id_question,
			'question_hide' => 1
		];
		$this->assignment->updateQuestion($forQuestion);
		$forAssignmetnQuestion = [
			'id_assignment' => $id_assignment,
			'id_question' => $id_question,
			'val_hide' => 1
		];
		$this->assignment->updateAssignmentQuestion($forAssignmetnQuestion);
		$this->message('Yeeayy!','Soal yang anda pilih berhasil dihapus :)','success');
		redirect('page/list_question/'.$id_assignment);
	}
	public function deleteAssignment($id_assignment = NULL) {
		if (!$id_assignment) {
			redirect('page/assignments');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataAssignment) {
			redirect('page/assignments');
		}
		$data = [
			'id_assignment' => $id_assignment,
			'assignment_hide' => 1
		];
		$this->assignment->updateAssignment($data);
		$this->message('Sukses!','Data ujian berhasil dihapus :)','success');
		redirect('page/assignments');
	}
	public function deleteQuestion($id_question = NULL) {
		if (!$id_question) {
			redirect('page/bank');
		}
		$dataQuestion = $this->assignment->getQuestionById($id_question);
		if (!$dataQuestion) {
			redirect('page/bank');
		}
		$data = [
			'id_question' => $id_question,
			'question_hide' => 1
		];
		$this->assignment->updateQuestion($data);
		$this->message('Sukses!','Data ujian berhasil dihapus :)','success');
		redirect('page/bank');
	}
	public function nonAktiveAssignment($id_assignment = NULL) {
		if (!$id_assignment) {
			redirect('page/assignments');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataAssignment) {
			redirect('page/assignments');
		}
		$data = [
			'id_assignment' => $id_assignment,
			'assignment_active' => 0
		];
		$this->assignment->updateAssignment($data);
		$this->message('Sukses!','Data ujian berhasil dinonaktifkan :)','success');
		redirect('page/assignments');
	}
	public function aktiveAssignment($id_assignment = NULL) {
		if (!$id_assignment) {
			redirect('page/assignments');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataAssignment) {
			redirect('page/assignments');
		}
		$data = [
			'id_assignment' => $id_assignment,
			'assignment_active' => 1
		];
		$this->assignment->updateAssignment($data);
		$this->message('Sukses!','Data ujian berhasil diaktifkan :)','success');
		redirect('page/assignments');
	}

	// AJAX //
	public function changeStatusAssignment($id_assignment,$status) {
		if ($status == 2) {
			$status = 0;
		}
		$data = [
			'id_assignment' => $id_assignment,
			'assignment_active' => $status,
		];
		$totalAssignment = 0;
		foreach ($this->assignment->getAllAssignment() as $row => $value) {
			if ($value->assignment_active == 1) {
				$totalAssignment++;
			}
		}
		if ($totalAssignment >= 10 AND $status == 1) {
			echo "limit";
		} else {
			$this->assignment->updateAssignment($data);
			return true;
		}
	}

	public function import_excel() {
		$path = './assets/import_soal_by_excel/';
		$config['upload_path'] = $path;
		$config['allowed_types'] = 'xls|xlsx';
		$config['max_size'] = 2048;
	
		$this->load->library('upload', $config);
	
		if (!$this->upload->do_upload('userfile')) {
			$error = array('error' => $this->upload->display_errors());
			// Handle error
			print_r($error);
		} else {
			$file_data = $this->upload->data();
			$file_path = $path . $file_data['file_name'];
			require_once FCPATH . 'vendor/autoload.php';
	
			// Baca data dari file excel dan impor ke database
			if ($this->_importExcelToDatabase($file_path)) {
				$this->message('Yeeayy!','Soal dan jawaban berhasil disimpan :)','success');
			} else {
				$this->message('Maaf..','Mungkin ada data yang tidak valid :)','error');
			}
		}

		redirect('page/bank');
	}
	

	public function _importExcelToDatabase($file_path){
		try {
			$spreadsheet = IOFactory::load($file_path);
			$worksheet = $spreadsheet->getActiveSheet();
			$data = $worksheet->toArray(null, true, true, true);
			
			// Anda perlu menyesuaikan bagian ini sesuai dengan struktur Excel Anda dan database Anda
			$keys = array_keys($data[13]);
	
			foreach ($data as $key => $row) {
				if ($key >= 13) {
					$dataRow = [
						'question_' 		=> $row['B'],
						'id_sub'			=> (int) $this->master->getSubtestName($row['C'])->id_sub,
						'id_lesson'			=> (int) $this->master->getLessontName($row['D'])->id_lesson,
						'question_level' 	=> (int) $row['F'],
						'timer' 			=> (int) $row['E'],
						'id_type' 			=> (int) $data[8]['A'],
						'question_created' 	=> date('Y-m-d'),
					];
	
					// Insert pertanyaan dan dapatkan ID pertanyaan baru
					$questionId = $this->assignment->insertQuestion($dataRow);
	
					for ($i = 0; $i < count($keys); $i += 2) {
						if (!in_array($keys[$i], ['A', 'B', 'C', 'D', 'E', 'F'])) {
							$answer = $row[$keys[$i]];
							$is_correct = $row[$keys[$i + 1]];
					
							if ($answer !== null && $is_correct !== null) {
								if ((int) $data[8]['A'] == 1) {
									$pair = [
										'id_question' 		=> $questionId,
										'option_' 			=> $answer,
										'option_true' 		=> $is_correct,
										'option_created' 	=> date('Y-m-d'),
									];
									// Insert pilihan jawaban ke dalam database
									$this->assignment->insertOption($pair);
								} else if ((int) $data[8]['A'] == 2 || (int) $data[8]['A'] == 4 || (int) $data[8]['A'] == 6) {
									$pair = [
										'id_question' 		=> $questionId,
										'option_' 			=> $answer,
										'option_true' 		=> $is_correct,
										'option_created' 	=> date('Y-m-d'),
									];
									// Insert pilihan jawaban ke dalam database
									$this->assignment->insertOption($pair);
								} else if ((int) $data[8]['A'] == 3) {
									$pair = [
										'id_question' 		=> $questionId,
										'answer' 			=> $answer,
										'option_created' 	=> date('Y-m-d'),
									];
									// Insert pilihan jawaban ke dalam database
									$this->assignment->insertAnswer($pair);
								} else if ((int) $data[8]['A'] == 5) {
									$pair = [
										'id_question' 		=> $questionId,
										'option_' 			=> $answer,
										'option_created' 	=> date('Y-m-d'),
									];
									// Insert pilihan jawaban ke dalam database
									$insertResult = $this->assignment->insertMatch($pair);

									$match = [
										'id_match' 			=> $insertResult,
										'answer_' 			=> $is_correct,
										'option_created' 	=> date('Y-m-d'),
									];

									$this->assignment->insertMatchAnswer($match);
								} 
	
							}
						}
					}				
	
				}
			}
	
			return true;
		} catch (\Throwable $th) {
			// Tangani kesalahan di sini
			return false;
		}
	}	

	public function getAssignmentAndStudent($id){

		$assignment = $this->assignment->getAssignmenBegintWithRelation($id);
		$students = $this->master->getStudents();

		$response = [
			'status' => 'success',
			'message' => 'Data berhasil diambil',
			'assignment' => $assignment,
			'students' => $students,
		];
		$this->output
				->set_content_type('application/json')
				->set_output(json_encode($response));
	}

	public function addStudentAssignment(){

		if (json_decode($this->input->post('student'), true) == []){
			// Jika terjadi error, kirim respons error
			$response = [
				'status' => 'error',
				'message' => 'Anda belum memilih murid',
				'error' => 'error'
			];
	
			// Mengirim respons JSON
			$this->output
				->set_status_header(400)
				->set_content_type('application/json')
				->set_output(json_encode($response));

			return;
		}

		$students = json_decode($this->input->post('student'), true);
		$assignment = json_decode($this->input->post('assignment'), true);

		try{
			// STUDENT //
			foreach ($students as $key => $student) {
				$input_student = [
					'id_assignment'	=> $assignment['id_assignment'],
					'id_student'	=> $student['id'],
					'duration'		=> $assignment['duration'],
					'total_soal'	=> $assignment['total_soal'],
					'password'		=> mt_rand(1000000, 9999999),
					'status'		=> 0
				];

				$id_begin = $this->assignment->insertBegin($input_student);

				foreach ($assignment['categories'] as $key => $category) {
					$categ = [
						'id_begin'		=> $id_begin,
						'id_category'	=> $category['id_category'],
						'status'		=> 0,
						'order'			=> $category['order'],
					];

					$id_begin_cat = $this->assignment->insertAssignmentBeginCategory($categ);

					// ASSIGNMENT SUBTEST
					foreach ($category['subtest'] as $k => $sub) {
						$sub = [
							'id_begin'		=> $id_begin,
							'id_begin_cat'	=> $id_begin_cat,
							'id_subtest'	=> $sub['id_subtest'],
							'qty_soal'		=> $sub['qty_soal'],
							'timer'			=> $sub['timer'],
							'status'		=> 0,
							'total_soal'	=> 0,
							'order'			=> $sub['order'],
						];

						$this->assignment->insertAssignmentBeginSubtest($sub);
					}
				}
			}

			$response = [
				'status' => 'success',
				'message' => 'Data berhasil diambil',
				'student' => $student,
				'assignment' => $assignment,
			];
			$this->output
					->set_content_type('application/json')
					->set_output(json_encode($response));
		} catch (\Exception $e) {

			// Jika terjadi error, kirim respons error
			$response = [
				'status' => 'error',
				'message' => 'Terjadi kesalahan saat menambahkan data siswa ke assignment.',
				'error' => $e->getMessage()
			];
	
			// Mengirim respons JSON
			$this->output
				->set_content_type('application/json')
				->set_output(json_encode($response));
		}
	}

}

/* End of file AssignmentCtrl.php */
/* Location: ./application/controllers/AssignmentCtrl.php */