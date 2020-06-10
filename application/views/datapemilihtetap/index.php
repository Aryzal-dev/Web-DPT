<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800"><?php echo $title; ?></h1>

    <div class="row">
        <div class="col-lg">
            <?php if (validation_errors()) : ?>
                <div class="alert alert-danger" role="alert">
                    <?php echo validation_errors(); ?>
                </div>
            <?php endif; ?>
            <?php echo form_error('menu', '<div class="alert alert-danger pl-3" role="alert">', '</div>'); ?>

            <?php echo $this->session->flashdata('message'); ?>

            <a href="" class=" btn btn-primary mb-3" data-toggle="modal" data-target="#newDataPemilihTetap">Tambah Data</a>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nik</th>
                            <th scope="col">Nama</th>
                            <th scope="col">Tanggal Lahir</th>
                            <th scope="col">Kecamatan</th>
                            <th scope="col">Kelurahan</th>
                            <th scope="col">TPS</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $i = 1; ?>
                        <?php foreach ($datapemilihtetap as $dp) : ?>
                            <tr>
                                <th scope="row"><?php echo $i; ?></th>
                                <td><?php echo $dp['nik']; ?></td>
                                <td><?php echo $dp['nama']; ?></td>
                                <td><?php echo $dp['tanggal_lahir']; ?></td>
                                <td><?php echo $dp['kecamatan_id']; ?></td>
                                <td><?php echo $dp['kelurahan_id']; ?></td>
                                <td><?php echo $dp['tps']; ?></td>
                                <td>
                                    <a href="" class="badge badge-success">edit</a>
                                    <a href="" class="badge badge-danger">delete</a>
                                </td>
                            </tr>
                            <?php $i++; ?>
                        <?php endforeach; ?>
                    </tbody>
                </table>

            </div>

        </div>




</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<!-- Modal -->
<div class="modal fade" id="newDataPemilihTetap" tabindex="-1" role="dialog" aria-labelledby="newDataPemilihTetapLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newDataPemilihTetapLabel">Add Data Pemilih Tetap</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?php echo base_url('datapemilihtetap') ?>" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="nik" name="nik" placeholder="Nomor Induk Kependudukan">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="nama" name="nama" placeholder="Nama">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="tanggal_lahir" name="tanggal_lahir" placeholder="Tanggal Lahir">
                    </div>
                    <div class="form-group">
                        <select name="kecamatan_id" id="kecamatan_id" class="form-control">
                            <option value="">Kecamatan</option>
                            <?php foreach($kecamatan as $dkc) : ?>
                            <option value="<?= $dkc['id'] ?>"><?= $dkc['kecamatan'] ?></option>
                            <?php endforeach;  ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <select name="kelurahan_id" id="kelurahan_id" class="form-control">
                                <option value="">Kelurahan</option>
                                <?php foreach($kelurahan as $dkl) : ?>
                                <option value="<?= $dkl['id'] ?>"><?= $dkl['kelurahan'] ?></option>
                                <?php endforeach;  ?>
                        </select>   
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="tps" name="tps" placeholder="TPS">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">add</button>
                </div>
            </form>
        </div>
    </div>
</div>