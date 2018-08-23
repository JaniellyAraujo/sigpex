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

    <?php if (\app\models\Projetos::find()->where(['isAtivo' => 1])) { ?> 
        <div class="alert alert-warning" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="alert-heading">Atenção!</h4>
            
            <span class="sigpex-link-box-text"><strong> Existem </strong></span>
            <span class="sigpex-link-box-number"><strong><?= \app\models\Projetos::find()->where(['isAtivo' => 1])->count(); ?></strong></span>
            <span class="mb-0"><strong> novos projetos para serem analisados. </strong></span>  
                                                      
        </div>
    <?php } ?>
        <?php if (\app\models\Projetos::find()->where(['isAtivo' => 4])) { ?> 
        <div class="alert alert-success" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="alert-heading">Atenção!</h4>
            
            <span class="sigpex-link-box-text"><strong> Existem </strong></span>
            <span class="sigpex-link-box-number"><strong><?= \app\models\Projetos::find()->where(['isAtivo' => 4])->count(); ?></strong></span>
            <span class="mb-0"><strong> novas versões de projetos para serem analisadas. </strong></span>  
                                                      
        </div>
    <?php } ?>
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
                        'coordenador',
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
                            'headerOptions' => ['style' => 'width: 10%;'],
                            'value' => function ($data) {
                                if ($data->isAtivo == 1) {
                                    $icon = ' <label class="badge bg-orange  ">Novo</label> ';
                                    $label = $icon;
                                    return Html::a($label);
                                } else if ($data->isAtivo == 4) {
                                    $icon = ' <label class="badge bg-olive">Modificado</label> ';
                                    $label = $icon;
                                    return Html::a($label);
                                } else if ($data->isAtivo == 3) {
                                    $icon = ' <label class="badge bg-red  ">Solicitado Modificação</label> ';
                                    $label = $icon;
                                    return Html::a($label);
                                } else if ($data->isAtivo == 2) {
                                    $icon = ' <label class="badge bg-blue  ">Reitoria</label> ';
                                    $label = $icon;
                                    return Html::a($label);
                                }
                            },
                        ],
                            [
                            'class' => 'yii\grid\ActionColumn',
                            'header' => "Ações",
                            'headerOptions' => ['style' => 'width: 25%;'],
                            'contentOptions' => ['class' => 'text-center'],
                            'template' => "{view} {visualizar} {aprovar} {status} {reitoria}  ", // altera a forma de exibição dos botões
                            'buttons' => [
                                'view' => function ($url, $data) {
                                    if (($data->isAtivo == 1) || ($data->isAtivo == 2)) {
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
                                'reitoria' => function ($url, $data) {
                                    if (($data->isAtivo == 1) || ($data->isAtivo == 4)) {
                                        $icon = '<span class="btn btn-primary " role="button" title = "Enviar para Reitoria",><i class="fa fa-university" /n ></i> </span> '; //fa-history
                                        $label = $icon;
                                        $url = Yii::$app->urlManager->createUrl(["/projetos/reitoria", "id" => $data->id]);
                                        return Html::a($label, $url);
                                    }
                                },
                                'status' => function ($url, $data) {
                                    if (($data->isAtivo == 1) || ($data->isAtivo == 4)) {
                                        $icon = '<span class="btn btn-danger " role="button" title = "Solicitar Modificação",><i class="fa fa-pencil-square-o" /n ></i> </span> '; //fa-history
                                        $label = $icon;
                                        $url = Yii::$app->urlManager->createUrl(["/projetos/update1", "id" => $data->id]);
                                        return Html::a($label, $url);
                                    }
                                },
                                'aprovar' => function ($url, $data) {
                                    if ($data->isAtivo == 2) {
                                        $icon = '<span class="btn btn-success " role="button" title = "Aprovar Projeto",><i class="fa fa-check-square-o" /n ></i> </span> '; //fa-history
                                        $label = $icon;
                                        $url = Yii::$app->urlManager->createUrl(["/projetos/aprovar", "id" => $data->id]);
                                        return Html::a($label, $url);
                                    }
                                },
                            ]
                        ]
                    ],
                ]);
                ?>
            </div>
        </div>
    </div>
</div>




