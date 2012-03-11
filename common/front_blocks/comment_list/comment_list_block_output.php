<?php 
	//So I get the first content list and want to return as a Data Provider
    //$content_list_data_provider = ListViewBlock::getContentList($this->content_list[0], null , null, ConstantDefine::CONTENT_LIST_RETURN_DATA_PROVIDER);
	$object_id=(int)$_GET['id'];
    $comment_list_data_provider = CommentListBlock::getCommentList($object_id);		    
	//Get the current content List model
    if (isset($comment_list_data_provider) && $comment_list_data_provider != null) : ?>
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