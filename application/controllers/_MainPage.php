<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MainPage extends MY_Controller {

	public function index() {
		$totalStudent = 0;
		if ($this->session->userdata('level') == 'admin' OR $this->session->userdata('level') == 'staff') {
			$totalStudent = count($this->master->getAllStudent());
			$totalResult = $this->assignment->getAllResult();
		} else {
			foreach ($this->master->getClassByTeacher($this->session->userdata('id_')) as $row => $value) {
				foreach ($this->master->getStudentByClass($value->id_class) as $r => $v) {
					$totalStudent++;
				}
			}
			$totalResult = [];
			foreach ($this->assignment->getAssignmentByTeacher($this->session->userdata('id_')) as $r_ => $v_) {
				foreach ($this->assignment->getResultByAssignment($v_->id_assignment) as $__r => $__v) {
					array_push($totalResult, $__v);
				}
			}
		}
		$totalGraduated = 0;
		foreach ($totalResult as $row => $value) {
			if ($value->result_status == 'lulus') {
				$totalGraduated++;
			}
		}
		$this->parseData['totalResult'] = count($totalResult);
		$this->parseData['totalGraduated'] = $totalGraduated;
		$this->parseData['activeAssignment'] = count($this->assignment->getActiveAssignment());
		$this->parseData['totalAssignment'] = count($this->assignment->getAllAssignment());
		$this->parseData['totalStudent'] = $totalStudent;
		// ASSIGNMENTS //
		$dataAssignment = $this->assignment->getAllAssignment();
		foreach ($dataAssignment as $row => $value) {
			$dataAssignment[$row]->totalQuestion = count($this->assignment->getQuestionByAssignment($value->id_assignment));
		}
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['content'] = 'content/dashboard';
		$this->parseData['title'] = 'Home - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function users() {
		$this->parseData['dataUsers'] = $this->master->getAllUser();
		$this->parseData['content'] = 'content/master/users';
		$this->parseData['title'] = 'Data Pengguna - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function lessons() {
		$this->parseData['dataLessons'] = $this->master->getAllLesson();
		$this->parseData['content'] = 'content/master/lessons';
		$this->parseData['title'] = 'Data Pelajaran - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function classes() {
		$this->parseData['dataClasses'] = $this->master->getAllClass();
		$this->parseData['content'] = 'content/master/classes';
		$this->parseData['title'] = 'Data Kelas - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function teachers() {
		$dataTeachers = $this->master->getAllTeacher();
		foreach ($dataTeachers as $row => $value) {
			$dataTeachers[$row]->classes = $this->master->getClassByTeacher($value->id_teacher);
			$dataTeachers[$row]->lessons = $this->master->getLessonByTeacher($value->id_teacher);
		}
		$this->parseData['dataTeachers'] = $dataTeachers;
		$this->parseData['content'] = 'content/master/teachers';
		$this->parseData['title'] = 'Data Guru - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function teacher_add() {
		$this->parseData['dataClasses'] = $this->master->getAllClass();
		$this->parseData['dataLessons'] = $this->master->getAllLesson();
		$this->parseData['content'] = 'content/master/teacher_add';
		$this->parseData['title'] = 'Tambah Guru - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function teacher_edit($id_teacher = NULL) {
		if (!$id_teacher) {
			redirect('page/teachers');
		}
		$dataTeacher = $this->master->getTeacherById($id_teacher);
		if (!$dataTeacher) {
			redirect('page/teachers');
		}
		$dataTeacher->classes = $this->master->getClassByTeacher($id_teacher);
		$dataTeacher->lessons = $this->master->getLessonByTeacher($id_teacher);
		$this->parseData['dataTeacher'] = $dataTeacher;
		$this->parseData['dataClasses'] = $this->master->getAllClass();
		$this->parseData['dataLessons'] = $this->master->getAllLesson();
		$this->parseData['content'] = 'content/master/teacher_edit';
		$this->parseData['title'] = 'Ubah Guru - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function students() {
		if ($this->session->userdata('level') == 'admin' OR $this->session->userdata('level') == 'staff') {
			$dataStudent = $this->master->getAllStudent();
		} else {
			$dataStudent = [];
			foreach ($this->master->getClassByTeacher($this->session->userdata('id_')) as $row => $value) {
				foreach ($this->master->getStudentByClass($value->id_class) as $r => $v) {
					array_push($dataStudent, $v);
				}
			}	
		}
		$this->parseData['dataStudents'] = $dataStudent;
		$this->parseData['content'] = 'content/master/students';
		$this->parseData['title'] = 'Ubah Siswa - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function student_add() {
		if ($this->session->userdata('level') == 'guru') {
			$dataClasses = $this->master->getClassByTeacher($this->session->userdata('id_'));
		} else {
			$dataClasses = $this->master->getAllClass();
		}
		$this->parseData['dataClasses'] = $dataClasses;
		$this->parseData['content'] = 'content/master/student_add';
		$this->parseData['title'] = 'Tambah Siswa - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function student_edit($id_student = NULL) {
		if (!$id_student) {
			redirect('page/students');
		}
		$dataStudent = $this->master->getStudentById($id_student);
		if (!$dataStudent) {
			redirect('page/students');
		}
		if ($this->session->userdata('level') == 'guru') {
			$dataClasses = $this->master->getClassByTeacher($this->session->userdata('id_'));
		} else {
			$dataClasses = $this->master->getAllClass();
		}
		$this->parseData['dataClasses'] = $dataClasses;
		$this->parseData['dataStudent'] = $dataStudent;
		$this->parseData['content'] = 'content/master/student_edit';
		$this->parseData['title'] = 'Ubah Siswa - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function create() {
		if ($this->session->userdata('level') == 'guru') {
			$dataClasses = $this->master->getClassByTeacher($this->session->userdata('id_'));
			$dataLessons = $this->master->getLessonByTeacher($this->session->userdata('id_'));
		} else {
			$dataClasses = $this->master->getAllClass();
			$dataLessons = $this->master->getAllLesson();
		}
		$this->parseData['dataLessons'] = $dataLessons;
		$this->parseData['dataClasses'] = $dataClasses;
		$this->parseData['content'] = 'content/assignment/create';
		$this->parseData['title'] = 'Buat Ujian - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function edit($id_assignment = NULL) {
		if (!$id_assignment) {
			redirect('page/assignments');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataAssignment) {
			redirect('page/assignments');
		}
		$dataAssignment->classes = $this->assignment->getClassByAssignment($id_assignment);
		if ($this->session->userdata('level') == 'guru') {
			$dataClasses = $this->master->getClassByTeacher($this->session->userdata('id_'));
			$dataLessons = $this->master->getLessonByTeacher($this->session->userdata('id_'));
		} else {
			$dataClasses = $this->master->getAllClass();
			$dataLessons = $this->master->getAllLesson();
		}
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['dataLessons'] = $dataLessons;
		$this->parseData['dataClasses'] = $dataClasses;
		$this->parseData['content'] = 'content/assignment/edit';
		$this->parseData['title'] = 'Ubah Ujian - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function list_question($id_assignment = NULL) {
		if (!$id_assignment) {
			redirect('page/assignments');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataAssignment) {
			redirect('page/assignments');
		}
		$dataAssignment->questions = $this->assignment->getQuestionByAssignment($id_assignment);
		foreach ($dataAssignment->questions as $row => $value) {
			$dataAssignment->questions[$row]->totalAnswer = count($this->assignment->getOptionByQuestion($value->id_question));
		}
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['content'] = 'content/assignment/list_question';
		$this->parseData['title'] = 'List Soal - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function create_question($id_assignment = NULL) {
		if (!$id_assignment) {
			redirect('page/assignments');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataAssignment) {
			redirect('page/assignments');
		}
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['content'] = 'content/assignment/create_question';
		$this->parseData['title'] = 'Buat Soal - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function detail_question($id_assignment = NULL, $id_question = NULL,$bank = NULL) {
		if (!$id_question OR !$id_assignment) {
			redirect('page/assignments');
		}
		$dataQuestion = $this->assignment->getQuestionById($id_question);
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataQuestion OR !$dataAssignment) {
			redirect('page/assignments');
		}
		$dataQuestion->options = $this->assignment->getOptionByQuestion($id_question);
		$this->parseData['dataQuestion'] = $dataQuestion;
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['bank'] = $bank;
		$this->parseData['content'] = 'content/assignment/detail_question';
		$this->parseData['title'] = 'Rincial Soal - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function assignments() {
		$dataAssignment = $this->assignment->getAllAssignment();
		foreach ($dataAssignment as $row => $value) {
			$dataAssignment[$row]->totalQuestion = count($this->assignment->getQuestionByAssignment($value->id_assignment));
		}
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['content'] = 'content/assignment/list';
		$this->parseData['title'] = 'List Ujian - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function bank() {
		$dataQuestion = [];
		foreach ($this->assignment->getAllQuestion() as $row => $value) {
			$assignmentQuestion = $this->assignment->getIdAssignmentByQuestion($value->id_question);
			if ($this->assignment->getAssignmentById($assignmentQuestion->id_assignment)->id_ == $this->session->userdata('id_')) {
				$value->totalAnswer = count($this->assignment->getAnswerByQuestion($value->id_question));
				$value->id_assignment = $this->assignment->getIdAssignmentByQuestion($value->id_question)->id_assignment;
				array_push($dataQuestion, $value);
			}
		}
		$this->parseData['dataQuestion'] = $dataQuestion;
		$this->parseData['content'] = 'content/assignment/bank';
		$this->parseData['title'] = 'Bank Soal - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function results() {
		if ($this->input->post()) {
			$dataAssignments = [];
			foreach ($this->assignment->getAssignmentByClass($this->input->post('id_class')) as $row => $value) {
				$assignment = $this->assignment->getAssignmentByTypeLessonAndId($this->input->post('assignment_type'),$this->input->post('id_lesson'),$value->id_assignment);
				if ($assignment) {
					array_push($dataAssignments,$assignment);
				}
			}
			foreach ($dataAssignments as $r => $v) {
				$students = $this->master->getStudentByClass($this->input->post('id_class'));
				if ($students) {
					foreach ($students as $_r => $_v) {
						$students[$_r]->result = $this->assignment->getResultByStudentAndAssignment($_v->id_student,$v->id_assignment);
					}
					$dataAssignments[$r]->students = $students;
				} else {
					unset($dataAssignments[$r]);
				}
			}
			// DATA FILTERING AUTH //
			$clearAssignment = [];
			foreach ($dataAssignments as $rAssignment => $vAssignment) {
				if ($this->session->userdata('level') != 'admin') {
					if ($vAssignment->id_ == $this->session->userdata('id_')) {
						array_push($clearAssignment, $vAssignment);
					}
				} else {
					array_push($clearAssignment, $vAssignment);
				}
			}
			// END //
			if ($dataAssignments) {
				$this->parseData['dataAssignments'] = $clearAssignment;
				$this->parseData['post'] = $this->input->post();
				$this->parseData['dataClass'] = $this->master->getClassById($this->input->post('id_class'));
				$this->parseData['dataLesson'] = $this->assignment->getLessonById($this->input->post('id_lesson'));
			} else {
				$this->message('Woopsss!','Tidak ditemukan laporan hasil ujian pada data ini','error');
				redirect('page/results');
			}
		}
		$dataLessons = $this->assignment->getLessonInAssignment();
		foreach ($dataLessons as $row => $value) {
			$dataLessons[$row]->lesson_name = $this->assignment->getLessonById($value->id_lesson)->lesson_name;
		}
		$this->parseData['dataLessons'] = $dataLessons;
		$this->parseData['content'] = 'content/report/result';
		$this->parseData['title'] = 'Laporan Hasil Ujian - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function result_pdf($id_assignment = NULL,$id_class = NULL) {
		if (!$id_assignment OR !$id_class) {
			redirect('page/results');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		$dataClass = $this->master->getClassById($id_class);
		if (!$dataAssignment OR !$dataClass) {
			redirect('page/results');
		}
		if ($this->session->userdata('level') == 'guru') {
			if ($dataAssignment->id_ != $this->session->userdata('id_')) {
				redirect('page/results');
			}
		}
		$students = $this->master->getStudentByClass($id_class);
		foreach ($students as $_r => $_v) {
			$students[$_r]->result = $this->assignment->getResultByStudentAndAssignment($_v->id_student,$id_assignment);
		}
		$dataAssignment->students = $students;
		$dataAssignment->totalQuestion = count($this->assignment->getQuestionByAssignment($id_assignment));
		$this->result['dataAssignment'] = $dataAssignment;
		$this->result['dataClass'] = $dataClass;
		$this->result['dataLesson'] = $this->assignment->getLessonById($dataAssignment->id_lesson);
		// echo "<pre>";
		// print_r($dataAssignment);
		$html = $this->load->view('content/report/result-pdf', $this->result, TRUE);
        $this->load->library('pdf');
        $this->pdf->pdf->WriteHTML($html);
        $this->pdf->pdf->Output();
	}
	public function analytics() {
		if ($this->input->post()) {
			$dataAssignments = [];
			foreach ($this->assignment->getAssignmentByClass($this->input->post('id_class')) as $row => $value) {
				$assignment = $this->assignment->getAssignmentByTypeLessonAndId($this->input->post('assignment_type'),$this->input->post('id_lesson'),$value->id_assignment);
				if ($assignment) {
					array_push($dataAssignments,$assignment);
				}
			}
			$students = $this->master->getStudentByClass($this->input->post('id_class'));
			foreach ($dataAssignments as $r => $v) {
				$questions = $this->assignment->getQuestionByAssignment($v->id_assignment);
				foreach ($questions as $rQuestion => $vQuestion) {
					$notYet = 0;
					$true = 0;
					$false = 0;
					$empty = 0;
					foreach ($students as $rStudent => $vStudent) {
						$analytics = $this->assignment->getAnalyticsByStudentAndAssignment($vStudent->id_student,$v->id_assignment);
						if ($analytics) {
							foreach($analytics as $rAnalytics => $vAnalytic) {
								if ($vAnalytic->id_question == $vQuestion->id_question) {
									if ($vAnalytic->analytics_status == 'true') {
										$true++;
									} elseif($vAnalytic->analytics_status == 'false') {
										$false++;
									} elseif($vAnalytic->analytics_status == 'empty') {
										$empty++;
									}
								}
							}
						} else {
							$notYet++;
						}
					}
					$questions[$rQuestion]->notYet = $notYet;
					$questions[$rQuestion]->true = $true;
					$questions[$rQuestion]->false = $false;
					$questions[$rQuestion]->empty = $empty;
				}
				$dataAssignments[$r]->questions = $questions;
			}
			// echo "<pre>";
			// print_r($dataAssignments);
			// die;
			// DATA FILTERING AUTH //
			$clearAssignment = [];
			foreach ($dataAssignments as $rAssignment => $vAssignment) {
				if ($this->session->userdata('level') != 'admin') {
					if ($vAssignment->id_ == $this->session->userdata('id_')) {
						array_push($clearAssignment, $vAssignment);
					}
				} else {
					array_push($clearAssignment, $vAssignment);
				}
			}
			// END //
			if ($dataAssignments) {
				$this->parseData['dataAssignments'] = $clearAssignment;
				$this->parseData['post'] = $this->input->post();
				$this->parseData['dataClass'] = $this->master->getClassById($this->input->post('id_class'));
				$this->parseData['dataLesson'] = $this->assignment->getLessonById($this->input->post('id_lesson'));
			} else {
				$this->message('Woopsss!','Tidak ditemukan laporan hasil ujian pada data ini','error');
				redirect('page/results');
			}
		}
		$dataLessons = $this->assignment->getLessonInAssignment();
		foreach ($dataLessons as $row => $value) {
			$dataLessons[$row]->lesson_name = $this->assignment->getLessonById($value->id_lesson)->lesson_name;
		}
		$this->parseData['dataLessons'] = $dataLessons;
		$this->parseData['content'] = 'content/report/analytics';
		$this->parseData['title'] = 'Laporan Analysis Ujian - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}
	public function analytics_pdf($id_assignment = NULL,$id_class = NULL) {
		if (!$id_assignment OR !$id_class) {
			redirect('page/results');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		$dataClass = $this->master->getClassById($id_class);
		if (!$dataAssignment OR !$dataClass) {
			redirect('page/results');
		}
		if ($this->session->userdata('level') == 'guru') {
			if ($dataAssignment->id_ != $this->session->userdata('id_')) {
				redirect('page/results');
			}
		}
		$students = $this->master->getStudentByClass($id_class);
		$questions = $this->assignment->getQuestionByAssignment($id_assignment);
		foreach ($questions as $rQuestion => $vQuestion) {
			$notYet = 0;
			$true = 0;
			$false = 0;
			$empty = 0;
			foreach ($students as $rStudent => $vStudent) {
				$analytics = $this->assignment->getAnalyticsByStudentAndAssignment($vStudent->id_student,$id_assignment);
				if ($analytics) {
					foreach($analytics as $rAnalytics => $vAnalytic) {
						if ($vAnalytic->id_question == $vQuestion->id_question) {
							if ($vAnalytic->analytics_status == 'true') {
								$true++;
							} elseif($vAnalytic->analytics_status == 'false') {
								$false++;
							} elseif($vAnalytic->analytics_status == 'empty') {
								$empty++;
							}
						}
					}
				} else {
					$notYet++;
				}
			}
			$questions[$rQuestion]->notYet = $notYet;
			$questions[$rQuestion]->true = $true;
			$questions[$rQuestion]->false = $false;
			$questions[$rQuestion]->empty = $empty;
		}
		$dataAssignment->questions = $questions;
		$dataAssignment->totalQuestion = count($this->assignment->getQuestionByAssignment($id_assignment));
		$this->result['dataAssignment'] = $dataAssignment;
		$this->result['dataClass'] = $dataClass;
		$this->result['dataLesson'] = $this->assignment->getLessonById($dataAssignment->id_lesson);
		// echo "<pre>";
		// print_r($dataAssignment);
		// die;
		$html = $this->load->view('content/report/analytics-pdf', $this->result, TRUE);
        $this->load->library('pdf');
        $this->pdf->pdf->WriteHTML($html);
        $this->pdf->pdf->Output();
	}
	public function presencereport() {
		if ($this->input->post()) {
			$dataStudent = $this->master->getStudentByClass($this->input->post('id_class'));
			foreach ($dataStudent as $row => $value) {
				$attend = 0;
				$alpha = 0;
				$leave = 0;
				$sick = 0;
				foreach ($this->master->getPresenceByCondition($value->student_nis,$this->input->post('from'),$this->input->post('until')) as $r => $v) {
					if ($v->presence_type == 'attend') {
						$alpha++;
					} elseif($v->presence_type == 'leave') {
						$leave++;
					} elseif($v->presence_type == 'alpha') {
						$alpha++;
					} elseif($v->presence_type == 'sick') {
						$sick++;
					}
				}
				$resume = [
					'alpha' => $alpha,
					'attend' => $attend,
					'leave' => $leave,
					'sick' => $sick
				];
				$dataStudent[$row]->presence = $resume;
			}

			$this->parseData['dataStudent'] = $dataStudent;
			$this->parseData['classChoosed'] = $this->master->getClassById($this->input->post('id_class'));
			$this->parseData['post'] = $this->input->post();
			// $this->debug($this->parseData['dataClass']);
		}
		if ($this->session->userdata('level') == 'guru') {
			$dataClass = $this->master->getClassByTeacher($this->session->userdata('id_'));
		} else {
			$dataClass = $this->master->getAllClass();
		}
		$this->parseData['dataClass'] = $dataClass;
		$this->parseData['content'] = 'content/report/presence';
		$this->parseData['title'] = 'Laporan Absensi - Boy Science Club';
		$this->load->view('MainView',$this->parseData);
	}

	// ERROR HANDLER //
	public function not_found() {
		echo "Page not found";
	}
	public function logout() {
		$this->auth->deleteToken($this->session->userdata('backToken'));
		$this->session->unset_userdata('backToken');
		$this->message('Logout berhasil!','Silahkan login kembali untuk melanjutkan :)','success');
		redirect('Auth');
	}

	public function presencedays() {
    	if ($this->session->userdata('level') == 'guru') {
			$this->parseData['dclass'] = $this->class->getAllClassByTeacher($this->session->userdata('userId'));
		} else {
			$this->parseData['dclass'] = $this->class->getAllClass();
		}
		
		$this->parseData['data'] = "";

		// ambil data siswa + presensi per kelas
		if ($this->input->post()) {
			$post = $this->input->post();
			$logdate = date('Y-m-d', strtotime($post['logdate']));

			//ambil siswa di kelas
			$siswa = $this->db->get_where('ms_student', ['id_class' => $post['id_class']])->result();
			$this->parseData['echo'] = '';
			foreach ($siswa as $value) {
				$where = ['nis' => $value->student_nis, 'Date(presence_log)' => $logdate];
				$attend = $leave = $sick = $alpha = "";

				if ($presensi = $this->db->get_where('st_presence', $where)->row()) {
					$log = date('d-m-Y H:i:s', strtotime($presensi->presence_time));

					if ($presensi->presence_type == 'attend') {
						$attend = "selected";
					} elseif ($presensi->presence_type == 'leave') {
						$leave = "selected";
					} elseif ($presensi->presence_type == 'sick') {
						$sick = "selected";
					} elseif ($presensi->presence_type == 'alpha') {
						$alpha = "selected";
					}

					$res = strtoupper($presensi->presence_res);
				} else {
					$log = "No record";
					$res = " - ";
					$data = ['nis' => $value->student_nis, 'presence_type' => 'alpha'];
				}
				$act = "onchange=\"updatePresence('$value->student_nis', this.id)\"";

				$sel = '<select class="form-control" id="sel'.$value->student_nis.'" '.$act.'>';
				$sel .= '<option value="null">No record</option>';
				$sel .= '<option value="attend" '.$attend.'>Hadir</option>';
				$sel .= '<option value="leave" '.$leave.'>Izin</option>';
				$sel .= '<option value="sick" '.$sick.'>Sakit</option>';
				$sel .= '<option value="alpha" '.$alpha.'>Alpha</option>';
				$sel .= '</select>';

				$this->parseData['data'] .= '<tr>';
				$this->parseData['data'] .= '<td>'.$value->student_nis.'</td>';
				$this->parseData['data'] .= '<td>'.$value->student_name.'</td>';
				$this->parseData['data'] .= '<td>'.$sel.'</td>';
				$this->parseData['data'] .= '<td><div id="log'.$value->student_nis.'">'.$log.'</div></td>';
				$this->parseData['data'] .= '<td><div id="res'.$value->student_nis.'">'.$res.'</td>';
				$this->parseData['data'] .= '</tr>';
			}

			//$this->parseData['data'] = $data;
			$this->parseData['selclass'] = $post['id_class'];
			$this->parseData['seldate'] = $post['logdate'];
		} else {
			$this->parseData['dsiswa'] = 'ng';
			$this->parseData['selclass'] = 0;
			$this->parseData['seldate'] = date('d-m-Y');
			$this->parseData['presensi'] = [];
		}

		$this->parseData['title'] = 'Presensi Harian siswa';
		$this->parseData['content'] = 'content/presence/ptable';
		$this->load->view('MainView', $this->parseData);
    }

}

/* End of file MainPage.php */
/* Location: ./application/controllers/MainPage.php */ 