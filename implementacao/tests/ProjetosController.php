<?php

namespace app\controllers;

use Yii;
use app\models\Projetos;
use app\models\ProjetosSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;
use kartik\mpdf\Pdf;
use yii\web\ForbiddenHttpException;
use mPDF;

/**
 * ProjetosController implements the CRUD actions for Projetos model.
 */
class ProjetosController extends Controller {

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
     * Lists all Projetos models.
     * @return mixed
     */
    public function actionGerar() {
        if (Yii::$app->user->can('coordenador')) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $content = $this->renderPartial('geral', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
            ]);

            $pdf = new Pdf([
                'format' => Pdf::FORMAT_A4,
                'orientation' => Pdf::ORIENT_PORTRAIT,
                'destination' => Pdf::DEST_BROWSER,
                'content' => $content,
                'cssFile' => '@vendor/kartik-v/yii2-mpdf/assets/kv-mpdf-bootstrap.min.css',
                'cssInline' => '.kv-heading-1{font-size:18px}',
                'options' => ['title' => 'Relatório'],
                'methods' => [
                    'SetHeader' => ['SigPex'],
                    'SetFooter' => ['{PAGENO}'],
                    'SetFooter' => ['<p style="text-align: center;font-size: 8px;">'
                        . 'Documento emitido pelo SigPex. '
                        . 'Todos os Direitos Reservados © 2018</p>'],
                ]
            ]);

