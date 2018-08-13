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
use app\themes\adminLTE\assets\AdminlteAsset;

/* @var $this \yii\web\View */
/* @var $content string */
AdminlteAsset::register($this);
?>

<?php $this->beginPage() ?>
<!DOCTYPE html>
<title>SigPex | Início</title>
<link rel="shortcut icon" href="<?= yii\helpers\Url::to('@web/images/favicon.ico') ?>" type="image/x-icon">
<link rel="icon" href="<?= yii\helpers\Url::to('@web/images/favicon.ico') ?>" type="image/x-icon">
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
    </head>
    <body class="skin-green sidebar-mini">
        <?php $this->beginBody() ?>
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
        <h3 align="center">Bem vindo! Você está conectado no SigPex.</h3> 
        <p align="center">Esta é a área do Discente. Clique nos links para acessar aos módulos.</p>  
        <div class="site-coordenador">
            <div class="col-md-6">
                <!-- USERS LIST -->
                <div class="box box-success">
                    <div class="box-header with-border"collor="greem">
                        <h3 class="box-title">Gerenciar Relatório Mensal</h3>
                        <div class="box-tools pull-right">
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                        <ul class="users-list clearfix">
                            <br>
                            <p align="center">
                                <?= Yii::t('app', ' Acesse a lista de todos os relatórios mensais, em que faz parte da equipe.'); ?>
                            </p>
                            <br>
                        </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-header with-border">
                        <div class="box-tools pull-right">
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-footer text-center">
                        <a  href="../projetos/relatoriomensal">Ver Todos &raquo;</a>
                    </div><!-- /.box-footer -->
                </div><!--/.box -->
            </div><!-- /.col -->

            <div class="col-md-6">
                <!-- USERS LIST -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Gerenciar Relatório Final</h3>
                        <div class="box-tools pull-right">
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                        <ul class="users-list clearfix">
                            <br>
                            <p align="center">
                                <?= Yii::t('app', ' Acesse a lista de todos os relatórios finais, em que faz parte da equipe.'); ?>
                            </p>
                            <br>
                        </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-header with-border">
                        <div class="box-tools pull-right">
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-footer text-center">
                        <a href="../projetos/relatoriofinal" class="uppercase">Ver Todos &raquo;</a>
                    </div><!-- /.box-footer -->
                </div><!--/.box -->
            </div><!-- /.col -->

            <div class="col-md-6">
                <!-- USERS LIST -->
                <div class="box box-danger">
                    <div class="box-header with-border">
                        <h3 class="box-title">Gerenciar Declarações</h3>
                        <div class="box-tools pull-right">
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                        <ul class="users-list clearfix">
                            <br>

                            <br>
                            <br>
                        </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-header with-border">
                        <div class="box-tools pull-right">
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-footer text-center">
                        <a href="javascript::" class="uppercase">Ver Todos  &raquo;</a>
                    </div><!-- /.box-footer -->
                </div><!--/.box -->
            </div><!-- /.col -->

            <div class="col-md-6">
                <!-- USERS LIST -->
                <div class="box box-warning">
                    <div class="box-header with-border">
                        <h3 class="box-title">Gerenciar Certificados</h3>
                        <div class="box-tools pull-right">
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                        <ul class="users-list clearfix">
                            <br><br><br>



                        </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-header with-border">
                        <div class="box-tools pull-right">
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-footer text-center">
                        <a href="javascript::" class="uppercase">Ver Todos  &raquo;</a>
                    </div><!-- /.box-footer -->
                </div><!--/.box -->
            </div><!-- /.col -->

        </div>

        <?php $this->endBody() ?>
    </body>
</html>
<?php $this->endPage() ?>




