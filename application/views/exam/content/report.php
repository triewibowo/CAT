<style type="text/css">
	table.table tbody tr td {
		background-color: transparent !important;
	}
    .box {
        width: 100%;
        min-height: 100px;
        text-align: center;
        padding-top:30px;
        color: white;
        font-size: 20px;
        border-radius: 6px;
        margin-bottom: 10px;
    }
    .box.blue {
        background-color: #078BD0;
    }
    .box.yellow {
        background-color: #F4B316;
    }
    .box.red {
        background-color: #DE1330;
    }
    .box.purple {
        background-color: #BC1EBE;
    }
    .box.green {
        background-color: #18C33C;
    }
</style>
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title">Laporan hasil ujian</h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-2">
                <div class="box blue">
                    <?= $dataResult->result_true ?> Soal Benar <i class="fa fa-check"></i>
                </div>
                <div class="box yellow">
                    <?= $dataResult->result_false ?> Soal Salah <i class="fa fa-times"></i>
                </div>
                <div class="box purple">
                    Nilai <?= $dataResult->result_score ?>% <i class="fa fa-edit"></i>
                </div>
                <?php if ($dataResult->result_score < $dataAssignment->assignment_kkm): ?>
                    <div class="box red">
                        Gagal <i class="fa fa-exclamation"></i>
                    </div>
                <?php else: ?>
                    <div class="box green">
                        Lulus <i class="fa fa-graduation-cap"></i>
                    </div>
                <?php endif ?>
            </div>
            <div class="col-sm-10">
                <?php if ($dataAssignment->show_analytic == 1): ?>
                    <table class="table table-striped datatable">
                        <thead>
                            <tr>
                                <th style="width:5%">#</th>
                                <th>Pertanyaan</th>
                                <th style="width:30%">Jawaban Benar</th>
                                <th style="width:30%">Jawaban Anda</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($dataAnalytics as $row => $value): ?>
                                <tr>
                                    <td><?= $row + 1 ?></td>
                                    <td><?= $value->question_ ?></td>
                                    <td>
                                        <?php $rOption = $row; $char = include('numberToChar.php'); echo $char ?>. 
                                        <?= $value->trueAnswer->option_ ?>
                                    </td>
                                    <td>
                                        <?php if ($value->option_char == $char): ?>
                                            <span style="color:green">
                                        <?php else: ?>
                                            <span style="color:red">
                                        <?php endif ?>
                                        <?= $value->option_char.'. '.$value->studentChoosed->option_ ?></span>
                                    </td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <center>
                        <h4>Ooopsss, admin tidak mengizinkan untuk melihat laporan analisis soal :(</h4>
                    </center>
                <?php endif ?>
            </div>
        </div><!-- / Row -->
    </div>
</div>