<?php 
$this->pageTitle=t('Caching Management');
$this->pageHint=t('Here you can clear Cache & Assets for Backend and Frontend'); 
?>
<?php $this->widget('cmswidgets.caching.CachingClearWidget',array()); 
?>