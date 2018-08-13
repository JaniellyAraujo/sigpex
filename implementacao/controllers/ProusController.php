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
use app\models\ProjetoUsuario;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ProusController implements the CRUD actions for ProjetoUsuario model.
 */
class ProusController extends Controller {

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
     * @return array action filters
     */
    public function filters() {
        return array(
            'accessControl', // perform access control for CRUD operations
            'postOnly + delete', // we only allow deletion via POST request
        );
    }

    public function accessRules() {
        return array(
            array('allow', // allow all users to perform 'index' and 'view' actions
                'actions' => array('index', 'indexByProjeto'),
                'usuarios' => array('*'),
            ),
            array('allow', // allow authenticated user to perform 'create' and 'update' actions
                'actions' => array('create', 'update', 'createByProjeto', 'delete'),
                'usuarios' => array('@'),
                'roles' => array('createByProjeto', 'updateProjeto')
            ),
//            array('allow', // allow admin user to perform 'admin' and 'delete' actions
//                'actions' => array('admin', 'adminByProject'),
//                'users' => array('@'),
//            ),
            array('deny', // deny all users
                'usuarios' => array('*'),
            ),
        );
    }

    /**
     * Lists all models.
     */
    public function actionIndexByProjeto($projetoId) {
        $this->render('indexByProjeto', array(
            'dataProvider' => UserProjeto::model()->searchByProjeto($projetoId),
            'projetoId' => $projetoId
        ));
    }

    /**
     * Displays a single ProjetoUsuario model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id) {
        return $this->render('view', [
                    'model' => $this->findModel($id),
        ]);
    }

    public function actionCreateByProjeto($projetoId) {
        $model = new ProjetoUsuario();

        // Uncomment the following line if AJAX validation is needed
        // $this->performAjaxValidation($model);

        if (isset($_POST['ProjetoUsuario'])) {
            $user_ids = $_POST['ProjetoUsuario']['usuario_id'];
            unset($_POST['ProjetoUsuario']['usuario_id']);
            foreach ($user_ids as $usuario_id) {
                $up = new ProjetoUsuario;
                $up->attributes = $_POST['ProjetoUsuario'];
                $up->projeto_id = $projetoId;
                $up->usuario_id = $usuario_id;
                $up->save();
            }
            $this->sendAssociationNotification($user_ids, $projetoId);
            $this->sendEmailAssociationNotification($user_ids, $projetoId);
            $this->redirect(array('projetos/view', 'id' => $projetoId));
        }

        $this->render('createByProject', array(
            'model' => $model,
            'projetoId' => $projetoId
        ));
    }

    /**
     * Updates an existing ProjetoUsuario model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id) {
        $model = $this->loadModel($id);

        // Uncomment the following line if AJAX validation is needed
        // $this->performAjaxValidation($model);

        if (isset($_POST['ProjetoUsuario'])) {
            $model->attributes = $_POST['ProjetoUsuario'];
            if ($model->save())
//                $this->redirect(array('indexByProject', 'projectId' => $model->project_id));
                $this->redirect(array('projetos/view', 'id' => $model->projeto_id));
        }

        $this->render('update', array(
            'model' => $model,
            'projetoId' => $model->projeto_id
        ));
    }

    /**
     * Deletes a particular model.
     * If deletion is successful, the browser will be redirected to the 'admin' page.
     * @param integer $id the ID of the model to be deleted
     */
    public function actionDelete($id) {
        $this->loadModel($id)->delete();

        // if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
        if (!isset($_GET['ajax'])) {
            $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('indexByProjeto', 'projetoId' => $projetoId));
        }
    }

    /**
     * Finds the ProjetoUsuario model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ProjetoUsuario the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = ProjetoUsuario::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }

}
