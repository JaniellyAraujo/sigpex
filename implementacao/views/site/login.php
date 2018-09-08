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

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = Yii::t('app', 'SigPex | Login');

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \app\models\LoginForm */


$fieldOptions1 = [
    'options' => ['class' => 'form-group has-feedback'],
    'inputTemplate' => "{input}<span class='glyphicon glyphicon-envelope form-control-feedback'></span>"
];

$fieldOptions2 = [
    'options' => ['class' => 'form-group has-feedback'],
    'inputTemplate' => "{input}<span class='glyphicon glyphicon-lock form-control-feedback'></span>"
];
?>

<div class="login-box">
    <title>SigPex | Login</title>
    <link rel="shortcut icon" href="<?= yii\helpers\Url::to('@web/images/favicon.ico') ?>" type="image/x-icon">
    <link rel="icon" href="<?= yii\helpers\Url::to('@web/images/favicon.ico') ?>" type="image/x-icon">
    <div class="login-box">

        <div class="login-box-body">

            <div class="login-box-body login-header text-center">
                <h1>
                    <img src="<?= yii\helpers\Url::to('@web/images/ifnmg.png') ?>" />
                    <img src="<?= yii\helpers\Url::to('@web/images/sp.png') ?>" />
                </h1>
            </div>

            <p class="login-box-msg"><b>SigPex - Autenticação</b><br>
                Preencha os campos para entrar
            </p>

            <?php $form = ActiveForm::begin(['id' => 'login-form', 'enableClientValidation' => false]); ?>

            <?=
                    $form
                    ->field($model, 'email', $fieldOptions1)
                    ->label(false)
                    ->textInput(['placeholder' => $model->getAttributeLabel('email'), 'autofocus' => true])
            ?>

            <?=
                    $form
                    ->field($model, 'password_hash', $fieldOptions2)
                    ->label(false)
                    ->passwordInput(['placeholder' => $model->getAttributeLabel('password_hash')])
            ?>

            <div class="row">
                <div class="col-xs-8">
                    <?= $form->field($model, 'rememberMe')->checkbox() ?>
                </div>
                <!-- /.col -->

                <div class="col-xs-4">
                <?= Html::submitButton('Login', ['class' => 'btn btn-primary btn-block btn-flat', 'name' => 'login-button']) ?>
                </div>
                <!-- /.col -->
            </div>

            <div style="color:#999;margin:1em 0">
                <?= Html::a('Esqueceu a senha?', ['request-password-reset']) ?>
            </div>


        <?php ActiveForm::end(); ?>


        </div>
        <!-- /.login-box-body -->
    </div><!-- /.login-box -->
