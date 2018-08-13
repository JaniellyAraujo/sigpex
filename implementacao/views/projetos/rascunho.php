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
use yii\widgets\ActiveForm;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjetosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->params['breadcrumbs'][] = $this->title;
?>
<?php
//$model = $this->findModel($id);
$form = ActiveForm::begin([
            'action' => Url::toRoute('projetos/index/gerar'),
            'method' => 'get',
        ]);
?><br>
<div class="projetos-index">



    <?php //echo $this->render('_search', ['model' => $searchModel]); ?>

    <div class="panel panel-info">
        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-list-ul"></i> Listagem de Projetos Não Enviados</h5>
        </div>

        <div class="box-body">

            <div class="pull-right">       

                <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['projetos/index'], ['class' => 'btn btn-social btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar', 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3]) ?>
                <?= Html::a('<b class="fa fa-plus"></b> Novo', ['create'], ['class' => 'btn btn-social btn-success']) ?>
                <?= Html::a('<b class="fa fa-download"></b>', ['gerar'], ['target' => '_blank', 'class' => 'btn btn-default', 'title' => 'Exportar', 'id' => 'modal-btn-pdf']) ?>
            </div><br>
            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
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
                        /*[
                        'attribute' => 'Status',
                        'value' => 'Status',
                        'format' => 'raw',
                        'contentOptions' => ['class' => 'text-center'],
                        'headerOptions' => ['style' => 'width: 10%;'],
                        'value' => function ($data) {
                            if ($data->isAtivo == 2) {
                                $icon = '<span class="btn btn-primary btn-xs" role="button" title = "Clique para Enviar",> Enviar </span> '
                                        . ' <label class="badge bagde-success"></label> ';
                                $label = $icon;
                                $url = Yii::$app->urlManager->createUrl(["/projetos/submeter", "id" => $data->id]);
                                return Html::a($label, $url);
                            } else if ($data->isAtivo == 0) {
                                $icon = ' <label class="badge bagde-success ">Enviado</label> ';
                                $label = $icon;
                                // $url = Yii::$app->urlManager->createUrl([""]);
                                return Html::a($label);
                            }
                        },
                    ],
                    /* [
                      'label' => 'Ação',
                      'visible' => ((\Yii::$app->user->can('servidor'))),
                      'format' => 'raw',
                      'value' => function ($data) {
                      return Html::a('Visualizar', ['projetos/visualizar', 'id' => $data->id], ['class' => 'profile-link']);
                      },
                      ],
                      //['class' => 'yii\grid\ActionColumn'],
                      ['class' => 'yii\grid\ActionColumn', 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3,
                      'header' => "Ações",
                      'template' => '{view} {update}',
                      'buttons' => [
                      'view' => function ($url) {
                      return Html::a('', $url, ['title' => 'Visualisar Projeto', 'class' => 'glyphicon glyphicon-eye-open']);
                      },
                      'update' => function ($url) {
                      return Html::a('', $url, ['title' => 'Editar Projeto', 'class' => 'glyphicon glyphicon-pencil']);
                      },

                      ]
                      ], */
                        ['class' => 'yii\grid\ActionColumn', 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3,
                        'header' => "Ações",
                        'headerOptions' => ['style' => 'width: 25%;'],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => "{view} {status} {update} {delete} ", // altera a forma de exibição dos botões
                        'buttons' => [
                            'view' => function ($url, $model) {
                                return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualizar',
                                            'class' => 'btn btn-info',
                                ]);
                            },
                            'status' => function ($url, $data) {
                                if ($data->isAtivo == 0) {
                                    $icon = '<span class="btn btn-success " role="button" title = "Enviar",><i class="fa fa-send (alias)" /n ></i> </span> '; //fa-history
                                    $label = $icon;
                                    $url = Yii::$app->urlManager->createUrl(["/projetos/submeter", "id" => $data->id]);
                                    return Html::a($label, $url);
                                }
                            },
                            'update' => function ($url, $model) {
                                return Html::a('<i class="fa  fa-eyedropper fa fa-white"></i>', $url, ['title' => 'Editar',
                                            'class' => 'btn btn-primary',
                                ]);
                            },
                            'delete' => function ($url, $model) {
                                return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Excluir',
                                            'class' => 'btn btn-danger',
                                            'data-confirm' => 'Tem certeza de que deseja excluir este item?', // altera a mensagem de confirmação
                                            'data-method' => 'post',
                                ]);
                            }
                        ]
                    ],
                ],
                  
            ]);
            ?>         



            <!--div class="form-group">
            <!--?= Html::submitButton('Gerar Relatório', ['class' => 'btn btn-primary']) ?>
          </div-->
            <!--a href="gerar" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a-->

            <div class="box-footer"></div>
        </div>
    </div>
</div>
