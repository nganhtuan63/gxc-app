<?php //if(isset($newsletter_subscription_data_provider) && $newsletter_subscription_data_provider != null): ?>
	<h2><?php echo t('Subscribe for our newsletter'); ?></h2>
<?php $this->widget('ModelCreateWidget', array('model_name'=>'NewsletterSubscription',));?>
<?php //endif;?>	