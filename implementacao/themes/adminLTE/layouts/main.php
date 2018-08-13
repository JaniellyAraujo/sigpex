<?php

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use app\themes\adminLTE\assets\AdminlteAsset;
use \yii\debug\models\search\User;
use adminlte\widgets\Menu;
//use app\themes\adminLTE\components\ThemeNav;
use \kartik\growl\Growl;

/* @var $this \yii\web\View */
/* @var $content string */
AdminlteAsset::register($this);
AppAsset::register($this);
?>

<?php $this->beginPage() ?>
<!DOCTYPE html>
<title>SigPex | Início</title>
<link rel="shortcut icon" href="<?= yii\helpers\Url::to('@web/images/favicon.ico') ?>" type="image/x-icon">
<link rel="icon" href="<?= yii\helpers\Url::to('@web/img/favicon.ico') ?>" type="image/x-icon">
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
        <div class="wrapper">
            <header class="main-header">
                <!-- Logo -->
                <a img src="web\images\if.png" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>S</b>Px</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Sig</b>Pex</span>
                </a>
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <div class="navbar-custom-menu">
                                <?php
                                echo Nav::widget([
                                    'options' => ['class' => 'nav navbar-nav'],
                                    'items' => [
                                            ['label' => 'Início', 'url' => ['/site/index'], 'visible' => Yii::$app->user->isGuest],
                                            ['label' => 'Início', 'url' => ['projetos/index'], 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 4],
                                            ['label' => 'Início', 'url' => ['/projetos/index'], 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3],
                                            ['label' => 'Início', 'url' => ['/projetos/solicitacao'], 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 2],
                                            ['label' => 'Início', 'url' => ['/usuarios/index'], 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 1],
                                            ['label' => 'Sobre', 'url' => ['/site/about']],
                                            ['label' => 'Contato', 'url' => ['/site/contact']],
                                        Yii::$app->user->isGuest ?
                                                ['label' => 'Login', 'icon' => 'fa fa-user', 'url' => ['/site/login']] :
                                                ['label' => 'Sair',
                                            'url' => ['/site/logout'],
                                            'linkOptions' => ['data-method' => 'post']],
                                    ],
                                ]);
                                ?>
                            </div>

                        </ul>
                    </div>
                </nav>
            </header> 
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
<?= Html::img('@web/dist/img/if.png', ['class' => 'img', 'alt' => 'User Image']) ?>
                        </div>
                        <div class="pull-left info">
                            <p>
                            <?php
                            $info[] = Yii::t('app', '');

                            if (isset(Yii::$app->user->identity->nome)) {
                                $info[] = ucfirst(\Yii::$app->user->identity->nome);
                            }

                            echo implode(' ', $info);
                            ?>
                            </p>
                            <a href="https://www.ifnmg.edu.br/"><i class="fa text-success"></i> IFNMG - JANUÁRIA</a>
                        </div>

                    </div>
                   


