<?php

/**
 * Class for render Content based on Content list
 * 
 * 
 * @author Tuan Nguyen <nganhtuan63@gmail.com>
 * @version 1.0
 * @package common.front_blocks.html
 */

class ListViewBlock extends CWidget
{
    
    //Do not delete these attr block, page and errors
    public $id='listview';
    public $block=null;    
    public $errors=array();
    public $page=null;
    public $layout_asset='';
    
    //Content list attribute
    public $content_list;    
	public $display_type;	
	
	//Display types for the list view render 
	const DISPLAY_TYPE_HOMEPAGE=0;
	  	
    const DISPLAY_TYPE_CATEGORY=1;
    
    
    public function setParams($params){
	    $this->content_list=isset($params['content_list']) ? $params['content_list'] : null;
		$this->display_type=isset($params['display_type']) ? $params['display_type'] : self::DISPLAY_TYPE_HOMEPAGE;
    }
    public function run()
    {
            $this->renderContent();
    }       
 
 
    protected function renderContent()
    {
		if(isset($this->block) && ($this->block!=null)){	    
	            //Set Params from Block Params
	            $params=unserialize($this->block->params);
		    	$this->setParams($params);            	                                        
	            $this->render(BlockRenderWidget::setRenderOutput($this),array());
		} else {
		    echo '';
		}
       
    }
    
    public function validate(){
	return true;
    }
    
    public function params()
    {
            return array(
                    'content_list' => t('Content list'),                   
                    'display_type' => t('Display type'),
            );
    }
    
    public function beforeBlockSave(){
	return true;
    }
    
    public function afterBlockSave(){
	return true;
    }
	
	public static function getDisplayTypes(){
        return array(
           self::DISPLAY_TYPE_HOMEPAGE=>t("Display in Homepage"),	  	
           self::DISPLAY_TYPE_CATEGORY=>t("Display in Category page"));
    }
	
	public static function getContentList($content_list_id, $max=null, $pagination=null, $return_type=ConstantDefine::CONTENT_LIST_RETURN_ACTIVE_RECORD) {
        		
			//Find the content list model first	
        	$model = ContentList::model()->findbyPk($content_list_id);        
        	$condition = 't.object_status = :status and t.object_date < :time';
        	$params = array(':status'=>ConstantDefine::OBJECT_STATUS_PUBLISHED, ':time'=>time()) ;
			
			
			                    
        	if (isset($model)) {
            	if ($model->type == ConstantDefine::CONTENT_LIST_TYPE_AUTO) {    //auto
                
	                $criteria_field = 'object_date DESC';                                                                         
	                
	                //object_type
	                if (isset($model->content_type)) {
	                    $content_types = $model->content_type;
	                    if ($content_types[0] != 'all') {	                        
	                        $condition .= ' AND (0';
	                        foreach ($content_types as $type) {
	                            $condition .= ' or object_type="'.$type.'"';
	                        }
	                        $condition .= ')';    
	                    }                         
	                }
                
                
	                //terms
	                
	                if (isset($model->terms)) {
	                    $content_terms = $model->terms;
	                    if ($content_terms[0] != '0') {	                        
	                        $condition .= ' AND (0';
	                        foreach ($content_terms as $term) {
	                            $condition .= ' or (object_id in (select object_id from `{{object_term}}` where term_id='.$term.'))';
	                        }
	                        $condition .= ')';    
	                    }    
	                } 
                                              
	                //criteria not newest
	                if ($model->criteria != ConstantDefine::CONTENT_LIST_CRITERIA_NEWEST) {
	                    $criteria_field = 'object_view DESC';                                             
	                      
	                }      
				
                if ($return_type == ConstantDefine::CONTENT_LIST_RETURN_DATA_PROVIDER && $model->number > 1) { 
                                        
                    $sort = new CSort('Object');
                    $sort->defaultOrder='t.object_date DESC';
                    $sort->attributes = array(
                            'object_view' => array(
                                    'asc'=>'object_view ASC',
                                    'desc'=>'object_view DESC',
                            ),
                            'object_date'=>array(
                                    'asc'=>'t.object_date ASC',
                                    'desc'=>'t.object_date DESC',
                            ),
                    );                    
                    
                    return new CActiveDataProvider('Object',array(
                                'criteria'=>array(
                                        'condition'=>$condition,
                                        'order'=>$criteria_field,
                                        'params'=>$params,
                                        'limit'=>isset($max)?$max:$model->number,                                
                                ),
                                'pagination'=>array(
                                        'pageSize'=>isset($max)?$max:$model->number*$model->paging, 
                                        'pageVar'=>'page'
                                ),
                                'sort'=>$sort,
                            ));                
                }

                
                return Object::model()->findAll(array(
                                        'condition'=>$condition,
                                        'params'=>$params,
                                        'order'=>$criteria_field,
                                        'limit'=>isset($max)?$max:$model->number,                
                                        ));
            }

			else {
				//manual
	            if (isset($model->manual_list)) {
	            						
	                $condition = '';
	                $manual_list = $model->manual_list;
	                $count = 0;
					
	                foreach ($manual_list as $manual_id) {	                    
	                    if ($count == 0) {
	                        $condition_string = $manual_id;
	                    } else 
	                        $condition_string .= ','.$manual_id;
	                    if (isset($max) && $count == $max)
	                       break;
	                    $count++;
	                }
					$condition = 'object_id IN ('.$condition_string.')';

	                if ($return_type == ConstantDefine::CONTENT_LIST_RETURN_DATA_PROVIDER && count($manual_list)>1) { 
			
	                    return new CActiveDataProvider('Object',array(
	                               'criteria'=>array(	                               		   
	                                       'condition'=>$condition,
	                                       'params'=>$params,
	                                       'order'=>'FIELD(t.object_id, '.$condition_string.')'
	                               ),
	                               'pagination'=>array(
	                                       'pageSize'=>isset($max)?$max:$model->number*$model->paging, 
	                                       'pageVar'=>'page'
	                               ),
	                           ));
	                } 
	                
	                
	                return Object::model()->findAll(array(	                						
	                                        'condition'=>$condition,                                        
	                                        'params'=>$params,
	                                        'order'=>'FIELD(t.object_id, '.$condition_string.')'
	                                        ));
	            }
			}
            
        }   

		return null;              
    }
}

?>