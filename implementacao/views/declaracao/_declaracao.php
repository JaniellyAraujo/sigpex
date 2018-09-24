<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DeclaracaoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

?>
<div class="panel panel-default">

        <div class="panel-heading">
                <h5 class="panel-title"><i class="fa fa-file-text"></i> Declarações Emitidas</h5>
            
            
        </div>

        <div class="box-body">

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'summary' => '',
        'columns' => [
            
            [
                'label' => 'Participante',
                'headerOptions' => ['class' => 'CustomHeadClass'],
                'contentOptions' => ['class' => 'text-center'],
                'value' => 'participante',
            ],
       
            [
                'header' => 'Data de Emissão',
                'headerOptions' => ['class' => 'CustomHeadClass'],
                'contentOptions' => ['class' => 'text-center'],
                'attribute' => 'dataEmissao',
                'format' => 'raw',
                'value' => function ($model) {
                    if ($model->dataEmissao != null) {
                        //return Yii::$app->formatter->asDate($model->dataEmissao);
                        return Html::encode(Yii::$app->formatter->asDate($model->dataEmissao));
                         
                    } else {
                        return 'Não informado';
                    }
                },
            ],
                        [
                        'class' => 'yii\grid\ActionColumn',
                        'header' => "Ações",
                        //'headerOptions' => ['style' => 'width: 15%;'],
                        'headerOptions' => [
                            'class' => 'CustomHeadClass ',
                            ],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => " {view}", // altera a forma de exibição dos botões
                        'buttons' => [
                            'view' => function ($url, $data) {
                                return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualizar',
                                                'class' => 'btn btn-info',
                                    ]);
                                
                            },
                            
                            
                          
                        ]
                    ]
        ],
    ]); ?>
</div></div>

<style>
     .CustomHeadClass {
    color: #3c8dbc;
    width: 20%;
    text-align:center;
    }

</style>

