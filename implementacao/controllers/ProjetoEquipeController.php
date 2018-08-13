<?php

/******************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
 /******************************************************************/

namespace app\controllers;

use Yii;
use app\models\ProjetoEquipe;
use app\models\ProjetoEquipeSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ProjetoEquipeController implements the CRUD actions for ProjetoEquipe model.
 */
class ProjetoEquipeController extends Controller {

    /**
     * @inheritdoc
     */
    public function behaviors() {
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
     * Lists all ProjetoEquipe models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new ProjetoEquipeSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ProjetoEquipe model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($projeto_id, $participante_id) {
        return $this->render('view', [
                    'model' => $this->findModel($projeto_id, $participante_id),
        ]);
    }

    /**
     * Creates a new ProjetoEquipe model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new ProjetoEquipe();

        if ($participanteModel->load(Yii::$app->request->post()) && $participanteModel->save()) {
            return $this->redirect(['view', 'projeto_id' => $participanteModel->projeto_id, 'participante_id' => $participanteModel->participante_id]);
        }

        return $this->render('create', [
                    'model' => $participanteModel,
        ]);
    }

    /**
     * Updates an existing ProjetoEquipe model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($projeto_id, $participante_id) {
        $model = $this->findModel($projeto_id, $participante_id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'projeto_id' => $model->projeto_id, 'participante_id' => $model->participante_id]);
        }

        return $this->render('update', [
                    'model' => $model,
        ]);
    }

    /**
     * Deletes an existing ProjetoEquipe model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($projeto_id, $participante_id) {
        $this->findModel($projeto_id, $participante_id)->delete();



        return $this->redirect(['index']);
    }

    /**
     * Finds the ProjetoEquipe model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ProjetoEquipe the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($projeto_id, $participante_id) {
        if (($model = ProjetoEquipe::findOne(['$projeto_id' => $projeto_id, 'participante_id' => $participante_id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }

}
