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
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\User;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use app\models\PasswordResetRequestForm;
use app\models\ResetPasswordForm;

class SiteController extends Controller {

    /**
     * @inheritdoc
     */
    public function behaviors() {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'admin', 'coordenador', 'servidor', 'discente'],
                'rules' => [
                        [
                        'actions' => ['logout', 'admin'],
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback' => function ($rule, $action) {
                            return User::isUserAdmin(Yii::$app->user->identity->id);
                        },
                    ],
                        [
                        'actions' => ['logout', 'coordenador'],
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback' => function ($rule, $action) {
                            return User::isUserCoordenador(Yii::$app->user->identity->id);
                        },
                    ],
                        [
                        'actions' => ['logout', 'servidor'],
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback' => function ($rule, $action) {
                            return User::isUserServidor(Yii::$app->user->identity->id);
                        },
                    ],
                        [
                        'actions' => ['logout', 'discente'],
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback' => function ($rule, $action) {
                            return User::isUserDiscente(Yii::$app->user->identity->id);
                        },
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions() {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionAdmin() {
        return $this->render("admin");
    }

    public function actionCoordenador() {
        return $this->render("coordenador");
    }

    public function actionServidor() {
        return $this->render("servidor");
    }

    public function actionDiscente() {
        return $this->render("discente");
    }

    public function actionEnviar_email() {
        return $this->render("enviar_email");
    }

    public function actionCadastro() {
        $model = new User();

        return $this->render('cadastro', [
                    'model' => $model,
        ]);
    }

    public function actionLogin() {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            //if (!\Yii::$app->user->isGuest) {
            //$identifica=Yii::$app->user->getId();
            $session = Yii::$app->session;
            if ($session->isActive) {
                // open a session
                $session->open();
            }
            Yii::$app->getSession()->setFlash('info', [
                'type' => 'info',
                'duration' => 10000,
                'message' => 'Bem-vindo(a) ao SigPex!',
                'title' => '',
                'positonY' => 'top',
                'positonX' => 'right'
            ]);
            if (User::isUserAdmin(Yii::$app->user->identity->id)) {
                return $this->redirect(["usuarios/index"]);  //pagína que redireciona ao logar
            } else if (User::isUserCoordenador(Yii::$app->user->identity->id)) {
                return $this->redirect(["projetos/solicitacao"]);
            } else if (User::isUserServidor(Yii::$app->user->identity->id)) {
                return $this->redirect(["projetos/index"]);
            } else if (User::isUserDiscente(Yii::$app->user->identity->id)) {
                return $this->redirect(["projetos/index"]);
            }
            if (!Yii::$app->user->isGuest) {
                return $this->render('index');
            }
            return $this->goBack();
        }
        return $this->render('login', [
                    'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout() {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    public function beforeAction($action) {
        if (parent::beforeAction($action)) {
            // change layout for error action
            if ($action->id == 'login')
                $this->layout = 'login';
            return true;
        } else {
            return false;
        }
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex() {
        /*
          $auth = Yii::$app->authManager;

          $createPost = $auth->createPermission('createPost');
          $createPost->description = 'Create a post';
          $auth->add($createPost);

          $updatePost = $auth->createPermission('updatePost');
          $updatePost->description = 'Update a post';
          $auth->add($updatePost);

          $viewPost = $auth->createPermission('viewPost');
          $viewPost->description = 'View a post';
          $auth->add($viewPost);

          $deletePost = $auth->createPermission('deletePost');
          $deletePost->description = 'Delete a post';
          $auth->add($deletePost);

          $indexPost = $auth->createPermission('indexPost');
          $indexPost->description = 'Index a post';
          $auth->add($indexPost);

          $rule = new UserGroupRule;
          $auth->add($rule);

          $admin = $auth->createRole('admin');
          $admin->ruleName = $rule->name;
          $auth->add($admin);
          $auth->addChild($admin, $createPost);
          $auth->addChild($admin, $updatePost);
          $auth->addChild($admin, $viewPost);
          $auth->addChild($admin, $indexPost);
          $auth->addChild($admin, $deletePost);

          $coordenador = $auth->createRole('coordenador');
          $coordenador->ruleName = $rule->name;
          $auth->add($coordenador);
          $auth->addChild($coordenador, $createPost);
          $auth->addChild($coordenador, $updatePost);
          $auth->addChild($coordenador, $viewPost);
          $auth->addChild($coordenador, $indexPost);
          $auth->addChild($coordenador, $deletePost);

          $servidor = $auth->createRole('servidor');
          $servidor->ruleName = $rule->name;
          $auth->add($servidor);
          $auth->addChild($servidor, $createPost);
          $auth->addChild($servidor, $viewPost);

          $discente = $auth->createRole('discente');
          $discente->ruleName = $rule->name;
          $auth->add($discente);
          $auth->addChild($discente, $createPost);
          $auth->addChild($discente, $viewPost);

         */

        return $this->render('index');
    }

    public function actionCreateMPDF() {
        $mpdf = new mPDF();
        $mpdf->WriteHTML($this->renderPartial('mpdf'));
        $mpdf->Output();
        exit;
        //return $this->renderPartial('mpdf');
    }

    public function actionSamplePdf() {
        $mpdf = new mPDF;
        $mpdf->WriteHTML('Sample Text');
        $mpdf->Output();
        exit;
    }

    public function actionForceDownloadPdf() {
        $mpdf = new mPDF();
        $mpdf->WriteHTML($this->renderPartial('mpdf'));
        $mpdf->Output('MyPDF.pdf', 'D');
        exit;
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact() {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
                    'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout() {
        return $this->render('about');
    }

    public function actionRecuperarpassword() {
        $this->render('recuperarpassword');
    }

    public function validatePassword() {
        $this->render('validatePassword');
    }

    /**
     * Sends email that contains link for password reset action.
     *
     * @return string|\yii\web\Response
     */
    public function actionRequestPasswordReset() {
        $model = new PasswordResetRequestForm();

        if (!$model->load(Yii::$app->request->post()) || !$model->validate()) {
            return $this->render('requestPasswordResetToken', ['model' => $model]);
        }

        if (!$model->sendEmail()) {
            Yii::$app->session->setFlash('error', Yii::t('app', 'Desculpe, não podemos redefinir a senha para o email fornecido.'));
            return $this->refresh();
        }

        Yii::$app->session->setFlash('success', Yii::t('app', 'Verifique seu e-mail para mais instruções.'));

        return $this->goHome();
    }

    public function actionResetPassword($token) {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if (!$model->load(Yii::$app->request->post()) || !$model->validate() || !$model->resetPassword()) {
            return $this->render('resetPassword', ['model' => $model]);
        }

        Yii::$app->session->setFlash('success', Yii::t('app', 'Nova senha foi salva.'));

        return $this->goHome();
    }

}
