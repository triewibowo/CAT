<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ExamCtrl extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('AssignmentModel','assignment',TRUE);
		$this->load->model('MasterModel','master',TRUE);
		date_default_timezone_set('Asia/Jakarta');
		if (!$this->session->userdata('examToken')) {
			$this->session->sess_destroy();
			redirect('Auth/exam');
		}
	}
	public function message($title = NULL,$text = NULL,$type = NULL) {
		return $this->session->set_flashdata([
				'title' => $title,
				'text' => $text,
				'type' => $type
			]
		);
	}

	public $dataParse = [
		'navbar' => 'exam/inc/navbar',
		'title' => 'No title',
		'content' => ''
	];

	public function index() {
		redirect('exam/lists');
		// $this->dataParse['title'] = 'Dashboard - Boy Science Club';
		// $this->dataParse['content'] = 'exam/content/dashboard';
		// $this->load->view('MainExam',$this->dataParse);
	}
	public function lists() {
		$dataAssignments = [];
		$id = (int) $this->session->globalStudent->id_student;
		// foreach ($this->assignment->getAllAssignmentStudent() as $row => $value) {
		// 	$push = false;
		// 	foreach ($this->assignment->getClassByAssignment($value->id_assignment) as $r => $v) {
		// 		if ($v->id_class == $this->session->userdata('globalStudent')->id_class) {
		// 			$push = true;
		// 		}
		// 	}
		// 	if ($push) {
		// 		if ($value->assignment_active == 1) {
		// 			if (!$this->assignment->checkDoneAssignment($value->id_assignment,$this->session->userdata('globalStudent')->id_student)) {
		// 				array_push($dataAssignments, $value);
		// 			}
		// 		}
		// 	}
		// }
		// foreach ($dataAssignments as $r => $v) {
		// 	$dataAssignments[$r]->totalQuestion = count($this->assignment->getQuestionByAssignment($v->id_assignment));
		// }

		$this->dataParse['dataAssignments'] = $this->assignment->getExamByStudent($id);
		$this->dataParse['title'] = 'List Ujian';
		$this->dataParse['content'] = 'exam/content/lists';
		$this->load->view('MainExam',$this->dataParse);
	}
	public function beginExam($id_begin = NULL) {
		$id = (int) $this->session->globalStudent->id_student;

		$this->dataParse['dataAssignments'] = $this->assignment->getExamByAssignmentBegin($id_begin, $id);
		$this->dataParse['title'] = 'Mulai Ujian';
		$this->dataParse['content'] = 'exam/content/baseBegin';
		$this->load->view('MainExam',$this->dataParse);
	}
	public function begin($id_assignment = NULL) {
		if (!$id_assignment) {
			redirect('exam/lists');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataAssignment) {
			redirect('exam/lists');
		} else {
			$red = true;
			foreach ($this->assignment->getClassByAssignment($id_assignment) as $r => $v) {
				if ($v->id_class == $this->session->userdata('globalStudent')->id_class) {
					$red = false;
				}
			}
			if ($red) {
				redirect('exam/lists');
			}
		}
		$long = 0;
		$begin = [
			'id_assignment' => $id_assignment,
			'id_student' => $this->session->userdata('globalStudent')->id_student,
			'time_begin' => date('H:i')
		];
		$lastBegin = $this->assignment->checkBegin($begin);
		if ($lastBegin) {
			$to_time = strtotime(date("H:i:s"));
			$from_time = strtotime($lastBegin->time_begin);
			$long = round(abs($to_time - $from_time) / 60);
		} else {
			$this->assignment->insertBegin($begin);
		}
		$dataAssignment->questions = $this->assignment->getQuestionByAssignment($id_assignment,$dataAssignment->assignment_order);
		foreach ($dataAssignment->questions as $row => $value) {
			$dataAssignment->questions[$row]->options = $this->assignment->getOptionByQuestion($value->id_question);
		}
		$this->dataParse['long'] = $long;
		$this->dataParse['dataAssignment'] = $dataAssignment;
		$this->dataParse['title'] = 'Selamat Mengerjakan - Boy Science Club';
		$this->dataParse['content'] = 'exam/content/begin';
		$this->load->view('MainExam',$this->dataParse);
	}
	public function calculate() {
		$dataAssignment = $this->assignment->getAssignmentById($this->input->post('id_assignment'));
		$resultTrue = 0;
		$resultFalse = 0;
		$dataResult = [
			'id_assignment' => $this->input->post('id_assignment'),
			'id_student' => $this->session->userdata('globalStudent')->id_student,
			'result_created' => date('Y-m-d H:i:s')
		];
		foreach ($this->input->post('id_question') as $row => $value) {
			$option = $this->input->post('option'.$value);
			$option_char = $this->input->post('key_option'.$value.$this->input->post('option'.$value));
			if (!$option) {
				$option = '';
				$analytics_status = 'empty';
				$resultFalse++;
			}
			if (!$option_char) {
				$option_char = '';
			}
			if ($this->assignment->checkTrueOption($option)) {
				$analytics_status = 'true';
				$resultTrue++;
			} else {
				$analytics_status = 'false';
				$resultFalse++;
			}
			$forAnalytics = [
				'id_assignment' => $this->input->post('id_assignment'),
				'id_student' => $this->session->userdata('globalStudent')->id_student,
				'id_question' => $value,
				'id_option' => $option,
				'option_char' => $option_char,
				'analytics_status' => $analytics_status,
				'analytics_created' => date('Y-m-d H:i:s'),
			];
			$this->assignment->insertAssignmentAnalytics($forAnalytics);
		}
		// CONTINUE RESULT DATA //
		$dataResult['result_true'] = $resultTrue;
		$dataResult['result_false'] = $resultFalse;
		$finalScore = ($resultTrue / count($this->assignment->getQuestionByAssignment($this->input->post('id_assignment')))) * 100;
		if ($finalScore > 0) {
			$finalScore = ceil($finalScore);
		}
		$dataResult['result_score'] = $finalScore;
		$resultStatus = 'lulus';
		if ($finalScore < $dataAssignment->assignment_kkm) {
			$resultStatus = 'gagal';
		}
		$dataResult['result_status'] = $resultStatus;
		$this->assignment->insertAssignmentResult($dataResult);
		$this->assignment->deleteAssignmentBegin($dataAssignment->id_assignment,$this->session->userdata('globalStudent')->id_student); // DELETE BEGIN
		if ($dataAssignment->show_report == 1) {
			$this->message('Yeeaay!','Ujian berhasil dikumpulkan, anda bisa melihat hasilnya disini :)','success');
			redirect('exam/report/'.$dataAssignment->id_assignment);
		} else {
			$this->message('Yeeaay!','Ujian berhasil dikumpulkan, semoga hasilnya memuaskan :)','success');
			redirect('exam/lists');
		}
	}
	public function history() {
		$id = (int) $this->session->globalStudent->id_student;
		$dataAssignment = $this->assignment->getExamByStudentHistory($id);

		foreach ($dataAssignment as $key => $value) {
    		$value->total_questions = count($value->assign_answers); // Perbarui properti max_percent pada objek $value
			$value->total_correct = 0;
			$value->total_false = 0;
			foreach ($value->assign_answers as $k => $v) {
				if ($v->is_true == '1') {
					$value->total_correct++; // Perbarui properti value_percent pada objek $v
				}
				if($v->is_true == '0'){
					$value->total_false++; // Perbarui properti value_percent pada objek $v
				}
			}
			$value->points = round(($value->total_correct / count($value->assign_answers)) * 100, 1); // Perbarui properti value_percent pada objek $v
		}
		// print_r(json_encode($dataAssignment));
		// die();
		$this->dataParse['dataAssignment'] = $dataAssignment;
		$this->dataParse['title'] = 'Riwayat Ujian';
		$this->dataParse['content'] = 'exam/content/history';
		$this->load->view('MainExam',$this->dataParse);
	}
	// public function history() {
	// 	$dataAssignments = [];
	// 	foreach ($this->assignment->getResultByStudent($this->session->userdata('globalStudent')->id_student) as $row => $value) {
	// 		$assignment = $this->assignment->getAssignmentById($value->id_assignment);
	// 		$assignment->resultCreated = $value->result_created;
	// 		array_push($dataAssignments,$assignment);
	// 	}
	// 	foreach ($dataAssignments as $r => $v) {
	// 		$dataAssignments[$r]->totalQuestion = count($this->assignment->getQuestionByAssignment($v->id_assignment));
	// 	}
	// 	$this->dataParse['dataAssignments'] = $dataAssignments;
	// 	$this->dataParse['title'] = 'Riwayat Ujian - Boy Science Club';
	// 	$this->dataParse['content'] = 'exam/content/history';
	// 	$this->load->view('MainExam',$this->dataParse);
	// }
	public function report($id_assignment = NULL) {
		if (!$id_assignment) {
			redirect('exam');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$id_assignment) {
			redirect('exam');
		} elseif($dataAssignment->show_report != 1) {
			redirect('exam');
		}
		$dataResult = $this->assignment->getResultStudentById($id_assignment,$this->session->userdata('globalStudent')->id_student);
		$dataAnalytics = $this->assignment->getAnalyticsStudentById($id_assignment,$this->session->userdata('globalStudent')->id_student);
		foreach ($dataAnalytics as $_row => $_value) {
			$dataAnalytics[$_row]->studentChoosed = $this->assignment->getOptionById($_value->id_option);
			$dataAnalytics[$_row]->trueAnswer = $this->assignment->getTrueAnswerByQuestion($_value->id_question);
		}
		$this->dataParse['dataAssignment'] = $dataAssignment;
		$this->dataParse['dataResult'] = $dataResult;
		$this->dataParse['dataAnalytics'] = $dataAnalytics;
		$this->dataParse['title'] = 'Hasil Ujian - Boy Science Club';
		$this->dataParse['content'] = 'exam/content/report';
		$this->load->view('MainExam',$this->dataParse);
	}
	public function change_password() {
		if ($this->input->post()) {
			$data = $this->input->post();
			$data['student_password'] = crypt($this->input->post('student_password'),'');
			unset($data['old_password']);
			if (!password_verify($this->input->post('old_password'),$this->session->userdata('globalStudent')->student_password)) {
				$this->message('Wooopsss!','Password lama tidak sesuai dengan yang tersedia :(','error');
				redirect('exam/change_password');
			}
			$dataStudent = $this->master->getStudentById($data['id_student']);
			$this->master->updateStudent($data);
			$this->session->unset_userdata('globalStudent');
			$sess_ = [ 'globalStudent' => $dataStudent ];
			$this->session->set_userdata($sess_);
			$this->message('Yeeaay!','Password anda berhasil diubah :)','success');
			redirect('exam/lists');
		} else {
			$this->dataParse['title'] = 'Ubah Password - Boy Science Club';
			$this->dataParse['content'] = 'exam/content/change_password';
			$this->load->view('MainExam',$this->dataParse);
		}
	}

	// HANDLER //
	public function logout() {
		$this->session->unset_userdata('globalStudent');
		$this->session->unset_userdata('examToken');
		$this->message('','Silahkan login kembali untuk melanjutkan','success');
		redirect('Auth/exam');
	}

	public function getQuestion(){
		$data = json_decode($this->input->post('question'), true);
		$id = (int) $this->session->globalStudent->id_student;
		$id_sub = $data['subtest']['id_subtest'];
		$id_begin_cat = $data['subtest']['id_begin_cat'];
		$id_begin = $data['subtest']['id_begin'];
		$subtest = [];
		$assign_question_id = null;
		$subtest_status = 1;
		$soal = [];
		try{

			// Update total soal subtest ke proses
			$d = [
				'id' 			=> $data['subtest']['id'],
				'total_soal' 	=> $data['qty'],
				'timer' 		=> isset($data['duration']) ? $data['duration'] : $data['subtest']['timer'],
			];
			$subtest = $this->assignment->updateAssignmentBeginSubtest($d);

			// Update status subtest ke proses
			if($data['subtest']['status'] == 0){
				$d = [
					'id' => $data['subtest']['id'],
					'status' 	=> 1,
				];
				$this->assignment->updateAssignmentBeginSubtest($d);
				$subtest_status = 1;
			}

			
			// Update status subtest ke selesai
			if($data['subtest']['status'] == 1 && (int) $data['subtest']['qty_soal'] <= $data['qty'] || isset($data['time_off']) && $data['time_off']){
				$d = [
					'id' => $data['subtest']['id'],
					'status' 	=> 2,
				];
				$this->assignment->updateAssignmentBeginSubtest($d);
				$subtest_status = 2;
			}

			// Masukan Jawab Benar/Salah Siswa
			if(isset($data['is_true'])){
				$param = [
					'id_assign_begin' 			=> $data['id_begin'],
					'id_assign_begin_category' 	=> $id_begin_cat,
					'id_assign_begin_subtest' 	=> $data['subtest']['id'],
					'id_question' 				=> $data['question'],
					'is_true' 					=> $data['is_true'],
					'id_student' 				=> $data['id_student'],
					'created_at'				=> date('Y-m-d')
				];

				$assign_question_id = $this->assignment->insertAssignmentQuestionAnswer($param);
			}
			// check status category
			$this->updateStatusAssignmentBeginCategory($id_begin_cat);

			// check status assignment begin per student
			$this->updateStatusAssignmentBegin($id_begin);

			if (isset($data['question_type'])) {
				$this->insertAnswer($assign_question_id,$data);
			}

			if (isset($data['level'])) {
				// Ambil Soal yang sesuai subtest dan level
				$soal = $this->assignment->getQuestionSubtestLevel($id_sub, $data['level']);
			}

			$response = [
				'status' => 'success',
				'message' => 'Data soal berhasil diambil',
				'data' => $soal,
				'subtest' => $subtest,
				'exams' => $this->assignment->getExamByAssignmentBegin($data['id_begin'], $id),
				'subtest_status' => $subtest_status == 2 ? true : false,
				'qty_subtest' => (int) $data['subtest']['qty_soal'],
				'qty' => $data['qty'],
			];
			// Mengirim respons JSON
			$this->output
				->set_content_type('application/json')
				->set_output(json_encode($response));

		} catch (\Exception $e) {

			// Jika terjadi error, kirim respons error
			$response = [
				'status' => 'error',
				'message' => 'Terjadi kesalahan saat mengambil data',
				'error' => $e->getMessage()
			];
	
			// Mengirim respons JSON
			$this->output
				->set_content_type('application/json')
				->set_output(json_encode($response));
		}
	}

	public function insertAnswer($assign_question_id,$data){
		if (
			$data['question_type'] == 2 
		) {
			$params = [
				'assignment_question_id' => $assign_question_id,
				'answer_id' => $data['answer'],
			];

			$this->assignment->insertAssignmentAnswerSingle($params);
		}else if ($data['question_type'] == 4){
			foreach ($data['answer'] as $key => $value) {
				$params = [
					'assignment_question_id' => $assign_question_id,
					'answer_id' => $value['id_option'],
				];

				$this->assignment->insertAssignmentAnswerSingle($params);
			}
		}else if ($data['question_type'] == 3){
			$params = [
				'assignment_question_id' => $assign_question_id,
				'answer_text' => $data['answer'],
			];

			$this->assignment->insertAssignmentAnswerText($params);
		}else if ($data['question_type'] == 1){
			$params = [
				'assignment_question_id' => $assign_question_id,
				'answer_id' => $data['answer'],
			];

			$this->assignment->insertAssignmentAnswerSingle($params);
		}
		else if ($data['question_type'] == 5){
			foreach ($data['answer'] as $key => $value) {
				$params = [
					'assignment_question_id' => $assign_question_id,
					'answer_match_id' => $value['answer']['id_option'],
					'answer_match_option_id' => $value['matchAnswer']['id_option'],
				];

				$this->assignment->insertAssignmentAnswerMatch($params);
			}
		}
	}

	public function updateStatusAssignmentBeginCategory($id_begin_cat){
		$subtests_db = $this->assignment->getAllAssignmentBeginSubtest($id_begin_cat);
		if ($subtests_db) {
			$is_done = true; // Menginisialisasi $is_done ke true di awal

			foreach ($subtests_db as $sub) {
				if ($sub->status != 2) {
					$is_done = false;
					break; // Keluar dari loop jika status bukan 2
				}
			}

			if ($is_done) {
				// Update status kategori menjadi 2
				$d = [
					'id_acat' => $id_begin_cat,
					'status' => 2,
				];
				$this->assignment->updateAssignmentBeginCategory($d);
			} else {
				// Ada setidaknya satu elemen dengan status bukan 2, jadi status kategori tetap 1
				$d = [
					'id_acat' => $id_begin_cat,
					'status' => 1,
				];
				$this->assignment->updateAssignmentBeginCategory($d);
			}
		}
	}

	public function updateStatusAssignmentBegin($id_begin){
		$categories_db = $this->assignment->getAllAssignmentBeginCategory($id_begin);
		if ($categories_db) {
			$is_done = true; // Menginisialisasi $is_done ke true di awal

			foreach ($categories_db as $cat) {
				if ($cat->status != 2) {
					$is_done = false;
					break; // Keluar dari loop jika status bukan 2
				}
			}

			if ($is_done) {
				// Update status kategori menjadi 2
				$d = [
					'id_abegin' => $id_begin,
					'status' => 2,
				];
				$this->assignment->updateAssignmentBegin($d);
			} else {
				// Ada setidaknya satu elemen dengan status bukan 2, jadi status kategori tetap 1
				$d = [
					'id_abegin' => $id_begin,
					'status' => 1,
				];
				$this->assignment->updateAssignmentBegin($d);
			}
		}
	}
}

/* End of file ExamCtrl.php */
/* Location: ./application/controllers/ExamCtrl.php */