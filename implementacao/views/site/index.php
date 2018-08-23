<?php
/* * ****************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
  /***************************************************************** */

use app\themes\adminLTE\assets\AdminlteAsset;
use app\assets\AppAsset;
use yii\helpers\Html;

/* @var $this yii\web\View */
$this->registerCss(".disp-count{cursor:default;} .disp-count:hover {background-color:none !important}");
//$this->title = 'SigPex';
AdminlteAsset::register($this);
AppAsset::register($this);
?>
<div class="site-index">


    <!--h1>Bem vindo</h1-->

    <!--p class="lead" align="center">Sistema para Gerenciamento de Projetos de Extensão do IFNMG-Campus Januária.</p-->
    <div><div class="container-fluid">
            <div class="row docs-premium-template">

                <div class="col-sm-12 col-md-6">
                    <div class="card">
                        <div class="card-body p-2">
                            <br><br><br><br><br>
                            <h2 class="t__h3 c__grey homepage__hero-subheadline" >
                                Sistema para Gerenciamento de Projetos de Extensão
                            </h2>

                            <!-- Widerfunnel 1_3 Control -->
                            <section class="section o__no-top" data-experiment-name="1_3" data-variation-name="control">
                                <div class="sp__2"></div>

                                <form class="cta cta__form cta__large" action="/pt-BR/sign_up" data-signup="form" data-product-id="" data-solution-id="">

                                    <span class="t__h5 c__blue u__hide" data-signup="success" align="justify">“A extensão Universitária é o processo
                                        Educativo, cultural e científico que articula o
                                        Ensino e a pesquisa de forma indissociável e
                                        Viabiliza a relação transformadora entre a
                                        Universidade e a sociedade”.
                                    </span>
                                </form>

                                <div class="sp__1"></div>
                                <div class="t__small">
                                    <div class="list__bullet-inline">(I Fórum de Extensão de Pró-Reitores das Universidades Públicas)</div>
                                    <div class="list__bullet-inline"></div>
                                    <div class="row"><br>
                                        <div class="col-md-4 col-sm-3 col-xs-6">
                                            <div class="sigpex-link-box bg-gray-active">
                                                <span class="sigpex-link-box-icon bg-light-blue-gradient"><i class="fa fa-folder-open"></i></span>
                                                <div class="sigpex-link-box-content">
                                                    <span class="sigpex-link-box-text"><strong> PROJETOS em</strong></span>
                                                    <span class="sigpex-link-box-text"><strong> andamento:</strong></span>
                                                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['isAtivo' => 2])->count(); ?></span>
                                                    <span class="sigpex-link-box-desc"></span>
                                                    <span class="sigpex-link-box-bottom"><?= Html::a(Yii::t('app', 'Detalhes') . ' <i class="fa fa-arrow-circle-right"></i>', ['#'], ['target' => '_blank', 'class' => 'small-box-footer']); ?></span>
                                                </div><!-- /.info-box-content -->
                                            </div><!-- /.info-box -->
                                        </div>

                                        <div class="col-md-4 col-sm-3 col-xs-6">
                                            <div class="sigpex-link-box bg-gray-active">
                                                <span class="sigpex-link-box-icon bg-light-blue-gradient"><i class="fa fa-sitemap"></i></span>
                                                <div class="sigpex-link-box-content">
                                                    <span class="sigpex-link-box-text"><strong>Total de </strong></span>
                                                    <span class="sigpex-link-box-text"><strong>projetos: </strong></span>
                                                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 2], ['isAtivo' => 5]])->count(); ?></span>
                                                    <span class="sigpex-link-box-desc"></span>
                                                    <span class="sigpex-link-box-bottom"><?= Html::a(Yii::t('app', 'Detalhes') . ' <i class="fa fa-arrow-circle-right"></i>', ['#'], ['target' => '_blank', 'class' => 'small-box-footer']); ?></span>
                                                </div><!-- /.info-box-content -->
                                            </div><!-- /.info-box -->
                                        </div>

                                        <div class="col-md-4 col-sm-3 col-xs-6">
                                            <div class="sigpex-link-box bg-gray-active">
                                                <span class="sigpex-link-box-icon bg-light-blue-gradient"><i class="fa fa-users""></i></span>
                                                <div class="sigpex-link-box-content">
                                                    <span class="sigpex-link-box-text"><strong>Usuários</strong></span>
                                                    <span class="sigpex-link-box-text"><strong>cadastrados: </strong></span>
                                                    <span class="sigpex-link-box-number"><?= \app\models\User::find()->where(['OR', ['role' => 3], ['role' => 4]])->count(); ?></span>
                                                    <span class="sigpex-link-box-desc"></span>
                                                    <span class="sigpex-link-box-bottom"><?= Html::a(Yii::t('app', 'Detalhes') . ' <i class="fa fa-arrow-circle-right"></i>', ['#'], ['target' => '_blank', 'class' => 'small-box-footer']); ?></span>
                                                </div><!-- /.info-box-content -->
                                            </div><!-- /.info-box -->
                                        </div>

                                    </div> 
                                    
                                </div>

                            </section>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6">
                    <div class="card">
                        <div class="card-body p-2">
                            <!--h4 style="background-color:#f7f7f7; font-size: 18px; text-align: center; padding: 7px 10px; margin-top: 0;">
                                PREMIUM TEMPLATE
                            </h4-->
                            <div class="media">

                                <div class="media-body ml-3">
                                    <div class="clearfix">

                                        <div class="g__c6 g__c12--md" >
                                            <div class="sp__2 sp__0--md"></div>
                                            <img src="<?= yii\helpers\Url::to('@web/img/arte.png') ?>" width="500" height="500" class="img-responsive /><hr>
                                                 <!--img class="img-responsive pad" src="web\img\logo.jpg" alt="foto" width="500" width="500"-->
                                                 <!--img src="web\img\logo.jpg" class="logo"></-->
                                                 <!--img width="500" width="500" class="homepage__hero-img max__none-lg" data-large="https://marketing.intercomassets.com/assets/homepage/v2/hero-2-71fe876f8175b062d084ab4224f3e136196fd166ac453de1a0b042183cfb85c7.png" data-medium="https://marketing.intercomassets.com/assets/homepage/v2/hero-2-71fe876f8175b062d084ab4224f3e136196fd166ac453de1a0b042183cfb85c7.png" data-large2x="https://marketing.intercomassets.com/assets/homepage/v2/hero-2-2x-2a488573c4fe70f3dc2d1c31a8ab33d44bf6475164822a79add2abac4be9fad2.png" data-medium2x="https://marketing.intercomassets.com/assets/homepage/v2/hero-2-2x-2a488573c4fe70f3dc2d1c31a8ab33d44bf6475164822a79add2abac4be9fad2.png" data-lazy-load="true" alt="" src="https://marketing.intercomassets.com/assets/homepage/v2/hero-2-71fe876f8175b062d084ab4224f3e136196fd166ac453de1a0b042183cfb85c7.png"><noscript><img  class="homepage__hero-img max__none-lg" alt="" src="https://marketing.intercomassets.com/assets/homepage/v2/hero-2-71fe876f8175b062d084ab4224f3e136196fd166ac453de1a0b042183cfb85c7.png" /></noscript-->
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Main content -->
    <!--section class="content"-->
    <!-- Small boxes (Stat box) -->
    <!--div class="row">
        <div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <!--div class="small-box bg-aqua-active">
        <div class="inner">
            <h3>140</h3>
            <p>New Orders</p>
        </div>
        <div class="icon">
            <i class="ion ion-bag"></i>
        </div>
        <a href="#" class="small-box-footer">Mais Informações <i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div><!-- ./col -->
    <!--div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <!--div class="small-box bg-aqua-active">
        <div class="inner">
            <h3>53<sup style="font-size: 20px">%</sup></h3>
            <p>Bounce Rate</p>
        </div>
        <div class="icon">
            <i class="ion ion-stats-bars"></i>
        </div>
        <a href="#" class="small-box-footer">Mais Informações  <i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div><!-- ./col -->
    <!--div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <!--div class="small-box bg-aqua-active">
        <div class="inner">
            <h3>44</h3>
            <p>User Registrations</p>
        </div>
        <div class="icon">
            <i class="ion ion-person-add"></i>
        </div>
        <a href="#" class="small-box-footer">Mais Informações <i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div><!-- ./col -->
    <!--div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <!--div class="small-box bg-aqua-active">
        <div class="inner">
            <h3>65</h3>
            <p>Unique Visitors</p>
        </div>
        <div class="icon">
            <i class="ion ion-pie-graph"></i>
        </div>
        <a href="#" class="small-box-footer">Mais Informações <i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div><!-- ./col -->
    <!--/div><!-- /.row -->
    <!-- /.row (main row) -->

    <!--/section>


    <div class="body-content">

        <div class="row">
            <div class="col-lg-4">
                <h2>Informações</h2>

                <p align="justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    fugiat nulla pariatur.</p>

                <p><a class="btn btn-default" href="http://www.yiiframework.com/doc/">Yii Documentation &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Portal IFNMG</h2>

                <p align="justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    fugiat nulla pariatur.</p>

                <p><a class="btn btn-default" href="http://www.ifnmg.edu.br/januaria">Yii Forum &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <h2>Informações</h2>

                <p align="justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                    fugiat nulla pariatur.</p>

                <p><a class="btn btn-default" href="http://www.yiiframework.com/extensions/">Yii Extensions &raquo;</a></p>
            </div>
        </div>

    </div-->
</div>
<style>
    .sigpex-link-box {
        background: none repeat scroll 0 0 #fff;
        border-radius: 2px;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        display: block;
        margin-bottom: 15px;
        min-height: 70px;
        width: 100%;
        border: 1px solid #ddd;
        position:relative;
    }
    .sigpex-link-box-icon {
        background: none repeat scroll 0 0 rgba(0, 0, 0, 0.2);
        border-radius: 2px 0 0 2px;
        display: block;
        float: left;
        font-size: 25px;
        height: 70px;
        line-height: 70px;
        text-align: center;
        width: 50px;
    }
    .sigpex-link-box-content {
        margin-left: 50px;
        padding: 2px 3px;
    }
    .sigpex-link-box-text {
        text-transform: uppercase;
        display: block;
        font-size: 12px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .sigpex-link-box-number {
        display: block;
        font-size: 20px;
        font-weight: bold;
    }
    .sigpex-link-box-desc {
        color:#aaa;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        display: block;
    }
    .sigpex-link-box-bottom {
        position:absolute;
        bottom:5px;
        right:6px;
    }
</style>