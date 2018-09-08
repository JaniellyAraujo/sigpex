
<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\RelatoriosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

?>

<div class="relatorios-index">

    <div class="panel panel-info">

        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-user"></i> Listagem de Relatórios</h5>
        </div>

        <div class="box-body">
            <div class="pull-right">
                    <?= Html::a('Novo', ['create'], ['class' => 'btn btn-success']) ?>
            </div><br>

                <?=
                GridView::widget([
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'columns' => [
                        //['class' => 'kartik\grid\SerialColumn'],
                        
                        'versao',
                        'descricao',
                          
                    
                        
                  
                         [
                            'attribute' => 'status',                            
                            'format' => 'boolean',
                            'filter' => ['0' => 'Não', '1' => 'Sim'],
                        ],
                        [
                            'class' => 'kartik\grid\ActionColumn',
                            'template' => '{view}{update}{editar-relatorio}',
                            'header' => 'Ações',
                            'buttons' => [
                                'view' => function ($url) {
                                    return Html::a('<span  class="fa fa-eye"></span>', $url);
                                },
                                'update' => function ($url) {
                                    return Html::a('<span style="margin-left: 5px" class="fa  fa-pencil"></span>', $url);
                                },
                                'editar-relatorio' => function ($url) {
                                    return Html::a('<span style="margin-left: 5px"  class="fa fa-gears"></span>', $url );
                                },
                            ],
                        ],
                    ],
                ]);
                ?>
            </div>


        </div>

    </div>




