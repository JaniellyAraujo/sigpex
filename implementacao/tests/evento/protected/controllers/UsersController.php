<?php

class UsersController extends Controller
{

	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column1';

	// array action filters
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // delete only via post request
		);
	}

	// access control rules
	public function accessRules()
	{
		return array(
		array('allow', 
				'actions'=>array('view'),
				'users'=>array('@'),
		),
		array('allow',
			  'actions'=>array('create'),
		'users'=>array('@'),
		'expression'=>'(!Yii::app()->user->isGuest && !Yii::app()->user->isNormal())'
			),
			array('allow',
			  'actions'=>array('admin','delete','update'),
		'users'=>array('@'),
		'expression'=>'(!Yii::app()->user->isGuest && Yii::app()->user->isAdmin())'
			),
		array('deny',  // deny all users
				'users'=>array('*'),
		),
		);
		
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new User;


		// some ajax validation
		$this->performAjaxValidation($model);

		if(isset($_POST['User']))
		{
			$model->attributes=$_POST['User'];
			$model->Type = 1;
			if($model->Pass != '' && strlen($model->Pass) > 7){

				$model->Pass = md5($model->Pass);
					
			}
			if($model->validate() && $model->save())
			$this->redirect(array('view','id'=>$model->Id));
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// clear current password from view
		// some ajax validation
		$this->performAjaxValidation($model);

		if(isset($_POST['User']))
		{
			$model->attributes=$_POST['User'];
				
			if($model->validate() && $model->save())
			$this->redirect(array('view','id'=>$model->Id));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
		$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	public function actionAdmin()
	{
			
		$model=new User('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['User']))
		$model->attributes=$_GET['User'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	// returns data model finding this by using primary key - the id
	public function loadModel($id)
	{
		$model=User::model()->findByPk($id);
		if($model===null)
		throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	// look at rules defined in user model and validate the entry
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='user-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

}
