<div class="form-stacked">
    
    <div class="website-info">
        <h1><?php echo t('Forgot password?'); ?></h1>
    </div>
    <?php $this->render('cmswidgets.views.notification_frontend'); ?>
    
    <?php $form=$this->beginWidget('CActiveForm', array(
       'id'=>'recoverpassword-content',
		'enableClientValidation'=>true,
		'clientOptions'=>array(
			'validateOnSubmit'=>true,
		),     
	        )); 
    ?>
 
    <p style="font:12px Verdana; padding:10px 0"><?php echo t('Enter your e-mail address to have the password associated with that account reset. A new password will be e-mailed to the address.'); ?> 
                            
	</p>
      <div class="clearfix">
            
        <label for="email" class="labelBlur" style="display: inline; "><?php echo t('Email');?></label>
 		<div class="input">       
        <?php echo $form->textField($model,'email',array('size'=>30,'class'=>'userform','autoComplete'=>'off')); ?>
        <?php echo $form->error($model,'email'); ?>
        </div>   
    </div>        
  
    <div class="actions">
         <?php echo CHtml::submitButton(t('Reset my password'),array('class'=>'btn primary','id'=>'bReset')); ?>    
    </div>
    
    <?php $this->endWidget(); ?>
     
   
</div>

