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

            <a href="" class=" btn btn-primary mb-3" data-toggle="modal" data-target="#newKelurahan">Tambah Data</a>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Kelurahan/Desa</th>
                            <th scope="col">Kecamatan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $i = 1; ?>
                        <?php foreach ($kelurahan as $kel) : ?>
                            <tr>
                                <th scope="row"><?php echo $i; ?></th>
                                <td><?= $kel['kelurahan']; ?></td>
                                <td><?= $kel['kecamatan']; ?></td>
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
<div class="modal fade" id="newKelurahan" tabindex="-1" role="dialog" aria-labelledby="newKelurahan" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newKelurahan">Add Data Pemilih Tetap</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?php echo base_url('datakecamatankelurahan/kelurahan') ?>" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="kelurahan" name="kelurahan" placeholder="Kelurahan">
                    </div>
                    <div class="form-group">
                        <select name="kecamatan_id" id="kecamatan_id" class="form-control">
                            <option value="">Kecamatan</option>
                            <?php foreach($kecamatan as $k) : ?>
                            <option value="<?= $k['id'] ?>"><?= $k['kecamatan'] ?></option>
                            <?php endforeach;  ?>
                        </select>
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