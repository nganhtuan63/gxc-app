<?php

/**
 * Class for render Top Menu
 * 
 * 
 * @author Tuan Nguyen <nganhtuan63@gmail.com>
 * @version 1.0
 * @package common.front_blocks.search
 */

class MenuBlock extends CWidget
{
    
    //Do not delete these attr block, page and errors
    public $id='menu';
    public $block=null;     
    public $errors=array();
    public $page=null;
    public $layout_asset='';
    
    public $menu_id;
    
    
    public function setParams($params){
          $this->menu_id=isset($params['menu_id']) ? $params['menu_id'] : null;
          
    }
    
    public function run()
    {        
            $this->renderContent();
    }       
 
 
    protected function renderContent()
    {
		if (isset($this->block) && ($this->block!=null)) {	        
	            $params=unserialize($this->block->params);
		    	$this->setParams($params);               
	            $menu_r0_items = self::getMenuItems(0,$this->menu_id);          
	            $this->render(BlockRenderWidget::setRenderOutput($this),array('menus'=>$menu_r0_items,
	                ));
		} else {
		    echo '';
		}
       
    }
    
    public function validate(){	
        if($this->menu_id==""){
		$this->errors['menu_id']=t('Please select a Menu');
                return false ;
	}
	else
		return true ;
    }
    
    public function params()
    {
         return array(
                    'menu_id' => t('Menu'),                   
            );
    }
    
    public function beforeBlockSave(){
	return true;
    }
    
    public function afterBlockSave(){
	return true;
    }
    
    public static function getMenuItems($parent_id,$menu_id){
        $menu_items = MenuItem::model()->findAll(
                        array(
                              'condition'=>'parent=:pid AND menu_id=:mid',
                              'params'=>array(':pid'=>$parent_id, ':mid'=>$menu_id),
                              'order'=>' t.order ASC ')
                        );
		
		$result = array();
		foreach ($menu_items as $menu_item) {
			$result[] = array('name'=>$menu_item->name, 'link'=>self::buildLink($menu_item));
		}
		
        return $result;
    }
    
    public static function findMenu(){    
        $result=array();
        $menus=Menu::model()->findAll();
        if($menus){
            foreach($menus as $menu){
                $result[$menu->menu_id]=$menu->menu_name;
            }
        }       

	return $result;
    }
    
    public static function buildLink($item){
        switch ($item->type) {
			case ConstantDefine::MENU_TYPE_URL:
				return $item->value; 
				break;
			case ConstantDefine::MENU_TYPE_PAGE:
				$page = Page::model()->findByAttributes(array('name'=>$item->value));
				if ($page)
					return SITE_NAME_URL.$page->slug;
			case ConstantDefine::MENU_TYPE_TERM:
			case ConstantDefine::MENU_TYPE_STRING:								
			default :
				return $item->value;
				break;
		}
    }
}

?>