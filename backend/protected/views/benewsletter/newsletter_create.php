<?php
$this->pageTitle=t('Create new newsletter'); 
$this->titleImage='images/pencil2.png';
$this->widget('cmswidgets.newsletter.NewsletterCreateWidget',array('model'=>$model)); 
?>