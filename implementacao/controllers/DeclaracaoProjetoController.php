<?php

namespace app\controllers;

use Yii;
use app\models\DeclaracaoProjeto;
use app\models\DeclaracaoProjetoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * DeclaracaoProjetoController implements the CRUD actions for DeclaracaoProjeto model.
 */
class DeclaracaoProjetoController extends Controller
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
     * Lists all DeclaracaoProjeto models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new DeclaracaoProjetoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        
        if (Yii::$app->user->identity->role == 3 || Yii::$app->user->identity->role == 4) {
                $dataProvider->query
                    ->andWhere(['DECLARACAO_PROJETO.participante_id' => \Yii::$app->user->identity->getId()]);
            }

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single DeclaracaoProjeto model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $query = \app\models\Projetos::find()->where(['id_projeto' => $id ]);
       $data = new \yii\data\ActiveDataProvider ([
            'query' => $query
        ]);
       $query2 = \app\models\User::find()->where(['participante_id' => $id ]);
       $data2 = new \yii\data\ActiveDataProvider ([
            'query' => $query
        ]);
       
       
        return $this->render('view', [
            'model' => $this->findModel($id),
            'data' => $data,
            'data2' => $data2,
        ]);
    }

    /**
     * Creates a new DeclaracaoProjeto model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($id)
    {
        $model = new DeclaracaoProjeto();
        $model->id_declaracao = $id;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(array('declaracao/salvar?id=' . $model->id_declaracao));
        }

        return $this->renderAjax('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing DeclaracaoProjeto model.
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
     * Deletes an existing DeclaracaoProjeto model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $id = $this->findModel($id);       
        
        $this->findModel($id)->delete();

        return $this->redirect(['declaracao/salvar?id='  . $id->id_declaracao]);
    }

    /**
     * Finds the DeclaracaoProjeto model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return DeclaracaoProjeto the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = DeclaracaoProjeto::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
