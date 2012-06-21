<div style="margin-top:20px">
<div class="form-stacked">
  
        <?php $this->render('cmswidgets.views.notification_frontend'); ?>
      
    
         <h3 style="margin-bottom:0.5em"><?php echo t('Change password'); ?></h3>
        
    
        <?php $form=$this->beginWidget('CActiveForm', array(
           'id'=>'changepass-form',
            'enableClientValidation'=>true,
            'clientOptions'=>array(
              'validateOnSubmit'=>true,
            ),     
            )); 
        ?>
     
        <div  class="clearfix">
              <label><?php echo t('Old password:'); ?></label>
              <div class="input">
              <?php echo $form->passwordField($model,'old_password',array('autoComplete'=>'off')); ?>              
              <?php echo $form->error($model,'old_password',array()); ?>
              </div>
        </div>
        <div  class="clearfix">
              <label><?php echo t('New password:'); ?></label>
              <div class="input">
              <?php echo $form->passwordField($model,'new_password_1',array('autoComplete'=>'off')); ?>              
              <?php echo $form->error($model,'new_password_1',array()); ?>
              </div>
        </div>
      <div  class="clearfix">
              <label><?php echo t('Re-type your new password:'); ?></label>
              <div class="input">
              <?php echo $form->passwordField($model,'new_password_2',array('autoComplete'=>'off')); ?>              
              <?php echo $form->error($model,'new_password_2',array()); ?>
              </div>
        </div>
        
       
        <div class="actions" >
        <?php echo CHtml::submitButton(t('Change my password'),array('class'=>'btn','id'=>'bChangePassword')); ?>

        </div>
         <?php $this->endWidget(); ?>
         
          <h3 style="margin-bottom:0.5em; margin-top:20px"><?php echo t('Notification'); ?></h3>
          <?php $form=$this->beginWidget('CActiveForm', array(
           'id'=>'notify-form',
            'enableClientValidation'=>true,
            'clientOptions'=>array(
              'validateOnSubmit'=>true,
            ),     
            )); 
        ?>
        <div  class="clearfix">
        <strong><?php echo t('Allow Mywordbook.com send me email when:')?></strong>
        
       </div>
       <div style="margin-top:10px">
        <div class="clearfix">
         	<?php echo $form->checkBox($model_notify,'email_site_news',array('style'=>'float:left;width:20px;')); ?>
            <label style="width:50%;text-align:left; margin-top:0px; font-weight:normal"><?php echo t('Mywordbook.com has fun news, as well as periodic emails.');?></label>
            <?php echo $form->error($model_notify,'email_site_news'); ?>
            <div class="clear"></div>
    	</div>
    	<div  class="clearfix">
         	<?php echo $form->checkBox($model_notify,'email_search_alert',array('style'=>'float:left;width:20px;')); ?>
            <label style="width:50%;text-align:left; margin-top:0px; font-weight:normal"><?php echo t('Periodic revision email.');?></label>
            <?php echo $form->error($model_notify,'email_search_alert'); ?>
            <div class="clear"></div>
    	</div>
    	</div>
    	 <div class="actions">
        <?php echo CHtml::submitButton(t('Update'),array('class'=>'btn','id'=>'bUpdateNotify')); ?>

        </div>
    	<?php $this->endWidget(); ?>
    </div>
</div>
    
