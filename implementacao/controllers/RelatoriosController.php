<?php

namespace app\controllers;

use Yii;
use app\models\Relatorios;
use app\models\RelatoriosSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * RelatoriosController implements the CRUD actions for Relatorios model.
 */
class RelatoriosController extends Controller
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
     * Lists all Relatorios models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new RelatoriosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        
        $dataProvider = new \yii\data\ActiveDataProvider([
                'query' => Relatorios::find()->where(['status' => 0]), 
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionArquivados() {
        if (Yii::$app->user->can('coordenador')) {
            $searchModel = new RelatoriosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $dataProvider = new \yii\data\ActiveDataProvider([
                'query' => Relatorios::find()->where(['status' => 1]), // ARQUIVADOS
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);

            return $this->render('arquivados', [
                        'dataProvider' => $dataProvider,
                        'searchModel' => $searchModel,
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta ação.');
        }
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
        $model->status = '0';
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect('index');
        }

        return $this->render('create', [
            'model' => $model,
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
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }
    
    public function actionArquivar($id) {
        if (Yii::$app->user->can('coordenador')) {
            $model = $this->findModel($id);
            $model->status = '1'; //ARQUIVADO
            $model->save(false);
            $this->redirect(array("relatorios/index"));
            //$this->redirect(array("projetos/reprovados"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
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
}
