<?php

class SiteController extends FeController
{	
        
        public $defaultAction='index';
        /**
         * List of allowd default Actions for the user
         * @return type 
         */
        public function allowedActions()
        {
               return 'index,view,error,ajax,caching';
        }
        
        /**
		 * To Homepage
		 */
		public function actionHome()
		{
	        parent::renderIndex();
		}
	
	    
		/**
		 * Index Page of the Site, re route here
		 */
		//public function actionIndex($path)
	    public function actionIndex()
		{	       
					        	        												
	            $slug=isset($_GET['slug']) ? fn_clean_input($_GET['slug']) : '';                
	            if($slug==''){
	                $slug=Yii::app()->settings->get('general', 'homepage');
	            }
	            parent::renderPageSlug($slug);  	           
		}
	
		/**
		 * When viewing a Page
		 */
		public function actionView($id)
		{   
	               parent::renderPage($id);
		}
	        	        
		/**
		 * This is the action to handle external exceptions.
		 */
		public function actionError()
		{
	              	
	              parent::error();
		}
		
		/**
		 * This is the action to Clear Cache
		 */
		public function actionCaching()
		{
				if($_POST['key']==FRONTEND_CLEAR_CACHE_KEY){
					Yii::app()->cache->flush();
					echo '1';				
				}	              		            	 
				else{
					echo '0';										
				}
				Yii::app()->end();
		}


	
}