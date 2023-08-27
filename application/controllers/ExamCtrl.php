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
		foreach ($this->assignment->getAllAssignmentStudent() as $row => $value) {
			$push = false;
			foreach ($this->assignment->getClassByAssignment($value->id_assignment) as $r => $v) {
				if ($v->id_class == $this->session->userdata('globalStudent')->id_class) {
					$push = true;
				}
			}
			if ($push) {
				if ($value->assignment_active == 1) {
					if (!$this->assignment->checkDoneAssignment($value->id_assignment,$this->session->userdata('globalStudent')->id_student)) {
						array_push($dataAssignments, $value);
					}
				}
			}
		}
		foreach ($dataAssignments as $r => $v) {
			$dataAssignments[$r]->totalQuestion = count($this->assignment->getQuestionByAssignment($v->id_assignment));
		}
		$this->dataParse['dataAssignments'] = $dataAssignments;
		$this->dataParse['title'] = 'List Ujian - Boy Science Club';
		$this->dataParse['content'] = 'exam/content/lists';
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
		$dataAssignments = [];
		foreach ($this->assignment->getResultByStudent($this->session->userdata('globalStudent')->id_student) as $row => $value) {
			$assignment = $this->assignment->getAssignmentById($value->id_assignment);
			$assignment->resultCreated = $value->result_created;
			array_push($dataAssignments,$assignment);
		}
		foreach ($dataAssignments as $r => $v) {
			$dataAssignments[$r]->totalQuestion = count($this->assignment->getQuestionByAssignment($v->id_assignment));
		}
		$this->dataParse['dataAssignments'] = $dataAssignments;
		$this->dataParse['title'] = 'Riwayat Ujian - Boy Science Club';
		$this->dataParse['content'] = 'exam/content/history';
		$this->load->view('MainExam',$this->dataParse);
	}
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

}

/* End of file ExamCtrl.php */
/* Location: ./application/controllers/ExamCtrl.php */