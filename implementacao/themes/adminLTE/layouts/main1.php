<?php

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use app\themes\adminLTE\assets\AdminlteAsset;
use \yii\debug\models\search\User;
use adminlte\widgets\Menu;
use app\themes\adminLTE\components\ThemeNav;
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
                                            ['label' => 'Início', 'url' => ['/site/index']],
                                            ['label' => 'Sobre', 'url' => ['/site/about']],
                                            ['label' => 'Contato', 'url' => ['/site/contact']],
                                        Yii::$app->user->isGuest ?
                                                ['label' => 'Login', 'url' => ['/site/login']] :
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
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->


                    <?=
                    Menu::widget([
                        'encodeLabels' => false,
                        'options' => ['class' => 'sidebar-menu', 'data-widget' => "tree"],
                        'items' => [
                                ['label' => 'MAIN NAVIGITION', 'options' => ['class' => 'header']],
                                ['label' => ThemeNav::link('Cadastre-se'), 'icon' => 'fa fa-user-plus', 'url' => ['/usuarios/create'], 'visible' => Yii::$app->user->isGuest],
                                ['label' => ThemeNav::link('Regulamentos'), 'icon' => 'fa fa fa-folder', 'url' => ['#'], 'visible' => Yii::$app->user->isGuest],
                            //Menu Administrador
                            ['label' => 'Usuários',
                                'icon' => 'fa fa-users',
                                'url' => '#',
                                'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 1,
                                //'options'=>['class'=>'pull-right-container',"treeview-menu"] ,
                                'items' => [
                                        [
                                        'label' => 'Cadastro',
                                        'icon' => 'fa fa-user-plus',
                                        'url' => '@web/usuarios/create/',
                                        'active' => $this->context->route == 'projetos/index'
                                    ],
                                        [
                                        'label' => 'Listagem',
                                        'icon' => 'fa fa-list-ul',
                                        'url' => '@web/usuarios/index/',
                                        'active' => $this->context->route == 'projetos/index'
                                    ],
                                ],
                            ],
                                ['label' => 'Backup',
                                'icon' => 'fa fa-database',
                                'url' => '#',
                                'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 1,
                                //'options'=>['class'=>'pull-right-container',"treeview-menu"] ,
                                'items' => [
                                        [
                                        'label' => 'Criar Backup',
                                        'icon' => 'fa fa-external-link',
                                        'url' => '@web/backuprestore/index/',
                                        'active' => $this->context->route == 'backuprestore/index'
                                    ],
                                        [
                                        'label' => 'Enviar Backup',
                                        'icon' => 'fa fa-upload',
                                        'url' => '@web/backuprestore/upload/',
                                        'active' => $this->context->route == 'backuprestore/upload'
                                    ],
                                ],
                            ],
                            //Menu Coordenador 
                            ['label' => ThemeNav::link('Atividades'),
                                'icon' => 'fa fa-table',
                                'url' => '#',
                                'items' => [
                                        [
                                        'label' => 'Cadastro',
                                        'icon' => 'fa fa-file-o',
                                        'url' => '@web/atividades/create/',
                                        'active' => $this->context->route == 'atividades/index'
                                    ],
                                        [
                                        'label' => 'Listagem',
                                        'icon' => 'fa fa-list-ul',
                                        'url' => '@web/atividades/index/',
                                        'active' => $this->context->route == 'atividades/index',
                                    ],
                                        [
                                        'label' => 'Adicionar Participante',
                                        'icon' => 'fa fa-user-plus',
                                        'url' => '@web/participantes/create/',
                                        'active' => $this->context->route == 'participantes/index'
                                    ],
                                        [
                                        'label' => 'Listar Participantes',
                                        'icon' => 'fa fa-users',
                                        'url' => '@web/participantes/index/',
                                        'active' => $this->context->route == 'participantes/index'
                                    ],
                                        [
                                        'label' => 'Certificados',
                                        'icon' => 'fa fa-graduation-cap',
                                        'url' => '#',
                                        'active' => $this->context->route == '#',
                                    ],
                                ],
                                'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 2],
                                ['label' => ThemeNav::link('Projetos'),
                                'icon' => 'fa fa-paste (alias)',
                                'url' => '#',
                                'options' => ['class' => 'pull-right-container', "treeview-menu"],
                                'items' => [
                                        [
                                        'label' => 'Cadastro',
                                        'icon' => 'fa fa-file',
                                        'url' => '@web/projetos/create/',
                                        'active' => $this->context->route == 'projetos/index'
                                    ],
                                        [
                                        'label' => 'Listagem Aprovados',
                                        'icon' => 'fa fa-check-square-o',
                                        'url' => '@web/projetos/aprovados/',
                                        'active' => $this->context->route == 'projetos/index'
                                    ],
                                    [
                                        'label' => 'Listagem Reprovadoss',
                                        'icon' => 'fa fa-ban',
                                        'url' => '@web/projetos/reprovados/',
                                        'active' => $this->context->route == 'projetos/index'
                                    ],
                                        [
                                        'label' => 'Cadastros Pendentes',
                                        'icon' => 'fa fa-spinner',
                                        'url' => '@web/projetos/solicitacao/',
                                        'active' => $this->context->route == 'projetos/index',
                                    ],
                                        [
                                        'label' => 'Adicionar Participante',
                                        'icon' => 'fa fa-user-plus',
                                        'url' => '@web/equipe/create/',
                                        'active' => $this->context->route == 'equipe/index'
                                    ],
                                        [
                                        'label' => 'Equipe Executora',
                                        'icon' => 'fa fa-users',
                                        'url' => '@web/equipe/index/',
                                        'active' => $this->context->route == 'equipe/index'
                                    ],
                                        [
                                        'label' => 'Certificados',
                                        'icon' => 'fa fa-graduation-cap',
                                        'url' => '#',
                                        'active' => $this->context->route == '#',
                                    ],
                                        [
                                        'label' => 'Declarações',
                                        'icon' => 'fa fa-check-square-o',
                                        'url' => '@web/declaracoes/create/',
                                        'active' => $this->context->route == '#',
                                    ]
                                ],
                                'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 2],
                                ['label' => ThemeNav::link('Relatórios'),
                                'icon' => 'fa fa-bar-chart',
                                'url' => '#',
                                'options' => ['class' => 'pull-right-container', "treeview-menu"],
                                'items' => [
                                        [
                                        'label' => '',
                                        'icon' => 'fa fa-file',
                                        'url' => '#',
                                        'active' => $this->context->route == '#'
                                    ],
                                    [
                                        'label' => '',
                                        'icon' => 'fa fa-file',
                                        'url' => '#',
                                        'active' => $this->context->route == '#'
                                    ],        
                                ],
                                'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 2],
                            //Menu Servidor
                            ['label' => ThemeNav::link('Atividades'),
                                'icon' => 'fa fa-table',
                                'url' => '#',
                                'items' => [
                                        [
                                        'label' => 'Cadastro',
                                        'icon' => 'fa fa-file-o',
                                        'url' => '@web/atividades/create/',
                                        'active' => $this->context->route == 'atividades/index'
                                    ],
                                        [
                                        'label' => 'Listagem',
                                        'icon' => 'fa fa-list-ul',
                                        'url' => '@web/atividades/index/',
                                        'active' => $this->context->route == 'atividades/index',
                                    ],
                                        [
                                        'label' => 'Adicionar Participante',
                                        'icon' => 'fa fa-user-plus',
                                        'url' => '@web/participantes/create/',
                                        'active' => $this->context->route == 'participantes/index'
                                    ],
                                        [
                                        'label' => 'Listar Participantes',
                                        'icon' => 'fa fa-users',
                                        'url' => '@web/participantes/index/',
                                        'active' => $this->context->route == 'participantes/index'
                                    ],
                                        [
                                        'label' => 'Solicitar Certificado',
                                        'icon' => 'fa fa-graduation-cap',
                                        'url' => '#',
                                        'active' => $this->context->route == '#',
                                    ],
                                ],
                                'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3
                            ],
                                ['label' => ThemeNav::link('Projetos'),
                                'icon' => 'fa fa-paste (alias)',
                                'url' => '#',
                                'options' => ['class' => 'pull-right-container', "treeview-menu"],
                                'items' => [
                                        [
                                        'label' => 'Cadastro',
                                        'icon' => 'fa fa-file',
                                        'url' => '@web/projetos/create/',
                                        'active' => $this->context->route == 'projetos/index'
                                    ],
                                        [
                                        'label' => 'Listagem',
                                        'icon' => 'fa fa-list-ul',
                                        'url' => '@web/projetos/index/',
                                        'active' => $this->context->route == 'projetos/index'
                                    ],
                                        [
                                        'label' => 'Adicionar Participante',
                                        'icon' => 'fa fa-user-plus',
                                        'url' => '@web/equipe/create/',
                                        'active' => $this->context->route == 'equipe/index'
                                    ],
                                        [
                                        'label' => 'Equipe Executora',
                                        'icon' => 'fa fa-users',
                                        'url' => '@web/equipe/index/',
                                        'active' => $this->context->route == 'equipe/index'
                                    ],
                                        [
                                        'label' => 'Solicitar Certificado',
                                        'icon' => 'fa fa-graduation-cap',
                                        'url' => '#',
                                        'active' => $this->context->route == '#',
                                        'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3
                                    ],
                                        [
                                        'label' => 'Solicitar Declaração',
                                        'icon' => 'fa fa-check-square-o',
                                        'url' => '#',
                                        'active' => $this->context->route == '#',
                                        'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3
                                    ],
                                ],
                                'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3
                            ],
                            //Menu Discente
                            ['label' => ThemeNav::link('Projetos'),
                                'icon' => 'fa fa-paste (alias)',
                                'url' => '#',
                                'items' => [
                                        [
                                        'label' => 'Meus Projetos',
                                        'icon' => 'fa fa-list',
                                        'url' => '#',
                                        'active' => $this->context->route == '?r=#',
                                    //'visible'=> \yii\debug\models\search\User::$app->user->where(['email' => 'email']&&['password'=>'password'])
                                    ],
                                        [
                                        'label' => 'Relatório Mensal',
                                        'icon' => 'fa fa-line-chart',
                                        'url' => '#',
                                        'active' => $this->context->route == '#'
                                    ],
                                        [
                                        'label' => 'Relatório Final',
                                        'icon' => 'fa fa-bar-chart',
                                        'url' => '#',
                                        'active' => $this->context->route == '#'
                                    ],
                                ],
                                'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 4
                            ],
                                ['label' => ThemeNav::link('Atividades', ''),
                                'icon' => 'fa fa-table',
                                'url' => '#',
                                'items' => [
                                        [
                                        'label' => 'Minhas Atividades',
                                        'icon' => 'fa fa-list-alt',
                                        'url' => '#',
                                        'active' => $this->context->route == '#'
                                    ],
                                ],
                                'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 4
                            ],
                                ['label' => ThemeNav::link('Certificados'),
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
                <?php echo Yii::powered(); ?>
            </div>
            IFNMG - Januária &copy; <?php echo date('Y'); ?> by SigPex. Todos os direitos reservados.
        </footer>
    </div>
    <?php $this->endBody() ?>
</body>
</body>
</html>
<?php $this->endPage() ?>
