<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AssignmentModel extends CI_Model {

	public function getAllAssignment() {
		$this->db->order_by('ms_assignment.id_assignment', 'desc');
		$this->db->where('ms_assignment.assignment_hide', 0);
		if ($this->session->userdata('level') != 'admin') {
			$this->db->where('ms_assignment.id_', $this->session->userdata('id_'));
		}
		// $this->db->join('ms_lesson', 'ms_assignment.id_lesson = ms_lesson.id_lesson', 'left');
		$assignments = $this->db->get('ms_assignment')->result_object();

		foreach ($assignments as $key => $assignment) {
			$this->db->where("id_assignment", $assignment->id_assignment);
			$assignment->categories = $this->db->get('assignment_categories')->result_object();

			$this->db->where("id_assignment", $assignment->id_assignment);
			$assignment->assigns = $this->db->get('assignment_begin')->result_object();

			foreach ($assignment->categories as $k => $category) {
				$this->db->where('id_cat', $category->id_category);
				$category->category = $this->db->get('ms_subtest_categories')->row();

				$this->db->where('id_assignment', $assignment->id_assignment);
				$this->db->where('id_category', $category->id_acat);
				$subtests = $this->db->get('assignment_detail_subtest')->result_object();
				$category->subtests = $subtests;

				foreach ($category->subtests as $ks => $sub) {
					$this->db->where('id_sub', $sub->id_subtest);
					$sub->subtest = $this->db->get('ms_question_subtest')->row();
				}

			}

		}

		return $assignments;
	}
	public function getAllAssignmentStudent() {
		$this->db->order_by('ms_assignment.id_assignment', 'desc');
		$this->db->where('ms_assignment.assignment_hide', 0);
		$this->db->join('ms_lesson', 'ms_assignment.id_lesson = ms_lesson.id_lesson', 'left');
		return $this->db->get('ms_assignment')->result_object();
	}
	public function getAssignmentById($id_assignment) {
		$this->db->where('ms_assignment.id_assignment', $id_assignment);
		$this->db->where('ms_assignment.assignment_hide', 0);
		$this->db->join('ms_lesson', 'ms_assignment.id_lesson = ms_lesson.id_lesson', 'left');
		return $this->db->get('ms_assignment')->row_object();
	}
	public function insertAssignment($data) {
		$this->db->insert('ms_assignment', $data);
		return $this->db->insert_id();
	}
	public function insertAssignmentClass($data) {
		return $this->db->insert('assignment_class', $data);
	}
	public function getQuestionByAssignment($id_assignment,$assignment_order = NULL) {
		$this->db->where('assignment_question.id_assignment', $id_assignment);
		if ($assignment_order) {
			$this->db->order_by('assignment_question.id_aquestion', 'random');
		}
		$this->db->where('assignment_question.val_hide', 0);
		$this->db->join('ms_question', 'assignment_question.id_question = ms_question.id_question', 'left');
		return $this->db->get('assignment_question')->result_object();
	}
	public function insertQuestion($data) {
		$this->db->insert('ms_question', $data);
		return $this->db->insert_id();
	}
	public function insertOption($data) {
		return $this->db->insert('question_option', $data);
	}
	public function insertMatch($data) {
		$this->db->insert('question_match', $data);
		return $this->db->insert_id();
	}
	public function insertAnswer($data) {
		return $this->db->insert('question_answer', $data);
		
	}
	public function insertMatchAnswer($data) {
		return $this->db->insert('question_match_answer', $data);
		
	}
	public function CheckAssignmentQuestionByAssignmentAndQuestion($id_assignment,$id_question) {
		$this->db->where('id_assignment', $id_question);
		return $this->db->get('assignment_question')->row_object();
	}
	public function insertAssignmentQuestion($data) {
		return $this->db->insert('assignment_question', $data);
	}
	public function insertAssignmentQuestionAnswer($data) {
		$this->db->insert('assignment_question_answers', $data);
    	return $this->db->insert_id();
	}
	public function getOptionByQuestion($id_question) {
		$this->db->where('id_question', $id_question);
		$this->db->where('option_hide', 0);
		return $this->db->get('question_option')->result_object();
	}
	public function getQuestionById($id_question) {
		$this->db->where('id_question', $id_question);
		$this->db->where('question_hide', 0);
		return $this->db->get('ms_question')->row_object();
	}
	public function getQuestionSubtestLevel($id_sub, $level) {
		$this->db->where('id_sub', $id_sub);
		$this->db->where('question_level', $level);
		$this->db->where('question_hide', 0);
		$this->db->order_by('RAND()'); // Mengurutkan data secara acak
		$question = $this->db->get('ms_question')->row();

		if ($question) {
			if ($question->id_type == 1 ||
				$question->id_type == 2 ||
				$question->id_type == 4) {
				$this->db->where('id_question', $question->id_question);
				$this->db->where('option_hide', 0);
				$question->answer = $this->db->get('question_option')->result_object();
			}else if ($question->id_type == 3){
				$this->db->where('id_question', $question->id_question);
				$this->db->where('option_hide', 0);
				$question->answer = $this->db->get('question_answer')->result_object();
			}else{
				$match = [];
				$this->db->where('id_question', $question->id_question);
				$this->db->where('option_hide', 0);
				$question->answer = $this->db->get('question_match')->result_object();
	
				foreach ($question->answer as $key => $value) {
					$this->db->where('id_match', $value->id_option);
					$this->db->where('option_hide', 0);
					$value->match = $this->db->get('question_match_answer')->row();
					array_push($match, $value->match);
				}

				$question->match = $match;
	
			}
		}

		return $question;
	}
	public function updateQuestion($data) {
		$this->db->where('id_question', $data['id_question']);
		return $this->db->update('ms_question', $data);
	}
	public function updateOption($data) {
		$this->db->where('id_option', $data['id_option']);
		return $this->db->update('question_option', $data);
	}
	public function updateAssignmentQuestion($data) {
		$this->db->where('id_assignment', $data['id_assignment']);
		$this->db->where('id_question', $data['id_question']);
		return $this->db->update('assignment_question', $data);
	}
	public function updateAssignment($data) {
		$this->db->where('id_assignment', $data['id_assignment']);
		return $this->db->update('ms_assignment', $data);
	}
	public function getClassByAssignment($id_assignment) {
		$this->db->where('assignment_class.id_assignment', $id_assignment);
		$this->db->join('ms_class', 'assignment_class.id_class = ms_class.id_class', 'left');
		return $this->db->get('assignment_class')->result_object();
	}
	public function deleteAssignmentClassId($id_aclass) {
		$this->db->where('id_aclass', $id_aclass);
		return $this->db->delete('assignment_class');
	}
	public function getAllQuestion() {
		$this->db->where('ms_question.question_hide', 0);
		$this->db->order_by('ms_question.id_question', 'desc');
		// $this->db->join('ms_question_subtest', 'ms_question.id_sub = ms_question_subtest.id_sub', 'left');
		// return $this->db->get('ms_question')->result_object();
		$questions = $this->db->get('ms_question')->result_object();

		// Loop through subtest
		foreach ($questions as &$question) {
			$this->db->where('id_lesson', $question->id_lesson);
			$lesson = $this->db->get('ms_lesson')->row();

			$this->db->where('id_sub', $question->id_sub);
			$subtest = $this->db->get('ms_question_subtest')->row();

			$this->db->where('id_type', $question->id_type);
			$type = $this->db->get('ms_question_type')->row();

			$question->lesson = $lesson;
			$question->subtest = $subtest;
			$question->type = $type;
		}
    	return $questions;
	}
	public function getAnswerByQuestion($id_question) {
		$this->db->where('id_question', $id_question);
		$this->db->where('option_hide', 0);
		return $this->db->get('question_option')->result_object();
	}
	public function getIdAssignmentByQuestion($id_question) {
		$this->db->where('id_question', $id_question);
		$this->db->where('val_hide', 0);
		return $this->db->get('assignment_question')->row_object();
	}

	// STUDENT BELOW HERE //
	public function checkBegin($data) {
		$this->db->where('id_assignment', $data['id_assignment']);
		$this->db->where('id_student', $data['id_student']);
		return $this->db->get('assignment_begin')->row_object();
	}
	public function checkDoneAssignment($id_assignment,$id_student) {
		$this->db->where('id_assignment', $id_assignment);
		$this->db->where('id_student', $id_student);
		return $this->db->get('assignment_result')->row_object();
	}
	public function insertBegin($data) {
		$this->db->insert('assignment_begin', $data);
		return $this->db->insert_id();
	}
	public function checkTrueOption($id_option) {
		$this->db->where('id_option', $id_option);
		$this->db->where('option_hide', 0);
		$this->db->where('option_true', 1);
		return $this->db->get('question_option')->row_object();
	}
	public function insertAssignmentAnalytics($data) {
		return $this->db->insert('assignment_analytics', $data);
	}
	public function insertAssignmentResult($data) {
		return $this->db->insert('assignment_result', $data);
	}
	public function deleteAssignmentBegin($id_assignment,$id_student) {
		$this->db->where('id_assignment', $id_assignment);
		$this->db->where('id_student', $id_student);
		return $this->db->delete('assignment_begin');
	}
	public function getResultByStudent($id_student) {
		$query = "SELECT * FROM assignment_result WHERE id_student = '$id_student' ORDER BY result_created DESC";
		return $this->db->query($query)->result_object();
	}
	public function getResultStudentById($id_assignment,$id_student) {
		$this->db->where('id_assignment', $id_assignment);
		$this->db->where('id_student', $id_student);
		return $this->db->get('assignment_result')->row_object();
	}
	public function getAnalyticsStudentById($id_assignment,$id_student) {
		$this->db->where('assignment_analytics.id_assignment', $id_assignment);
		$this->db->where('assignment_analytics.id_student', $id_student);
		$this->db->join('ms_question', 'assignment_analytics.id_question = ms_question.id_question', 'left');
		return $this->db->get('assignment_analytics')->result_object();
	}
	public function getOptionById($id_option) {
		$this->db->where('id_option', $id_option);
		$this->db->where('option_hide', 0);
		return $this->db->get('question_option')->row_object();
	}
	public function getTrueAnswerByQuestion($id_question) {
		$this->db->where('id_question', $id_question);
		$this->db->where('option_true', 1);
		$this->db->where('option_hide', 0);
		return $this->db->get('question_option')->row_object();
	}
	// NEWEST //
	public function getLessonInAssignment() {
		$id_ = $this->session->userdata('id_');
		$query = "SELECT DISTINCT id_lesson FROM ms_assignment WHERE id_ = '$id_'";
		return $this->db->query($query)->result_object();
	}
	public function getLessonById($id_lesson) {
		$this->db->where('id_lesson', $id_lesson);
		return $this->db->get('ms_lesson')->row_object();
	}
	public function getAssignmentByLesson($id_lesson) {
		$query = "SELECT DISTINCT id_assignment FROM ms_assignment WHERE id_lesson = '$id_lesson'";
		return $this->db->query($query)->result_object();
	}
	public function getAsssignmentTypeByLesson($id_lesson) {
		$query = "SELECT DISTINCT assignment_type FROM ms_assignment WHERE id_lesson = '$id_lesson'";
		return $this->db->query($query)->result_object();
	}
	public function getResultByAssignment($id_assignment) {
		$this->db->where('id_assignment', $id_assignment);
		return $this->db->get('assignment_result')->result_object();
	}
	public function getAssignmentByClass($id_class) {
		// $query = "SELECT DISTINCT id_assignment FROM assignment_class WHERE id_class = '$id_class' ORDER BY id_aclass DESC";
		$query = "SELECT DISTINCT id_assignment FROM assignment_class WHERE id_class = '$id_class'";
		return $this->db->query($query)->result_object();
	}
	public function getAssignmentByTypeLessonAndId($assignment_type,$id_lesson,$id_assignment) {
		$this->db->where('assignment_type', $assignment_type);
		$this->db->where('id_lesson', $id_lesson);
		$this->db->where('id_assignment', $id_assignment);
		return $this->db->get('ms_assignment')->row_object();
	}
	public function getResultByStudentAndAssignment($id_student,$id_assignment) {
		$this->db->where('id_student', $id_student);
		$this->db->where('id_assignment', $id_assignment);
		return $this->db->get('assignment_result')->row_object();
	}
	public function getAnalyticsByStudentAndAssignment($id_student,$id_assignment) {
		$this->db->where('id_student', $id_student);
		$this->db->where('id_assignment', $id_assignment);
		return $this->db->get('assignment_analytics')->result_object();
	}
	public function getActiveAssignment(){
		$this->db->where('assignment_hide', 0);
		$this->db->where('assignment_active', 1);
		if ($this->session->userdata('level') != 'admin') {
			$this->db->where('id_', $this->session->userdata('id_'));
		}
		return $this->db->get('ms_assignment')->result_object();
	}
	public function getAllResult() {
		return $this->db->get('assignment_result')->result_object();
	}
	public function getAssignmentByTeacher($id_teacher) {
		$this->db->where('id_', $id_teacher);
		return $this->db->get('ms_assignment')->result_object();
	}
	public function checkAnswerTrue($id_option,$id_question) {
		$this->db->where('id_option', $id_option);
		$this->db->where('id_question', $id_question);
		$this->db->where('option_true', 1);
		return $this->db->get('question_option')->row_object();
	}
	public function deleteOptionById($id_option) {
		$this->db->where('id_option', $id_option);
		return $this->db->delete('question_option');
	}
	public function getAssignmentByClassNew($id_class) {
		$query = "SELECT * FROM assignment_class WHERE id_class = '$id_class' ORDER BY id_aclass DESC";
		return $this->db->query($query)->result_object();
	}

	// ASSIGNMENT CATEGORY //
	public function getAllAssignmentCategory() {
		$this->db->order_by('id_acat', 'asc');
		return $this->db->get('assignment_categories')->result_object();
	}
	public function getAssignmentCategoryById($id_subtest) {
		$this->db->where('id_acat', $id_subtest);
		return $this->db->get('assignment_categories')->row_object();
	}
	public function insertAssignmentCategory($data) {
		$this->db->insert('assignment_categories', $data);
		return $this->db->insert_id();
	}
	public function insertAssignmentBeginCategory($data) {
		$this->db->insert('assignment_begin_categories', $data);
		return $this->db->insert_id();
	}
	public function getAllAssignmentBeginCategory($id) {
		$this->db->where('id_begin', $id);
		$this->db->order_by('id_begin', 'asc');
		return $this->db->get('assignment_begin_categories')->result_object();
	}
	public function updateAssignmentBeginCategory($data) {
		$this->db->where('id_acat', $data['id_acat']);
		$result = $this->db->update('assignment_begin_categories', $data);
	}
	public function updateAssignmentCategory($data) {
		$this->db->where('id_acat', $data['id_acat']);
		return $this->db->update('assignment_categories', $data);
	}
	public function deleteAssignmentCategory($id_sub) {
		$this->db->where('id_acat', $id_sub);
		return $this->db->delete('assignment_categories');
	}
	// END //

	// ASSIGNMENT DETAIL SUBTEST //
	public function getAllAssignmentDetailSubtest() {
		$this->db->order_by('id_detail', 'asc');
		return $this->db->get('assignment_detail_subtest')->result_object();
	}
	public function getAssignmentDetailSubtestById($id_subtest) {
		$this->db->where('id_detail', $id_subtest);
		return $this->db->get('assignment_detail_subtest')->row_object();
	}
	public function insertAssignmentDetailSubtest($data) {
		return $this->db->insert('assignment_detail_subtest', $data);
	}
	public function updateAssignmentDetailSubtest($data) {
		$this->db->where('id_detail', $data['id_detail']);
		$result = $this->db->update('assignment_detail_subtest', $data);
		
		// Memeriksa apakah pembaruan berhasil
		if ($result) {
			// Jika berhasil, ambil data yang telah diperbarui
			$this->db->where('id_detail', $data['id_detail']);
			$updatedData = $this->db->get('assignment_detail_subtest')->row();

			$this->db->where('id_sub', $updatedData->id_subtest);
			$updatedData->subtest = $this->db->get('ms_question_subtest')->row();
			if ($updatedData) {
				return $updatedData;
			}else{
				$this->output
				->set_content_type('application/json')
				->set_output(json_encode($response= [
					'messange' => "data kosong"
				]));
			}
		} else {
			// Jika gagal, kembalikan FALSE
			return FALSE;
		}
	}
	public function deleteAssignmentDetailSubtest($id_sub) {
		$this->db->where('id_detail', $id_sub);
		return $this->db->delete('assignment_detail_subtest');
	}
	// END //

	// ASSIGN BEGIN SUBTEST
	public function getAllAssignmentBeginSubtest($id_begin_cat, $id_begin = null) {
		$this->db->where('id_begin_cat', $id_begin_cat);
		if ($id_begin) {
			$this->db->where('id_begin', $id_begin);
		}
		$this->db->order_by('id', 'asc');
		return $this->db->get('assignment_begin_subtest')->result_object();
	}
	public function getAssignmentBeginSubtestByCategory($id_begin_cat) {
		$this->db->where('id_begin_cat', $id_begin_cat);
		return $this->db->get('assignment_begin_subtest')->row_object();
	}
	public function insertAssignmentBeginSubtest($data) {
		return $this->db->insert('assignment_begin_subtest', $data);
	}
	public function updateAssignmentBeginSubtest($data) {
		$this->db->where('id', $data['id']);
		$result = $this->db->update('assignment_begin_subtest', $data);

		if ($result) {
			// Pembaruan berhasil, ambil objek hasilnya
			$this->db->where('id', $data['id']);
			$updatedData = $this->db->get('assignment_begin_subtest')->row();
	
			return $updatedData;
		} else {
			// Pembaruan gagal, kembalikan null atau sesuai dengan kebutuhan Anda
			return null;
		}
	}
	// END

	// INSERT JAWABAN SISWA
	public function insertAssignmentAnswerSingle($data) {
		return $this->db->insert('assignment_answer_singles', $data);
	}

	public function insertAssignmentAnswerMatch($data) {
		return $this->db->insert('assignment_answer_match', $data);
	}

	public function insertAssignmentAnswerText($data) {
		return $this->db->insert('assignment_answer_text', $data);
	}

	public function getExamByStudent($id_student) {
		$this->db->where('id_student', $id_student);
		$this->db->where('assignment_active', 1);
		$this->db->where('status <>', 2);
		$this->db->join('ms_assignment', 'assignment_begin.id_assignment = ms_assignment.id_assignment', 'left');
		$students = $this->db->get('assignment_begin')->result_object();

		foreach ($students as $index => $student) {
			$this->db->where('id_assignment', $student->id_assignment);
			$student->assignment = $this->db->get('ms_assignment')->row();
	
			$this->db->where('id_begin', $student->id_abegin);
			$this->db->order_by('order', 'asc');
			$categories = $this->db->get('assignment_begin_categories')->result_object();

			$student->assignment->categories = $categories;

			foreach ($categories as $key => $category) {
				$this->db->where('id_cat', $category->id_category);
				$category->category = $this->db->get('ms_subtest_categories')->row();

				$this->db->where('id_begin', $student->id_abegin);
				$this->db->where('id_begin_cat', $category->id_acat);
				$this->db->order_by('order', 'asc');
				$subtests = $this->db->get('assignment_begin_subtest')->result_object();
				$category->subtests = $subtests;

				foreach ($subtests as $k => $subtest) {
					$this->db->where('id_sub', $subtest->id_subtest);
					$subtest->subtest = $this->db->get('ms_question_subtest')->row();
				}
			}
		}

    	return $students;
	}

	public function getExamByStudentHistory($id_student) {
		$this->db->where('id_student', $id_student);
		$this->db->where('assignment_active', 1);
		$this->db->where('status', 2);
		$this->db->join('ms_assignment', 'assignment_begin.id_assignment = ms_assignment.id_assignment', 'left');
		$students = $this->db->get('assignment_begin')->result_object();

		foreach ($students as $index => $student) {
			$this->db->where('id_assignment', $student->id_assignment);
			$student->assignment = $this->db->get('ms_assignment')->row();
	
			$this->db->where('id_begin', $student->id_abegin);
			$categories = $this->db->get('assignment_begin_categories')->result_object();

			$student->assignment->categories = $categories;

			foreach ($categories as $key => $category) {
				$this->db->where('id_cat', $category->id_category);
				$category->category = $this->db->get('ms_subtest_categories')->row();

				$this->db->where('id_begin', $student->id_abegin);
				$this->db->where('id_begin_cat', $category->id_acat);
				$subtests = $this->db->get('assignment_begin_subtest')->result_object();
				$category->subtests = $subtests;

				foreach ($subtests as $k => $subtest) {
					$this->db->where('id_sub', $subtest->id_subtest);
					$subtest->subtest = $this->db->get('ms_question_subtest')->row();

					$this->db->where('id_assign_begin', $student->id_abegin);
					$this->db->where('id_student', $id_student);
					$this->db->where('id_assign_begin_category', $category->id_acat);
					$this->db->where('id_assign_begin_subtest', $subtest->id);
					$assign_question = $this->db->get('assignment_question_answers')->result_object();
					$subtest->assign_answers = $assign_question;

					foreach ($assign_question as $key => $ass) {
						// $ass->question = $ass->id_question;
						$this->db->where('id_question', $ass->id_question);
						$question = $this->db->get('ms_question')->row();
						$ass->question = $question;

						if ($question->id_type == 1) {
							$this->db->where('assignment_question_id', $ass->id_assign_question);
							$answer = $this->db->get('assignment_answer_singles')->result_object();
							$ass->answers = $answer;

							if (count($answer) > 0) {
								foreach ($answer as $keyAns => $ans) {
									$this->db->where('id_question', $ass->id_question);
									$this->db->where('id_option', $ans->answer_id);
									$rel_answer = $this->db->get('question_option')->row();
									$ass->rel_answer = $rel_answer;
								}
							}
						}else if ($question->id_type == 2){
							$this->db->where('assignment_question_id', $ass->id_assign_question);
							$answer = $this->db->get('assignment_answer_singles')->result_object();
							$ass->answers = $answer;

							if (count($answer) > 0) {
								foreach ($answer as $keyAns => $ans) {
									$this->db->where('id_question', $ass->id_question);
									$this->db->where('id_option', $ans->answer_id);
									$rel_answer = $this->db->get('question_option')->row();
									$ass->rel_answer = $rel_answer;
								}
							}
						}else if ($question->id_type == 3){
							$this->db->where('assignment_question_id', $ass->id_assign_question);
							$answer = $this->db->get('assignment_answer_text')->result_object();
							$ass->answers = $answer;

							if (count($answer) > 0) {
								$this->db->where('id_question', $ass->id_question);
								$rel_answer = $this->db->get('question_answer')->row();
								$ass->rel_answer = $rel_answer;
							}
						}else if ($question->id_type == 4){
							$this->db->where('assignment_question_id', $ass->id_assign_question);
							$answer = $this->db->get('assignment_answer_singles')->result_object();
							$ass->answers = $answer;
							$ass->rel_answer = [];

							if (count($answer) > 0) {
								foreach ($answer as $keyAns => $ans) {
									$this->db->where('id_question', $ass->id_question);
									$this->db->where('id_option', $ans->answer_id);
									$rel_answer = $this->db->get('question_option')->row();
									array_push($ass->rel_answer,$rel_answer);
								}
							}
						}else{
							$this->db->where('assignment_question_id', $ass->id_assign_question);
							$answer = $this->db->get('assignment_answer_match')->result_object();
							$ass->answers = $answer;
							$ass->rel_answer = [];

							if (count($answer) > 0) {
								foreach ($answer as $keyAns => $ans) {
									$this->db->where('id_question', $ass->id_question);
									$this->db->where('id_option', $ans->answer_match_id);
									$rel_answer = $this->db->get('question_match')->row();
									$_answer = $rel_answer;
									
									$this->db->where('id_option', $ans->answer_match_option_id);
									$rel_match_answer = $this->db->get('question_match_answer')->row();
									$_answer->option = $rel_match_answer;
									// $ass->rel_answer->option = $rel_match_answer;
									array_push($ass->rel_answer,$_answer);
								}
							}
						}
						

					}

					$this->db->where('id_assign_begin', $student->id_abegin);
					$this->db->where('id_student', $id_student);
					$student->assign_answers = $this->db->get('assignment_question_answers')->result_object();
				}
			}
		}

		// print_r(json_encode($students));
		// die();
    	return $students;
	}

	public function updateAssignmentBegin($data) {
		$this->db->where('id_abegin', $data['id_abegin']);
		$result = $this->db->update('assignment_begin', $data);
	}

	public function getExamByAssignmentBegin($id_begin,$id_student) {
		$this->db->where('id_student', $id_student);
		$this->db->where('id_abegin', $id_begin);
		$begin = $this->db->get('assignment_begin')->row();

		$this->db->where('id_assignment', $begin->id_assignment);
		$begin->assignment = $this->db->get('ms_assignment')->row();

		$this->db->where('id_begin', $begin->id_abegin);
		$categories = $this->db->get('assignment_begin_categories')->result_object();

		$begin->assignment->categories = $categories;

		foreach ($categories as $index => $category) {
			$this->db->where('id_cat', $category->id_category);
			$category->category = $this->db->get('ms_subtest_categories')->row();

			$this->db->where('id_begin', $begin->id_abegin);
			$this->db->where('id_begin_cat', $category->id_acat);
			$subtests = $this->db->get('assignment_begin_subtest')->result_object();
			$category->subtests = $subtests;

			foreach ($subtests as $k => $subtest) {
				$this->db->where('id_sub', $subtest->id_subtest);
				$subtest->subtest = $this->db->get('ms_question_subtest')->row();
			}
		}

    	return $begin;
	}

	public function getExamByAssignmentBeginReport($id_assignment) {
		$this->db->where('id_assignment', $id_assignment);
		$begin = $this->db->get('assignment_begin')->row();

		$this->db->where('id_assignment', $begin->id_assignment);
		$begin->assignment = $this->db->get('ms_assignment')->row();

		$this->db->where('id_assignment', $begin->id_assignment);
		$categories = $this->db->get('assignment_categories')->result_object();

		$begin->assignment->categories = $categories;

		foreach ($categories as $index => $category) {
			$this->db->where('id_cat', $category->id_category);
			$category->category = $this->db->get('ms_subtest_categories')->row();

			$this->db->where('id_category', $category->id_acat);
			$this->db->where('id_assignment', $category->id_assignment);
			$subtests = $this->db->get('assignment_detail_subtest')->result_object();
			$category->subtests = $subtests;

			foreach ($subtests as $k => $subtest) {
				$this->db->where('id_sub', $subtest->id_subtest);
				$subtest->subtest = $this->db->get('ms_question_subtest')->row();

				$this->db->where('id_assignment', $id_assignment);
				$assigns = $this->db->get('assignment_begin')->result_object();

				foreach ($assigns as $ka => $assign) {

					$this->db->where('id_begin', $assign->id_abegin);
					$this->db->where('id_category', $category->id_category);
					$begin_category = $this->db->get('assignment_begin_categories')->row();
					
					$this->db->where('id_begin', $assign->id_abegin);
					$this->db->where('id_subtest', $subtest->id_subtest);
					$this->db->where('id_begin_cat', $begin_category->id_acat);
					$begin_subtest = $this->db->get('assignment_begin_subtest')->row();


					$this->db->where('id_student', $assign->id_student);
					$assign->student = $this->db->get('ms_student')->row();

					$this->db->where('id_assign_begin', $assign->id_abegin);
					$this->db->where('id_student', $assign->id_student);
					$this->db->where('id_assign_begin_category', $begin_category->id_acat);
					$this->db->where('id_assign_begin_subtest', $begin_subtest->id);
					$assign->assign_answers = $this->db->get('assignment_question_answers')->result_object();
				}
				$subtest->assign = $assigns;
			}
		}

    	return $begin;
	}
}

/* End of file AssignmentModel.php */
/* Location: ./application/models/AssignmentModel.php */