<!-- OPTIONS -->
<style type="text/css">
	table.table tr td {
		background-color: transparent;
		padding: 4px;
	}
	table tr td {
		padding: 4px;
	}
	table tr {
		margin-bottom: 10px;
	}
</style>
<table class="" border="0" cellpadding="0" cellspacing="0">
<?php foreach ($value->options as $rOption => $vOption): ?>
	<tr>
		<td style="width:2%">
			<input onclick="answered('<?= $rows ?>')" type="radio" name="option<?= $value->id_question ?>" value="<?= $vOption->id_option ?>">
		</td>
		<td style="width:3%">
			<div style="color:black;margin-top:-4px;">
				<b><?php $char = include('numberToChar.php'); echo $char ?>.</b>
			</div>
			<input type="hidden" name="key_option<?= $value->id_question.$vOption->id_option ?>" value="<?= $char ?>">
		</td>
		<td style="width:90%">
			<div class="row">
				<?php if ($vOption->option_image != ''): ?>
					<div class="col-sm-8">
				<?php else: ?>
					<div class="col-sm-12">
				<?php endif ?>
					<span style="color:black !important;"><?= $vOption->option_ ?></span>
				</div>
				<?php if ($vOption->option_image != ''): ?>
					<div class="col-sm-4">
						<center>
							<a data-fancybox="gallery" href="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$vOption->option_image) ?>"><img src="<?= base_url('assets/images/assignments/'.$dataAssignment->assignment_path.'/'.$vOption->option_image) ?>" class="img-thumbnail"></a>
						</center>
					</div>
				<?php endif ?>
			</div><!-- / Row -->
		</td>
	</tr>
<?php endforeach ?>
<!-- OPTIONS -->
</table>