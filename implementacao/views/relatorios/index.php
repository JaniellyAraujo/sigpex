<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\RelatoriosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>
<h3 class="box-title"><i class="fa fa-list-ul"></i> Gerenciar Relatórios</h3>
<div class="panel panel-info">


        <div class="panel-heading">
                <h5 class="panel-title"><i class="fa fa-file-text"></i> Relatórios de Projetos em Andamento</h5>
            
            
        </div>

        <div class="box-body">
            <div class="pull-right">       

                <?= Html::a('<b class="fa fa-plus"></b> Novo', ['create'], ['class' => 'btn btn-success']) ?>
                <?= Html::a('<b class="fa fa-folder"></b> Arquivados', ['relatorios/arquivados'], ['class' => 'btn btn-social btn-primary ', 'title' => 'Projetos Encerrados ', 'id' => 'modal-btn-encerrados']) ?>


            </div><br>
    <!--?php $rCount = app\models\Relatorios::find()->where(['projeto_id' =>'id', 'tipo' => 1])->count();?>
    < ?php $rCount = app\models\Relatorios::find()->where(['projeto_id' =>'id', 'tipo' => 2])->count();?-->
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],
            [
                        'class' => 'kartik\grid\ExpandRowColumn',
                        //'width' => '50px','width' => '50px',
                        'value' => function ($model, $key, $index, $column) {
                            return GridView::ROW_COLLAPSED;
                        },
                        'detail' => function ($model, $key, $index, $column) {
                            $searchModel = new \app\models\RelatoriosSearch();
                            $searchModel->id = $model->id;
                            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
                            
                            return Yii::$app->controller->renderPartial('_relatorio', [
                                'searchModel' => $searchModel,
                                'dataProvider' => $dataProvider,
                            ]);
                        },
                        //'headerOptions' => ['class' => 'kartik-sheet-style'] 
                        //'expandOneOnly' => true
                    ],            
            //'id',
            //'projeto_id',
            [
              'attribute'  => 'projeto_id',
              'value' => 'projetos.titulo',
              
            ],
            [
              'attribute'  => 'projeto_id',
              'header'  => 'Modalidade',
              'value' => 'projetos.modalidade',
                'headerOptions' => [
                            'class' => 'CustomHeadClass ',
                            ],
                'contentOptions' => ['class' => 'text-center'],
            ],
                                
          
            //'discente',
            //'tipo',
            //'dataEntrega',
            //'mes',

            [
                        'class' => 'yii\grid\ActionColumn',
                        'header' => "Ações",
                        //'headerOptions' => ['style' => 'width: 15%;'],
                        'headerOptions' => [
                            'class' => 'CustomHeadClass ',
                            ],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => " {update} {arq}", // altera a forma de exibição dos botões
                        'buttons' => [
                            'arq' => function ($url, $model) {
                                return Html::a('<span class="btn btn-primary " role="button" title = "Arquivar"><i class="fa fa-folder fa fa-white" /n ></i></span> ', ['relatorios/arquivar', 'id' => $model->id], ['class' => 'profile-link']);
                                
                            },
                            'update' => function ($url, $model) {
                                return Html::a('<i class="fa fa-plus fa fa-white"></i>', $url, ['title' => 'Adicionar Relatório',
                                            'class' => 'btn btn-success',
                                ]);
                                
                            },
                            'delete' => function ($url, $model) {
                                 if (Yii::$app->user->identity->role == 1) {
                                return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Não Permitido',
                                            'class' => 'btn btn-danger disabled ',
                                            'data-confirm' => 'Tem certeza de que deseja excluir este item?', // altera a mensagem de confirmação
                                            'data-method' => 'post',
                                ]);
                            }
                          }
                        ]
                    ]
        ],
    ]); ?>
</div>
    </div>
<style>
     .CustomHeadClass {
    color: #3c8dbc;
    width: 15%;
    text-align:center;
    }

</style>