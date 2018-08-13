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
/* @var $model app\models\Projetos */
?><br>
<div class="projetos-index">

    <?php //echo $this->render('_search', ['model' => $searchModel]);  ?>

    <div class="panel panel-info">
        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-list-ul"></i> Listagem de Projetos</h5>
        </div>

        <div class="box-body">

            <div class="pull-right">

                <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['site/servidor'], ['class' => 'btn  btn-social btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar', 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3]) ?>
                <?= Html::a('<b class="fa fa-plus"></b> Novo', ['create'], ['class' => 'btn btn  btn-social btn-success']) ?>
                <?= Html::a('<b class="fa fa-pencil-square-o"></b> Rascunhos', ['rascunho'], ['class' => 'btn  btn-social btn-bitbucket']) ?>
                <?= Html::a('<b class="fa fa-download"></b>', ['gerar'], ['target' => '_blank', 'class' => 'btn btn-default', 'title' => 'Exportar', 'id' => 'modal-btn-pdf']) ?>
            </div><br>
            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                'rowOptions' => function($model) {
                    if ($model->isAtivo == '2') { //EM ANDAMENTO
                        return ['class' => 'success'];
                    } else if (($model->isAtivo == '3') || ($model->isAtivo == '4')) {
                        return ['class' => 'danger'];
                    } else if ($model->isAtivo == '0') {
                        return ['class' => 'active'];
                    } else if ($model->isAtivo == '5') {
                        return ['class' => 'info'];
                    } else if ($model->isAtivo == '1') {
                        return ['class' => 'warning'];
                    }
                },
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
                        [
                        'attribute' => 'isAtivo',
                        'value' => 'Status',
                        'format' => 'raw',
                        'contentOptions' => ['class' => 'text-center'],
                        'headerOptions' => ['style' => 'width: 10%;'],
                        'value' => function ($data) {
                            if ($data->isAtivo == 2) {
                                $icon = ' <label class="badge bg-green "> Em Andamento</label> ';
                                $label = $icon;
                                return Html::a($label);
                            } else if ($data->isAtivo == 3) {
                                //$icon =  ' <label class="badge bg-danger">Solicitado Modificação</label> ';
                                $icon = ' <label class="badge bg-red "> Solicitado Modificação</label> ';

                                $label = $icon;
                                return Html::a($label);
                            } else if ($data->isAtivo == 4) {
                                $icon = ' <label class="badge bg-olive">Modificado</label> ';


                                $label = $icon;
                                return Html::a($label);
                            } else if ($data->isAtivo == 1) {
                                $icon = ' <label class="badge bg-orange ">Em Análise</label> ';
                                $label = $icon;
                                return Html::a($label);
                            } else if ($data->isAtivo == 0) {
                                $icon = ' <label class="badge bg-purple">Rascunho</label> ';
                                $label = $icon;
                                return Html::a($label);
                            } else if ($data->isAtivo == 5) {
                                $icon = ' <label class="badge bg-blue ">Encerrado</label> ';
                                $label = $icon;
                                return Html::a($label);
                            }
                        },
                    ],
                        ['class' => 'yii\grid\ActionColumn',
                        'header' => "Ações",
                        'headerOptions' => ['style' => 'width: 25%;'],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => '{view} {status} {visualizar} {update} {modificar} {teste} ',
                        'buttons' => [
                            'teste' => function ($url, $data) {
                                if ($data->isAtivo == 0) {
                                    return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Excluir',
                                                'class' => 'btn btn-danger',
                                                'data-confirm' => 'Tem certeza de que deseja excluir este item?', // altera a mensagem de confirmação
                                                'data-method' => 'post',
                                    ]);
                                }
                            },
                            'status' => function ($url, $data) {
                                if ($data->isAtivo == 0) {
                                    $icon = '<span class="btn btn-success " role="button" title = "Enviar",><i class="fa fa-send (alias)" /n ></i> </span> '; //fa-history
                                    $label = $icon;
                                    $url = Yii::$app->urlManager->createUrl(["/projetos/submeter", "id" => $data->id]);
                                    return Html::a($label, $url);
                                }
                            },
                            'modificar' => function ($url, $data) {
                                if ($data->isAtivo == 3) {
                                    return Html::a('<span class="btn btn-primary " role="button" title = "Modificar"><i class="fa fa-eyedropper fa fa-white" /n ></i></span> ', ['projetos/update2', 'id' => $data->id], ['class' => 'profile-link']);
                                }
                            },
                            'visualizar' => function ($url, $data) {
                                if ($data->isAtivo == 3) {
                                    return Html::a('<span class="btn btn-info " role="button" title = "Visualizar"><i class="fa fa-eye fa fa-white" /n ></i></span> ', ['projetos/visualizar', 'id' => $data->id], ['class' => 'profile-link']);
                                }
                            },
                            'view' => function ($url, $data) {
                                if ($data->isAtivo != 3) {
                                    return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualisar Projeto',
                                                'class' => 'btn btn-info',
                                    ]);
                                }
                            },
                            'update' => function ($url, $data) {
                                if ($data->isAtivo == 0) {
                                    return Html::a('<i class="fa  fa-eyedropper fa fa-white"></i>', $url, ['title' => 'Editar Projeto',
                                                'class' => 'btn btn-primary',
                                    ]);
                                }
                            },
                        ]
                    ],
                ],
            ]);
            ?>
            <div class="box-footer"></div>
        </div>
    </div>
</div>


