<div class="form-stacked">
    

    
    <div class="website-info">
        <h1><?php echo t('Reset Password'); ?></h1>
    </div>
    <?php $this->render('cmswidgets.views.notification_frontend'); ?>
    
    <?php $form=$this->beginWidget('CActiveForm', array(
       'id'=>'resetpassword-content',
		'enableClientValidation'=>true,
		'clientOptions'=>array(
			'validateOnSubmit'=>true,
		),     
	        )); 
    ?>
 
    <p style="font:12px Verdana; padding:10px 0">Type your new password to reset.</p>
    <div class="clearFix">            
        <label for="email" class="labelBlur">New Password</label>
		<div class="input">       
        <?php echo $form->textField($model,'password',array('size'=>30,'class'=>'userform','autoComplete'=>'off')); ?>
        <?php echo $form->error($model,'password'); ?>   
		</div>
    </div>        
  
    <div class="actions">
         <?php echo CHtml::submitButton(t('Reset Password'),array('class'=>'button-glossy green','id'=>'bReset','style'=>'')); ?>    
    </div>

    <?php $this->endWidget(); ?>
</div>

