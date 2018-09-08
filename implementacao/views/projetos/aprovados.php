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

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjetosSearchh */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>
<div class="projetos-aprovados">
    
    <div class="row">
        <div class="table-responsive">
            <?php if (\app\models\Projetos::find()->where(['isAtivo' => 6])->count() != 0) { ?> 
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="sigpex-link-box bg-gray-active">
                        <span class="sigpex-link-box-icon bg-orange"><div class="grow"><i class="fa fa-exclamation-triangle"></i></div></span>
                        <div class="sigpex-link-box-content">
                            <span class="sigpex-link-box-text"><strong> Projetos</strong></span>
                            <span class="sigpex-link-box-text"><strong> Encerrados:</strong></span>
                            <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['isAtivo' => 6])->count(); ?></span>
                            <span class="sigpex-link-box-desc"></span>
                            <span class="sigpex-link-box-bottom"></span>
                        </div><!-- /.info-box-content -->
                    </div><!-- /.info-box -->
                </div>
            <?php } ?>
            <?php if (\app\models\Projetos::find()->where(['isAtivo' => 5])->count() != 0) { ?> 
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="sigpex-link-box bg-gray-active">
                        <span class="sigpex-link-box-icon bg-green-gradient"><div class="grow"><i class="fa fa-file"></i></div></span>
                        <div class="sigpex-link-box-content">
                            <span class="sigpex-link-box-text"><strong> Projetos</strong></span>
                            <span class="sigpex-link-box-text"><strong> Em Andamento:</strong></span>
                            <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['isAtivo' => 5])->count(); ?></span>
                            <span class="sigpex-link-box-desc"></span>
                            <span class="sigpex-link-box-bottom"></span>
                        </div><!-- /.info-box-content -->
                    </div><!-- /.info-box -->
                </div>
            <?php } ?>
        </div></div>
    <h3 class="box-title"><i class="fa fa-list-ul"></i> Gerenciar Projetos</h3>

    <div class="panel panel-info">

        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-folder-open"></i> Projetos em Andamento</h5>
        </div>

        <div class="panel-body">
            <div class="table-responsive">
                <div class="pull-right" >
                    <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['projetos/solicitacao'], ['class' => 'btn btn-social btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar']) ?>
                    <?= Html::a('<b class="fa fa-plus"></b> Novo', ['create'], ['class' => 'btn btn-social btn-success', 'title' => 'Cadastrar Projeto']) ?>
                    <?= Html::a('<b class="fa fa-folder"></b> Arquivados', ['projetos/arquivados'], ['class' => 'btn btn-social btn-bitbucket ', 'title' => 'Projetos Encerrados ', 'id' => 'modal-btn-encerrados']) ?>

                    <?= Html::a('<b class="fa fa-download"></b>', ['gerar'], ['target' => '_blank', 'class' => 'btn btn-default', 'title' => 'Exportar', 'id' => 'modal-btn-pdf']) ?>


                </div><br>

                <?=
                GridView::widget([
                    'dataProvider' => $dataProvider,
                    //'filterModel' => $searchModel,
                    'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                    'columns' => [
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
                        'modalidade',
                                    
                        [
                        'attribute' => 'isAtivo',
                        'value' => 'Status',
                        'format' => 'raw',
                        'contentOptions' => ['class' => 'text-center'],
                        'headerOptions' => ['style' => 'width: 10%;'],
                        'value' => function ($data) {
                            if ($data->isAtivo == 5) {
                                $icon = ' <label class="badge bg-green "> Em Andamento</label> ';
                                $label = $icon;
                                return Html::a($label);
                            } else if ($data->isAtivo == 6) {
                                $icon = ' <label class="badge bg-blue ">Encerrado</label> ';
                                $label = $icon;
                                return Html::a($label);
                            }
                        },
                    ],
                            ['class' => 'yii\grid\ActionColumn',
                            'header' => "Visualizar",
                            'headerOptions' => [
                                'class' => 'CustomHeadClass ',
                            ],
                            'contentOptions' => ['class' => 'text-center'],
                            'template' => ' {view}  ',
                            'buttons' => [
                                /*'status' => function ($url, $data) {
                                    if ($data->isAtivo == 6) {
                                        $icon = '<span class="btn btn-bitbucket " role="button" title = "Arquivar"><i class="fa fa-folder-open fa fa-white"></i> </span> '; //fa-history
                                        $label = $icon;
                                        $url = Yii::$app->urlManager->createUrl(["/projetos/arquivar", "id" => $data->id]);
                                        return Html::a($label, $url);
                                    }
                                },*/
                                'view' => function ($url, $model) {
                                    return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualizar',
                                                'class' => 'btn btn-info',
                                    ]);
                                },
                                'update' => function ($url, $model) {
                                    return Html::a('<i class="fa  fa-eyedropper fa fa-white"></i>', $url, ['title' => 'Editar Projeto',
                                                'class' => 'btn btn-success disabled',
                                    ]);
                                },
                                'delete' => function ($url, $model) {
                                    return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Excluir Status do Projeto',
                                                'class' => 'btn btn-danger disabled',
                                                'data-confirm' => 'Tem certeza de que deseja excluir este item?', // altera a mensagem de confirmação
                                                'data-method' => 'post',
                                    ]);
                                },
                            ]
                        ],
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