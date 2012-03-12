<div class="wide" id="comment">
	<p style="margin-top:0">
		<strong><?php echo $data->author_name. '  -  ' . $data->topic;
		 ?></strong>
		<br /><span><?php echo date("m/d/Y H:i", $data->create_time); ?></span>
		<br />
		<?php echo $data->content; ?>
	</p>

	<div class="row button">
		<?php 
		//Reply button for each comment : 
		//when button clicked, the field content of comment form will be focused
		//and pre-filled by the text : @ + [author_name being replied]
			$this->widget('zii.widgets.jui.CJuiButton', array(
  			'id'=>'btReply'.$data->comment_id,
  			'buttonType'=>'submit',
 			'name'=>$data->author_name,
  			'caption'=>'Reply',
 			'options'=>array('icons'=>'js:{primary:"ui-icon-wrench"}'),
  			'onclick'=>'js:function(){
					var name = $(this).attr("name");
					$("#Comment_content").focus();
					$("#Comment_content").val("@"+name+":\n");
					return false;
					}',
 			));
		?>
	</div>
</div>