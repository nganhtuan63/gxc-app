<div class="wide">
	<p style="margin-top:0">
		<strong><?php echo CHtml::encode($data->topic); ?></strong>
		<span><?php echo date("m/d/Y H:i", $data->create_time); ?></span>
		<br />
		<?php echo CHtml::encode($data->content); ?>
	</p>
</div>