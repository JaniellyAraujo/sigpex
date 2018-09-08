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

use yii\helpers\Html;
use yii\grid\GridView;

//use ercling\pace\PaceWidget;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjetosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>
<!--?php ercling\pace\PaceWidget::widget()?-->
<div class="projetos-solicitacao">
    <div class="row">
        <div class="table-responsive">
            <?php if (\app\models\Projetos::find()->where(['isAtivo' => 1])->count() != 0) { ?> 


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="sigpex-link-box bg-gray-active">
                        <span class="sigpex-link-box-icon bg-orange"><div class="grow"><i class="fa fa-exclamation-triangle"></i></div></span>
                        <div class="sigpex-link-box-content">
                            <span class="sigpex-link-box-text"><strong> Novos</strong></span>
                            <span class="sigpex-link-box-text"><strong> Projetos:</strong></span>
                            <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['isAtivo' => 1])->count(); ?></span>
                            <span class="sigpex-link-box-desc"></span>
                            <span class="sigpex-link-box-bottom"></span>
                        </div><!-- /.info-box-content -->
                    </div><!-- /.info-box -->
                </div>
            <?php } ?>


            <!--?php if (\app\models\Projetos::find()->where(['isAtivo' => 2])->count() != 0) { ?> 


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="sigpex-link-box bg-gray-active">

                        <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-university"></i></div></span>
                        <div class="sigpex-link-box-content">
                            <span class="sigpex-link-box-text"><strong> Enviado a</strong></span>
                            <span class="sigpex-link-box-text"><strong> Reitoria:</strong></span>
                            <span class="sigpex-link-box-number">< ?= \app\models\Projetos::find()->where(['isAtivo' => 2])->count(); ?></span>
                            <span class="sigpex-link-box-desc"></span>
                            <span class="sigpex-link-box-bottom"></span>
                        </div><!-- /.info-box-content -->
                    <!--/div><!-- /.info-box -->
                <!--/div>
            <!?php } ?-->


            <?php if (\app\models\Projetos::find()->where(['isAtivo' => 3])->count() != 0) { ?> 


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="sigpex-link-box bg-gray-active">
                        <span class="sigpex-link-box-icon bg-red-gradient"><div class="grow"><i class="fa fa-pencil-square-o"></i></div></span>
                        <div class="sigpex-link-box-content">
                            <span class="sigpex-link-box-text"><strong> Solicitado </strong></span>
                            <span class="sigpex-link-box-text"><strong> Modificação:</strong></span>
                            <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['isAtivo' => 3])->count(); ?></span>
                            <span class="sigpex-link-box-desc"></span>
                            <span class="sigpex-link-box-bottom"></span>
                        </div><!-- /.info-box-content -->
                    </div><!-- /.info-box -->
                </div>
            <?php } ?>


            <?php if (\app\models\Projetos::find()->where(['isAtivo' => 4])->count() != 0) { ?> 


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="sigpex-link-box bg-gray-active">
                        <span class="sigpex-link-box-icon bg-blue-gradient"><div class="grow"><i class="fa fa-mail-forward"></i></div></span>
                        <div class="sigpex-link-box-content">
                            <span class="sigpex-link-box-text"><strong> Projetos</strong></span>
                            <span class="sigpex-link-box-text"><strong> Modificados:</strong></span>
                            <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['isAtivo' => 4])->count(); ?></span>
                            <span class="sigpex-link-box-desc"></span>
                            <span class="sigpex-link-box-bottom"></span>
                        </div><!-- /.info-box-content -->
                    </div><!-- /.info-box -->
                </div>
            <?php } ?>
        </div>

    </div>

    <h3 class="box-title"><i class="fa fa-list-ul"></i> Gerenciar Projetos</h3>

    <div class="panel panel-warning">
        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-exclamation-circle"></i> Projetos Pendentes</h5>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

                <?=
                GridView::widget([
                    //'filterModel' => $searchModel,
                    'dataProvider' => $dataProvider,
                    'tableOptions' => ['class' => 'table table-striped table-bordered table-responsive'],
                    'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                    'columns' => [
                        //'responsive' => true,
                        'titulo',
                        //'coordenador',
                            [
                            'attribute' => 'dataInicio',
                            'format' => 'raw',
                            'value' => function ($model) {
                                if ($model->dataInicio != null) {
                                    return Yii::$app->formatter->asDate($model->dataInicio);
                                } else {
                                    return 'Não informado';
                                }
                            },
                        ],
                            [
                            'attribute' => 'datafim',
                            'format' => 'raw',
                            'value' => function ($model) {
                                if ($model->datafim != null) {
                                    return Yii::$app->formatter->asDate($model->datafim);
                                } else {
                                    return 'Não informado';
                                }
                            },
                        ],
                            [
                            'attribute' => 'isAtivo',
                            'value' => 'Status',
                            'format' => 'raw',
                            'contentOptions' => ['class' => 'text-center'],
                            'headerOptions' => ['style' => 'width: 10%;','class' => 'text-center'],
                            'value' => function ($data) {
                                if ($data->isAtivo == 1) {
                                    $icon = ' <label class="badge bg-orange  ">Novo</label> ';
                                    $label = $icon;
                                    return Html::a($label);
                                } else if ($data->isAtivo == 4) {
                                    $icon = ' <label class="badge bg-blue">Modificado</label> ';
                                    $label = $icon;
                                    return Html::a($label);
                                } else if ($data->isAtivo == 3) {
                                    $icon = ' <label class="badge bg-red  ">Solicitado Modificação</label> ';
                                    $label = $icon;
                                    return Html::a($label);
                                } /*else if ($data->isAtivo == 2) {
                                    $icon = ' <label class="badge bg-blue  ">Reitoria</label> ';
                                    $label = $icon;
                                    return Html::a($label);
                                }*/
                            },
                        ],
                            [
                            'class' => 'yii\grid\ActionColumn',
                            'header' => "Visualizar",
                            //'headerOptions' => ['style' => 'width: 25%;'],
                             'headerOptions' => [
                            'class' => 'CustomHeadClass ',
                            ],
                            'contentOptions' => ['class' => 'text-center'],
                            'template' => "{view} {visualizar} ", // altera a forma de exibição dos botões
                            'buttons' => [
                                'view' => function ($url, $data) {
                                    if (($data->isAtivo == 1) /*|| ($data->isAtivo == 2)*/) {
                                        return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualizar',
                                                    'class' => 'btn btn-info',
                                        ]);
                                    }
                                },
                                'visualizar' => function ($url, $data) {
                                    if (($data->isAtivo == 3) || ($data->isAtivo == 4)) {
                                        return Html::a('<span class="btn btn-info " role="button" title = "Visualizar"><i class="fa fa-eye fa fa-white" /n ></i></span> ', ['projetos/visualizar', 'id' => $data->id], ['class' => 'profile-link']);
                                    }
                                },
                                /*'reitoria' => function ($url, $data) {
                                    if (($data->isAtivo == 1) || ($data->isAtivo == 4)) {
                                        $icon = '<span class="btn btn-primary " role="button" title = "Enviar para Reitoria",><i class="fa fa-university" /n ></i> </span> '; //fa-history
                                        $label = $icon;
                                        $url = Yii::$app->urlManager->createUrl(["/projetos/reitoria", "id" => $data->id]);
                                        return Html::a($label, $url);
                                    }
                                },*/
                               
                                /*'aprovar' => function ($url, $data) {
                                    if (($data->isAtivo == 1)||($data->isAtivo == 4)) {
                                        $icon = '<span class="btn btn-success " role="button" title = "Aprovar Projeto",><i class="fa fa-check-square-o" /n ></i> </span> '; //fa-history
                                        $label = $icon;
                                        $url = Yii::$app->urlManager->createUrl(["/projetos/aprovar", "id" => $data->id]);
                                        return Html::a($label, $url);
                                    }
                                },*/
                            ]
                        ]
                    ],
                ]);
                ?>
            </div>
        </div>
    </div>
</div>


<style>
    .sigpex-link-box {
        background: none repeat scroll 0 0 #fff;
        border-radius: 2px;
        box-shadow: 0 2px 2px rgba(0, 0, 0, 0.2);
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
        font-size: 35px;
        height: 75px;
        line-height: 70px;
        text-align: center;
        width: 70px;
    }
    .sigpex-link-box-content {
        margin-left: 50px;
        //margin-right:10px;
        padding: 2px 3px;
    }
    .sigpex-link-box-text {
        text-transform: uppercase;
        display: block;
        font-size: 13px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        margin-left: 30px;
    }
    .sigpex-link-box-number {
        display: block;
        font-size:25px;
        font-weight: bold;
        margin-left: 30px;
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
    .grow:hover{
        -webkit-transform: scale(1.3);
        -ms-transform: scale(1.3);
        transform: scale(1.3);
    }
    .CustomHeadClass {
        color: #3c8dbc;
        width: 15%;
        text-align:center;
    }

</style>

