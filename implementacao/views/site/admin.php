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

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">

    <?php
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            Yii::$app->user->isGuest ? (
                        ['label' => 'Login', 'url' => ['/site/login']]
                    ) : (
                    '<li>'
                    . Html::beginForm(['/site/logout'], 'post')
                    . Html::endForm()
                    . '</li>'
                    )
        ],
    ]);
    ?>
    <br>
    <h3 align="center">Bem vindo! Você está conectado no SigPex.</h3> 
    <p align="center"></p>
    <br>

    <div class="col-md-12 well bs-component" > 

        <p align="center">
<?= Yii::t('app', 'Esta é a área do administrador. Acesse o menu à esquerda para listar todos os usuários do sistema, gerenciar usuários, gerenciar backup, consultar informações.'); ?>
        </p>
    </div>
<?php $this->endBody() ?>

</html>
<?php $this->endPage() ?>

