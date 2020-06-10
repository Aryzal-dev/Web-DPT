<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Data_pemilih_model extends CI_Model
{
    public function  KeCamatan()
    {
       $query = "SELECT `data_kecamatan`.*, `data_kelurahan`. `kelurahan`
        FROM `data_kecamatan` JOIN `data_kelurahan`
        ON `data_kecamatan`. `kelurahan_id` = `data_kelurahan`. `id`
        ";
        return $this->db->query($query)->result_array();
    }
    public function  KeLurahan()
    {
       $query = "SELECT `data_kelurahan`.*, `data_kecamatan`. `kecamatan`
        FROM `data_kelurahan` JOIN `data_kecamatan`
        ON `data_kelurahan`. `kecamatan_id` = `data_kecamatan`. `id`
        ";
        return $this->db->query($query)->result_array();
    }
  
}