<?php

namespace app\controllers;

use Yii;
use app\models\Relatorios;
use app\models\RelatoriosSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;
use \app\models\RelatoriosProjetos;

/**
 * RelatoriosController implements the CRUD actions for Relatorios model.
 */
class RelatoriosController extends Controller
{
    /**
     * @inheritdoc
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
     * Lists all Relatorios models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new RelatoriosSearch();       
        $relacao = \app\models\RelatoriosProjetos::find();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'relacao' => $relacao,
        ]);
    }

    /**
     * Displays a single Relatorios model.
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
     * Creates a new Relatorios model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Relatorios();
        $modelRelatorios = [new RelatoriosProjetos()];
        if ($model->loadAll(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['editar-relatorio', 'id' => $model->id]);
        }else {
            return $this->render('create', [
                        'model' => $model,
                        'modelRelatorios' => (empty($modelRelatorios)) ? [new RelatoriosProjetos] : $modelRelatorios,
                        
            ]);
        }
    }
    
    /*
    public function actionPreenche($id) {
        $model = $this->findModel($id);
        $model->status = 1;

        if ($model->save()) {
            return $this->redirect(['editar-relatorio', 'id' => $model->id]); //$this->redirect(['create', 'id' => $model->id]);       
        }
    }
     public function actionEnviar($id) {
        $model = $this->findModel($id);
        $model->status = 2;

        if ($model->save()) {
            return $this->redirect(['editar-relatorio', 'id' => $model->id]); //$this->redirect(['create', 'id' => $model->id]);       
        }
    }
    
    public function actionConfirmar($id) {
        $model = $this->findModel($id);
        $model->status = 3;

        if ($model->save()) {
            return $this->redirect(['editar-relatorio', 'id' => $model->id]); //$this->redirect(['create', 'id' => $model->id]);       
        }
    }*/
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
        $modelRelatorios = $model->relatoriosProjetos;
        if ($model->loadAll(Yii::$app->request->post()) && $model->saveAll()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                        'model' => $model,
                        'modelRelatorios' => (empty($modelRelatorios)) ? [new RelatoriosProjetos] : $modelRelatorios,
                        
            ]);
        }
    }

    /**
     * Deletes an existing Relatorios model.
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
     * Finds the Relatorios model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Relatorios the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Relatorios::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
    
    public function actionEditarRelatorio($id) {
        $relatorio = Relatorios::findOne($id);
        $query = RelatoriosProjetos::find()->where(['id_relatorios' => $id]);
        
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            
        ]);

        return $this->render('create0', [
                    'relatorio' => $relatorio,
                    'dataProvider' => $dataProvider,
                   
        ]);
    }
}
