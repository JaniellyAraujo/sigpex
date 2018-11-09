<?php

namespace app\controllers;

use Yii;
use app\models\Declaracao;
use app\models\DeclaracaoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * DeclaracaoController implements the CRUD actions for Declaracao model.
 */
class DeclaracaoController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Declaracao models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new DeclaracaoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        
        

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Declaracao model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Declaracao model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Declaracao();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(array('declaracao/salvar?id=' . $model->id));
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }
    
        public function  actionSalvar($id){
       $model = $this->findModel($id);
       $query = \app\models\Declaracaoprojeto::find()->where(['id_declaracao' => $id ]);
       $data = new \yii\data\ActiveDataProvider ([
            'query' => $query
        ]);
       
       if ($model->load(Yii::$app->request->post()) && $model->save()) {
           
                $model->save(false);
                return $this->redirect(array('declaracao/index'));
            }
        return $this->render('doc', [
            'model' => $model,
            'data' => $data,            
        ]);   
    }

       /**
     * Creates a new Relatorios model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreateModal($id)
    {
        $model = $this->findModel($id);
         $query = \app\models\Declaracaoprojeto::find()->where(['id_declaracao' => $id ]);
       $data = new \yii\data\ActiveDataProvider ([
            'query' => $query
        ]);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['declaracao/index']);
        }

        return $this->render('update', [
            'model' => $model,
            'data' => $data,
        ]);
    }
    
        /**
     * Updates an existing Relatorios model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(array('declaracao/salvar?id=' . $model->id));
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Declaracao model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Declaracao model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Declaracao the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Declaracao::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
