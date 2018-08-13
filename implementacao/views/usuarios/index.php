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
use kartik\grid\GridView;


/* @var $this yii\web\View */
/* @var $searchModel app\models\UsuariosSearch */

?>
<div class="usuarios-index">

    <div class="panel panel-info">

        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-user"></i> Listagem de Usuário</h5>
        </div>

        <div class="box-body">
            <div class="pull-right">       

                <?= Html::a('<b class="fa fa-plus"></b> Novo', ['create'], ['class' => 'btn btn-success']) ?>

            </div><br>
            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                //'filterModel' => $searchModel,
                //'summary' => '',
                //'layout'=> "{summary}\n{items}\n{pager}",
                'responsive'=>true,

                'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                'columns' => [
                    'nome',
                    'cpf',
                        [
                        'attribute'=> 'role',
                        'format' => 'raw',
                        'value' => function($data) {
                            if ($data->role == 1) {
                                return 'Administrador';
                            }
                            if ($data->role == 2) {
                                return 'Coordenador';
                            }
                            if ($data->role == 3) {
                                return 'Servidor';
                            }
                            if ($data->role == 4) {
                                return 'Discente';
                            }
                        }],
                                
                                
                
                                
                    'email:email',
                        [
                        'attribute'=> 'isAtivo',
                        'format' => 'raw',
                        'contentOptions' => ['class' => 'text-center'],
                        'headerOptions' => ['style' => 'width: 10%;'],
                        'value' => function ($data) {
                            if ($data->isAtivo == 0) {
                                $icon = '<span class="btn btn-warning btn-xs" title = "Aprovar Usuário",role="button"> Novo </span> '
                                        . ' <label class="badge bagde-danger"></label> ';
                                $label = $icon;
                                $url = Yii::$app->urlManager->createUrl(["/usuarios/ativar", "id" => $data->id]);
                                return Html::a($label, $url);
                            } else if ($data->isAtivo == 1) {
                                $icon = '<span class="btn btn-success btn-xs" title = "Desativar Usuário" role="button"> Ativo </span> '
                                        . ' <label class="badge bagde-success"></label> ';
                                $label = $icon;
                                $url = Yii::$app->urlManager->createUrl(["/usuarios/desativar", "id" => $data->id]);
                                return Html::a($label, $url);
                            } else if ($data->isAtivo == 2) {
                                $icon = '<span class="btn btn-danger btn-xs" title = "Reativar Usuário" role="button"> Desativado </span> '
                                        . ' <label class="badge bagde-danger"></label> ';
                                $label = $icon;
                                
                                $url = Yii::$app->urlManager->createUrl(["/usuarios/reativar", "id" => $data->id]);
                                
                                return Html::a($label, $url);
                               
                            }
                        },
                    ],
                    //['class' => 'yii\grid\ActionColumn'],
                    /* ['class' => 'yii\grid\ActionColumn',
                      'header' => "Ações",
                      'template' => '{view} {update}',
                      'buttons' => [
                      'view' => function ($url, $model, $key) {
                      return Html::a('', $url, ['title' => 'Visualisar Usuário', 'class' => 'glyphicon glyphicon-eye-open']);
                      },
                      'update' => function ($url, $model, $key) {
                      return Html::a('', $url, ['title' => 'Editar Usuário', 'class' => 'glyphicon glyphicon-user']);
                      },
                      /*'delete' => function ($url, $model, $key) {
                      return Html::a('', $url, ['title' => 'Excluir Usuário',
                      'class' => 'glyphicon glyphicon-trash',
                      'data' => [
                      'confirm' => Yii::t('app', 'Confirma exclusão de usuário?'),
                      'method' => 'post']
                      ]);
                      }
                      ]
                      ], */
                        [
                        'class' => 'yii\grid\ActionColumn',
                        'header' => "Ações",
                        'headerOptions' => ['style' => 'width: 15%;'],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => "{view} {update}  {delete}", // altera a forma de exibição dos botões
                        'buttons' => [
                            'view' => function ($url, $model) {
                                return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualisar Usuário',
                                            'class' => 'btn btn-info',
                                ]);
                            },
                            'update' => function ($url, $model) {
                                return Html::a('<i class="fa fa-user fa fa-white"></i>', $url, ['title' => 'Editar Usuário',
                                            'class' => 'btn btn-primary',
                                ]);
                            },
                            'delete' => function ($url, $model) {
                                return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Não Permitido',
                                            'class' => 'btn btn-danger disabled ',
                                            'data-confirm' => 'Tem certeza de que deseja excluir este item?', // altera a mensagem de confirmação
                                            'data-method' => 'post',
                                ]);
                            }
                        ]
                    ]
                ],
            ]);
            ?>
        </div> 


    </div>
</div>
