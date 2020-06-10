<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Datapemilihtetap extends CI_Controller
{
    public function index()
    {
        $data['title'] = 'Data Pemilih Tetap Kabupaten Luwu Utara';
        $data['user'] = $this->db->get_where('user', ['email' =>
        $this->session->userdata('email')])->row_array();
        $this->load->model('Data_pemilih_model', 'data_pemilih');

        $data['kelurahan'] = $this->db->get('data_kelurahan')->result_array();
        $data['datapemilihtetap'] = $this->db->get('data_pemilih_tetap')->result_array();
        $data['kecamatan'] = $this->db->get('data_kecamatan')->result_array();

        $this->form_validation->set_rules('nik', 'Nik', 'required');
        $this->form_validation->set_rules('nama', 'Nama', 'required');
        $this->form_validation->set_rules('tanggal_lahir', 'Tanggal Lahir', 'required');
        $this->form_validation->set_rules('kecamatan_id', 'Kecamatan', 'required');
        $this->form_validation->set_rules('kelurahan_id', 'Kelurahan', 'required');
        $this->form_validation->set_rules('tps', 'TPS', 'required');

        if($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('datapemilihtetap/index', $data);
            $this->load->view('templates/footer');
        } else {
            $data= [
                'nik' =>$this->input->post('nik'),
                'nama' =>$this->input->post('nama'),
                'tanggal_lahir' =>$this->input->post('tanggal_lahir'),
                'kecamatan_id' =>$this->input->post('kecamatan_id'),
                'kelurahan_id' =>$this->input->post('kelurahan_id'),
                'tps' =>$this->input->post('tps'),
            ];
            $this->db->insert('data_pemilih_tetap', $data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Sudah Masuk!!</div>' );
            redirect('datapemilihtetap');
        }
    }

}
