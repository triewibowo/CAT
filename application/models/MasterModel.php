<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MasterModel extends CI_Model {

	// USERS //
	public function getAllUser() {
		$this->db->order_by('full_name', 'asc');
		$this->db->where('admin_hide', 0);
		return $this->db->get('ms_admin')->result_object();
	}
	public function checkAvailableUser($username,$id_admin = NULL) {
		$this->db->where('username', $username);
		if ($id_admin) {
			$this->db->where('id_admin', $id_admin);
		}
		$this->db->where('admin_hide', 0);
		return $this->db->get('ms_admin')->row_object();
	}
	public function insertUser($data) {
		return $this->db->insert('ms_admin', $data);
	}
	public function updateUser($data) {
		$this->db->where('id_admin', $data['id_admin']);
		return $this->db->update('ms_admin', $data);
	}
	// END //

		// QUESTION //
	public function getAllQuestionType() {
		return $this->db->get('ms_question_type')->result_object();
	}

	public function getAllSub() {
		return $this->db->get('ms_question_subtest')->result_object();
	}

	public function getAllLevel() {
		return $this->db->get('ms_question_level')->result_object();
	}
	

	// END QUESTION

	// LESSONS //
	public function getAllLesson() {
		$this->db->where('lesson_hide', 0);
		$this->db->order_by('lesson_name', 'asc');
		return $this->db->get('ms_lesson')->result_object();
	}
	public function getLessontName($lesson_name) {
		$this->db->where('lesson_name', $lesson_name);
		return $this->db->get('ms_lesson')->row_object();
	}
	public function insertLesson($data) {
		return $this->db->insert('ms_lesson', $data);
	}
	public function updateLesson($data) {
		$this->db->where('id_lesson', $data['id_lesson']);
		return $this->db->update('ms_lesson', $data);
	}
	// END //

	// SUBTEST CATEGORIES //
	public function getAllSubtestCatWithRelation() {
		$this->db->where('cat_hide', 0);
		$this->db->order_by('cat_name', 'asc');
		$categories = $this->db->get('ms_subtest_categories')->result_object();

		// Loop through subtest
		foreach ($categories as &$category) {
			$this->db->where('id_cat', $category->id_cat);
			$subtests = $this->db->get('category_subtests')->result_object();

			foreach ($subtests as &$subtest) {
				if (!empty($subtest->id_sub)) {
					$this->db->where('id_sub', $subtest->id_sub);
					$sub = $this->db->get('ms_question_subtest')->row();
					if ($sub) {
						$subtest->sub_name = $sub->sub_name;
					}
				}
			}
			
			$category->subtest = $subtests;
		}

    	return $categories;
	}
	public function getAllSubtestCat() {
		$this->db->where('cat_hide', 0);
		$this->db->order_by('cat_name', 'asc');
		return $this->db->get('ms_subtest_categories')->result_object();
	}
	public function insertSubtestCat($data) {
		return $this->db->insert('ms_subtest_categories', $data);
	}
	public function updateSubtestCat($data) {
		$this->db->where('id_cat', $data['id_cat']);
		return $this->db->update('ms_subtest_categories', $data);
	}
	// END //

	// CLASS //
	public function getAllClass() {
		$this->db->where('class_hide', 0);
		$this->db->order_by('class_name', 'asc');
		return $this->db->get('ms_class')->result_object();
	}
	public function getClassById($id_class) {
		$this->db->where('id_class', $id_class);
		return $this->db->get('ms_class')->row_object();
	}
	public function insertClass($data) {
		return $this->db->insert('ms_class', $data);
	}
	public function updateClass($data) {
		$this->db->where('id_class', $data['id_class']);
		return $this->db->update('ms_class', $data);
	}
	// END //

	// SUBTEST //
	public function getAllSubtest() {
		$this->db->where('sub_hide', 0);
		$this->db->order_by('sub_name', 'asc');
		$subtests = $this->db->get('ms_question_subtest')->result_object();

		// Loop through subtest
		foreach ($subtests as &$subtest) {
			$this->db->where('id_sub', $subtest->id_sub);
			$categories = $this->db->get('category_subtests')->result_object();

			foreach ($categories as &$subtest_category) {
				if (!empty($subtest_category->id_cat)) {
					$this->db->where('id_cat', $subtest_category->id_cat);
					$category = $this->db->get('ms_subtest_categories')->row();
					if ($category) {
						$subtest_category->cat_name = $category->cat_name;
					}
				}
			}

			$subtest->categories = $categories;
		}

    	return $subtests;
	}
	public function getSubtestById($id_sub) {
		$this->db->where('id_sub', $id_sub);
		return $this->db->get('ms_question_subtest')->row_object();
	}
	public function getSubtestName($sub_name) {
		$this->db->where('sub_name', $sub_name);
		return $this->db->get('ms_question_subtest')->row_object();
	}
	public function insertSubtest($data) {
		$this->db->insert('ms_question_subtest', $data);
		return $this->db->insert_id();
	}
	public function updateSubtest($data) {
		$this->db->where('id_sub', $data['id_sub']);
		return $this->db->update('ms_question_subtest', $data);
	}
	// END //

	// CATEGORY SUBTEST //
	public function getAllCategorySubtest() {
		$this->db->where('val_hide', 0);
		$this->db->order_by('id_asubtest', 'asc');
		return $this->db->get('category_subtests')->result_object();
	}
	public function getCategorySubtestById($id_subtest) {
		$this->db->where('id_asub', $id_subtest);
		return $this->db->get('category_subtests')->row_object();
	}
	public function insertCategorySubtest($data) {
		return $this->db->insert('category_subtests', $data);
	}
	public function updateCategorySubtest($data) {
		$this->db->where('id_asub', $data['id_asubtest']);
		return $this->db->update('category_subtests', $data);
	}
	public function deleteCategorySubtest($id_sub) {
		$this->db->where('id_sub', $id_sub);
		return $this->db->delete('category_subtests');
	}
	// END //

	// TEACHERS //
	public function getAllTeacher() {
		$this->db->order_by('teacher_name', 'asc');
		$this->db->where('teacher_hide', 0);
		return $this->db->get('ms_teacher')->result_object();
	}
	public function getTeacherById($id_teacher) {
		$this->db->where('id_teacher', $id_teacher);
		$this->db->where('teacher_hide', 0);
		return $this->db->get('ms_teacher')->row_object();
	}
	public function getTeacherByUsername($teacher_username) {
		$this->db->where('teacher_username', $teacher_username);
		$this->db->where('teacher_hide', 0);
		return $this->db->get('ms_teacher')->row_object();
	}
	public function getClassByTeacher($id_teacher) {
		$this->db->where('teacher_class.id_teacher', $id_teacher);
		$this->db->join('ms_class', 'teacher_class.id_class = ms_class.id_class', 'left');
		return $this->db->get('teacher_class')->result_object();
	}
	public function getLessonByTeacher($id_teacher) {
		$this->db->where('teacher_lesson.id_teacher', $id_teacher);
		$this->db->join('ms_lesson', 'teacher_lesson.id_lesson = ms_lesson.id_lesson', 'left');
		return $this->db->get('teacher_lesson')->result_object();
	}
	public function insertTeacher($data) {
		$this->db->insert('ms_teacher', $data);
		return $this->db->insert_id();
	}
	public function insertTeacherClass($data) {
		return $this->db->insert('teacher_class',$data);
	}
	public function insertTeacherLesson($data) {
		return $this->db->insert('teacher_lesson', $data);
	}
	public function updateTeacher($data) {
		$this->db->where('id_teacher', $data['id_teacher']);
		return $this->db->update('ms_teacher', $data);
	}
	public function deleteClassByTeacher($id_teacher,$id_class) {
		$this->db->where('id_teacher', $id_teacher);
		$this->db->where('id_class', $id_class);
		return $this->db->delete('teacher_class');
	}
	public function deleteLessonByTeacher($id_teacher,$id_lesson) {
		$this->db->where('id_teacher', $id_teacher);
		$this->db->where('id_lesson', $id_lesson);
		return $this->db->delete('teacher_lesson');
	}
	// END //

	// STUDENTS //
	public function getAllStudent($class = null) {
		$this->db->order_by('ms_student.student_name', 'asc');
		$this->db->where('ms_student.student_hide', '0');
		$this->db->where('ms_student.id_class',$class);
		$this->db->join('ms_class', 'ms_student.id_class = ms_class.id_class', 'left');
		return $this->db->get('ms_student')->result_object();
	}
	public function getAllStudentByClass($ids) {
		$this->db->order_by('student_name', 'asc');
		$this->db->where_in('id_class', $ids);
		return $this->db->get('ms_student')->result_object();
	}
	public function getStudentById($id_student) {
		$this->db->where('id_student', $id_student);
		$this->db->where('student_hide', 0);
		return $this->db->get('ms_student')->row_object();
	}
	public function getStudentByClass($id_class) {
		$this->db->where('ms_student.id_class', $id_class);
		$this->db->where('ms_student.student_hide', 0);
		$this->db->join('ms_class', 'ms_student.id_class = ms_class.id_class', 'left');
		return $this->db->get('ms_student')->result_object();
	}
	public function getStudentByNis($student_nis) {
		$this->db->where('student_nis', $student_nis);
		$this->db->where('student_hide', 0);
		return $this->db->get('ms_student')->row_object();
	}
	public function insertStudent($data) {
		return $this->db->insert('ms_student', $data);
	}
	public function updateStudent($data) {
		$this->db->where('id_student', $data['id_student']);
		return $this->db->update('ms_student', $data);
	}
	public function getPresenceByCondition($nis,$from,$until) {
		$query = "SELECT * FROM st_presence WHERE LEFT(presence_log,10) BETWEEN '$from' AND '$until' AND nis = '$nis'";
		return $this->db->query($query)->result_object();
	}
	// END //
	public function getAbsenThisMonth() {
		$month = date('Y-m');
		$query = "SELECT * FROM st_presence WHERE LEFT(presence_log,7) = '$month'";
		return $this->db->query($query)->result_object();
	}
	public function getAbsenWithCondition($date,$type) {
		$query = "SELECT * FROM st_presence WHERE LEFT(presence_log,10) = '$date' AND presence_type = '$type'";
		return $this->db->query($query)->result_object();
	}
	public function getAbsenWithFilteringDashboard($student_nis,$from,$until) {
		$query = "SELECT * FROM st_presence WHERE LEFT(presence_log,10) = '$date' AND presence_type = '$type'";
		return $this->db->query($query)->row_object();
	}
	public function getAbsenWithConditionAndNis($date,$type,$student_nis) {
		$query = "SELECT * FROM st_presence WHERE LEFT(presence_log,10) = '$date' AND presence_type = '$type' AND nis = '$student_nis'";
		// return $query;
		return $this->db->query($query)->result_object();
	}
	public function tendayschart() {
		$arr = [];
		for ($n = 0; $n <= 9; $n++) {
			$tglto = date('Y-m-d',strtotime("-$n days"));
			$qa = "SELECT nis FROM `st_presence` WHERE DATE(presence_log) = '$tglto' And presence_type = 'attend'";
			$ql = "SELECT nis FROM `st_presence` WHERE DATE(presence_log) = '$tglto' And presence_type = 'leave'";
			$qs = "SELECT nis FROM `st_presence` WHERE DATE(presence_log) = '$tglto' And presence_type = 'sick'";
			$qp = "SELECT nis FROM `st_presence` WHERE DATE(presence_log) = '$tglto' And presence_type = 'alpha'";
			$ra = $this->db->query($qa)->num_rows();
			$rl = $this->db->query($ql)->num_rows();
			$rs = $this->db->query($qs)->num_rows();
			$rp = $this->db->query($qp)->num_rows();
			array_unshift($arr, ['logdate' => date('d-m-Y', strtotime($tglto)), 'attend' => $ra, 'leave' => $rl, 'sick' => $rs, 'alpha' => $rp]);
		}
		return $arr;
	}
	public function getAllLog() {
		$this->db->order_by('id_log', 'desc');
		return $this->db->get('ms_log')->result_object();
	}
}

/* End of file MasterModel.php */
/* Location: ./application/models/MasterModel.php */