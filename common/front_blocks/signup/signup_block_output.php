<div class="form-stacked" align="left">
    <div class="website-info">
        <h1><?php echo t('Sign up for mywordbook.com'); ?></h1>
    </div>
    <?php $form=$this->beginWidget('CActiveForm', array(
        'id'=>'userregister-form',
         'enableClientValidation'=>true,
            'clientOptions'=>array(
                    'validateOnSubmit'=>true,
            ),   
        )); 
    ?>

    <div class="clearfix">
      	<label for="user_full_name" class="labelBlur"><?php echo t('Username'); ?></label>
        <div class="input">
        <?php echo $form->textField($model,'username',array('size'=>30,'class'=>'userform','autoComplete'=>'off')); ?>
        <?php echo $form->error($model,'username'); ?>
        </div>      
    </div>
        
    <div class="clearfix">
      <label for="user_email" class="labelBlur"><?php echo t('Email'); ?></label>
       <div class="input">
        <?php echo $form->textField($model,'email',array('size'=>30,'class'=>'userform','autoComplete'=>'off')); ?>
        <?php echo $form->error($model,'email'); ?>
       </div>
    </div>
    
    <div class="clearfix">
      <label for="user_password" class="labelBlur" style="display: inline; "><?php echo t('Password'); ?></label>
          <div class="input">
        <?php echo $form->passwordField($model,'password',array('size'=>30,'class'=>'userform','autoComplete'=>'off')); ?>
        <?php echo $form->error($model,'password'); ?>
        </div>
    </div>
    <div class="actions">
    
         <?php echo CHtml::submitButton(t('Register'),array('class'=>'btn primary','id'=>'bCreateButton')); ?>
        	<p style="margin-top:10px; color:#aaa">
    <?php echo t('By clicking "Register" you confirm that you accept the'); ?>
                        <a href="<?php echo FRONT_SITE_URL;?>/terms" onclick="window.open(this.href);return false;">Terms of Service.</a>
                </p>
    
    </div>
    
    <p style="font:15px Verdana; padding-top: 20px"><?php echo t('Already have an account?'); ?> 
                            <a href="<?php echo FRONT_SITE_URL;?>/sign-in"><?php echo t('Sign in here'); ?></a>.
                    </p>
    <?php $this->endWidget(); ?>
   
</div>

