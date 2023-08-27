<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model('AuthModel','auth',TRUE);
	}
	public function message($title = NULL,$text = NULL,$type = NULL) {
		return $this->session->set_flashdata([
				'title' => $title,
				'text' => $text,
				'type' => $type
			]
		);
	}
	public function checkToken() {
		if ($this->session->userdata('backToken')) {
			if ($this->auth->checkToken($this->session->userdata('backToken'))) {
				redirect('page');
			} else {
				$this->session->unset_userdata('backToken');
				redirect('page/logout');
			}
		}
	}

	public function index() {
		$this->checkToken();
		$this->load->view('auth/login');
	}
	public function login() {
		$data = $this->input->post();
		if ($this->input->post()) {
			$dataAdmin = $this->auth->getAdminByUsername($data['username']);
			$dataTeacher = $this->auth->getTeacherByUsername($data['username']);
			if ($dataAdmin) {
				if (password_verify($data['password'],$dataAdmin->password)) {
					$sess_ = [
						'fullName' => $dataAdmin->full_name,
						'username' => $dataAdmin->username,
						'level' => $dataAdmin->level,
						'id_' => $dataAdmin->id_admin,
						'backToken' => crypt($dataAdmin->full_name,'')
					];
					$this->session->set_userdata( $sess_ );
					$this->auth->registToken($forToken = ['access_token' => $sess_['backToken']]);
					$this->message('Selamat datang '.$dataAdmin->full_name.'!','Semoga hari anda menyenangkan:)','success');
					redirect('page');
				} else {
					$this->message('Ooppsss','Username dan password tidak sesuai, silahkan coba lagi','error');
				}
			} elseif($dataTeacher) {
				if (password_verify($data['password'],$dataTeacher->teacher_password)) {
					$sess_ = [
						'fullName' => $dataTeacher->teacher_name,
						'username' => $dataTeacher->teacher_username,
						'level' => 'guru',
						'id_' => $dataTeacher->id_teacher,
						'backToken' => crypt($dataTeacher->teacher_name,'')
					];
					$this->session->set_userdata( $sess_ );
					$this->auth->registToken($forToken = ['access_token' => $sess_['backToken']]);
					$this->message('Selamat datang '.$dataTeacher->teacher_name.'!','Semoga hari anda menyenangkan:)','success');
					redirect('page');
				} else {
					$this->message('Ooppsss','Username dan password tidak sesuai, silahkan coba lagi','error');
				}
			} else {
				$this->message('Ooppsss','Username tidak terdaftar, silahkan coba username lain','error');
			}
		}
		redirect('Auth');
	}
	public function exam() {
		if ($this->input->post()) {
			$data = $this->input->post();
			$student = $this->auth->getStudentByNis($data['student_nis']);
			if ($student) {
				if (password_verify($data['student_password'],$student->student_password)) {
					$sess_ = [
						'globalStudent' => $student,
						'examToken' => crypt($student->student_password,'')
					];
					$this->session->set_userdata( $sess_ );
					$this->message('Wohoooo!!','Login berhasil di verifikasi, selamat datang '.$student->student_name,'success');
					redirect('exam/lists');	
				} else {
					$this->message('Oooppss','NIS dan password tidak sesuai, silahkan coba lagi','danger');
					redirect('Auth/exam');	
				}
			} else {
				$this->message('Oooppss','NIS tidak terdaftar, silahkan coba lagi','danger');
				redirect('Auth/exam');
			}
		} else {
			if ($this->session->userdata('examToken') AND $this->session->userdata('globalStudent')) {
				redirect('exam');
			}
			$this->load->view('auth/loginExam');
		}
	}

	public function not_found() {
		echo "Page not found";
	}
}

/* End of file Auth.php */
/* Location: ./application/controllers/Auth.php */