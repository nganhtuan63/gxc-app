<div class="wide">
	<p style="margin-top:0">
		<strong><?php echo $data->author_name. '  -  ' . $data->topic;
		 ?></strong>
		<br /><span><?php echo date("m/d/Y H:i", $data->create_time); ?></span>
		<br />
		<?php echo $data->content; ?>
	</p>
</div>