<?php

namespace app\controllers;

use Yii;
use app\models\Declaracao;
use app\models\DeclaracaoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \yii\web\ForbiddenHttpException;

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
        if (!Yii::$app->user->isGuest && Yii::$app->user->identity->role == 2) { 
        $searchModel = new DeclaracaoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
        } else {
            throw new \yii\web\ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    /**
     * Displays a single Declaracao model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        if (Yii::$app->user->can('coordenador')) {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
        
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    /**
     * Creates a new Declaracao model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        if (Yii::$app->user->can('coordenador')) {
        $model = new Declaracao();
        $model->dataEmissao = new \yii\db\Expression('NOW()');
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    /**
     * Updates an existing Declaracao model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        if (Yii::$app->user->can('coordenador')) {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
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
        if (Yii::$app->user->can('coordenador')) {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
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
