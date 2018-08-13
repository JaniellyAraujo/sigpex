<?php

class EventsController extends CController
{

	public $layout='//layouts/column1';

	public function filters()

	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	// accessRules /* DONE */
	public function accessRules()
	{

        return array(
            array('allow',
                'actions'=>array('view'),
                'users'=>array('*'),

            ),
            array('allow',
                'actions'=>array('create'),
                'users'=>array('@'),
                'expression'=>'(!Yii::app()->user->isGuest && !Yii::app()->user->isNormal() && !Yii::app()->user->isEditor() )'
            ),
            array('allow',
                'actions'=>array('changeParticipationStatus'),
                'users'=>array('@'),
            ),
            array('allow',
                'actions'=>array('admin','delete','update','statistics'),
                'users'=>array('@'),
                'expression'=>'(!Yii::app()->user->isGuest && Yii::app()->user->isAdmin() || !Yii::app()->user->isGuest && Yii::app()->user->isOrganizer())'
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

        $model = $this->loadModel($id);

        $connection = Yii::app()->db;
        $usersSQL =
            "
        select *
        from users u join usersevents ue on ue.Id_User = u.Id where ue.Id_Event = '$model->Id'
        ";

        $command = $connection->createCommand($usersSQL);
        $users = $command->queryAll();

		$this->render('view',array(
			'model'=>$model,
            'users'=>$users
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Events();
		$this->performAjaxValidation($model);
        $currentCityCountryCode = null;
        $formCountryCode = null;

		if(isset($_POST['Events']))
		{
            $model->PublishedBy = Yii::app()->user->id;
            $model->PublishedAt = date('Y-m-d H:i:s');
			$model->attributes=$_POST['Events'];
            $model->image = CUploadedFile::getInstance($model,'image');
            $path = $model->image != null ? 'assets/uploads/'.$model->image->name : '';
            $model->MainImagePath = $path;

            if($model->Id_City != null && $model->Id_Country != null){
                $currentCityCountryCode = Cities::model()->findByPk($model->Id_City)->CountryCode;
                $formCountryCode = $model->Id_Country;
            }

            if($currentCityCountryCode != null && $formCountryCode !=null &&  $currentCityCountryCode != $formCountryCode)
            {
                $model->addError('Id_City', 'Invalid City - Select a city from selected country');
                $model->addError('Id_Country', 'Invalid Country - Select a country synced with the selected city');
            }
            else{

                if($model->validate() && $model->save()){

                    if($model->image != null){

                        $model->image->saveAs($model->MainImagePath);
                    }
                    $this->redirect(array('view','id'=>$model->Id));

                }

            }

		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);
        $currentCityCountryCode = null;
        $formCountryCode = null;

		$this->performAjaxValidation($model);

		if(isset($_POST['Events']))
		{

            $model->attributes=$_POST['Events'];
            $model->PublishedBy = Yii::app()->user->id;
            $model->PublishedAt = date('Y-m-d H:i:s');

            if($model->Id_City != null && $model->Id_Country != null){
                $currentCityCountryCode = Cities::model()->findByPk($model->Id_City)->CountryCode;
                $formCountryCode = $model->Id_Country;
            }

            if($currentCityCountryCode != null && $formCountryCode != null && $currentCityCountryCode != $formCountryCode)
            {
                $model->addError('Id_City', 'Invalid City - Select a city from selected country');
                $model->addError('Id_Country', 'Invalid Country - Select a country synced with the selected city');
            }
            else{

            if($model->save()){
                $this->redirect(array('view','id'=>$model->Id));
            }

            }

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

	// grid view
	public function actionAdmin()
	{
		$model=new Events('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Events']))
			$model->attributes=$_GET['Events'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

    public function actionStatistics(){

        $connection = Yii::app()->db;
        $startEventsSQL = '
        select c.Name as Category,
        sum(case when MONTH(e.StartDate) = 1 then 1 else 0 end) As Jan,
        sum(case when MONTH(e.StartDate) = 2 then 1 else 0 end) As Feb,
        sum(case when MONTH(e.StartDate) = 3 then 1 else 0 end) As Mar,
        sum(case when MONTH(e.StartDate) = 4 then 1 else 0 end) As Apr,
        sum(case when MONTH(e.StartDate) = 5 then 1 else 0 end) As May,
        sum(case when MONTH(e.StartDate) = 6 then 1 else 0 end) As Jun,
        sum(case when MONTH(e.StartDate) = 7 then 1 else 0 end) As Jul,
        sum(case when MONTH(e.StartDate) = 8 then 1 else 0 end) As Aug,
        sum(case when MONTH(e.StartDate) = 9 then 1 else 0 end) As Sep,
        sum(case when MONTH(e.StartDate) = 10 then 1 else 0 end) As Oct,
        sum(case when MONTH(e.StartDate) = 11 then 1 else 0 end) As Nov,
        sum(case when MONTH(e.StartDate) = 12 then 1 else 0 end) As "Dec"
        from events e join categories c on e.Id_Category = c.Id where YEAR(e.StartDate) = YEAR(SYSDATE()) group by e.Id_Category
        ';

        $commandStart = $connection->createCommand($startEventsSQL);
        $dbStartEvents = $commandStart->queryAll();
        $startArray = [];
        $startContor = 0;
        foreach($dbStartEvents as $dbStartEvent){

            $monthsArray = [];
            array_push($monthsArray,intval($dbStartEvent['Jan']));
            array_push($monthsArray,intval($dbStartEvent['Feb']));
            array_push($monthsArray,intval($dbStartEvent['Mar']));
            array_push($monthsArray,intval($dbStartEvent['Apr']));
            array_push($monthsArray,intval($dbStartEvent['May']));
            array_push($monthsArray,intval($dbStartEvent['Jun']));
            array_push($monthsArray,intval($dbStartEvent['Jul']));
            array_push($monthsArray,intval($dbStartEvent['Aug']));
            array_push($monthsArray,intval($dbStartEvent['Sep']));
            array_push($monthsArray,intval($dbStartEvent['Oct']));
            array_push($monthsArray,intval($dbStartEvent['Nov']));
            array_push($monthsArray,intval($dbStartEvent['Dec']));


            $startArray[$startContor]['name'] = $dbStartEvent['Category'];
            $startArray[$startContor]['data'] = $monthsArray;

            $startContor++;

        }


        $endEventsSQL = '
                select c.Name as Category,
        sum(case when MONTH(e.EndDate) = 1 then 1 else 0 end) As Jan,
        sum(case when MONTH(e.EndDate) = 2 then 1 else 0 end) As Feb,
        sum(case when MONTH(e.EndDate) = 3 then 1 else 0 end) As Mar,
        sum(case when MONTH(e.EndDate) = 4 then 1 else 0 end) As Apr,
        sum(case when MONTH(e.EndDate) = 5 then 1 else 0 end) As May,
        sum(case when MONTH(e.EndDate) = 6 then 1 else 0 end) As Jun,
        sum(case when MONTH(e.EndDate) = 7 then 1 else 0 end) As Jul,
        sum(case when MONTH(e.EndDate) = 8 then 1 else 0 end) As Aug,
        sum(case when MONTH(e.EndDate) = 9 then 1 else 0 end) As Sep,
        sum(case when MONTH(e.EndDate) = 10 then 1 else 0 end) As Oct,
        sum(case when MONTH(e.EndDate) = 11 then 1 else 0 end) As Nov,
        sum(case when MONTH(e.EndDate) = 12 then 1 else 0 end) As "Dec"
        from events e join categories c on e.Id_Category = c.Id where YEAR(e.EndDate) = YEAR(SYSDATE()) group by e.Id_Category
        ';
        $commandEnd = $connection->createCommand($endEventsSQL);
        $dbEndEvents=$commandEnd->queryAll();


        $endArray = [];
        $endContor = 0;
        foreach($dbEndEvents as $dbEndEvent){

            $monthsArray = [];
            array_push($monthsArray,intval($dbEndEvent['Jan']));
            array_push($monthsArray,intval($dbEndEvent['Feb']));
            array_push($monthsArray,intval($dbEndEvent['Mar']));
            array_push($monthsArray,intval($dbEndEvent['Apr']));
            array_push($monthsArray,intval($dbEndEvent['May']));
            array_push($monthsArray,intval($dbEndEvent['Jun']));
            array_push($monthsArray,intval($dbEndEvent['Jul']));
            array_push($monthsArray,intval($dbEndEvent['Aug']));
            array_push($monthsArray,intval($dbEndEvent['Sep']));
            array_push($monthsArray,intval($dbEndEvent['Oct']));
            array_push($monthsArray,intval($dbEndEvent['Nov']));
            array_push($monthsArray,intval($dbEndEvent['Dec']));


            $endArray[$endContor]['name'] = $dbEndEvent['Category'];
            $endArray[$endContor]['data'] = $monthsArray;

            $endContor++;

        }


        $this->render('statistics',
        array(
            'startModel' => $startArray,
            'endModel' => $endArray
        ));

    }

	public function loadModel($id)
	{
		$model=Events::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

    public function actionChangeParticipationStatus(){

        if(isset($_POST['participate']) && isset($_POST['eventId']) && isset($_POST['userId'])){

            $participating = $_POST['participate'];

            $eventId = $_POST['eventId'];

            $userId = $_POST['userId'];

            $connection = Yii::app()->db;

            if($participating == 'true'){

                $sql = "insert into usersevents (id_user, id_event) values (:userId, :eventId)";

                $parameters = array(":userId"=>$userId,":eventId"=>$eventId);

                $connection->createCommand($sql)->execute($parameters);

            }
            else{

                $sqlDelete = "delete from usersevents where id_user = :userId and id_event = :eventId";

                $parametersDelete = array(":userId"=>$userId,":eventId"=>$eventId);

                $connection->createCommand($sqlDelete)->execute($parametersDelete);

            }

        }


    }

	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='events-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
