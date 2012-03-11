<?php

/**
 * Class for render Comment List * 
 * 
 * @author Tuan Nguyen <nganhtuan63@gmail.com>
 * @version 1.0
 * @package common.front_blocks.comment_list */

class CommentListBlock extends CWidget
{
    
    //Do not delete these attr block, page and errors
    public $id='comment_list';
    public $block=null;     
    public $errors=array();
    public $page=null;
    public $layout_asset='';
    
    /**
     * $object_id The id of the content to which the searched comments belong.
     * @var int
     */
    public $object_id;
        
    
    public function setParams($params){
          return; 
    }
    
    public function run()
    {                 
           $this->renderContent();         
    }       
 
 
    protected function renderContent()
    {     
       if(isset($this->block) && ($this->block!=null)){
       			//Start working with Comment List here
				$params=unserialize($this->block->params);
	    		$this->setParams($params);                            
            	$this->render(BlockRenderWidget::setRenderOutput($this),array());                                                          	       		     
		} else {
			echo '';
		}
			  
       
    }
    
    public function validate(){	
		return true ;
    }
    
    public function params()
    {
         return array();
    }
    
    public function beforeBlockSave(){
	return true;
    }
    
    public function afterBlockSave(){
	return true;
    }
	
    public static function getCommentList($object_id)
    {
    	//Search for the PUBLISHED comments that belong to the $object_id
    	$condition = 't.object_id = :object_id and t.status = :status';
    	$params = array(
    			':object_id'=>$object_id,
    			':status'=>ConstantDefine::COMMENT_STATUS_PUBLISHED,);
    	
       	return new CActiveDataProvider('Comment',array(
    			'criteria'=>array(
    					'condition'=>$condition,
    					'params'=>$params,
    			),
    	));
    }
	
}

?>