<?php defined('BASEPATH') OR exit('No direct script access allowed');

class PresenceCtrl extends MY_Controller {

	public function onlineupdater() {
		$data = $this->input->post();
		$time = $data['presence_log']." ".date('H:i:s');
		$tgl = $data['presence_log'];
		$res = $data['presence_res'];
		$nis = $data['nis'];
		$data['presence_log'] = date('Y-m-d H:i:s', strtotime($time));
		
		$where = ['nis' => $data['nis'], "Date(presence_log)" => date('Y-m-d',strtotime($tgl))];
		//echo $this->db->get_where('st_presence',$where)->num_rows().",".$this->db->last_query();
		if ($this->db->get_where('st_presence',$where)->num_rows() != 0) {
			unset($data['nis']);
			unset($data['presence_log']);
			unset($data['presence_res']);
			$this->db->where($where);
			$this->db->update('st_presence',$data);
			$id = $this->db->get_where('st_presence',$where)->row()->idpresence;
		} else {
			$this->db->insert('st_presence',$data);
			$id = $this->db->insert_id();
		}

		if ($data['presence_type'] != 'attend') {
			$out = "No record";
		} else {
			$out = '<button type="button" id="home'.$id.'" onclick="horepulang(\''.$id.'\', this.id)" class="btn btn-warning">';
			$out .= '<i class="fa fa-home"></i> No record</button>';
		}

		$arr = ['nis' => $nis, 
				'log' => $this->db->affected_rows(), 
				'time' => $time,
				'res' => strtoupper($res),
				'out' => $out];
		echo json_encode($arr);
	}

	public function pulangonline() {
		$id = $this->input->post('idpresence');
		$data['presence_out'] = date("Y-m-d H:i:s");
		$where = ['idpresence' => $id];
		if ($this->db->where($where)->update('st_presence', $data)) {
			echo json_encode(["sts" => "ok", "log" => date("d-m-Y H:i:s", strtotime($data['presence_out']))]);
		} else {
			echo json_encode(["sts" => "ng", "log" => "No record"]);
		}
	}

}