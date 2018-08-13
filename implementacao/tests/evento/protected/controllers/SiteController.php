<?php

class SiteController extends Controller
{
	/**
	 * Declares class-based actions.
	 */
	public function actions()
	{
		return array(
		// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
		),
		// page action renders "static" pages stored under 'protected/views/site/pages'
		// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
		),
		);
	}

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{

		$connection = Yii::app()->db;
		$sql = 'select * from categories';
		$command = $connection->createCommand($sql);
		$categories=$command->query();


        $sqlEvents = 'SELECT * FROM events WHERE EndDate > curdate() order by EndDate LIMIT 5;';
        $commandEvents = $connection->createCommand($sqlEvents);
        $events = $commandEvents->query();

        $this->render('index',array(
            'categories'=>$categories,
            'events'=> $events
        ));


	}


    public function actionFilter(){

        $html = ' ';

        if(isset($_POST['categories'])){

            $categories = $_POST['categories'];

               foreach($categories as $key => $categoryId) {
                $newCategories[$key] = "'".mysql_real_escape_string($categoryId)."'";
            }

            $dbCategories = join(', ', $newCategories);

            $connection = Yii::app()->db;
            $eventsSQL = "SELECT * from events WHERE Id_Category IN ($dbCategories) order by EndDate LIMIT 5;";


            $command = $connection->createCommand($eventsSQL);
            $events = $command->query();

            $html = $this->renderPartial('_eventList',array(
                'events'=> $events
            ));

        }
        else{
            $connection = Yii::app()->db;
            $eventsSQL = "SELECT * from events WHERE EndDate > curdate() order by EndDate LIMIT 5;";

            $command = $connection->createCommand($eventsSQL);
            $events = $command->query();

            $html = $this->renderPartial('_eventList',array(
                'events'=> $events
            ));
        }
        return $html;

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

	public function sendMail($model){

		Yii::import('application.extensions.swiftMailer.classes.Swift',true);
		Yii::registerAutoloader(array('Swift','autoload'));
		Yii::import('application.extensions.swiftMailer.swift_init', true);

		$transport = Swift_SmtpTransport::newInstance('smtp.gmail.com', 465, "ssl")
		->setUsername('globaleventsmailer')->setPassword('mailer123');

		$mailer = Swift_Mailer::newInstance($transport);

		$message = Swift_Message::newInstance('Contact | '.$model->subject)
		->setTo(Yii::app()->params['adminEmail'])
		->addReplyTo($model->email, $model->name)
		->setFrom('globaleventsmailer@gmail.com','Global Events')
		->setBody($model->body);

		$result = $mailer->send($message);
	}

	/**
	 * Displays the contact page
	 */
	public function actionContact()
	{
		$model=new ContactForm;
		if(isset($_POST['ContactForm']))
		{
			$model->attributes=$_POST['ContactForm'];
			if($model->validate())
			{

				$this->sendMail($model);
				Yii::app()->user->setFlash('contact','Thank you for contacting us. We will respond to you as soon as possible');
				$this->refresh();
			}
		}
		$this->render('contact',array('model'=>$model));
	}

	/**
	 * Displays the login page
	 */
	public function actionLogin()
	{

		if (!Yii::app()->user->isGuest){
			$this->redirect(Yii::app()->createUrl('/'));
		}

		$model=new LoginForm;

		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}

		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
			$this->redirect(Yii::app()->user->returnUrl);
		}
		// display the login form
		$this->render('login',array('model'=>$model));



	}


	public function actionRegister() {

		$model   = new RegisterForm ;
		
		if (!Yii::app()->user->isGuest){
			$this->redirect(Yii::app()->createUrl('/'));
		}

		if(isset($_POST['RegisterForm'])) {
				
			$model->attributes = $_POST['RegisterForm'];

			if($model->validate() && $model->register()) {


				$this->redirect(Yii::app()->user->returnUrl);

			}
		}
		$this->render('register',array('model'=>$model));
	}


	/**
	 * Logs out the current user and redirect to homepage.
	 */
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect(Yii::app()->homeUrl);
	}
}