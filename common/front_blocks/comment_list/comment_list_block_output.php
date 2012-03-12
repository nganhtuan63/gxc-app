<!-- 
- Display the comment list of the given object
- Display a form that allow users to give their comment -->

<?php 
	//Get the comment list given by the object_id
	$object_id=(int)$_GET['id'];
    $comment_list_data_provider = CommentListBlock::getCommentList($object_id);	
    	    
	//Display the list if its itemCount > 0
    if (isset($comment_list_data_provider) && $comment_list_data_provider != null && $comment_list_data_provider->getItemCount(false) > 0) : ?>
        <h2><?php echo t('Comments'); ?></h2>
            <?php 
            	$this->widget('zii.widgets.CListView',
            			array
            			(
            					'viewData'=>array('asset'=>$this->layout_asset),
            					'dataProvider'=>$comment_list_data_provider,
            					'itemView'=>'common.front_blocks.comment_list.item_render',
            					'summaryText'=>'',
            					'ajaxUpdate'=>true,
            					'enablePagination'=> true,
            					'enableSorting'=>false,
            					'sortableAttributes'=>array(),
            			)
            			);   
                            							                                                       
            ?>
	<?php endif; ?> 
	      
<?php if(isset($comment_list_data_provider) && $comment_list_data_provider != null): ?>
	<h2><?php echo t('Enter a comment'); ?></h2>
		<?php $this->widget('ModelCreateWidget', array('model_name'=>'Comment',));?>
		
<?php endif;?>	