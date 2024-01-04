<div class="container">
    <div class="main-body">

        <div class="row gutters-sm">
        <div class="col-md-4 mb-3">
            <div class="card">
            <div class="card-body" style="padding-top:2rem">
                <div class="d-flex flex-column align-items-center text-center">
                <?php if ($user->student_photo): ?>
                    <img src="<?= base_url('assets/images/students/'.$user->student_photo) ?>" alt="Admin" class="rounded-circle" width="150">
                <?php else: ?>
                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                <?php endif; ?>
                <div style="margin-top: 3em;">
                    <h4><?php echo $user->student_name ?></h4>
                    <p class="text-secondary mb-1"><?php echo $user->student_nis ?></p>
                    <p class="text-muted font-size-sm" style="word-wrap: break-word;">
                        <?php echo $user->student_address ?>
                    </p>
                </div>
                </div>
            </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card mb-3">
            <div class="card-body" style="padding-top:2rem">
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">Full Name</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                <?php echo $user->student_name ?>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">Email</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                <?php echo $user->student_email ?>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">Phone</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <?php echo $user->student_phone ?>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">Kelas</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                    <?php echo $user->dataClasses ?>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-3">
                    <h6 class="mb-0">Address</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                <?php echo $user->student_address ?>
                </div>
                </div>
                <hr>
                <div class="row">
                <div class="col-sm-12">
                    <a class="btn btn-info " href="<?= site_url('exam/profilEdit') ?>">Edit</a>
                </div>
                </div>
            </div>
            </div>
        </div>
        </div>
    </div>
</div>

<style>
    .card {
        box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
    }

    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 0 solid rgba(0,0,0,.125);
        border-radius: .25rem;
    }

    .card-body {
        flex: 1 1 auto;
        min-height: 1px;
        padding: 1rem;
    }

    .gutters-sm {
        margin-right: -8px;
        margin-left: -8px;
    }

    .gutters-sm>.col, .gutters-sm>[class*=col-] {
        padding-right: 8px;
        padding-left: 8px;
    }
    .mb-3, .my-3 {
        margin-bottom: 1rem!important;
    }

    .bg-gray-300 {
        background-color: #e2e8f0;
    }
    .h-100 {
        height: 100%!important;
    }
    .shadow-none {
        box-shadow: none!important;
    }

    .rounded-circle {
            border-radius: 50%; /* Ini akan mengubah gambar menjadi lingkaran */
        }
</style>

