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

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjetosSearchh */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>
<div class="projetos-aprovados">

    <h3 class="box-title"><i class="fa fa-list-ul"></i> Gerenciar Projetos</h3>

    <div class="panel panel-info">

        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-folder-open"></i> Projetos em Andamento</h5>
        </div>

        <div class="panel-body">
            <div class="table-responsive">
            <div class="pull-right" >
                <!--div class="btn-group" >
                    <button type="button" class="btn  btn-primary  "><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><b class="fa fa-list-alt"></b> Projetos</font></font> </button>
                    <button type="button" class="btn btn-primary  dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Alternar o menu suspenso</font></font></span>
                    </button>
                    <div class="dropdown-menu" role="menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(57px, 42px, 0px);">
                        <-?= Html::a('<b class="fa fa-folder"></b> Arquivados', ['projetos/encerrados'], ['class' => 'btn btn-social btn-primary', 'title' => 'Projetos Encerrados ', 'id' => 'modal-btn-encerrados']) ?>
                        <--?= Html::a('<b class="fa fa-exclamation-circle"></b> Analisar Novos', ['projetos/solicitacao'], ['class' => 'btn btn-social btn-primary margin', 'title' => 'Analisar Projetos', 'id' => 'modal-btn-encerrados']) ?>
                        <--?= Html::a('<b class="fa fa-pencil-square-o"></b> Solicitado Modificação', ['projetos/modificar'], ['class' => 'btn btn-social btn-primary ', 'title' => 'Projetos a serem Modificados', 'id' => 'modal-btn-encerrados']) ?>

                        <div class="dropdown-divider"></div>
                    </div>
                </div-->
                <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['projetos/solicitacao'], ['class' => 'btn btn-social btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar']) ?>
                <?= Html::a('<b class="fa fa-plus"></b> Novo', ['create'], ['class' => 'btn btn-social btn-success', 'title' => 'Cadastrar Projeto']) ?>
               <?= Html::a('<b class="fa fa-folder"></b> Arquivados', ['projetos/encerrados'], ['class' => 'btn btn-social btn-bitbucket ', 'title' => 'Projetos Encerrados ', 'id' => 'modal-btn-encerrados']) ?>
                        
 <?= Html::a('<b class="fa fa-download"></b>', ['gerar'], ['target' => '_blank', 'class' => 'btn btn-default', 'title' => 'Exportar', 'id' => 'modal-btn-pdf']) ?>


            </div><br>

            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                //'filterModel' => $searchModel,
                'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                'columns' => [
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
                    'modalidade',
                        ['class' => 'yii\grid\ActionColumn',
                        'header' => "Ações",
                        'headerOptions' => ['style' => 'width: 25%;'],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => ' {view} {status} ',
                        'buttons' => [
                            'status' => function ($url, $data) {
                                if ($data->isAtivo == 2) {
                                    $icon = '<span class="btn btn-bitbucket " role="button" title = "Encerrar e Arquivar"><i class="fa fa-folder-open fa fa-white"></i> </span> '; //fa-history
                                    $label = $icon;
                                    $url = Yii::$app->urlManager->createUrl(["/projetos/encerrar", "id" => $data->id]);
                                    return Html::a($label, $url);
                                }
                            },
                            'view' => function ($url, $model) {
                                return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualisar Projeto',
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