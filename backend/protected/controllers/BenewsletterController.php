<?php
class BenewsletterController extends BeController
{
	
	public function __construct($id,$module=null)
	{
		parent::__construct($id,$module);
		$this->menu=array(
				array('label'=>t('Manage Send List'), 'url'=>array('sendlist'),'linkOptions'=>array('class'=>'button')),
				array('label'=>t('Manage Newsletters'), 'url'=>array('admin'),'linkOptions'=>array('class'=>'button')),
				array('label'=>t('Create Newsletter '), 'url'=>array('Create'),'linkOptions'=>array('class'=>'button')),
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
				array()
		);
		$this->render('newsletter_view');
	}
	
	/**
	 * Manage newsletter list
	 * 
	 */
	public function actionAdmin()
	{
		//$newsletter_id=isset($_GET['newsletter_id']) ? (int) ($_GET['newsletter_id']) : 0 ;
		$this->render('newsletter_admin');
	}
	
	public function actionSendlist()
	{
		$this->render('newsletter_sendlist');
	}
	
	public function actionCreate()
	{
		$model = new Newsletter;
		//If the form is submitted by user
		if(isset($_POST['Newsletter']))
		{
			$model->attributes = $_POST[Newsletter];
			//Newsletter is saved without being sent to mail list
			if($model->status == ConstantDefine::NEWSLETTER_STATUS_DRAFT)
			{
				if($model->save())
				{
					user()->setFlash('success',t('New Newsletter was saved successfully!'));
					$model=new Newsletter;
				}
			}
			//Newsletter is send to mail list, then saved
			else if($model->status == ConstantDefine::NEWSLETTER_STATUS_SENT)
			{
				//Get all the
				$mailList = NewsletterSubscription::model()->findAll('status=:status', array(':status'=>ConstantDefine::MAIL_STATUS_ACTIVE));
		
				if(self::sendMail($mailList, $model->topic, $model->content) > 0)
				{
					if($model->save())
					{
						user()->setFlash('success',t('New Newsletter was saved successfully!'));
						$model=new Newsletter;
					}
				}
				else
				{
					user()->setFlash('failure',t('Fail to send newsletter!'));
				}
		
			}
		}
		$this->render('newsletter_create', array('model'=>$model));
	}
	
	protected static function sendMail($mailList=array(), $subject, $body)
	{
		if(empty($mailList))
			return false;
		require_once(CMS_FOLDER.DIRECTORY_SEPARATOR.'extensions'.DIRECTORY_SEPARATOR.'yii-mail'.DIRECTORY_SEPARATOR.'YiiMail.php');
	
		//Initialize the mailer
		$mailer = new YiiMail;
		$mailer->transportType = 'smtp';
		$mailer->transportOptions = array(
				'host'=>'smtp.gmail.com',
				'username'=>'nguyen.tuan.quyen.it@gmail.com',
				'password'=>'whitewinter_noel',
				'port'=>465,
				'encryption'=>'tls',
		);
	
		//Prepare the mail
		$msg = new YiiMailMessage;
		$arrMails = array();
		foreach($mailList as $mail)
		{
			$arrMails = CMap::mergeArray($arrMails, array($mail->email=>$mail->name));
		}
		$msg->setTo($arrMails);
		$msg->setFrom( array($mailer->transportOptions['username']=>$mailer->transportOptions['username']) );
		$msg->setReplyTo( array($mailer->transportOptions['username']=>$mailer->transportOptions['username']) );
		$msg->setSubject($subject);
		$msg->setBody($body);
		return $mailer->send($msg);
	
	}
	
}