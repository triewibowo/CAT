<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AuthModel extends CI_Model {

	public function getAdminByUsername($username) {
		$this->db->where('username', $username);
		$this->db->where('admin_hide', 0);
		return $this->db->get('ms_admin')->row_object();
	}
	public function getTeacherByUsername($username) {
		$this->db->where('teacher_username', $username);
		$this->db->where('teacher_hide', 0);
		return $this->db->get('ms_teacher')->row_object();
	}
	public function checkToken($access_token) {
		$this->db->where('access_token', $access_token);
		return $this->db->get('ms_token')->row_object();
	}
	public function registToken($data) {
		return $this->db->insert('ms_token', $data);
	}
	public function deleteToken($access_token) {
		$this->db->where('access_token', $access_token);
		return $this->db->delete('ms_token');
	}
	public function getStudentByNis($nis) {
		$this->db->where('student_nis', $nis);
		$this->db->where('student_hide', 0);
		return $this->db->get('ms_student')->row_object();
	}

}

/* End of file AuthModel.php */
/* Location: ./application/models/AuthModel.php */