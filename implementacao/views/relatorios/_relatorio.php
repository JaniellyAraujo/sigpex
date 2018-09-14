<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\RelatoriosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

?>
<div class="panel panel-default">

        <div class="panel-heading">
                <h5 class="panel-title"><i class="fa fa-file-text"></i> Relatórios Entregues</h5>
            
            
        </div>

        <div class="box-body">

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'summary'=>'',
        'columns' => [
            
            [
                'label' => 'Discente',
                'attribute' => 'discente',
            ],
            [
                        'header' => 'Tipo',
                        'format' => 'raw',
                        'headerOptions' => [ 'class' => 'CustomHeadClass'],
                         'contentOptions' => ['class' => 'text-center'],
                        'value' => function($data) {
                            if ($data->tipo == 1) {
                                return 'Mensal';
                            }
                            if ($data->tipo == 2) {
                                return 'Final';
                            }
                            
                        }
                        ],
            
            [
                        'header' => 'Data de Entrega',
                        'headerOptions' => ['class' => 'CustomHeadClass'],
                        'contentOptions' => ['class' => 'text-center'],
                        'attribute' => 'dataEntrega',              
                        'format' => 'raw',
                        'value' => function ($model) {
                            if ($model->dataEntrega != null) {
                                return Yii::$app->formatter->asDate($model->dataEntrega);
                            } else {
                                return 'Não informado';
                            }
                        },
                    ],
            [
                        'header' => 'Mês',
                        'format' => 'raw',
                        'contentOptions' => ['class' => 'text-center'],
                        'headerOptions' => [ 'class' => 'CustomHeadClass'],
                        'value' => function($data) {
                            if ($data->mes == 1) {
                                return 'Janeiro';
                            }
                            if ($data->mes == 2) {
                                return 'Fevereiro';
                            }
                            if ($data->mes == 3) {
                                return 'Março';
                            }
                            if ($data->mes == 4) {
                                return 'Abril';
                            }
                            if ($data->mes == 5) {
                                return 'Maio';
                            }
                            if ($data->mes == 6) {
                                return 'Junho';
                            }
                            if ($data->mes == 7) {
                                return 'Julho';
                            }
                            if ($data->mes == 8) {
                                return 'Agosto';
                            }
                             if ($data->mes == 9) {
                                return 'Setembro';
                            }
                            if ($data->mes == 10) {
                                return 'Outubro';
                            }
                            if ($data->mes == 11) {
                                return 'Novembro';
                            }
                            if ($data->mes == 12) {
                                return 'Dezembro';
                            }
                        }
                        ],
            

            //['class' => 'yii\grid\ActionColumn'],
                                
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