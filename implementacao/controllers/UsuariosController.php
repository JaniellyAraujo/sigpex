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
use app\models\User;
use app\models\UsuariosSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\AuthAssignment;

/**
 * UsuariosController implements the CRUD actions for Usuarios model.
 */
class UsuariosController extends Controller {

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


        
        /*  Get dependent dropdown for  state wise City List.   city\_form.php  */
	public function actionGetcidade($id){
		$rows = \app\models\Cidades::find()->where(['estados_id' => $id])->all();	 
		echo "<option value=''>".Yii::t('app', '--- Selecione a Cidade ---')."</option>";	 
		if(count($rows)>0){
		    foreach($rows as $row){
		        echo "<option value='$row->id'>$row->nome</option>";
		    }
		}
		else{
		    echo "";
		}
 
    	}
    public function actionGetorgcidade($id)
	{
		$rows = \app\models\Cidades::find()->where(['estados_id' => $id])->ALL();	 
		echo Html::tag('option', Html::encode(Yii::t('app', '--- Selecione a Cidade ---')), ['value'=>'']); 	 
		    foreach($rows as $row)
			echo Html::tag('option', Html::encode($row->nome), ['value'=>$row->id]); 
 
    	}
    public function actionIndex() {
        if (Yii::$app->user->identity->role == 1 || Yii::$app->user->identity->role == 2 || Yii::$app->user->identity->role == 3 || Yii::$app->user->identity->role == 4) {
           // $model = new app\models\User();
            $searchModel = new UsuariosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
           
             if (Yii::$app->user->identity->role != 1) {
                $dataProvider->query
                    ->andWhere(['USUARIOS.id' => \Yii::$app->user->identity->getId()]);
            }

            return $this->render('index', [
                        'searchModel' => $searchModel,
                        'dataProvider' => $dataProvider,
                        //'model'=>$model,
            ]);
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    
    public function actionIndex0($id) {
        if (Yii::$app->user->identity->role == 2 || Yii::$app->user->identity->role == 3 || Yii::$app->user->identity->role == 4) {
            $searchModel = new UsuariosSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
             
            
                $dataProvider->query
                    ->andWhere(['USUARIOS.id' => \Yii::$app->user->identity->getId()]);
            
            $model = $this->findModel($id);
        $permissao = $model->id;
        
            if (($permissao == Yii::$app->user->id)||(Yii::$app->user->can('admin'))){
                return $this->render('index0', [
                        'model' => $this->findModel($id),
                        'dataProvider' => $dataProvider,
                    
                ]);
           
        }

            
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    /**
     * Displays a single Usuarios model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        $permissao = $model->id;
        
            if (($permissao == Yii::$app->user->id)||(Yii::$app->user->can('admin'))){
                return $this->renderAjax('view', [
                    'model' => $this->findModel($id),
                ]);
        } else {
            throw new NotAcceptableHttpException('Você não tem permissão para acessar esta página.');
        }
    }
    

    /**
     * Creates a new Usuarios model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {

        $model = new User;
        $model->isAtivo = '0';
        $model->codVerificacao = '0';

        if ((Yii::$app->user->isGuest) || (Yii::$app->user->identity->role == 1)) {
            if (isset($_POST['User'])) {
                $model->attributes = $_POST['User'];

                if ($model->role === '1') {
                    $model->role = 1; //admin
                } else if ($model->role === '2') {
                    $model->role = 2; //coordenador
                } else if ($model->role === '3') {
                    $model->role = 3; //servidor
                } else if ($model->role === '4') {
                    $model->role = 4; //discente
                }

                if ($model->validate()) {
                    $hash = Yii::$app->security->generatePasswordHash($model->password_hash);
                    $model->password_hash = $hash;

                    if ((!Yii::$app->user->isGuest) && (Yii::$app->user->identity->role == 1)) {
                        $model->isAtivo = '1';
                        Yii::$app->getSession()->setFlash('success', [
                            'type' => 'success',
                            'icon' => 'glyphicon glyphicon-ok-sign',
                            'showSeparator' => true,
                            'duration' => 10000,
                            'message' => 'Cadastro Realizado com Sucesso.',
                            'title' => '',
                            'pluginOptions' => [
                                'showProgressbar' => true,
                                'positonY' => 'top',
                                'positonX' => 'right'
                            ]
                        ]);
                    }

                    $model->save(false);

                    if (Yii::$app->user->isGuest) {
                        Yii::$app->getSession()->setFlash('success', [
                            'type' => 'success',
                            'icon' => 'glyphicon glyphicon-ok-sign',
                            'showSeparator' => true,
                            'duration' => 10000,
                            'message' => 'Cadastro Realizado com Sucesso.  '
                            . 'Aguarde Autorização do Administrador.',
                            'title' => '',
                            'pluginOptions' => [
                                'showProgressbar' => true,
                                'positonY' => 'top',
                                'positonX' => 'right'
                            ]
                        ]);
                        return $this->redirect(array('site/index'));
                    }
                    return $this->redirect(array('usuarios/index'));
                }
            }
            return $this->render('create', [
                        'model' => $model,
            ]);
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }

        /**
     * Creates a new Usuarios model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreateModal() {
        $model = new User();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->renderAjax('create', [
            'model' => $model,
        ]);
    }
    
    /**
     * Updates an existing Usuarios model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id) {
        if (Yii::$app->user->identity->role == 1 || Yii::$app->user->identity->role == 2 || Yii::$app->user->identity->role == 3 || Yii::$app->user->identity->role == 4) {
            $model = $this->findModel($id);
            //$model->password_hash = $model->password_hash;
            
            
              $hash = $model->password_hash;
              $model->password_hash_repeat = $model->password_hash;
            if (isset($_POST['User'])) {
                $model->attributes = $_POST['User'];

                if (Yii::$app->user->identity->role == 1 ) {
                if ($model->role === '1') {
                    $model->role = 1; //admin
                    //$model->role = "Administrador";
                } else if ($model->role === '2') {
                    $model->role = 2; //coordenador
                } else if ($model->role === '3') {
                    $model->role = 3; //servidor
                } else if ($model->role === '4') {
                    $model->role = 4; //discente
                }}

                if ($model->validate()) {
                    if ($hash !=$model->password_hash){
                      $hash = Yii::$app->security->generatePasswordHash($model->password_hash);
                    $model->password_hash = $hash;  
                    }
                    

                    $model->save(false);
                    Yii::$app->getSession()->setFlash('success', [
                        'type' => 'success',
                        'duration' => 10000,
                        'message' => 'Usuário: ' . $model->nome . ' Editado Com Sucesso.',
                        'title' => '',
                        'positonY' => 'top',
                        'positonX' => 'right'
                    ]);
                    return $this->redirect(array('index'));
                }
            }

            return $this->render('update', [
                        'model' => $model,
            ]);
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }    
    /*
    public function actionUpdate0($id) {
        if (Yii::$app->user->identity->role == 1) {
            $model = $this->findModel($id);
           
            if (isset($_POST['User'])) {
                $model->attributes = $_POST['User'];


                if ($model->role === '1') {
                    $model->role = 1; //admin
                    //$model->role = "Administrador";
                } else if ($model->role === '2') {
                    $model->role = 2; //coordenador
                } else if ($model->role === '3') {
                    $model->role = 3; //servidor
                } else if ($model->role === '4') {
                    $model->role = 4; //discente
                }

                if ($model->validate()) {
                                   
                    $model->save(false);
                    Yii::$app->getSession()->setFlash('success', [
                        'type' => 'success',
                        'duration' => 10000,
                        'message' => 'Usuário: ' . $model->nome . ' Editado Com Sucesso.',
                        'title' => '',
                        'positonY' => 'top',
                        'positonX' => 'right'
                    ]);
                    return $this->redirect(array('index'));
                }
            }

            return $this->render('update', [
                        'model' => $model,
            ]);
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }*/
    
     public function actionAtualiza($id)
    {
        $model = $this->findModel($id);
        $permissao = $model->id;
        
        if ($permissao == Yii::$app->user->id){
            $model->password_hash= null;

            if(isset($_POST['User']))
            {
                $model->attributes=$_POST['User'];
                
                if ($model->role === '1') {
                    $model->role = 1; //admin
                    //$model->role = "Administrador";
                } else if ($model->role === '2') {
                    $model->role = 2; //coordenador
                } else if ($model->role === '3') {
                    $model->role = 3; //servidor
                } else if ($model->role === '4') {
                    $model->role = 4; //discente
                }
                if($model->validate())
                {
                                     

                    $hash = Yii::$app->security->generatePasswordHash($model->password_hash);
                    $model->password_hash = $hash;

                    $model->save(false);    

                    Yii::$app->getSession()->setFlash('success', [
                                                    'type' => 'success',
                                                    'duration' => 10000,
                                                    'message' => 'Dados Alterados Com Sucesso.',
                                                    'title' => '',
                                                    'positonY' => 'top',
                                                    'positonX' => 'left'
                                                    ]);               
                    return $this->redirect(array('view','id'=>$model->id));
                }
            } 
            return $this->render('form', [
                'model' => $model,
            ]);    
        } else {
            throw new NotAcceptableHttpException('Você não tem permissão para acessar esta página.');
        }
      
    }
     public function actionAtualizar($id)
    {
        $model = $this->findModel($id);           
       
        return $this->render('form', [
            'model' => $model,
        ]); 
    }    

    /**
     * Deletes an existing Usuarios model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id) {
        if (Yii::$app->user->identity->role == 1) {
            $this->findModel($id)->delete();
            Yii::$app->getSession()->setFlash('danger', [
                'type' => 'danger',
                'duration' => 10000,
                'message' => 'Usuário Excluído Com Sucesso.',
                'title' => '',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);
            return $this->redirect(['index']);
        } else {
            throw new NotFoundHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    /**
     * Finds the Usuarios model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Usuarios the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('A página não existe.');
    }

    public function actionAtivar($id) {
        if (Yii::$app->user->identity->role == 1) {
            $model = $this->findModel($id);
            $ativo = $model->isAtivo;

            if ($ativo == '0') {
                if ($model->role == 1) {
                    $auth = Yii::$app->authManager;
                    $adminRole = $auth->getRole('admin');
                    $auth->assign($adminRole, $model->getId());
                    $model->save(false);
                } else if ($model->role == 2) {
                    $auth = Yii::$app->authManager;
                    $coordenadorRole = $auth->getRole('coordenador');
                    $auth->assign($coordenadorRole, $model->getId());
                    $model->save(false);
                } else if ($model->role == 3) {
                    $auth = Yii::$app->authManager;
                    $servidorRole = $auth->getRole('servidor');
                    $auth->assign($servidorRole, $model->getId());
                    $model->save(false);
                } else if ($model->role == 4) {
                    $auth = Yii::$app->authManager;
                    $discenteRole = $auth->getRole('discente');
                    $auth->assign($discenteRole, $model->getId());
                    $model->save(false);
                }
                $model->isAtivo = '1';
                $model->save(false);
                Yii::$app->getSession()->setFlash('success', [
                    'type' => 'success',
                    'duration' => 10000,
                    'message' => 'Usuário: ' . $model->nome . ' Ativado Com Sucesso.',
                    'title' => '',
                    'positonY' => 'top',
                    'positonX' => 'right'
                ]);
            }
            $model->isAtivo = '1';
            $model->save(false);

            $this->redirect(array("usuarios/index"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para ativar usuários.');
        }
    }

    public function actionDesativar($id) {
        if (Yii::$app->user->identity->role == 1) {
            $model = $this->findModel($id);
            if ($model->role != 1) {
            
            $model->isAtivo = '2';
            $model->save(false);

            $assignment = AuthAssignment::find()->where(['user_id' => $id])->all();
            foreach ($assignment as $assignments) {
                $assignments->delete($id);
            }
            Yii::$app->getSession()->setFlash('danger', [
                'type' => 'danger',
                'duration' => 10000,
                'message' => 'Usuário: ' . $model->nome . ' Desativado Com Sucesso.',
                'title' => '',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);
            
            } else {
            Yii::$app->getSession()->setFlash('warning', [
                'type' => 'warning',
                'duration' => 10000,
                'message' => 'Não permitido desativar usuário ' . $model->nome,
                //'message' => 'Não Permitido!',
                'title' => 'Ação Negada.',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);
        }$this->redirect(array("usuarios/index"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para desativar usuários.');
        }
    }

    public function actionReativar($id) {
        if (Yii::$app->user->identity->role == 1) {
            $model = $this->findModel($id);
            $ativo = $model->isAtivo;

            if ($ativo == '2') {
                if ($model->role == 1) {
                    $auth = Yii::$app->authManager;
                    $adminRole = $auth->getRole('admin');
                    $auth->assign($adminRole, $model->getId());
                    $model->save(false);
                } else if ($model->role == 2) {
                    $auth = Yii::$app->authManager;
                    $coordenadorRole = $auth->getRole('coordenador');
                    $auth->assign($coordenadorRole, $model->getId());
                    $model->save(false);
                } else if ($model->role == 3) {
                    $auth = Yii::$app->authManager;
                    $servidorRole = $auth->getRole('servidor');
                    $auth->assign($servidorRole, $model->getId());
                    $model->save(false);
                } else if ($model->role == 4) {
                    $auth = Yii::$app->authManager;
                    $discenteRole = $auth->getRole('discente');
                    $auth->assign($discenteRole, $model->getId());
                    $model->save(false);
                }
                $model->isAtivo = '1';
                $model->save(false);
                Yii::$app->getSession()->setFlash('success', [
                    'type' => 'success',
                    'duration' => 10000,
                    'message' => 'Usuário: ' . $model->nome . ' Reativado Com Sucesso.',
                    'title' => '',
                    'positonY' => 'top',
                    'positonX' => 'right'
                ]);
            }
            $model->isAtivo = '1';
            $model->save(false);

            $this->redirect(array("usuarios/index"));
        } else {
            throw new NotFoundHttpException('Você não tem permissão para desativar usuários.');
        }
    }

}
