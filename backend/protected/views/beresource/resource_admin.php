<?php 
$this->pageTitle=t('Manage Resource');
$this->pageHint=t('Here you can manage your Resource'); 
?>
<?php $this->widget('cmswidgets.ModelManageWidget',array('model_name'=>'Resource')); 
?>