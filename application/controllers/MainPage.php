<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Cell\DataType;
use PhpOffice\PhpSpreadsheet\Cell\DataValidation;

class MainPage extends MY_Controller {

	public function index() {
		$totalStudent = 0;
		$totalExam = 0;
		$totalExamActive = 0;
		$totalQuestion = 0;
		// if ($this->session->userdata('level') == 'admin' OR $this->session->userdata('level') == 'staff') {
		// 	$totalStudent = count($this->master->getAllStudent());
		// 	$totalResult = $this->assignment->getAllResult();
		// } else {
		// 	foreach ($this->master->getClassByTeacher($this->session->userdata('id_')) as $row => $value) {
		// 		foreach ($this->master->getStudentByClass($value->id_class) as $r => $v) {
		// 			$totalStudent++;
		// 		}
		// 	}
		// 	$totalResult = [];
		// 	foreach ($this->assignment->getAssignmentByTeacher($this->session->userdata('id_')) as $r_ => $v_) {
		// 		foreach ($this->assignment->getResultByAssignment($v_->id_assignment) as $__r => $__v) {
		// 			array_push($totalResult, $__v);
		// 		}
		// 	}
		// }
		// $totalGraduated = 0;
		// foreach ($totalResult as $row => $value) {
		// 	if ($value->result_status == 'lulus') {
		// 		$totalGraduated++;
		// 	}
		// }

		foreach ($this->master->getStudents() as $r => $v) {
			$totalStudent++;
		}

		foreach ($this->assignment->getAllAssignment() as $r => $v) {
			if ($v->assignment_active == 1) {
				$totalExamActive++;
			}
			$totalExam++;
		}

		foreach ($this->assignment->getAllQuestion() as $r => $v) {
			$totalQuestion++;
		}

		$this->parseData['totalStudent'] = $totalStudent;
		$this->parseData['totalExam'] = $totalExam;
		$this->parseData['totalExamActive'] = $totalExamActive;
		$this->parseData['totalQuestion'] = $totalQuestion;
		$this->parseData['content'] = 'content/dashboard';
		$this->parseData['title'] = 'Home ';
		$this->load->view('MainView',$this->parseData);
	}
	public function users() {
		$this->parseData['dataUsers'] = $this->master->getAllUser();
		$this->parseData['content'] = 'content/master/users';
		$this->parseData['title'] = 'Data Pengguna ';
		$this->load->view('MainView',$this->parseData);
	}
	public function lessons() {
		$this->parseData['dataLessons'] = $this->master->getAllLesson();
		$this->parseData['content'] = 'content/master/lessons';
		$this->parseData['title'] = 'Data Pelajaran ';
		$this->load->view('MainView',$this->parseData);
	}
	public function categories() {
		$this->parseData['dataCategories'] = $this->master->getAllSubtestCat();
		$this->parseData['content'] = 'content/master/categories';
		$this->parseData['title'] = 'Data Kategori ';
		$this->load->view('MainView',$this->parseData);
	}
	public function classes() {
		$this->parseData['dataClasses'] = $this->master->getAllClass();
		$this->parseData['content'] = 'content/master/classes';
		$this->parseData['title'] = 'Data Kelas ';
		$this->load->view('MainView',$this->parseData);
	}
	public function subtests() {
		$this->parseData['dataSubtest'] = $this->master->getAllSubtest();
		$this->parseData['dataCategory'] = $this->master->getAllSubtestCat();
		$this->parseData['content'] = 'content/master/subtests';
		$this->parseData['title'] = 'Data Subtes ';
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
		$this->parseData['title'] = 'Data Guru ';
		$this->load->view('MainView',$this->parseData);
	}
	public function teacher_add() {
		$this->parseData['dataClasses'] = $this->master->getAllClass();
		$this->parseData['dataLessons'] = $this->master->getAllLesson();
		$this->parseData['content'] = 'content/master/teacher_add';
		$this->parseData['title'] = 'Tambah Guru ';
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
		$this->parseData['title'] = 'Ubah Guru ';
		$this->load->view('MainView',$this->parseData);
	}
	public function students($class = null) {
		// if ($this->session->userdata('level') == 'admin' OR $this->session->userdata('level') == 'staff') {
		// 	$dataStudent = $this->master->getAllStudent($class);
		// } else {
		// 	$dataStudent = [];
		// 	foreach ($this->master->getClassByTeacher($this->session->userdata('id_')) as $row => $value) {
		// 		foreach ($this->master->getStudentByClass($value->id_class) as $r => $v) {
		// 			array_push($dataStudent, $v);
		// 		}
		// 	}	
		// }
		// // SEND TO SESSION //
		// if ($dataStudent AND $class) {
		// 	$SESS_ = [
		// 		'STUDENT_DATA_EXPORT' => $dataStudent,
		// 		'CLASS_DATA_EXPORT' => $class
		// 	];
		// 	$this->session->set_userdata($SESS_);
		// }
		// END //
		if ($class) {
			$dataStudent = $this->master->getAllStudent($class);
		}else{
			$dataStudent = $this->master->getStudents();
		}
		$this->parseData['mclass'] = $this->master->getAllClass();
		$this->parseData['cls'] = $class;
		$this->parseData['dataStudents'] = $dataStudent;
		$this->parseData['content'] = 'content/master/students';
		$this->parseData['title'] = 'Ubah Siswa ';
		$this->load->view('MainView',$this->parseData);
	}
	public function ExportStudent() {
		$DataStudent = $this->session->userdata('STUDENT_DATA_EXPORT');
		$DataClass = $this->master->getClassById($this->session->userdata('CLASS_DATA_EXPORT'));
		if ($DataStudent AND $DataClass) {
			$Data = [
				'DataStudent' => $DataStudent,
				'DataClass' => $DataClass
			];
			$this->load->view('content/report/export_student',$Data);
		} else {
			redirect('page/students');
		}
	}
	public function student_add() {
		if ($this->session->userdata('level') == 'guru') {
			$dataClasses = $this->master->getClassByTeacher($this->session->userdata('id_'));
		} else {
			$dataClasses = $this->master->getAllClass();
		}
		foreach ($dataClasses as $row => $value) {
			if (count($this->master->getStudentByClass($value->id_class)) >= 20) {
				unset($dataClasses[$row]);
			}
		}
		$this->parseData['dataClasses'] = $dataClasses;
		$this->parseData['content'] = 'content/master/student_add';
		$this->parseData['title'] = 'Tambah Siswa ';
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
		foreach ($dataClasses as $row => $value) {
			if (count($this->master->getStudentByClass($value->id_class)) >= 20) {
				unset($dataClasses[$row]);
			}
		}
		$this->parseData['dataClasses'] = $dataClasses;
		$this->parseData['dataStudent'] = $dataStudent;
		$this->parseData['content'] = 'content/master/student_edit';
		$this->parseData['title'] = 'Ubah Siswa ';
		$this->load->view('MainView',$this->parseData);
	}
	public function create() {
		$this->parseData['dataCategories'] = $this->master->getAllSubtestCatWithRelation();
		$this->parseData['dataClasses'] = $this->master->getAllClass();
		$this->parseData['content'] = 'content/assignment/create';
		$this->parseData['title'] = 'Buat Ujian ';
		$this->load->view('MainView',$this->parseData);
	}
	public function edit_old($id_assignment = NULL) {
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
		$this->parseData['title'] = 'Ubah Ujian ';
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
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['content'] = 'content/assignment/edit';
		$this->parseData['title'] = 'Ubah Ujian ';
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
		$this->parseData['title'] = 'List Soal ';
		$this->load->view('MainView',$this->parseData);
	}
	public function reuse_question($id_assignment = NULL) {
		if (!$id_assignment) {
			redirect('page/assignments');
		}
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataAssignment) {
			redirect('page/assignments');
		}
		if ($dataAssignment->id_ == $this->session->userdata('id_')) {
			$dataQuestion = [];
			foreach ($this->assignment->getAllQuestion() as $row => $value) {
				$assignmentQuestion = $this->assignment->getIdAssignmentByQuestion($value->id_question);
				if ($assignmentQuestion) {
					$Assignment = $this->assignment->getAssignmentById($assignmentQuestion->id_assignment);
					if ($Assignment) {
						if ($Assignment->id_ == $this->session->userdata('id_')) {
							$value->totalAnswer = count($this->assignment->getAnswerByQuestion($value->id_question));
							$value->id_assignment = $this->assignment->getIdAssignmentByQuestion($value->id_question)->id_assignment;
							array_push($dataQuestion, $value);
						}
					}
				}
			}
			// NOW WE GOT DATA QUESTION //
			$this->parseData['dataAssignment'] = $dataAssignment;
			$this->parseData['dataQuestion'] = $dataQuestion;
			$this->parseData['content'] = 'content/assignment/reuse_question';
			$this->parseData['title'] = 'Gunakan Soal Lain ';
			$this->load->view('MainView',$this->parseData);
		} else {
			redirect('page/assignments');
		}
	}
	public function update_question($id_assignment = NULL, $id_question = NULL) {
		if (!$id_question OR !$id_assignment) {
			redirect('page/assignments');
		}
		$dataQuestion = $this->assignment->getQuestionById($id_question);
		$dataAssignment = $this->assignment->getAssignmentById($id_assignment);
		if (!$dataQuestion OR !$dataAssignment) {
			redirect('page/assignments');
		}
		$dataQuestion->options = $this->assignment->getOptionByQuestion($id_question);
		// echo "<pre>";
		foreach ($dataQuestion->options as $row => $value) {
			if ($this->assignment->checkAnswerTrue($value->id_option,$id_question)) {
				$dataQuestion->trueAnswer = $row;
			}
		}
		// print_r($dataQuestion);
		// die;
		$this->parseData['dataQuestion'] = $dataQuestion;
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['content'] = 'content/assignment/update_question';
		$this->parseData['title'] = 'Rincial Soal ';
		$this->load->view('MainView',$this->parseData);
	}
	public function delete_option($id_assignment = NULL, $id_question = NULL, $id_option = NULL) {
		if (!$id_question OR !$id_assignment OR !$id_option) {
			redirect('page/assignments');
		}
		$this->assignment->deleteOptionById($id_option);
		$this->message('Yeeay!','Jawaban berhasil dihapus','success');
		redirect('page/update_question/'.$id_assignment.'/'.$id_question);
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
		$this->parseData['title'] = 'Buat Soal ';
		$this->load->view('MainView',$this->parseData);
	}

	public function create_question_var($id_type = NULL) {
		$dataSub = $this->master->getAllSub();
		$dataLesson = $this->master->getAllLesson();
		$dataLevel = $this->master->getAllLevel();
		if ($id_type==1) {
			
			$this->parseData['content'] = 'content/assignment/create_question_1';
		}
		else if ($id_type==2) {
			$this->parseData['content'] = 'content/assignment/create_question_2';
		}
		if ($id_type==3) {
			$this->parseData['content'] = 'content/assignment/create_question_3';
		}

		if ($id_type==4) {
			$this->parseData['content'] = 'content/assignment/create_question_4';
		}

		if ($id_type==5) {
			$this->parseData['content'] = 'content/assignment/create_question_5';
		}

		if ($id_type==6) {
			$this->parseData['content'] = 'content/assignment/create_question_6';
		}
		$this->parseData['dataSub'] = $dataSub;
		$this->parseData['dataLesson'] = $dataLesson;
		$this->parseData['dataLevel'] = $dataLevel;
		$this->parseData['title'] = 'Buat Soal ';
		$this->load->view('MainView',$this->parseData);
	}

	public function edit_question($id, $id_type) {
		$dataQuestion = $this->assignment->getQuestionByIdWithAnswer($id);
		// print_r(json_encode($dataQuestion));
		// die();
		$dataSub = $this->master->getAllSub();
		$dataLesson = $this->master->getAllLesson();
		$dataLevel = $this->master->getAllLevel();

		$this->parseData['dataQuestion'] = $dataQuestion;
		$this->parseData['dataSub'] = $dataSub;
		$this->parseData['dataLesson'] = $dataLesson;
		$this->parseData['dataLevel'] = $dataLevel;
		if ($id_type == 1) {
			$this->parseData['content'] = 'content/assignment/edit_question_benar_salah';
		} else if ($id_type == 2){
			$this->parseData['content'] = 'content/assignment/edit_question_berganda';
		} else if ($id_type == 3) {
			$this->parseData['content'] = 'content/assignment/edit_question_isian_singkat';
		} else if ($id_type == 4) {
			$this->parseData['content'] = 'content/assignment/edit_question_majemuk';
		} else if ($id_type == 5) {
			$this->parseData['content'] = 'content/assignment/edit_question_menjodohkan';
		} else if ($id_type == 6) {
			$this->parseData['content'] = 'content/assignment/edit_question_benar_salah_majemuk';
		}
		$this->parseData['title'] = 'Edit Soal ';
		$this->load->view('MainView',$this->parseData);
	}
	public function create_question_type() {
		$dataType = $this->master->getAllQuestionType();
		$this->parseData['dataType'] = $dataType;
		$this->parseData['content'] = 'content/assignment/create_question_type';
		$this->parseData['title'] = 'Buat Soal ';
		$this->load->view('MainView',$this->parseData);
	}
	public function create_question_all() {
		$this->parseData['content'] = 'content/assignment/create_question_all';
		$this->parseData['title'] = 'Buat Soal ';
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
		$this->parseData['title'] = 'Rincial Soal ';
		$this->load->view('MainView',$this->parseData);
	}
	public function assignments() {
		$dataAssignment = $this->assignment->getAllAssignment();
		foreach ($dataAssignment as $row => $value) {
			$dataAssignment[$row]->totalQuestion = count($this->assignment->getQuestionByAssignment($value->id_assignment));
		}
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['content'] = 'content/assignment/list';
		$this->parseData['title'] = 'List Ujian ';
		$this->load->view('MainView',$this->parseData);
	}
	public function report_irt() {
		$dataAssignment = $this->assignment->getAllAssignment();

		foreach ($dataAssignment as $key => $value) {
    		$value->max = count($value->assigns); // Perbarui properti max_percent pada objek $value
			$value->value = 0;
			foreach ($value->assigns as $k => $v) {
				if ($v->status == 2) {
					$value->value++; // Perbarui properti value_percent pada objek $v
				}
			}
			$value->percent = 0;  // Inisialisasi dengan nilai default

			if (!empty($value->assigns)) {
				$value->percent = round(($value->value / count($value->assigns)) * 100, 1);
			} // Perbarui properti value_percent pada objek $v
			
		}
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['content'] = 'content/assignment/report_irt';
		$this->parseData['title'] = 'List Laporan Ujian ';
		$this->load->view('MainView',$this->parseData);
	}
	public function report_users($id_assignment) {
		$dataAssignment = $this->assignment->getAllAssignmentPerAssign($id_assignment);

		foreach ($dataAssignment as $key => $value) {
    		$value->total_questions = count($value->assign_answers); // Perbarui properti max_percent pada objek $value
			$value->total_correct = 0;
			$value->total_false = 0;
			$value->points = 0;
			if ($value->assign_answers) {
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
		}
		// print_r(json_encode($dataAssignment));
		// die();
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['content'] = 'content/assignment/report_users';
		$this->parseData['title'] = 'List Laporan Ujian per Siswa';
		$this->load->view('MainView',$this->parseData);
	}
	public function assign_users($id_assignment) {
		$dataAssignment = $this->assignment->getAllAssignmentPerAssign($id_assignment);
		$idStudents		= [];
		foreach ($dataAssignment as $key => $data) {
			array_push($idStudents, $data->id_student);
		}
		$this->parseData['dataAssignment'] = $dataAssignment;
		$this->parseData['idStudents'] = $idStudents;
		$this->parseData['idAssignment'] = $id_assignment;
		$this->parseData['content'] = 'content/assignment/assign_users';
		$this->parseData['title'] = 'List Siswa Yang Mengikuti Ujian';
		$this->load->view('MainView',$this->parseData);
	}
	public function bank() {
		$dataQuestion = [];
		// foreach ($this->assignment->getAllQuestion() as $row => $value) {
		// 	$assignmentQuestion = $this->assignment->getIdAssignmentByQuestion($value->id_question);
		// 	if ($assignmentQuestion) {
		// 		$Assignment = $this->assignment->getAssignmentById($assignmentQuestion->id_assignment);
		// 		if ($Assignment) {
		// 			if ($Assignment->id_ == $this->session->userdata('id_')) {
		// 				$value->totalAnswer = count($this->assignment->getAnswerByQuestion($value->id_question));
		// 				$value->id_assignment = $this->assignment->getIdAssignmentByQuestion($value->id_question)->id_assignment;
		// 				array_push($dataQuestion, $value);
		// 			}
		// 		}
		// 	}
		// }

		// $this->parseData['dataQuestion'] = $dataQuestion;
		$this->parseData['dataQuestion'] = $this->assignment->getAllQuestion();
		$this->parseData['content'] = 'content/assignment/bank';
		$this->parseData['title'] = 'Bank Soal ';
		$this->load->view('MainView',$this->parseData);
	}
	public function results() {
		if ($this->input->post()) {
			$dataAssignments = [];
			$forAssignment = [];
			foreach ($this->assignment->getAssignmentByClassNew($this->input->post('id_class')) as $row => $value) {
				if ($forAssignment) {
					$val = false;
					foreach ($forAssignment as $_rr => $_vv) {
						if ($_vv->id_assignment == $value->id_assignment) {
							$val = true;
						}
					}
					if ($val) {
						array_push($forAssignment, $value);
					}
				} else {
					array_push($forAssignment, $value);
				}
			}
			// NEW LOGIC //
			foreach ($forAssignment as $row => $value) {
				$assignment = $this->assignment->getAssignmentByTypeLessonAndId($this->input->post('assignment_type'),$this->input->post('id_lesson'),$value->id_assignment);
				if ($assignment) {
					array_push($dataAssignments,$assignment);
				}
			}
			// END //

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
		$this->parseData['title'] = 'Laporan Hasil Ujian ';
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
		$this->parseData['title'] = 'Laporan Analysis Ujian ';
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

	public function coba_pdf() {
		$admin = [
			[
				"nama" => "Sandi Ramadhan",
				"umur" =>  22,
			], [
				"nama" => "Uchiha Sasuke",
				"umur" => 22
			]
		];
		$data = [
			'dataAdmin' => $admin
		];
		$html = $this->load->view('content/contoh_pdf', $data, TRUE);
	    $this->load->library('pdf');
	    $this->pdf->pdf->WriteHTML($html);
	    $this->pdf->pdf->Output();
	}
	public function coba_excel() {
		$admin = [
			[
				"nama" => "Sandi Ramadhan",
				"umur" =>  22,
			], [
				"nama" => "Uchiha Sasuke",
				"umur" => 22
			]
		];
		$data = [
			'dataAdmin' => $admin
		];
		$this->load->view('content/contoh_excel', $data);
	}
	public function reusequestion($id_assignment = NULL,$id_question = NULL) {
		if ($id_assignment AND $id_question) {
			$Data = [
				'id_assignment' => $id_assignment,
				'id_question' => $id_question
			];
			if ($this->assignment->CheckAssignmentQuestionByAssignmentAndQuestion($id_assignment,$id_question)) {
				$this->message('Oopsss!','Soal yang anda pilih sudah berada pada ujian ini','error');
			} else {
				$this->assignment->insertAssignmentQuestion($Data);
				$this->message('Yeeay!','Soal berhasil digunakan kembali','success');
			}
			redirect('page/reuse_question/'.$id_assignment);
		} else {
			redirect('page/assignments');
		}
	}
	public function logs() {
		$this->parseData['dataLog'] = $this->master->getAllLog();
		$this->parseData['content'] = 'content/master/logs';
		$this->parseData['title'] = 'Data Log Aktifitas ';
		$this->load->view('MainView',$this->parseData);
	}

	function download_temp()
	{
		$type = $_GET['type'];
		$path_name = '';
		// $this->load->helper('download');
		// $data = file_get_contents('assets/temp_xls/rules_question.xls');
		// force_download('rules_question.xls', $data);

		// Load the existing spreadsheet
		switch ($type) {
			case '1':
				$path_name = 'rules_question_benar_salah.xls';
				$spreadsheet = IOFactory::load('assets/temp_xls/' . $path_name);
				break;
			case '2':
				$path_name = 'rules_question_berganda.xls';
				$spreadsheet = IOFactory::load('assets/temp_xls/' . $path_name);
				break;
			case '3':
				$path_name = 'rules_question_isian_singkat.xls';
				$spreadsheet = IOFactory::load('assets/temp_xls/' . $path_name);
				break;
			case '4':
				$path_name = 'rules_question_majemuk.xls';
				$spreadsheet = IOFactory::load('assets/temp_xls/' . $path_name);
				break;
			case '5':
				$path_name = 'rules_question_menjodohkan.xls';
				$spreadsheet = IOFactory::load('assets/temp_xls/' . $path_name);
				break;
			case '6':
				$path_name = 'rules_question_benar_salah_majemuk.xls';
				$spreadsheet = IOFactory::load('assets/temp_xls/' . $path_name);
				break;
			
			default:
				# code...
				break;
		}

		$worksheet = $spreadsheet->getActiveSheet();

		// Set up the list of options for the dropdown
		$options = [];
		$lesson_options = [];
		$subtests = $this->master->getAllSubtest();
		$lessons = $this->master->getAllLesson();

		foreach ($subtests as $subtest) {
			array_push($options, $subtest->sub_name); // Ganti "nama_field" dengan nama field yang sesuai
		}

		foreach ($lessons as $lesson) {
			array_push($lesson_options, $lesson->lesson_name); // Ganti "nama_field" dengan nama field yang sesuai
		}

		// Set data validation to create dropdown
		$validation = $worksheet->getCell('C13')->getDataValidation();
		$validation->setType(DataValidation::TYPE_LIST) // Use DataValidation::TYPE_LIST
			->setErrorStyle(DataValidation::STYLE_INFORMATION) // Use DataValidation::STYLE_INFORMATION
			->setShowDropDown(true)
			->setFormula1('"' . implode(',', $options) . '"'); // Comma-separated list

		// Set data validation to create dropdown
		$validation = $worksheet->getCell('D13')->getDataValidation();
		$validation->setType(DataValidation::TYPE_LIST) // Use DataValidation::TYPE_LIST
			->setErrorStyle(DataValidation::STYLE_INFORMATION) // Use DataValidation::STYLE_INFORMATION
			->setShowDropDown(true)
			->setFormula1('"' . implode(',', $lesson_options) . '"'); // Comma-separated list

		// Save the edited spreadsheet
		$writer = IOFactory::createWriter($spreadsheet, 'Xls');
		$writer->save('assets/temp_xls/' . $path_name);

		// Download the edited spreadsheet
		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename=' . $path_name);
		header('Cache-Control: max-age=0');
		readfile('assets/temp_xls/' . $path_name);

	}

	public function exportReportIrt($id, $id_category){
		$assignment = $this->assignment->getExamByAssignmentBeginReport($id);

		// print_r(json_encode($assignment->assignment));
		// die();

		foreach ($assignment->assignment->categories as $key => $value) {
			if ($value->id_acat == $id_category) {
				$spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();
				$this->setExportIrt($spreadsheet, $value, $assignment->assignment->assignment_name);
			}
		}
	}

	public function setExportIrt($spreadsheet, $data, $assignment_name) {
	
		// Buat objek Writer untuk format XLSX
		$writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
	
		// Ambil data subtest dari database Anda
		$subtests = $data->subtests;
	
		foreach ($subtests as $subtest) {
			// Buat lembar baru untuk subtest
			$worksheet = $spreadsheet->createSheet();
			$worksheet->setTitle($subtest->subtest->sub_name); // Atur nama lembar sesuai dengan subtest
	
			// Ambil data hasil jawaban siswa untuk subtest ini dari database
			$answers = $subtest->assign;

			// Isi lembar Excel dengan data hasil jawaban siswa
			$rowIndex = 2; // Mulai dari baris kedua
			$rowIndexNilai = count($answers) + 15; // Mulai dari baris ke 14
			$barisJumlah = count($answers) + 2;
			$barisJumlahNilai = count($answers) + 14;
			$worksheet->setCellValue('A' . $barisJumlah, "Jumlah Benar");
			$worksheet->setCellValue('A' . ($barisJumlah + 1), "Nilai Minimum");
			$worksheet->setCellValue('A' . ($barisJumlah + 2), "Nilai Maksimum");
			$worksheet->setCellValue('A' . ($barisJumlah + 4), "% Minimum");
			$worksheet->setCellValue('A' . ($barisJumlah + 5), "% Maksimum");
			$worksheet->setCellValue('C' . ($barisJumlah + 3), "% Benar");
			$worksheet->setCellValue('C' . ($barisJumlah + 4), "% Salah");
			$worksheet->setCellValue('C' . ($barisJumlah + 6), "Nilai IRT");
			$worksheet->setCellValue('C' . ($barisJumlah + 8), "Nilai Minimum");
			$worksheet->setCellValue('C' . ($barisJumlah + 9), "Nilai Maksimum");
	
			// Tambahkan header
			$worksheet->setCellValue('A1', 'NIS');
			$worksheet->setCellValue('B1', 'No');
			$worksheet->setCellValue('C1', 'Nama Siswa');

			// Tambahkan header
			$worksheet->setCellValue('A' . $barisJumlahNilai, 'NIS');
			$worksheet->setCellValue('B' . $barisJumlahNilai, 'No');
			$worksheet->setCellValue('C' . $barisJumlahNilai, 'Nama Siswa');
	
			// Mendapatkan jumlah soal untuk subtest ini
			$totalQuestions = $subtest->qty_soal;
	
			// Menambahkan judul kolom untuk setiap soal
			for ($i = 1; $i <= $totalQuestions; $i++) {
				// Mengatur lebar kolom A dan B dan C
				$worksheet->getColumnDimension('A')->setWidth(20);
				$worksheet->getColumnDimension('B')->setWidth(10);
				$worksheet->getColumnDimension('C')->setWidth(25);

				$worksheet->getStyle("A1")->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("A1")->getFill()->getStartColor()->setARGB('FFFF00');
				$worksheet->getStyle("B1")->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("B1")->getFill()->getStartColor()->setARGB('FFFF00');
				$worksheet->getStyle("C1")->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("C1")->getFill()->getStartColor()->setARGB('FFFF00');

				$worksheet->getStyle("A" . ($rowIndexNilai - 1))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("A" . ($rowIndexNilai - 1))->getFill()->getStartColor()->setARGB('FFFF00');
				$worksheet->getStyle("B" . ($rowIndexNilai - 1))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("B" . ($rowIndexNilai - 1))->getFill()->getStartColor()->setARGB('FFFF00');
				$worksheet->getStyle("C" . ($rowIndexNilai - 1))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("C" . ($rowIndexNilai - 1))->getFill()->getStartColor()->setARGB('FFFF00');
	
				// Mengatur teks pada kolom A dan B menjadi kiri
				$worksheet->getStyle('A')->getAlignment()->setHorizontal('left');
				$worksheet->getStyle('B')->getAlignment()->setHorizontal('center');
				$worksheet->getStyle('C')->getAlignment()->setHorizontal('left');
	
				// Mengatur judul kolom pada kolom C dan seterusnya
				$worksheet->getColumnDimensionByColumn($i + 3)->setWidth(10); // Mengatur lebar kolom C dan seterusnya
				$worksheet->getStyleByColumnAndRow($i + 3, 1)->getAlignment()->setHorizontal('center');
				$worksheet->setCellValueByColumnAndRow($i + 3, 1, 'Soal ' . $i);

				// Mengatur judul kolom pada kolom D dan seterusnya
				$worksheet->getColumnDimensionByColumn($i + 3)->setWidth(10); // Mengatur lebar kolom C dan seterusnya
				$worksheet->getStyleByColumnAndRow($i + 3, $barisJumlahNilai)->getAlignment()->setHorizontal('center');
				$worksheet->setCellValueByColumnAndRow($i + 3, $barisJumlahNilai, 'Soal ' . $i);

				// MEWARNAI ROW DAN KOLOM
				$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 3);
				$worksheet->getStyle($kolomSoal . "1")->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle($kolomSoal . "1")->getFill()->getStartColor()->setARGB('FFFF00');

				$kolomSoalAkhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4);
				$worksheet->getStyle($kolomSoalAkhir . "1")->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle($kolomSoalAkhir . "1")->getFill()->getStartColor()->setARGB('FFFF00');

				// MEWARNAI ROW DAN KOLOM NILAI SISWA
				$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 3);
				$worksheet->getStyle($kolomSoal . ($rowIndexNilai - 1))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle($kolomSoal . ($rowIndexNilai - 1))->getFill()->getStartColor()->setARGB('FFFF00');

				$kolomSoalAkhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4);
				$worksheet->getStyle($kolomSoalAkhir . ($rowIndexNilai - 1))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle($kolomSoalAkhir . ($rowIndexNilai - 1))->getFill()->getStartColor()->setARGB('FFFF00');

				// MEWARNAI JUDUL JUMLAH
				$worksheet->getStyle("C" . ($barisJumlah))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("C" . ($barisJumlah))->getFill()->getStartColor()->setARGB('C4D79B');
				
				// MEWARNAI JUDUL %BENAR
				$worksheet->getStyle("C" . ($barisJumlah + 3))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("C" . ($barisJumlah + 3))->getFill()->getStartColor()->setARGB('FFFF00');
				
				// MEWARNAI JUDUL NILAI IRT
				$worksheet->getStyle("C" . ($barisJumlah + 6))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("C" . ($barisJumlah + 6))->getFill()->getStartColor()->setARGB('8DB4E2');

			}
	
			foreach ($answers as $index => $answer) {
				// Atur data hasil jawaban siswa ke sel-sel Excel
				$worksheet->setCellValue('A' . $rowIndex, $answer->student->student_nis);
				$worksheet->setCellValue('B' . $rowIndex, $index + 1);
				$worksheet->setCellValue('C' . $rowIndex, $answer->student->student_name);

				// Atur data hasil jawaban siswa ke sel-sel Excel
				$worksheet->setCellValue('A' . $rowIndexNilai, $answer->student->student_nis);
				$worksheet->setCellValue('B' . $rowIndexNilai, $index + 1);
				$worksheet->setCellValue('C' . $rowIndexNilai, $answer->student->student_name);

				// Loop melalui jawaban siswa untuk setiap soal
				for ($i = 0; $i < $totalQuestions; $i++) {
					$worksheet->getStyleByColumnAndRow($i + 4, $rowIndex)->getAlignment()->setHorizontal('center');
					if (isset($answer->assign_answers[$i])) {
						// Mengatur teks pada kolom C dan seterusnya menjadi tengah
						$worksheet->setCellValueByColumnAndRow($i + 4, $rowIndex, $answer->assign_answers[$i]->is_true);
					} else {
						$worksheet->setCellValueByColumnAndRow($i + 4, $rowIndex, 0);
					}

					if ($rowIndex % 2 != 0) {
						// STRIPPED COLOR
						$worksheet->getStyle("A" . $rowIndex)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
						$worksheet->getStyle("A" . $rowIndex)->getFill()->getStartColor()->setARGB('D3D3D3');
						$worksheet->getStyle("B" . $rowIndex)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
						$worksheet->getStyle("B" . $rowIndex)->getFill()->getStartColor()->setARGB('D3D3D3');
						$worksheet->getStyle("C" . $rowIndex)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
						$worksheet->getStyle("C" . $rowIndex)->getFill()->getStartColor()->setARGB('D3D3D3');

						// MEWARNAI ROW DAN KOLOM
						$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4);
						$worksheet->getStyle($kolomSoal . $rowIndex)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
						$worksheet->getStyle($kolomSoal . $rowIndex)->getFill()->getStartColor()->setARGB('D3D3D3');

						$kolomSoalAkhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4);
						$worksheet->getStyle($kolomSoalAkhir . $rowIndex)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
						$worksheet->getStyle($kolomSoalAkhir . $rowIndex)->getFill()->getStartColor()->setARGB('D3D3D3');

					}

					// MEWARNAI JUMLAH NILAI
					$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4);
					$worksheet->getStyle($kolomSoal . ($barisJumlah))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
					$worksheet->getStyle($kolomSoal . ($barisJumlah))->getFill()->getStartColor()->setARGB('C4D79B');

					$kolomSoalAkhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4);
					$worksheet->getStyle($kolomSoalAkhir . ($barisJumlah))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
					$worksheet->getStyle($kolomSoalAkhir . ($barisJumlah))->getFill()->getStartColor()->setARGB('C4D79B');
					
					// MEWARNAI %BENAR
					$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4);
					$worksheet->getStyle($kolomSoal . ($barisJumlah + 3))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
					$worksheet->getStyle($kolomSoal . ($barisJumlah + 3))->getFill()->getStartColor()->setARGB('FFFF00');

					$kolomSoalAkhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4);
					$worksheet->getStyle($kolomSoalAkhir . ($barisJumlah + 3))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
					$worksheet->getStyle($kolomSoalAkhir . ($barisJumlah + 3))->getFill()->getStartColor()->setARGB('FFFF00');
					
					// MEWARNAI Nilai IRT
					$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4);
					$worksheet->getStyle($kolomSoal . ($barisJumlah + 6))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
					$worksheet->getStyle($kolomSoal . ($barisJumlah + 6))->getFill()->getStartColor()->setARGB('8DB4E2');

					$kolomSoalAkhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4);
					$worksheet->getStyle($kolomSoalAkhir . ($barisJumlah + 6))->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
					$worksheet->getStyle($kolomSoalAkhir . ($barisJumlah + 6))->getFill()->getStartColor()->setARGB('8DB4E2');

					if ($rowIndexNilai % 2 != 0) {
						// STRIPPED COLOR
						$worksheet->getStyle("A" . $rowIndexNilai)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
						$worksheet->getStyle("A" . $rowIndexNilai)->getFill()->getStartColor()->setARGB('D3D3D3');
						$worksheet->getStyle("B" . $rowIndexNilai)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
						$worksheet->getStyle("B" . $rowIndexNilai)->getFill()->getStartColor()->setARGB('D3D3D3');
						$worksheet->getStyle("C" . $rowIndexNilai)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
						$worksheet->getStyle("C" . $rowIndexNilai)->getFill()->getStartColor()->setARGB('D3D3D3');

						// MEWARNAI ROW DAN KOLOM
						$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4);
						$worksheet->getStyle($kolomSoal . $rowIndexNilai)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
						$worksheet->getStyle($kolomSoal . $rowIndexNilai)->getFill()->getStartColor()->setARGB('D3D3D3');

						$kolomSoalAkhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4);
						$worksheet->getStyle($kolomSoalAkhir . $rowIndexNilai)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
						$worksheet->getStyle($kolomSoalAkhir . $rowIndexNilai)->getFill()->getStartColor()->setARGB('D3D3D3');
					}

					// Nilai
					$worksheet->getStyleByColumnAndRow($i + 4, $rowIndexNilai)->getAlignment()->setHorizontal('center');
					$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)
					$worksheet->setCellValueByColumnAndRow($i + 4, $rowIndexNilai, "=IF($kolomSoal" . $rowIndex . "=1," . $kolomSoal . "$" . ($barisJumlah+6) . ",0)");
					$worksheet->getStyleByColumnAndRow($i + 4, $rowIndexNilai)->getNumberFormat()->setFormatCode('0.00');

					// Menggunakan COUNTIF untuk menghitung jumlah nilai 1 di kolom soal yang sesuai
					// Ini jumlah per soal
					$worksheet->getStyleByColumnAndRow($i + 4, $barisJumlah)->getAlignment()->setHorizontal('center');
					$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)
					$worksheet->setCellValueByColumnAndRow($i + 4, $barisJumlah, "=COUNTIF($kolomSoal" . '2:$' . "$kolomSoal" . ($barisJumlah - 1) . ", 1)");
					
					// Jumlah Nilai Minimum
					$kolomSoalTerakhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 3);
					$worksheet->setCellValue('B' . ($barisJumlah + 1), "=MIN(D" . ($barisJumlah) . ":" . $kolomSoalTerakhir . ($barisJumlah) . ")");
					// Jumlah Nilai Maksimum
					$worksheet->setCellValue('B' . ($barisJumlah + 2), "=MAX(D" . ($barisJumlah) . ":" . $kolomSoalTerakhir . ($barisJumlah) . ")");
					//  Jumlah % Minimum
					$worksheet->setCellValue('B' . ($barisJumlah + 4), "=MIN(D" . ($barisJumlah + 1) . ":" . $kolomSoalTerakhir . ($barisJumlah + 1) . ")");
					$worksheet->getStyle('B' . ($barisJumlah + 4))->getNumberFormat()->setFormatCode('0.00%');
					//  Jumlah % Maksimum
					$worksheet->setCellValue('B' . ($barisJumlah + 5), "=MAX(D" . ($barisJumlah + 1) . ":" . $kolomSoalTerakhir . ($barisJumlah + 1) . ")");
					$worksheet->getStyle('B' . ($barisJumlah + 5))->getNumberFormat()->setFormatCode('0.00%');
					//  Jumlah Nilai Minimum IRT
					$worksheet->setCellValue('D' . ($barisJumlah + 8), "=MIN(D" . ($barisJumlah + 6) . ":" . $kolomSoalTerakhir . ($barisJumlah + 6) . ")");
					$worksheet->getStyle('D' . ($barisJumlah + 8))->getNumberFormat()->setFormatCode('0.00');
					//  Jumlah Nilai Minimum IRT
					$worksheet->setCellValue('D' . ($barisJumlah + 9), "=MAX(D" . ($barisJumlah + 6) . ":" . $kolomSoalTerakhir . ($barisJumlah + 6) . ")");
					$worksheet->getStyle('D' . ($barisJumlah + 9))->getNumberFormat()->setFormatCode('0.00');

					// Persentase
					$worksheet->getStyleByColumnAndRow($i + 4, $barisJumlah +1)->getAlignment()->setHorizontal('center');
					$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)
					$worksheet->setCellValueByColumnAndRow($i + 4, $barisJumlah+1, "=$kolomSoal" . $barisJumlah . '/$' . "B" . '$' . ($barisJumlah - 1));
					// Mengatur sel ke format persentase
					$worksheet->getStyleByColumnAndRow($i + 4, $barisJumlah + 1)->getNumberFormat()->setFormatCode('0.00%');

					// Persentase Benar
					$worksheet->getStyleByColumnAndRow($i + 4, $barisJumlah +3)->getAlignment()->setHorizontal('center');
					$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)
					$kolomSoalTerakhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)
					$worksheet->setCellValueByColumnAndRow($i + 4, $barisJumlah + 3, "=$kolomSoal" . $barisJumlah . '/$' . $kolomSoalTerakhir . '$' . ($barisJumlah));
					// Mengatur sel ke format persentase
					$worksheet->getStyleByColumnAndRow($i + 4, $barisJumlah + 3)->getNumberFormat()->setFormatCode('0.00%');

					// Persentase Salah
					$worksheet->getStyleByColumnAndRow($i + 4, $barisJumlah +4)->getAlignment()->setHorizontal('center');
					$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)// Konversi indeks kolom ke huruf (C, D, E, dll.)
					$worksheet->setCellValueByColumnAndRow($i + 4, $barisJumlah + 4, "=1-$kolomSoal" . ($barisJumlah + 3));
					// Mengatur sel ke format persentase
					$worksheet->getStyleByColumnAndRow($i + 4, $barisJumlah + 4)->getNumberFormat()->setFormatCode('0.00%');

					// Score IRT
					$worksheet->getStyleByColumnAndRow($i + 4, $barisJumlah +6)->getAlignment()->setHorizontal('center');
					$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)// Konversi indeks kolom ke huruf (C, D, E, dll.)
					$kolomSoalAkhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)
					$worksheet->setCellValueByColumnAndRow($i + 4, $barisJumlah + 6, "=$kolomSoal" . ($barisJumlah + 4) . "*1000/$kolomSoalAkhir" . ($barisJumlah + 4));
					$worksheet->getStyleByColumnAndRow($i + 4, $barisJumlah + 6)->getNumberFormat()->setFormatCode('0.00');
				}
				
				// Ini jumlah per siswa
				$worksheet->getStyleByColumnAndRow($totalQuestions + 4, $rowIndex)->getAlignment()->setHorizontal('center');
				$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 3); // Konversi indeks kolom ke huruf (C, D, E, dll.)
				$worksheet->setCellValueByColumnAndRow($totalQuestions + 4, $rowIndex, "=COUNTIF(D" .$rowIndex . ':$' . "$kolomSoal$rowIndex,1)");
				
				// Ini jumlah nilai per siswa
				$worksheet->getStyleByColumnAndRow($totalQuestions + 4, $rowIndexNilai)->getAlignment()->setHorizontal('center');
				$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 3); // Konversi indeks kolom ke huruf (C, D, E, dll.)
				$worksheet->setCellValueByColumnAndRow($totalQuestions + 4, $rowIndexNilai, "=SUM(D" .$rowIndexNilai . ':$' . "$kolomSoal$rowIndexNilai)");
				$worksheet->getStyleByColumnAndRow($totalQuestions + 4, $rowIndexNilai)->getNumberFormat()->setFormatCode('0.00');
				
				$rowIndex++;
				$rowIndexNilai++;
			}
			// TOTAL BENAR
			$worksheet->getStyleByColumnAndRow($totalQuestions + 4, $barisJumlah)->getAlignment()->setHorizontal('center');
			$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)
			$worksheet->setCellValueByColumnAndRow($totalQuestions + 4, 1, "Total");
			$worksheet->setCellValueByColumnAndRow($totalQuestions + 4, count($answers) + 14, "Total");
			$worksheet->setCellValueByColumnAndRow($totalQuestions + 4, $barisJumlah, "=SUM($kolomSoal" . '2:$' . "$kolomSoal" . ($barisJumlah - 1) . ")");

			// TOTAL BENAR PERSENTASE
			$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 3); // Konversi indeks kolom ke huruf (C, D, E, dll.)
			$worksheet->setCellValueByColumnAndRow($totalQuestions + 4, $barisJumlah + 3, '=SUM(D' . ($barisJumlah + 3) . ':' . $kolomSoal . ($barisJumlah + 3) . ')');
			$worksheet->getStyleByColumnAndRow($totalQuestions + 4, $barisJumlah + 3)->getNumberFormat()->setFormatCode('0.00%');
			
			// TOTAL SALAH PERSENTASE
			$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 3); // Konversi indeks kolom ke huruf (C, D, E, dll.)
			$worksheet->setCellValueByColumnAndRow($totalQuestions + 4, $barisJumlah + 4, '=SUM(D' . ($barisJumlah + 4) . ':' . $kolomSoal . ($barisJumlah + 4) . ')');
			$worksheet->getStyleByColumnAndRow($totalQuestions + 4, $barisJumlah + 4)->getNumberFormat()->setFormatCode('0.00%');
			
			// TOTAL IRT
			$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 3); // Konversi indeks kolom ke huruf (C, D, E, dll.)
			$worksheet->setCellValueByColumnAndRow($totalQuestions + 4, $barisJumlah + 6, '=SUM(D' . ($barisJumlah + 6) . ':' . $kolomSoal . ($barisJumlah + 6) . ')');
		}

		// REKAP
		$worksheet = $spreadsheet->createSheet();
		$worksheet->setTitle('Rekap');

		// Tambahkan header
		$worksheet->setCellValue('A1', 'NIS');
		$worksheet->setCellValue('B1', 'No');
		$worksheet->setCellValue('C1', 'Nama Siswa');

		$worksheet->getStyle("A1")->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
		$worksheet->getStyle("A1")->getFill()->getStartColor()->setARGB('FFFF00');
		$worksheet->getStyle("B1")->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
		$worksheet->getStyle("B1")->getFill()->getStartColor()->setARGB('FFFF00');
		$worksheet->getStyle("C1")->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
		$worksheet->getStyle("C1")->getFill()->getStartColor()->setARGB('FFFF00');

		// Mengatur lebar kolom A dan B dan C
		$worksheet->getColumnDimension('A')->setWidth(15);
		$worksheet->getColumnDimension('B')->setWidth(10);
		$worksheet->getColumnDimension('C')->setWidth(20);

		// Mengatur teks pada kolom A dan B menjadi kiri
		$worksheet->getStyle('A')->getAlignment()->setHorizontal('center');
		$worksheet->getStyle('B')->getAlignment()->setHorizontal('center');
		$worksheet->getStyle('C')->getAlignment()->setHorizontal('left');

		$rowIndex = 2; // Mulai dari baris kedua
		$rowIndexNilai = count($subtests[0]->assign) + 15; // Mulai dari baris ke 14
		foreach ($subtests[0]->assign as $keyAss => $assignment) {
			// Atur data hasil jawaban siswa ke sel-sel Excel
			$worksheet->setCellValue('A' . $rowIndex, $assignment->student->student_nis);
			$worksheet->setCellValue('B' . $rowIndex, $keyAss + 1);
			$worksheet->setCellValue('C' . $rowIndex, $assignment->student->student_name);

			if ($rowIndex % 2 != 0) {
				// STRIPPED COLOR
				$worksheet->getStyle("A" . $rowIndex)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("A" . $rowIndex)->getFill()->getStartColor()->setARGB('D3D3D3');
				$worksheet->getStyle("B" . $rowIndex)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("B" . $rowIndex)->getFill()->getStartColor()->setARGB('D3D3D3');
				$worksheet->getStyle("C" . $rowIndex)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle("C" . $rowIndex)->getFill()->getStartColor()->setARGB('D3D3D3');
			}

			// Menambahkan judul kolom untuk setiap soal
			foreach ($subtests as $key => $subtest)  {

				// Ambil data hasil jawaban siswa untuk subtest ini dari database
				$answers = $subtest->assign;
				$totalQuestions = $subtest->qty_soal;
				// Isi lembar Excel dengan data hasil jawaban siswa

				// nama subtest
				$subtestName = $subtest->subtest->sub_name;
				// Mengatur lebar kolom A dan B dan C
				$worksheet->getColumnDimension('A')->setWidth(15);
				$worksheet->getColumnDimension('B')->setWidth(10);
				$worksheet->getColumnDimension('C')->setWidth(20);

				// MEWARNAI JUDUL SUBTEST
				$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($key + 4);
				$worksheet->getStyle($kolomSoal . 1)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
				$worksheet->getStyle($kolomSoal . 1)->getFill()->getStartColor()->setARGB('FFFF00');

				// Mengatur teks pada kolom A dan B menjadi kiri
				$worksheet->getStyle('A')->getAlignment()->setHorizontal('center');
				$worksheet->getStyle('B')->getAlignment()->setHorizontal('center');
				$worksheet->getStyle('C')->getAlignment()->setHorizontal('left');

				if ($rowIndex % 2 != 0) {
					// MEWARNAI ROW DAN KOLOM
					$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($key + 4);
					$worksheet->getStyle($kolomSoal . $rowIndex)->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
					$worksheet->getStyle($kolomSoal . $rowIndex)->getFill()->getStartColor()->setARGB('D3D3D3');
				}

				// Mengatur judul kolom pada kolom C dan seterusnya
				$worksheet->getColumnDimensionByColumn($key + 4)->setWidth(20); // Mengatur lebar kolom C dan seterusnya
				$worksheet->getStyleByColumnAndRow($key + 4, 1)->getAlignment()->setHorizontal('center');
				$worksheet->setCellValueByColumnAndRow($key + 4, 1, $subtest->subtest->sub_name);

				// Nilai
				$worksheet->getStyleByColumnAndRow($key + 4, $rowIndex)->getAlignment()->setHorizontal('center');
				$kolomSoal = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($key + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)
				$kolomSoalAkhir = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($totalQuestions + 4); // Konversi indeks kolom ke huruf (C, D, E, dll.)
				$worksheet->setCellValueByColumnAndRow($key + 4, $rowIndex, "=VLOOKUP($" . "A" . $rowIndex . "," . "'$subtestName'!$" . "A$" . $rowIndexNilai . ":$" . $kolomSoalAkhir . "$" . $rowIndexNilai . "," . ($totalQuestions + 4) . ",FALSE)");
				$worksheet->getStyleByColumnAndRow($key + 4, $rowIndex)->getNumberFormat()->setFormatCode('0.00');
				
			}
			$rowIndex++;
			$rowIndexNilai++;
		}

		// Mengatur header HTTP untuk file Excel yang akan diunduh
		header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
		header('Content-Disposition: attachment; filename="Laporan ' . $assignment_name . '-' . $data->category->cat_name . '.xlsx"');
	
		// Simpan file Excel ke output browser
		$writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);
		$writer->save('php://output');
	}	
}

/* End of file MainPage.php */
/* Location: ./application/controllers/MainPage.php */ 