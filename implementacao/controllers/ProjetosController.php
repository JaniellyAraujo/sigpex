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

use app\models\ProjetosUsuariosForm;
use app\models\ProjetoUsuario;
use Yii;
use app\models\Projetos;
use app\models\User;
use app\models\ProjetosSearch;
use yii\web\Controller;
use app\models\ProjetoEquipe;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\ActiveDataProvider;
use kartik\mpdf\Pdf;
use yii\web\ForbiddenHttpException;

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
    public function actionGerar() {                            //FUNÇÃO GERAR PDF
        if (Yii::$app->user->can('coordenador')) {             //PERMISSÃO
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            //$src = yii\helpers\Url::to('@web/img/arte.png');
            
            $content = $this->renderPartial('geral', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel,
            ]);

            $pdf = new Pdf([//CONFIGURAÇÕES DE IMPRESSÃO
                'format' => Pdf::FORMAT_A4,
                'orientation' => Pdf::ORIENT_PORTRAIT,
                'destination' => Pdf::DEST_BROWSER,
                'content' => $content,
                'cssFile' => '@vendor/kartik-v/yii2-mpdf/assets/kv-mpdf-bootstrap.min.css',
                'cssInline' => '.kv-heading-1{font-size:18px}',
                'options' => ['title' => 'Relatório'],
               // 'content' => 'Printed @ {DATE j-m-Y}',
                'methods' => [
                    //'SetHeader' => ['SigPex'],
                    'SetFooter' => ['{PAGENO}'],
                    'SetFooter' => ['<p style="text-align: center;font-size: 8px;">'
                        . 'Documento emitido pelo SigPex. '
                        . 'Todos os Direitos Reservados © {DATE j-m-Y}</p>'],
                    
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

    /**
     * Finds the Projeto model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Prato the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = Projetos::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('A página requerida não existe.');
    }
    
    /**
     * Displays a single Projetos model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        if ((Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor')|| (Yii::$app->user->can('discente')))) {


            $model = $this->findModel($id);
            $participanteModel = new ProjetoEquipe();
            $participanteModel->projeto_id = $model->id;

            return $this->render('view', [
                'model' => $this->findModel($id),
                'participanteModel' => $participanteModel,
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    
        public function actionViewm($id) {
        return $this->render('viewm', [
                    'model' => $this->findModel($id),
        ]);
    }
        public function actionViewinfo($id) {
        //if ((Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor'))) {


            $model = $this->findModel($id);
            $participanteModel = new ProjetoEquipe();
            $participanteModel->projeto_id = $model->id;

            return $this->render('viewinfo', [
                        'model' => $this->findModel($id),
                        'participanteModel' => $participanteModel,
            ]);
        //} else {
            //throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        //}
    }
    
    public function actionViewinfotipo($id) {
        //if ((Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor'))) {


            $model = $this->findModel($id);
            $participanteModel = new ProjetoEquipe();
            $participanteModel->projeto_id = $model->id;

            return $this->render('viewinfotipo', [
                        'model' => $this->findModel($id),
                        'participanteModel' => $participanteModel,
            ]);
        //} else {
            //throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        //}
    }
    
    public function actionViewinfouser($id) {
        //if ((Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor'))) {


            $model = $this->findModel($id);
            $participanteModel = new ProjetoEquipe();
            $participanteModel->projeto_id = $model->id;

            return $this->render('viewinfouser', [
                        'model' => $this->findModel($id),
                        'participanteModel' => $participanteModel,
            ]);
        //} else {
            //throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        //}
    }

    public function actionVisualizar($id) {
        $model = $this->findModel($id);
        if (($model->id == Yii::$app->user->identity->id) || (Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor'))) {
            return $this->render('visualizar', [
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
    
        public function actionCreaterel($id) {
        $model = $this->findModel($id);
        //if ($model->load(Yii::$app->request->post()) && $model->save()) {
       // $model->save(false);
              //  return $this->redirect(array('projetos/indexm'));
            //}
        return $this->render('_formm', [
                    'model' => $model,
        ]);
    }
    
    /**
     * Creates a new Projetos model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        if ((Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor'))) {
            $model = new Projetos();
            $model->isControle = '0';
            $model->isTipo = '0';
            $model->justificativa = null;
            $model->isAtivo = '0'; //SALVA COMO RASCUNHO
            // $model::participanteSession ();
            //$model->isStatus = '0';
            //$model->justificativa = 'Nenhum';
            //$model->created_by = Yii::$app->getid->getId();
		//$model->created_at= new \yii\db\Expression('NOW()');
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                
                $usuarios = Yii::$app->request->post('ProjetosUsuariosForm');

                foreach ($usuarios as $usuario) {
                    $user = new ProjetosUsuariosForm();
                    $user->usuario = $usuario['usuario'];
                    $user->tipo = $usuario['tipo'];
                    $user->projeto = $model->primaryKey;

                    $user->create();
                }

                 if ($model->modalidade === 'Fomento Interno') {
                  $model->isControle = '1';
                  $model->save(false);
                  } else if($model->modalidade === 'Fomento Externo'){
                  $model->isControle = '2';
                  $model->save(false);
                  } else if($model->modalidade === 'Voluntário'){
                  $model->isControle = '3';
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


                if (Yii::$app->user->identity->role == 2) {
                    $model->isAtivo = '5'; //SALVA AUTOMATICAMENTE
                    $model->save(false);
                    Yii::$app->getSession()->setFlash('success', [
                        'type' => 'success',
                        'icon' => 'glyphicon glyphicon-ok-sign',
                        'showSeparator' => true,
                        'duration' => 10000,
                        'message' => 'Cadastro Realizado com Sucesso!',
                        'title' => '',
                        'pluginOptions' => [
                            'showProgressbar' => true,
                            'positonY' => 'top',
                            'positonX' => 'right'
                        ]
                    ]);
                } else {

                    Yii::$app->getSession()->setFlash('success', [
                        'type' => 'success',
                        'icon' => 'glyphicon glyphicon-ok-sign',
                        'showSeparator' => true,
                        'duration' => 10000,
                        'message' => 'Cadastro salvo como rascunho.  ',
                        'title' => '',
                        'pluginOptions' => [
                            'showProgressbar' => true,
                            'positonY' => 'top',
                            'positonX' => 'right'
                        ]
                    ]);
                    return $this->redirect(array('projetos/index'));
                }

                return $this->redirect(array('projetos/aprovados'));
            }



            return $this->render('create', [
                'model' => $model,
                'modelUsuarios' => [new ProjetosUsuariosForm()]
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

        //$model->carregaParticipantes();
        $usuarios = ProjetoUsuario::findAll(['projeto_id' => $id]);
        if ($usuarios) {
            foreach ($usuarios as $usuario) {
                $modelUsuarios[] = new ProjetosUsuariosForm($usuario);
            }
        } else {
            $modelUsuarios = [new ProjetosUsuariosForm()];
        }

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $model->save(false);

            $usuarios = Yii::$app->request->post('ProjetosUsuariosForm');

            ProjetoUsuario::deleteAll(['projeto_id' => $id]);
            foreach ($usuarios as $usuario) {
                $user = new ProjetosUsuariosForm();
                $user->usuario = $usuario['usuario'];
                $user->tipo = $usuario['tipo'];
                $user->projeto = $id;

                $user->create();
            }


            Yii::$app->getSession()->setFlash('success', [
                'type' => 'success',
                'duration' => 10000,
                'message' => 'Projeto: ' . $model->titulo . ' Editado Com Sucesso.',
                'title' => '',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);
            return $this->redirect(['projetos/index']);
        }
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            if ($model->modalidade === 'Fomento Interno') {
                  $model->isControle = '1';
                  $model->save(false);
                  } else if($model->modalidade === 'Fomento Externo'){
                  $model->isControle = '2';
                  $model->save(false);
                  } else if($model->modalidade === 'Voluntário'){
                  $model->isControle = '3';
                  $model->save(false);
                  }
            $model->save(false);

        }

        return $this->render('update', [
            'model' => $model,
            'modelUsuarios' => $modelUsuarios
        ]);
    }

    public function actionUpdate1($id) {
        $model = $this->findModel($id);
        //$model->justificativa = null;
        if ((Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor'))) {
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                $model->isAtivo = '3'; //SOLICITADO MODIFICAÇÃO
                $model->save(false);
                Yii::$app->getSession()->setFlash('success', [
                    'type' => 'success',
                    'duration' => 10000,
                    'message' => 'Justiicativa Editada Com Sucesso.',
                    'title' => '',
                    'positonY' => 'top',
                    'positonX' => 'right'
                ]);
            } else {
                return $this->render('justific', [
                            'model' => $model,
                ]);
            }
            $this->redirect(array("solicitacao"));
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    
        public function actionUpdate2($id) {
        $model = $this->findModel($id);
        
        $usuarios = ProjetoUsuario::findAll(['projeto_id' => $id]);
        if ($usuarios) {
            foreach ($usuarios as $usuario) {
                $modelUsuarios[] = new ProjetosUsuariosForm($usuario);
            }
        } else {
            $modelUsuarios = [new ProjetosUsuariosForm()];
        }
        
        if (Yii::$app->user->can('servidor')) {
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                $usuarios = Yii::$app->request->post('ProjetosUsuariosForm');

                ProjetoUsuario::deleteAll(['projeto_id' => $id]);
                foreach ($usuarios as $usuario) {
                    $user = new ProjetosUsuariosForm();
                    $user->usuario = $usuario['usuario'];
                    $user->tipo = $usuario['tipo'];
                    $user->projeto = $id;

                    $user->create();
                }
                
                $model->isAtivo = '4'; // MODIFICADO
                $model->save(false);
                Yii::$app->getSession()->setFlash('success', [
                    'type' => 'success',
                    'duration' => 10000,
                    'message' => 'Justiicativa Editada Com Sucesso.',
                    'title' => '',
                    'positonY' => 'top',
                    'positonX' => 'right'
                ]);
            } else {
                return $this->render('update2', [
                    'model' => $model,
                    'modelUsuarios' => $modelUsuarios
                ]);
            }
            $this->redirect(array("index"));
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
        if (Yii::$app->user->can('servidor') || (Yii::$app->user->can('coordenador'))) {
            $this->findModel($id)->delete();
            Yii::$app->getSession()->setFlash('danger', [
                'type' => 'danger',
                'duration' => 10000,
                'message' => 'Projeto Excluído Com Sucesso.',
                'title' => '',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);

            return $this->redirect(['projetos/encerrados']);
        } else {
            throw new NotFoundHttpException('Acesso negado.');
        }
    }

    public function actionAprovar($id) {
        if (Yii::$app->user->can('coordenador')) {
            $model = $this->findModel($id);
            $model->justificativa = null;
            $model->isAtivo = '5'; //APROVADO
            $model->save(false);
            Yii::$app->getSession()->setFlash('success', [
                'type' => 'success',
                'duration' => 10000,
                'message' => 'Cadastro Aprovado Com Sucesso.',
                'title' => '',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);

            $this->redirect(array("projetos/solicitacao"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionModificados($id) {
        if (Yii::$app->user->can('coordenador')) {
            
            $model = $this->findModel($id);
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $model->isAtivo = '3'; //SOLICITADO MODIFICAÇÃO
            $model->save(false);
            $this->redirect(array("projetos/solicitacao"));
            //$this->redirect(array("projetos/reprovados"));
        }} else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    
    public function actionEncerrar($id) {
        if (Yii::$app->user->can('servidor')) {
            $model = $this->findModel($id);
            $model->isAtivo = '6'; //ENCERRADO
            $model->save(false);
            $this->redirect(array("projetos/index"));
            //$this->redirect(array("projetos/reprovados"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    
        public function actionArquivar($id) {
        if (Yii::$app->user->can('coordenador')) {
            $model = $this->findModel($id);
            $model->isAtivo = '7'; //ARQUIVADO
            $model->save(false);
            $this->redirect(array("projetos/aprovados"));
            //$this->redirect(array("projetos/reprovados"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    
        /*public function actionReitoria($id) {
        if (Yii::$app->user->can('coordenador')) {
            $model = $this->findModel($id);
            $model->justificativa = null;
            $model->isAtivo = '2'; //ENVIADO REITORIA
            $model->save(false);
            $this->redirect(array("projetos/solicitacao"));
            //$this->redirect(array("projetos/reprovados"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }*/

    public function actionSubmeter($id) {
        if ((Yii::$app->user->can('coordenador')) || (Yii::$app->user->can('servidor'))) {
            $model = $this->findModel($id);
            $model->isAtivo = '1'; //EM ANÁLISE
            $model->save(false);
            Yii::$app->getSession()->setFlash('success', [
                'type' => 'success',
                'duration' => 10000,
                'message' => 'Cadastro Enviado Com Sucesso.',
                'title' => '',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);
            $this->redirect(array("projetos/index"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    // * @param integer $id
    public function actionIndex()
    {
        if (Yii::$app->user->identity->role == 3 || Yii::$app->user->identity->role == 4) {
            $searchModel = new ProjetosSearch();

            $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()
                    ->from(['PROJETO' => Projetos::tableName()])
                    ->innerJoin(['PROJETO_USUARIO' => ProjetoUsuario::tableName()], 'PROJETO_USUARIO.projeto_id = PROJETO.id')
                    ->where(['OR', ['isAtivo' => 0], ['isAtivo' => 1], ['isAtivo' => 3], ['isAtivo' => 4], ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]]),
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);

            if (Yii::$app->user->identity->role == 3 || Yii::$app->user->identity->role == 4) {
                $dataProvider->query
                    ->andWhere(['PROJETO_USUARIO.usuario_id' => \Yii::$app->user->identity->getId()]);
            }

            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    
        // * @param integer $id
    public function actionIndexm()
    {
        if (Yii::$app->user->identity->role == 2 || Yii::$app->user->identity->role == 4) {
        $searchModel = new ProjetosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('indexm', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionRascunho() {
        if (Yii::$app->user->can('createPost')) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()->where(['isAtivo' => 0]), //RASCUNHO
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);

            return $this->render('rascunho', [
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
    'query' => Projetos::find()->where(['OR',['isAtivo' => 1],['isAtivo' => 4],['isAtivo' => 3]]), // EM ANALISE
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
        $searchModel = new \app\models\ProjetosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider = new ActiveDataProvider([
            'query' => Projetos::find()->where('id =' . $id)->with('user')->with('projetoUsuario'),
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);

        return $this->render('projeto', [
                    'dataProvider' => $dataProvider,
                    'searchModel' => $searchModel,
        ]);
    }
    
     public function actionInfoprojeto() {
        $searchModel = new \app\models\ProjetosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider = new ActiveDataProvider([
            //'query' => \app\models\ProjetoUsuario::find()->where(['usuario_id' => Yii::$app->user->identity->id]),
            'query' => Projetos::find()->where(['isAtivo' => 5]),
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);

        return $this->render('infoprojeto', [
                    'dataProvider' => $dataProvider,
                    'searchModel' => $searchModel,
        ]);
    }
    
    public function actionInfoprojetotipo() {
        $searchModel = new \app\models\ProjetosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider = new ActiveDataProvider([
            //'query' => \app\models\ProjetoUsuario::find()->where(['usuario_id' => Yii::$app->user->identity->id]),
            'query' => Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6],['isAtivo' => 7]]),
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);

        return $this->render('infoprojetotipo', [
                    'dataProvider' => $dataProvider,
                    'searchModel' => $searchModel,
        ]);
    }
    
     public function actionInfoprojetouser() {
        $searchModel = new \app\models\ProjetosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider = new ActiveDataProvider([
            //'query' => \app\models\ProjetoUsuario::find()->where(['usuario_id' => Yii::$app->user->identity->id]),
            'query' => User::find()->where(['OR', ['role' => 3], ['role' => 4]]),
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);

        return $this->render('infoprojetouser', [
                    'dataProvider' => $dataProvider,
                    'searchModel' => $searchModel,
        ]);
    }

    public function actionModificar() {
        $searchModel = new ProjetosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider = new ActiveDataProvider([
            'query' => Projetos::find()->where(['OR', ['isAtivo' => 3], ['isAtivo' => 4]]), // SOLICITADO MODIFICAÇÃO--MODIFICADO
            'pagination' => [
                'pageSize' => 10,
            ],
        ]);

        return $this->render('modificar', [
                    'dataProvider' => $dataProvider,
                    'searchModel' => $searchModel,
        ]);
    }
    
    public function actionAprovados() {
        if (Yii::$app->user->can('coordenador')) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6]]), // APROVADO E ENCERRADO
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
    
       /* public function actionReitorias() {
        if (Yii::$app->user->can('coordenador')) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()->where(['isAtivo' => 2]), // APROVADOS
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);
            return $this->render('reitoria', [
                        'dataProvider' => $dataProvider,
                        'searchModel' => $searchModel,
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }*/
    public function actionEncerrados() {
        if (Yii::$app->user->can('coordenador')) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()->where(['isAtivo' => 6]), // ENCERRADOS
                'pagination' => [
                    'pageSize' => 10,
                ],
            ]);

            return $this->render('encerrados', [
                        'dataProvider' => $dataProvider,
                        'searchModel' => $searchModel,
            ]);
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta ação.');
        }
    }
    
        public function actionArquivados() {
        if (Yii::$app->user->can('coordenador')) {
            $searchModel = new ProjetosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            $dataProvider = new ActiveDataProvider([
                'query' => Projetos::find()->where(['isAtivo' => 7]), // ARQUIVADOS
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

}
