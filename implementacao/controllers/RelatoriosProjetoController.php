<?php

namespace app\controllers;

use Yii;
use app\models\RelatoriosProjeto;
use app\models\RelatoriosProjetoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * RelatoriosProjetoController implements the CRUD actions for RelatoriosProjeto model.
 */
class RelatoriosProjetoController extends Controller
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
                    'delete' => ['GET','POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all RelatoriosProjeto models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new RelatoriosProjetoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single RelatoriosProjeto model.
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
     * Creates a new RelatoriosProjeto model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($id)
    {
        $model = new RelatoriosProjeto();

        $model->id_relatorio = $id;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {  
             if ($model->tipo === 'Mensal') {
                  $model->istipo = '0';
                  $model->save(false);
                  } else if($model->tipo === 'Final'){
                  $model->istipo = '1';
                  $model->save(false);
                  }
            //echo 1;
           return $this->redirect(array('relatorios/salvar?id=' . $model->id_relatorio));
        }
        return $this->renderAjax('create', [
            'model' => $model,
        ]);
        
    }
      
    /**
     * Updates an existing RelatoriosProjeto model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing RelatoriosProjeto model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $id = $this->findModel($id);       
        
        $this->findModel($id)->delete();

        return $this->redirect(['relatorios/salvar?id='  . $id->id_relatorio]);
    }

    /**
     * Finds the RelatoriosProjeto model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return RelatoriosProjeto the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = RelatoriosProjeto::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
