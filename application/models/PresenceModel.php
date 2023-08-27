<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PresenceModel extends CI_Model {

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

}