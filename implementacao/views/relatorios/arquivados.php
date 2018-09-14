<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\RelatoriosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Relatórios');
?>
<div class="panel panel-primary">

        <div class="panel-heading">
                <h5 class="panel-title"><i class="fa fa-folder"></i> Relatórios Arquivados</h5>
            
            
        </div>

        <div class="box-body">
            <div class="pull-right">
                    <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['relatorios/index'], ['class' => 'btn  btn-social btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar', 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3]) ?>
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