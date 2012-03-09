<?php
/**
 * Backend Comment Controller.
 * 
 * @author Nguyen Tuan Quyen <nguyen.tuan.quyen.it@gmail.com>
 * @version 1.0
 * @package backend.controllers
 *
 */
class BecommentController extends BeController
{
        public function __construct($id,$module=null)
	{
		 parent::__construct($id,$module);
                 $this->menu=array(
                        array('label'=>t('Manage Comment'), 'url'=>array('admin'),'linkOptions'=>array('class'=>'button')),
                );
		 
	}
        
         /**
	 * The function that do View User
	 * 
	 */
	public function actionView()
	{         
              $id=isset($_GET['id']) ? (int) ($_GET['id']) : 0 ;
              $this->menu=array_merge($this->menu,                       
                        array(
                            array('label'=>t('View this comment'), 'url'=>array('view','id'=>$id),'linkOptions'=>array('class'=>'button')),
                            array('label'=>t('Publish this comment'), 'url'=>array('publish','id'=>$id),'linkOptions'=>array('class'=>'button')),
                            array('label'=>t('Discard this comment'), 'url'=>array('discard','id'=>$id),'linkOptions'=>array('class'=>'button')),
                        )
                    );
		$this->render('comment_view');
	}

	/**
	 * Manage comment given by the comment status (type) 
	 * and the object (object_id) to which all the comment belong 
	 */
	public function actionAdmin()
	{
		//Check the object id
		/*$object_id=isset($_GET['object_id']) ? (int) ($_GET['object_id']) : 0 ;
		
		if($object_id!= 0)
		{
			$this->render('comment_admin',array(
					'type'=>0,
					'object_id'=>$object_id));
		}
		else 
		{
			$this->render('comment_admin',array('type'=>0,);
		}*/
		$this->render('comment_admin',array('type'=>0);
		
	}

	/**
	 * Change the status of the comment given by the $id to "published"
	 */
	public function actionPublish()
	{
		$id=isset($_GET['id']) ? (int) ($_GET['id']) : 0 ;
		
		$model = self::loadModel($id);
		$model->setAttribute('status', ConstantDefine::COMMENT_STATUS_PUBLISHED);
		//After saving, refresh the current page
		if($model->save(false))
		{
			$this->redirect(array('view', 'id'=>$id));
		}
	}
	
	/**
	 * Change the status of the comment given by the id to "discarded"
	 */
	public function actionDiscard()
	{
		$id=isset($_GET['id']) ? (int) ($_GET['id']) : 0 ;
		
		$model = self::loadModel($id);
		$model->status = ConstantDefine::COMMENT_STATUS_DISCARDED;
		
		//After saving, refresh the current page
		if($model->save(false))
		{
			$this->redirect(array('view', 'id'=>$id));
		}
	}
	
	/**
	 * Load the model given by the id
	 * @param int $commentId
	 * @throws CHttpException
	 * @return Comment
	 */
	public static function loadModel($commentId)
	{
		$model = null;
		if($commentId != 0)
		{
			$model = Comment::model()->findByPk($commentId);

		}
		if($model == null)
			throw new CHttpException(404, 'The request page does not exist');
		return $model;
		
	}
     
     /**
	 * The function is to Delete a Comment
	 * 
	 */
	public function actionDelete($id)
	{                            
            GxcHelpers::deleteModel('Comment', $id);
	}

        
}