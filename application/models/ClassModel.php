<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ClassModel extends CI_Model {

	public function getAllClass() {
		$this->db->order_by('class_name', 'asc');
		$this->db->where('class_hide', 0);
		return $this->db->get('ms_class')->result_object();
	}
	public function getClassById($id_class) {
		$this->db->where('id_class', $id_class);
		$this->db->where('class_hide', 0);
		return $this->db->get('ms_class')->row_object();
	}
	public function insertClass($data) {
		return $this->db->insert('ms_class', $data);
	}
	public function updateClass($data) {
		$this->db->where('id_class', $data['id_class']);
		return $this->db->update('ms_class', $data);
	}
	public function getAllClassByTeacher($id_teacher) {
		$this->db->where('tr_teacher.id_teacher', $id_teacher);
		$this->db->join('ms_class', 'tr_teacher.id_class = ms_class.id_class', 'left');
		return $this->db->get('tr_teacher')->result_object();
	}
}

/* End of file ClassModel.php */
/* Location: ./application/models/ClassModel.php */