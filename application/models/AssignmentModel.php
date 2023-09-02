<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AssignmentModel extends CI_Model {

	public function getAllAssignment() {
		$this->db->order_by('ms_assignment.id_assignment', 'desc');
		$this->db->where('ms_assignment.assignment_hide', 0);
		if ($this->session->userdata('level') != 'admin') {
			$this->db->where('ms_assignment.id_', $this->session->userdata('id_'));
		}
		$this->db->join('ms_lesson', 'ms_assignment.id_lesson = ms_lesson.id_lesson', 'left');
		return $this->db->get('ms_assignment')->result_object();
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
		return $this->db->insert('assignment_begin', $data);
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
}

/* End of file AssignmentModel.php */
/* Location: ./application/models/AssignmentModel.php */