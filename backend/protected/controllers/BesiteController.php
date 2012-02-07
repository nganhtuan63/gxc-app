<?php
/**
 * Backend Site Controller.
 * 
 * @author Tuan Nguyen <nganhtuan63@gmail.com>
 * @version 1.0
 * @package backend.controllers
 *
 */
class BesiteController extends BeController
{
    
	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'				
		$this->render('index');
               
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
            
	    if($error=Yii::app()->errorHandler->error)
	    {
	    	if(Yii::app()->request->isAjaxRequest)
	    		echo $error['message'];
	    	else                     
	        	$this->render('error', $error);
	    }
	}

	
	/**
	 * Displays the login page
	 */
	public function actionLogin()
	{
		$model=new UserLoginForm;

		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
                   
		// collect user input data
		if(isset($_POST['UserLoginForm']))
		{
                       
			$model->attributes=$_POST['UserLoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
				$this->redirect(Yii::app()->user->returnUrl);
		}
                 
		// display the login form
                $this->layout='login';
		$this->render('login',array('model'=>$model));
	}

	/**
	 * Logs out the current user and redirect to homepage.
	 */
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect(Yii::app()->homeUrl);
	}
	
	
	public function actionInstall(){
		
		//First need to check has_install or not ? 
		if(file_exists(COMMON_FOLDER.DIRECTORY_SEPARATOR.'.locked')){
			echo 'Remove locked file for install first bro!';
			Yii::app()->end();
		} else {
			//Start working with Yii Database Components
			$connection=Yii::app()->db;   // assuming you have configured a "db" connection
			// If not, you may explicitly create a connection:
			// $connection=new CDbConnection($dsn,$username,$password);
			
			// Get SQL Script		
			$sql = file_get_contents(COMMON_FOLDER.DIRECTORY_SEPARATOR.'data'.DIRECTORY_SEPARATOR.'data.sql', true);				
			if($sql){
				//Replace some default attributes
				
				$sql=str_replace("{{SITE_NAME}}", SITE_NAME, $sql);
				$sql=str_replace("{{SUPPORT_EMAIL}}", SUPPORT_EMAIL, $sql);	
				$sql=str_replace("{{time}}", time(), $sql);
				$sql=str_replace("{{password_salt}}", USER_SALT, $sql);
				
				//Generate password 123456
				$password=hashPassword('123456',USER_SALT);
				$sql=str_replace("{{password}}", $password, $sql);
							
				$command=$connection->createCommand($sql);
				
				if($command->execute()!==false){
					echo "Install successfully";
				} else {
					echo "Error while installing! Please check config file and try again";
				}			
						
			} else {
				echo "Can't file data.sql file in COMMON FOLDER";
				Yii::app()->end();
			}
		}
					
	}
	

}