            return $pdf->render();
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionGeral() {
        if (Yii::$app->user->can('coordenador')) {

            $content = $this->renderPartial('geral');

            $pdf = new Pdf([
                'mode' => Pdf::MODE_CORE,
                'format' => Pdf::FORMAT_A4,
                'orientation' => Pdf::ORIENT_PORTRAIT,
                'destination' => Pdf::DEST_BROWSER,
                'content' => $content,
                'cssFile' => '@vendor/kartik-v/yii2-mpdf/assets/kv-mpdf-bootstrap.min.css',
                'cssInline' => '.kv-heading-1{font-size:18px}',
                'options' => ['title' => 'Relatório'],
                'methods' => [
                    'SetHeader' => ['SigPex'],
                    'SetFooter' => ['{PAGENO}'],
                    'SetFooter' => ['<p style="text-align: center;font-size: 8px;">'
                        . 'Documento emitido pelo Sistema de Projetos de Extensão. '
                        . 'Todos os Direitos Reservados © 2018</p>'],
                ]
            ]);

            return $pdf->render();
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionIndex() {
        if ((Yii::$app->user->can('coordenador') || (Yii::$app->user->can('servidor')))) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
             $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()->where(['OR', ['isAtivo'=>0], ['isAtivo'=>1], ['isAtivo'=>2]]),
                 
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);

            return $this->render('index', [
                        'searchModel' => $searchModel,
                        'dataProvider' => $dataProvider,
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }
        public function actionIndex2()      
    {
       return $this->render('index2');
    }
    /**
     * Displays a single Projetos model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id) {
        if ((Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor'))) {
            return $this->render('view', [
                        'model' => $this->findModel($id),
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionView2($id) {
        $model = $this->findModel($id);
        if (($model->id == Yii::$app->user->identity->id) || (Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor'))) {
            return $this->render('View2', [
                        'model' => $this->findModel($id),
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }
        public function actionView3($id) {
        $model = $this->findModel($id);
        if (($model->id == Yii::$app->user->identity->id) || (Yii::$app->user->can('discente')) || (Yii::$app->user->can('servidor'))) {
            return $this->render('View3', [
                        'model' => $this->findModel($id),
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    

    public function actionJustific($id) {
        $model = $this->findModel($id);

        return $this->render('justificativa', [
                    'model' => $model,
        ]);
    }

    /**
     * Creates a new Projetos model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {  // if (Yii::$app->user->can('admin')){
        $model = new Projetos();
        $model->isControle = '0';
        $model->isTipo = '0';
        //$model->isStatus = '0';
        //$model->justificativa = 'Nenhum';
        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            if ($model->modalidade === 'Fomento Interno') {
                $model->isControle = '1';
                $model->save(false);
            } else {
                $model->isControle = '2';
                $model->save(false);
            }

            if ($model->tipoProjeto === 'Tecnológico') {
                $model->isTipo = '1';
                $model->save(false);
            } else if ($model->tipoProjeto === 'Empreendedor') {
                $model->isTipo = '2';
                $model->save(false);
            } else if ($model->tipoProjeto === 'Social') {
                $model->isTipo = '3';
                $model->save(false);
            } else if ($model->tipoProjeto === 'Cultural') {
                $model->isTipo = '4';
                $model->save(false);
            } else if ($model->tipoProjeto === 'Artístico') {
                $model->isTipo = '5';
                $model->save(false);
            } else if ($model->tipoProjeto === 'Esportivo') {
                $model->isTipo = '6';
                $model->save(false);
            }
            $model->save(false);


            if (Yii::$app->user->identity->role == 3) {
                Yii::$app->getSession()->setFlash('info', [
                    'type' => 'info',
                    'icon' => 'glyphicon glyphicon-ok-sign',
                    'showSeparator' => true,
                    'duration' => 10000,
                    'message' => 'Cadastro Realizado com Sucesso.  '
                    . 'Aguarde Aprovação do Departamento de Extensão.',
                    'title' => '',
                    'pluginOptions' => [
                        'showProgressbar' => true,
                        'positonY' => 'top',
                        'positonX' => 'right'
                    ]
                ]);
            } else {
                Yii::$app->getSession()->setFlash('info', [
                    'type' => 'info',
                    'icon' => 'glyphicon glyphicon-ok-sign',
                    'showSeparator' => true,
                    'duration' => 10000,
                    'message' => 'Cadastro Realizado com Sucesso.  '
                    . 'Aprove o mesmo em Cadastros Pendentes.',
                    'title' => '',
                    'pluginOptions' => [
                        'showProgressbar' => true,
                        'positonY' => 'top',
                        'positonX' => 'right'
                    ]
                ]);
            }

            //return $this->redirect(['site' => $model->id]);
            //return $this->redirect(array('site/index'));
             if (Yii::$app->user->can('coordenador')) {
                return $this->redirect(array('projetos/aprovados'));
            } else if (Yii::$app->user->can('servidor')) {
                return $this->redirect(array('projetos/index'));
            
        }

            
        }



        return $this->render('create', [
                    'model' => $model,
        ]);

        /* } else {
          throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
          } */
    }
    public function actionCreate2() {   if (Yii::$app->user->can('discente')){
        $model = new Projetos();
        $model->isAndamento = '0';
        $model->editaAluno = '0';
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
           
            $model->save(false);
                Yii::$app->getSession()->setFlash('info', [
                    'type' => 'info',
                    'icon' => 'glyphicon glyphicon-ok-sign',
                    'showSeparator' => true,
                    'duration' => 10000,
                    'message' => 'Relatório editado com Sucesso.  ',
                    'title' => '',
                    'pluginOptions' => [
                        'showProgressbar' => true,
                        'positonY' => 'top',
                        'positonX' => 'right'
                    ]
                ]);
             
    
            //return $this->redirect(['site' => $model->id]);
            return $this->redirect(array('site/index2'));
        }
        
        return $this->render('create2', [
                    'model' => $model,
        ]);

        } else {
          throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
          } 
    }
     public function actionCreate3() {  if (Yii::$app->user->can('servidor')){
        $model = new Projetos();
                $model->isAndamento = '0';
                $model->editaCoordenador = '0';
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
           
            $model->save(false);
                Yii::$app->getSession()->setFlash('info', [
                    'type' => 'info',
                    'icon' => 'glyphicon glyphicon-ok-sign',
                    'showSeparator' => true,
                    'duration' => 10000,
                    'message' => 'Relatório editado com Sucesso.  ',
                    'title' => '',
                    'pluginOptions' => [
                        'showProgressbar' => true,
                        'positonY' => 'top',
                        'positonX' => 'right'
                    ]
                ]);
             
    
            //return $this->redirect(['site' => $model->id]);
            return $this->redirect(array('site/index2'));
        }
        
        return $this->render('create3', [
                    'model' => $model,
        ]);

         } else {
          throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
          } 
    }

