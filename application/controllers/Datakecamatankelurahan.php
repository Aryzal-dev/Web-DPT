<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Datakecamatankelurahan extends CI_Controller
{
    public function index()
    {
        $data['title'] = 'Data Kecamatan Kabupaten Luwu Utara';
        $data['user'] = $this->db->get_where('user', ['email' =>
        $this->session->userdata('email')])->row_array();
        $this->load->model('Data_pemilih_model', 'data_pemilih');

        $data['kecamatan'] = $this->db->get('data_kecamatan')->result_array();

        $this->form_validation->set_rules('kecamatan', 'Kecamatan', 'required');
        $this->form_validation->set_rules('kelurahan_id', 'Kelurahan', 'required');

        if($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('datakecamatankelurahan/index', $data);
            $this->load->view('templates/footer');                                
        } else {
            $data= [
                'kecamatan' =>$this->input->post('kecamatan'),
                'kelurahan_id' =>$this->input->post('kelurahan_id'),
            ];
            $this->db->insert('data_kecamatan', $data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Sudah Masuk!!</div>' );
            redirect('datakecamatankelurahan');
        }
    }

    public function kelurahan()
    {
        $data['title'] = 'Data Kelurahan Kabupaten Luwu Utara';
        $data['user'] = $this->db->get_where('user', ['email' =>
        $this->session->userdata('email')])->row_array();
        $this->load->model('Data_pemilih_model', 'data_pemilih');

        $data['kelurahan'] = $this->data_pemilih->KeLurahan();
        $data['kecamatan'] = $this->db->get('data_kecamatan')->result_array();

        $this->form_validation->set_rules('kelurahan', 'Kelurahan', 'required');
        $this->form_validation->set_rules('kecamatan_id', 'Kecamatan', 'required');

        if($this->form_validation->run() == false) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('datakecamatankelurahan/kelurahan', $data);
            $this->load->view('templates/footer');
        } else {
            $data= [
                'kelurahan' =>$this->input->post('kelurahan'),
                'kecamatan_id' =>$this->input->post('kecamatan_id'),
            ];
            $this->db->insert('data_kelurahan', $data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Sudah Masuk!!</div>' );
            redirect('datakecamatankelurahan/kelurahan');
        }
    }

}
