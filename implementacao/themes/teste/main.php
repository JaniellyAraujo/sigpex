<?php
use yii\helpers\Html;
use yii\bootstrap\Nav;
//use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use app\themes\adminLTE\assets\AdminlteAsset;
//use yii\widgets\Menu;
use adminlte\widgets\Menu;
use app\themes\adminLTE\components\ThemeNav;

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
                          $info[] = Yii::t('app','');

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
                  'encodeLabels'=>false,
                  'options' => ['class' => 'sidebar-menu','data-widget'=>"tree"],
                  'items' => [
                      ['label' =>'MAIN NAVIGITION', 'options'=>['class'=>'header']],
                      ['label' => ThemeNav::link('Cadastre-se', 'fa fa-users'), 'url' => ['/usuarios/create'], 'visible'=>Yii::$app->user->isGuest],
                      
                       //Menu Administrador
                      ['label' => 'Usuários',
                       'icon'=>'fa fa-paste (alias)',
                       'url' => '#',
                       'visible'=>!Yii::$app->user->isGuest && Yii::$app->user->identity->role==1,
                       //'options'=>['class'=>'pull-right-container',"treeview-menu"] ,
                        
                            'items' => [
                                [
                                    'label' => 'Cadastro',
                                    'icon'=>'fa fa-paste (alias)',
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
                       
                        //Menu Coordenador, Servidor 
                      ['label' => ThemeNav::link('Projetos', 'fa fa-paste (alias)'),
                       'url' => '#',
                       'options'=>['class'=>'pull-right-container',"treeview-menu"] ,
                        
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
                                    'url' => '?r=projetos/index/',
				    'active' => $this->context->route == 'projetos/index'
                                ],
                                [
                                    'label' => 'Adicionar Participante',
                                    'icon' => 'fa fa-user-plus',
                                    'url' => '?r=equipe/create/',
				    'active' => $this->context->route == 'equipe/index'
                                ],
                                [
                                    'label' => 'Equipe Executora',
                                    'icon' => 'fa fa-users',
                                    'url' => '?r=equipe/index/',
				    'active' => $this->context->route == 'equipe/index'
                                ],
                            ],
                        'visible'=>!Yii::$app->user->isGuest && (Yii::$app->user->identity->role==2 ||Yii::$app->user->identity->role==3)
                        ],
                        ['label' => ThemeNav::link('Eventos', 'fa fa-table'),
                            'url' => '#',
                            'items' => [
                                [
                                    'label' => 'Cadastro',
                                    'icon' => 'fa fa-file-o',
                                    'url' => '?r=eventos/create/',
				    'active' => $this->context->route == 'eventos/index'
                                ],
                                [
                                    'label' => 'Listagem',
                                    'icon' => 'fa fa-list-ul',
                                    'url' => '?r=eventos/index/',
				    'active' => $this->context->route == 'eventos/index'
                                ],
                                [
                                    'label' => 'Adicionar Participante',
                                    'icon' => 'fa fa-user-plus',
                                    'url' => '?r=participantes/create/',
				    'active' => $this->context->route == 'participantes/index'
                                ],
                                [
                                    'label' => 'Listar Participantes',
                                    'icon' => 'fa fa-users',
                                    'url' => '?r=participantes/index/',
				    'active' => $this->context->route == 'participantes/index'
                                ],
                                [
                                    'label' => 'Palestra',
                                    'icon' => 'fa fa-microphone',
                                    'url' => '?r=palestra/index/',
				    'active' => $this->context->route == 'palestra/index'
                                ],
                                 [
                                    'label' => 'Oficina',
                                    'icon' => 'fa fa-dashboard',
                                    'url' => '?r=oficina/index/',
				    'active' => $this->context->route == 'oficina/index'
                                ],
                                 [
                                    'label' => 'Minicurso',
                                    'icon' => 'fa fa-leanpub',
                                    'url' => '?r=minicurso/index/',
				    'active' => $this->context->route == 'minicurso/index'
                                ],
                                 [
                                    'label' => 'Poster',
                                    'icon' => 'fa fa-slideshare',
                                    'url' => '?r=poster/index/',
				    'active' => $this->context->route == 'poster/index'
                                ],
                                 [
                                    'label' => 'Mesa Redonda',
                                    'icon' => 'fa fa-comments',
                                    'url' => 'mesaredonda/index/',
				    'active' => $this->context->route == 'mesaredonda/index'
                                ],
                            ],
                        'visible'=>!Yii::$app->user->isGuest && (Yii::$app->user->identity->role==2 ||Yii::$app->user->identity->role==3)
                        ],
                      //Menu Discente
                        ['label' => ThemeNav::link('Projetos', 'fa fa-paste (alias)'),
                            'url' => '#',
                            'items' => [
                                [
                                    'label' => 'Meus Projetos',
                                    'icon' => 'fa fa-list',
                                    'url' => '#',
				    'active' => $this->context->route == '?r=#'
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
                        'visible'=>!Yii::$app->user->isGuest && Yii::$app->user->identity->role==4
                        ],
                        ['label' => ThemeNav::link('Eventos', 'fa fa-table'),
                            'url' => '#',
                            'items' => [
                                [
                                    'label' => 'Meus Eventos',
                                    'icon' => 'fa fa-list-alt',
                                    'url' => '#',
				    'active' => $this->context->route == '#'
                                ],
                                
                            ],
                        'visible'=>!Yii::$app->user->isGuest && Yii::$app->user->identity->role==4
                        ],
                       ['label' => ThemeNav::link('Certificados',
                               'fa fa-graduation-cap'),
                        'url' => ['#'], 'visible'=>!Yii::$app->user->isGuest && Yii::$app->user->identity->role==4],
                      ],
                ]);
            ?>
        
    </section>

    <!-- /.sidebar -->
</aside>
    

    <div class="content-wrapper">
    <?=$content?>
   
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