    /**
     * Updates an existing Projetos model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $model->save(false);
            Yii::$app->getSession()->setFlash('success', [
                'type' => 'success',
                'duration' => 10000,
                'message' => 'Projeto: ' . $model->titulo . ' Editado Com Sucesso.',
                'title' => '',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);
            return $this->redirect(['view', 'id' => $model->id]);
        }


        return $this->render('update', [
                    'model' => $model,
        ]);
    }

    public function actionUpdate1($id) {
        $model = $this->findModel($id);
        //$model->justificativa = null;
        if ((Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor'))) {
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                $model->isAtivo = '2';
                $model->save(false);
                Yii::$app->getSession()->setFlash('success', [
                    'type' => 'success',
                    'duration' => 10000,
                    'message' => 'Justiicativa Editada Com Sucesso.',
                    'title' => '',
                    'positonY' => 'top',
                    'positonX' => 'right'
                ]);
                //$this->redirect(array("reprovados"));
            } else {
                return $this->render('justific', [
                            'model' => $model,
                ]);
            }
            $this->redirect(array("reprovados"));
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    public function actionUpdate2($id) {
        $model = $this->findModel($id);
        if (Yii::$app->user->can('discente')) {
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                $model->isAndamento = '1';
                $model->editaAluno = '1';
                $model->save(false);
                Yii::$app->getSession()->setFlash('success', [
                    'type' => 'success',
                    'duration' => 10000,
                    'message' => 'Relatório Editado Com Sucesso.',
                    'title' => '',
                    'positonY' => 'top',
                    'positonX' => 'right'
                ]);
                //$this->redirect(array("reprovados"));
            } else {
                return $this->render('create2', [
                            'model' => $model,
                ]);
            }
            $this->redirect(array("index2"));
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    public function actionUpdate3($id) {
        $model = $this->findModel($id);
        if (Yii::$app->user->can('coordenador')) {
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                $model->isAndamento = '1';
                $model->editaCoordenador = '1';
                $model->save(false);
                Yii::$app->getSession()->setFlash('success', [
                    'type' => 'success',
                    'duration' => 10000,
                    'message' => 'Relatório Editado Com Sucesso.',
                    'title' => '',
                    'positonY' => 'top',
                    'positonX' => 'right'
                ]);
                //$this->redirect(array("reprovados"));
            } else {
                return $this->render('create3', [
                            'model' => $model,
                ]);
            }
            $this->redirect(array("index3"));
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    /**
     * Deletes an existing Projetos model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id) {
        if (Yii::$app->user->can('coordenador')) {
            $this->findModel($id)->delete();
            Yii::$app->getSession()->setFlash('danger', [
                'type' => 'danger',
                'duration' => 10000,
                'message' => 'Projeto Excluído Com Sucesso.',
                'title' => '',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);

            return $this->redirect(['index']);
        } else {
            throw new NotFoundHttpException('Acesso negado.');
        }
    }

    /**
     * Finds the Projetos model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Projetos the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = Projetos::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }

    public function actionAprovar($id) {
        if (Yii::$app->user->can('coordenador')) {
            $model = $this->findModel($id);
            $model->isAtivo = '1'; //aprovado
            $model->save(false);
            Yii::$app->getSession()->setFlash('success', [
                'type' => 'success',
                'duration' => 10000,
                'message' => 'Cadastro Aprovado Com Sucesso.',
                'title' => '',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);

            $this->redirect(array("projetos/projeto"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionReprovar($id) {
        if (Yii::$app->user->can('coordenador')) {
            $model = $this->findModel($id);
            $model->isAtivo = '2'; //reprovado  
            $model->save(false);
            $this->redirect(array("projetos/projeto"));
            //$this->redirect(array("projetos/reprovados"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }
        public function actionEditardiscente($id) {
        if (Yii::$app->user->can('discente')) {
            $model = $this->findModel($id);
            $model->isAndamento = '1';
            $model->editaDiscente = '1'; 
            $model->save(false);
            $this->redirect(array("projetos/index2"));
            //$this->redirect(array("projetos/reprovados"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    public function actionEditarcoordenador($id) {
        if (Yii::$app->user->can('coordenador')) {
            $model = $this->findModel($id);
            $model->isAndamento = '2';
            $model->editaCoordenador = '2'; 
            $model->save(false);
            $this->redirect(array("projetos/index2"));
            //$this->redirect(array("projetos/reprovados"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionListagem() {
        if (Yii::$app->user->can('createPost')) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()->where(['id' => Yii::$app->user->id]),
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);

            return $this->render('listagem', [
                        'dataProvider' => $dataProvider,
                        'searchModel' => $searchModel,
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta ação.');
        }
    }

    public function actionSolicitacao() {
        if (Yii::$app->user->can('servidor') || (Yii::$app->user->can('coordenador'))) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()->where(['isAtivo' => 0]),
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);

            return $this->render('solicitacao', [
                        'dataProvider' => $dataProvider,
                        'searchModel' => $searchModel,
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para realizar esta ação.');
        }
    }

    public function actionProjeto() {
        $searchModel = new ProjetosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider = new ActiveDataProvider([
            'query' => Projetos::find()->where(['OR', ['isAtivo' => 1], ['isAtivo' => 2]]),
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);

        return $this->render('projeto', [
                    'dataProvider' => $dataProvider,
                    'searchModel' => $searchModel,
        ]);
    }

    public function actionAprovados() {
        if (Yii::$app->user->can('coordenador')) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()->where(['isAtivo' => 1]),
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);
            return $this->render('aprovados', [
                        'dataProvider' => $dataProvider,
                        'searchModel' => $searchModel,
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionReprovados() {
        if (Yii::$app->user->can('coordenador')) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()->where(['isAtivo' => 2]),
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);

            return $this->render('reprovados', [
                        'dataProvider' => $dataProvider,
                        'searchModel' => $searchModel,
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta ação.');
        }
    }

}
