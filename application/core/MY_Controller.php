<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

	public function __construct() {
		parent::__construct();
		date_default_timezone_set('Asia/Jakarta');
		$this->load->model('MasterModel','master',TRUE);
		$this->load->model('AuthModel','auth',TRUE);
		$this->load->model('AssignmentModel','assignment',TRUE);
    	$this->load->model('ClassModel','class',TRUE);
    	$this->load->model('PresenceModel','presence',TRUE);
		$this->checkAuth();
	}

	public $parseData = [
		'navbar' => 'inc/navbar',
		'footer' => 'inc/footer',
		'title' => 'No Title',
		'content' => '',
		'sidebar' => 'inc/sidebar'
	];
	public function preg($value) {
		return str_replace(" ", "-", str_replace("/", "-", str_replace("\\", "-", str_replace("'", "-", str_replace(",", "-", str_replace(".", "-", str_replace('!', '', $value)))))));
	}
	public function checkAuth() {
		if (!$this->session->userdata('backToken')) {
			redirect('Auth');
		} else {
			if (!$this->auth->checkToken($this->session->userdata('backToken'))) {
				redirect('page/logout');
			}
		}
	}
	public function debug($data) {
		echo "<pre>";
		print_r($data);
		die;
	}
	public function imageConf($dirName = NULL) {
        $conf['upload_path']   = './assets/images/'.$dirName;
        $conf['allowed_types'] = 'gif|jpg|png|jpeg|mp3';
        $conf['max_size']      = 2000;
        $conf['overwrite']     = TRUE;
        $conf['encrypt_name'] = TRUE;
        $this->load->library('upload', $conf);
    }
    public function soundConf($dirName = NULL) {
        $conf['upload_path']   = './assets/images/'.$dirName;
        $conf['allowed_types'] = 'gif|jpg|png|jpeg|mp3';
        $conf['max_size']      = 2000;
        $conf['overwrite']     = TRUE;
        $conf['encrypt_name'] = TRUE;
        $this->load->library('upload', $conf);
    }
    public function compreesImage($dirName,$fileName,$resolution) {
        $this->load->library('image_lib');
        $config['image_library'] = 'gd2';
        $config['source_image'] = './assets/images/'.$dirName.'/'.$fileName;
        $config['create_thumb'] = FALSE;
        $config['maintain_ratio'] = TRUE;
        $config['width']     = $resolution['width'];
        $config['height']   = $resolution['height'];

        $this->image_lib->clear();
        $this->image_lib->initialize($config);
        $this->image_lib->resize();
    }
	public function message($title = NULL,$text = NULL,$type = NULL) {
		return $this->session->set_flashdata([
				'title' => $title,
				'text' => $text,
				'type' => $type
			]
		);
	}
	public function SetLog($Message = NULL) {
		$Data = [
			'log_author' => $this->session->userdata('level').' - '.$this->session->userdata('fullName'),
			'log_desc' => $Message,
			'log_created' => date('Y-m-d H:i:s'),
		];
		return $this->db->insert('ms_log',$Data);
	}

	public function index() {
		echo "System Running";
	}

}

/* End of file MY_Controller.php */
/* Location: ./application/core/MY_Controller.php */