<div class="form-stacked">
    
    <div class="website-info">
        <h1><?php echo t('Sign into your Account'); ?></h1>
    </div>
    <?php $this->render('cmswidgets.views.notification_frontend'); ?>
    
    <?php $form=$this->beginWidget('CActiveForm', array(
       'id'=>'login-content',
	'enableClientValidation'=>true,
	'clientOptions'=>array(
		'validateOnSubmit'=>true,
	),     
        )); 
    ?>
 
    <div class="clearfix">
        
     
        <label for="username" class="labelBlur" style="display: inline; "><?php echo t('Email'); ?></label>
       	   <div class="input">
        <?php echo $form->textField($model,'username',array('size'=>30,'class'=>'userform','autoComplete'=>'off')); ?>
        <?php echo $form->error($model,'username'); ?>
        </div>   
    </div>        
     
   <div class="clearfix">
        <label for="password" class="labelBlur" style="display: inline; "><?php echo t('Password'); ?></label>
        <div class="input">
        <?php echo $form->passwordField($model,'password',array('size'=>30,'class'=>'userform','autoComplete'=>'off')); ?>
        <?php echo $form->error($model,'password'); ?>
        </div>
    </div>
    <p style="font:13px Verdana; padding: 5px;"><a href="<?php echo bu();?>/forgot-password"><?php echo t('Forgot password?'); ?></a>                             
                    </p>
    <div class="clearfix">     
         <label><?php echo $form->checkBox($model,'rememberMe',array('style'=>'float:left; margin-right:10px')); ?> <?php echo t('Remember me on this computer') ?></label>
         <?php echo $form->error($model,'rememberMe'); ?>
    </div>
    <div class="actions">
         <?php echo CHtml::submitButton(t('Sign in'),array('class'=>'btn primary','id'=>'bSigninButton')); ?>
    
    </div>
    
    <p style="font:15px Verdana; padding-top: 20px"><?php echo t("Don't have an account?"); ?> 
                            <a href="<?php echo FRONT_SITE_URL;;?>/sign-up"><?php echo t('Register'); ?></a>.
                    </p>
    <?php $this->endWidget(); ?>
  
</div>

