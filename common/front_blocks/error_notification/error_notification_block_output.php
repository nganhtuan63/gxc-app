<?php if($error=Yii::app()->errorHandler->error) : ?>
 	<h1><?php echo $error['code']; ?></h1>						
 	<p><?php echo $error['message']; ?> </p>
<?php endif; ?> 	
 	
 
 
		   