<?=
Menu::widget([
    //'encodeLabels' => FALSE,
    'options' => ['class' => 'sidebar-menu', 'data-widget' => "tree"],
    'items' => [
            ['label' => 'MENU', 'options' => ['class' => 'header']],
            ['label' => 'Cadastre-se', 'icon' => 'fa fa-user-plus', 'url' => ['usuarios/create'], 'visible' => Yii::$app->user->isGuest],
            ['label' => 'Regulamentos', 'icon' => 'fa fa fa-folder', 'url' => ['#'], 'visible' => Yii::$app->user->isGuest],
        //Menu Administrador
        ['label' => 'Usuários',
            'icon' => 'fa fa-users',
            'url' => '@web/usuarios/index/',
            'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 1,
            'options' => ['class' => 'pull-right-container', "treeview-menu"],], 
        ['label' => 'Backup',
            'icon' => 'fa fa-database',
            'url' => '@web/backuprestore/index/',
            'active' => $this->context->route == 'backuprestore/index',
            'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 1,
        ],
        //Menu Coordenador
        ['label' => 'Projetos',
            'icon' => 'fa fa-paste (alias)',
            'url' => '@web/projetos/aprovados/',
            'options' => ['class' => 'pull-right-container', "treeview-menu"],
            'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 2],
        ['label' => 'Relatório Anual',
            'icon' => 'fa fa-bar-chart',
            'url' => '#',
            'options' => ['class' => 'pull-right-container', "treeview-menu"], 
            'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 2],
        ['label' => 'Perfil ',
            'icon' => 'fa fa-bar-chart',
            'url' => '@web/usuarios/view0 => function ($url, $data) {
                                
                                    return Html::a([usuarios/view0, id => $data->id], [class => profile-link]);
                                
                            }',
            'options' => ['class' => 'pull-right-container', "treeview-menu"], 
            'visible' => !Yii::$app->user->isGuest &&((Yii::$app->user->identity->role == 2)||(Yii::$app->user->identity->role == 3)||(Yii::$app->user->identity->role == 4))],
        ['label' => 'Configurações',
            'icon' => 'fa fa-cogs',
            'url' => '#',
            'items' => [
                    [
                    'label' => 'Área de Conhecimento',
                    'icon' => 'fa fa-gear (alias)',
                    'url' => '@web/area',
                    'active' => $this->context->route == '#',
                ],
                    [
                    'label' => 'Campus',
                    'icon' => 'fa fa-gear (alias)',
                    'url' => '@web/campus',
                    'active' => $this->context->route == '#',
                ],
                    [
                    'label' => 'Modalidade de Projeto',
                    'icon' => 'fa fa-gear (alias)',
                    'url' => '@web/modalidade',
                    'active' => $this->context->route == '#',
                ],
                    [
                    'label' => 'Parceiros',
                    'icon' => 'fa fa-gear (alias)',
                    'url' => '@web/parceiros',
                    'active' => $this->context->route == '#',
                ],
                    [
                    'label' => 'Status do Projeto',
                    'icon' => 'fa fa-gear (alias)',
                    'url' => '@web/status',
                    'active' => $this->context->route == '#',
                ],
                    [
                    'label' => 'Tipo de Projeto',
                    'icon' => 'fa fa-gear (alias)',
                    'url' => '@web/project',
                    'active' => $this->context->route == '#',
                ],
                    [
                    'label' => 'Tipo de Usuário',
                    'icon' => 'fa fa-gear (alias)',
                    'url' => '@web/users',
                    'active' => $this->context->route == '#',
                ],
            ],
            'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 2],
        //Menu Servidor
        ['label' => 'Projetos',
            'icon' => 'fa fa-paste (alias)',
            'url' => '@web/projetos/index',
            'options' => ['class' => 'pull-right-container', "treeview-menu"],
            'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3
        ],
        //Menu Discente
        ['label' => 'Projetos',
            'icon' => 'fa fa-paste (alias)',
            'url' => '@web/projetos/index',
            
            'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 4
        ],
            
            ['label' => 'Certificados',
            'icon' => 'fa fa-graduation-cap',
            'url' => ['#'], 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 4],
    ],
]);
?>

                </section>

                <!-- /.sidebar -->
            </aside>


            <div class="content-wrapper">
<?= $content ?>
                <div class="container">


<?php foreach (Yii::$app->session->getAllFlashes() as $message):; ?>
    <?php
    echo Growl::widget([
        'type' => (!empty($message['type'])) ? $message['type'] : 'danger',
        'title' => (!empty($message['title'])) ? Html::encode($message['title']) : '',
        'icon' => (!empty($message['icon'])) ? $message['icon'] : 'fa fa-info',
        'body' => (!empty($message['message'])) ? Html::encode($message['message']) : '',
        'showSeparator' => true,
        'delay' => 1,
        'pluginOptions' => [
            'delay' => (!empty($message['duration'])) ? $message['duration'] : 20000,
            'placement' => [
                'from' => (!empty($message['positonY'])) ? $message['positonY'] : 'top',
                'align' => (!empty($message['positonX'])) ? $message['positonX'] : 'right',
            ]
        ]
    ]);
    ?>
                    <?php endforeach; ?>

                </div>
            </div>
        </section><!-- /.content -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Versão</b> 1.0
            </div>
            <strong>IFNMG - Januária &copy; <?php echo date('Y'); ?> <a href="#">by SigPex</a>.</strong> Todos os direitos reservados.
        </footer>
    </div>
<?php $this->endBody() ?>
</body>
</body>
</html>
<?php $this->endPage() ?>