<?php
if(YII_DEBUG)
            $backend_asset=Yii::app()->assetManager->publish(Yii::getPathOfAlias('cms.assets.backend'), false, -1, true);
        else
            $backend_asset=Yii::app()->assetManager->publish(Yii::getPathOfAlias('cms.assets.backend'), false, -1, false);
?>
<?php $this->pageTitle=SITE_NAME; ?>
<p><?php echo t('What do you want to do today?'); ?></p>
<div>
<?php $types=GxcHelpers::getAvailableContentType(); ?>
<ul class="shortcut-buttons-set">
<?php foreach($types as $type) : ?>
<li>
<a href="<?php echo bu().'/beobject/create/type/'.$type['id']; ?>" class="shortcut-button">
<span>
<img alt="icon" src="<?php 
$icon_asset=Yii::app()->assetManager->publish(Yii::getPathOfAlias('common.content_type.'.$type['id'].'.assets'), false, -1, false);                    
echo $icon_asset.'/'.$type['icon']; ?>"><br />
<?php echo t('Create').' '.$type['name'];?>
</span></a></li>
<?php endforeach; ?>

<li>
<a href="<?php echo bu().'/bepage/create'; ?>" class="shortcut-button">
<span>
<img alt="icon" src="<?php 
		
		                    
echo $backend_asset.'/images/paper.png'; ?>"><br />
<?php echo t('Create new Page');?>
</span></a></li>


<li>
<a href="<?php echo bu().'/beresource/create'; ?>" class="shortcut-button">
<span>
<img alt="icon" src="<?php                     
echo $backend_asset.'/images/upload_file.png'; ?>"><br />
<?php echo t('Upload a File');?>
</span></a></li>


</ul>
<div style="clear:both"></div>
</div>

<p><?php echo t('This is an Open Source CMS, powered by ');?><a href="http://www.gxcsolutions.com">GXC Solutions</a>.</p>
<p><?php echo t('Having problems? Contact us at: ')?> <a href="mailto:cms-support@gxcsolutions.com">cms-support@gxcsolutions.com</a>,
<?php echo t('or Join us at ');?><a href="https://github.com/nganhtuan63/GXC-CMS">Github</a></p>