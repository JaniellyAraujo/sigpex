<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DeclaracaoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>
<h3 class="box-title"><i class="fa fa-list-ul"></i> Gerenciar Declarações</h3>
<div class="panel panel-info">


        <div class="panel-heading">
                <h5 class="panel-title"><i class="fa fa-file-text"></i> Declarações de Projetos Encerrados</h5>
            
            
        </div>

        <div class="box-body">
            <div class="pull-right">       

                <?= Html::a('<b class="fa fa-plus"></b> Novo', ['create'], ['class' => 'btn btn-success']) ?>
               
            </div><br>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",        
        'columns' => [
            [
                        'class' => 'kartik\grid\ExpandRowColumn',
                        'value' => function ($model, $key, $index, $column) {
                            return GridView::ROW_COLLAPSED;
                        },
                        'detail' => function ($model, $key, $index, $column) {
                            $searchModel = new \app\models\DeclaracaoSearch();
                            $searchModel->id = $model->id;
                            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
                            
                            return Yii::$app->controller->renderPartial('_declaracao', [
                                'searchModel' => $searchModel,
                                'dataProvider' => $dataProvider,
                            ]);
                        },
                    ],
            [
              'attribute'  => 'projeto_id',
              'value' => 'projetos.titulo',
              
            ],
            
            
           //['class' => 'yii\grid\ActionColumn'],
                    
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