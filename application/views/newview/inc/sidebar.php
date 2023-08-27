<style type="text/css">
    #navForSideBar::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
        background-color: #F5F5F5;
    }

    #navForSideBar::-webkit-scrollbar {
        width: 6px;
        background-color: #F5F5F5;
    }

    #navForSideBar::-webkit-scrollbar-thumb {
        background-color: #000000;
        border: 2px solid #555555;
    }
</style>
<aside class="site-sidebar scrollbar-enabled" data-suppress-scroll-x="true">
    <!-- /.side-user -->
    <!-- Sidebar Menu -->
    <nav id="navForSideBar" class="sidebar-nav" style="overflow-y:scroll">
        <ul class="nav in side-menu">
            <li class="current-pag"><a href="<?= site_url() ?>"><i class="list-icon feather feather-command"></i> <span class="hide-menu">Dashboard</span></a></li>
            <li class="menu-item-has-children"><a href="javascript:void(0);"><i class="list-icon feather feather-briefcase"></i> <span class="hide-menu">Master</span></a>
                <ul class="list-unstyled sub-menu">
                    <li><a href="<?= site_url('page/users') ?>">Pengguna</a></li>
                    <li><a href="<?= site_url('page/lessons') ?>">Pelajaran</a></li>
                    <li><a href="<?= site_url('page/classes') ?>">Kelas</a></li>
                    <li><a href="<?= site_url('page/teachers') ?>">Guru</a></li>
                    <li><a href="<?= site_url('page/students') ?>">Siswa</a></li>
                </ul>
            </li>
            <li class="menu-item-has-children"><a href="javascript:void(0);"><i class="list-icon feather feather-edit"></i> <span class="hide-menu">Ujian</span></a>
                <ul class="list-unstyled sub-menu">
                    <li><a href="<?= site_url('page/create') ?>">Buat Ujian</a></li>
                    <li><a href="<?= site_url('page/assignments') ?>">List Ujian</a></li>
                    <li><a href="<?= site_url('page/bank') ?>">Bank Soal</a></li>
                </ul>
            </li>
            <li class="menu-item-has-children"><a href="javascript:void(0);"><i class="list-icon feather feather-file-text"></i> <span class="hide-menu">Laporan</span></a>
                <ul class="list-unstyled sub-menu">
                    <li><a href="<?= site_url('page/results') ?>">Hasil Ujian</a></li>
                    <li><a href="<?= site_url('page/analytics') ?>">Analysis Ujian</a></li>
                </ul>
            </li>
        </ul>
        <!-- /.side-menu -->
    </nav>
    <!-- /.sidebar-nav -->
</aside>