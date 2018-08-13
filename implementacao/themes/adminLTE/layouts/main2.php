<?php
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use app\themes\adminLTE\assets\AdminlteAsset;
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

<body class="sidebar-mini skin-green" style="height: auto; min-height: 100%;">
<div class="wrapper" style="height: auto; min-height: 100%;"></div>
<?php $this->beginBody() ?>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        
        <header class="main-header">
            <a class="logo" href="/"><span class="logo-mini">Cajuí</span><span class="logo-lg"><strong>Cajuí</strong> IFNMG</span></a>
            <!-- Logo -->
            <a img src="<?= yii\helpers\Url::to('@web/images/ifnmg.png') ?>" class="logo">
              <!-- mini logo for sidebar mini 50x50 pixels -->
              <span class="logo-mini"><b>S</b>Px</span>
              <!-- logo for regular state and mobile devices -->
              <span class="logo-lg"><b>Sig</b>Pex</span>
            </a>
            
        <nav class="navbar navbar-static-top" role="navigation">
        <a href="index.html" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
       </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <li>
                              </li>
              <li>
                <a href="/ajuda/ajuda#">
                  <i class="fa fa-question-circle-o" title="Ajuda"></i>                    
                </a>
              </li>                
                
<li id="abre-mensagens" class="dropdown messages-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-envelope-o"></i>
        <span id="badge-mensagens" class="label label-warning">0</span>
    </a>
    <ul id="dropdown-mensagens" class="dropdown-menu">
    </ul>
</li>

                
                
<li id="abre-notificacao" class="dropdown notifications-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-bell-o"></i>
        <span id="badge-mensagens" class="label label-danger">0</span>
    </a>
    <ul id="dropdown-mensagens" class="dropdown-menu">
       
    </ul>
</li>              <?php
                      echo Nav::widget([
                          'options' => ['class' => 'nav navbar-nav'],
                          'items' => [
                              ['label' => 'Início', 'url' => ['/site/index']],
                              ['label' => 'Sobre', 'url' => ['/site/about']],
                            //['label' => 'Cadastre-se', 'url' => ['/site/cadastro']],
                              ['label' => 'Contato', 'url' => ['/site/contact']],
                              Yii::$app->user->isGuest ?
                                  ['label' => 'Login', 'url' => ['/site/login']] :
                                  ['label' => 'Logout (' . Yii::$app->user->identity->nome . ')',
                                      'url' => ['/site/logout'],
                                      'linkOptions' => ['data-method' => 'post']],
                          ],
                      ]);
                  ?> 
                <!-- User Account: style can be found in dropdown.less -->
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
            </ul>
        </div>
    </nav>
</header>

        <?= $content ?>

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
