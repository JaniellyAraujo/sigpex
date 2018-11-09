<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DeclaracaoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>

<div class="panel panel-info">
    <div class="panel-heading">
        <h5 class="panel-title"><i class="fa fa-file-text (alias)"></i> Lista de Declarações Emitidas</h5>
    </div>

    <div class="box-body">
        <div class="pull-right">
            <?= Html::a(Yii::t('app', '<b class="fa fa-file-text (alias)"></b> Novo'), ['create'], ['class' => 'btn btn-social btn-success']) ?>
        </div><br>

        <?=
        GridView::widget([
            'dataProvider' => $dataProvider,
            //'filterModel' => $searchModel,
            'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
            'columns' => [
                    [
                    'class' => 'kartik\grid\ExpandRowColumn',
                    //'width' => '50px','width' => '50px',
                   // 'defaultHeaderState'=>FALSE,
                    'defaultHeaderState'=>['expandIcon'=>false,
                        'collapseIcon'=>false,],
                    'value' => function ($model, $key, $index, $column) {
                        return GridView::ROW_COLLAPSED;
                    },
                    'detail' => function ($model, $key, $index, $column) {
                        $searchModel = new \app\models\DeclaracaoProjetoSearch();
                        $searchModel->id_declaracao = $model->id;
                        $data = $searchModel->search(Yii::$app->request->queryParams);

                        return Yii::$app->controller->renderPartial('_declaracao', [
                                    'searchModel' => $searchModel,
                                    'dataProvider' => $data,
                        ]);
                    },
                //'headerOptions' => ['class' => 'kartik-sheet-style'] 
                //'expandOneOnly' => true
                ],
                // 'id',
               // 'projeto.titulo',
                    [
                        'attribute' => 'projeto.titulo',
                        'header' => 'Projeto',
                       // 'value' => 'projetos.modalidade',
                        'headerOptions' => [
                            'class' => 'color:3c8dbc',
                    ],
                    ],
                   
                    [
                        'attribute' => 'projeto.dataInicio',
                        'format' => 'raw',
                        'value' => function ($model) {
                            if ($model->projeto->dataInicio != null) {
                                return Yii::$app->formatter->asDate($model->projeto->dataInicio);
                            } else {
                                return 'Não informado';
                            }
                        },
                    ],
                        [
                        'attribute' => 'projeto.datafim',
                        'format' => 'raw',
                        'value' => function ($model) {
                            if ($model->projeto->datafim != null) {
                                return Yii::$app->formatter->asDate($model->projeto->datafim);
                            } else {
                                return 'Não informado';
                            }
                        },
                    ],
                    
                    [
                    'class' => 'yii\grid\ActionColumn',
                    'header' => "Ações",
                    'headerOptions' => ['class' => 'CustomHeadClass '],
                    'contentOptions' => ['class' => 'text-center'],
                    'template' => "{update} ", // altera a forma de exibição dos botões
                    'buttons' => [
                        
                        'view' => function ($url, $model) {
                            return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualizar',
                                        'class' => 'btn btn-info',
                            ]);
                        },
                        'update' => function ($url, $model) {
                            return Html::a('<i class="fa fa-pencil fa fa-white"></i>', ['declaracao/salvar?id=' . $model->id], ['title' => 'Editar',
                                        'class' => 'btn btn-success',
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
                ]
            ],
        ]);
        ?>
    </div>
</div>
<style>
    .CustomHeadClass {
        text-align:center;
    }
</style>