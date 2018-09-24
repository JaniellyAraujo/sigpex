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
/* @var $searchModel app\models\ProjetosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>
<div class="projetos-aprovados">

    <h3 class="box-title"><i class="fa fa-list-ul"></i> Gerenciar Projetos</h3>

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-folder "></i> Projetos Arquivados</h5>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
            <?php if (Yii::$app->user->can('servidor')) { ?>
                <div class="pull-right">
                    <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['projetos/index'], ['class' => 'btn  btn-social btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar', 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3]) ?>
                </div>
            <?php } ?>
            <?php if (Yii::$app->user->can('coordenador')) { ?>
                <div class="pull-right">
                    <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['projetos/aprovados'], ['class' => 'btn  btn-social btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar', 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 2]) ?>
                </div>
            <?php } ?>
            <br>
            <?php // echo $this->render('_search', ['model' => $searchModel]);  ?>

            <?=
            GridView::widget([
                'filterModel' => $searchModel,
                'dataProvider' => $dataProvider,
                //'responsive'=>true,
                'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                'columns' => [
                    'titulo',
                   // 'coordenador',
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
                        //'format' => 'raw',
                        'format' => 'raw',
                        'value' => function ($model) {
                            if ($model->datafim != null) {
                                return Yii::$app->formatter->asDate($model->datafim);
                            } else {
                                return 'Não informado';
                            }
                        },
                        
                    ],
                    'modalidade',
                        ['class' => 'yii\grid\ActionColumn',
                        'header' => "Visualizar",
                        'headerOptions' => [
                                'class' => 'CustomHeadClass ',
                            ],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => '{view} {delete}',
                        'buttons' => [
                            'view' => function ($url, $model) {
                                return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualisar Projeto',
                                            'class' => 'btn btn-info',
                                ]);
                            },
                            'update' => function ($url, $model) {
                                return Html::a('<i class="fa  fa-eyedropper fa fa-white"></i>', $url, ['title' => 'Editar Projeto',
                                            'class' => 'btn btn-primary',
                                ]);
                            },
                            'delete' => function ($url, $model) {
                                return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Excluir Status do Projeto',
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
        </div>
        </div>
    </div>
</div>
<style>
    .CustomHeadClass {
        color: #3c8dbc;
        width: 15%;
        text-align:center;
    }
</style>

 <div><div class="container-fluid">
            <div class="row docs-premium-template">

                <div class="col-sm-12 col-md-6">
                    <div class="box box-info">
                        <div class="card-body p-2">
                           <?php

/*$datas = app\models\Projetos::findAll(array('select'=>'modalidade',
'order'=>'modalidade', 'condition'=>'modalidade!=:x', 'params'=>array(':x'=>0)));*/



	
		echo \miloschuman\highcharts\Highcharts::widget([
			'scripts' => [
				'highcharts-3d',   
			],
			'options' => [	
				'exporting'=>[
				 	'enabled'=>true 
				],
				'legend'=>[
				    'align'=>'center',
				    'verticalAlign'=>'bottom',
				    'layout'=>'vertical',
				    'x'=>0,
				    'y'=>0,
				],
				'credits'=>[
	    				'enabled'=>false
	  			 ],
				'chart'=> [
					'type'=>'pie',
					'options3d'=>[
						'enabled'=>true,
						'alpha'=>45,
						'beta'=>0
					],
				],
				'title'=>[
					'text'=>'',
					'margin'=>0,
				],
				'plotOptions'=>[
					'pie'=>[
						'allowPointSelect'=>true,
		        			'cursor'=>'pointer',
		       				'depth'=>35,
						'dataLabels'=>[
							'enabled'=>false
					    	 ],
						 'showInLegend'=>true,
					],	
					'series'=>[
						'pointPadding'=>0,
						'groupPadding'=>0,      
					 ],
				],
                                        'title' => ['text' => 'Tipo - Projeto'],
                                       'xAxis' => [
                                           'categories' => ['Tecnológico', 'Empreendedor', 'Social','Cultural e Artísticov','Esportivo']
                                       ],
                                       'yAxis' => [
                                           'title' => ['text' => 'Tipo Projeto']
                                       ],
                                   'series'=> [
					[
						'name'=>'Tipo',
						'data'=>[1,5,6,2,9],
					]
				]
			],
		]);
	 
	?>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6">
                    <div class="box box-info">
                           <div class="card-body p-2">
                            <?php

/*$datas = app\models\Projetos::findAll(array('select'=>'modalidade',
'order'=>'modalidade', 'condition'=>'modalidade!=:x', 'params'=>array(':x'=>0)));*/



	
		echo \miloschuman\highcharts\Highcharts::widget([
			'scripts' => [
				'highcharts-3d',   
			],
			'options' => [	
				'exporting'=>[
				 	'enabled'=>true 
				],
				'legend'=>[
				    'align'=>'center',
				    'verticalAlign'=>'bottom',
				    'layout'=>'vertical',
				    'x'=>0,
				    'y'=>0,
				],
				'credits'=>[
	    				'enabled'=>false
	  			 ],
				'chart'=> [
					'type'=>'pie',
					'options3d'=>[
						'enabled'=>true,
						'alpha'=>45,
						'beta'=>0
					],
				],
				'title'=>[
					'text'=>'',
					'margin'=>0,
				],
				'plotOptions'=>[
					'pie'=>[
						'allowPointSelect'=>true,
		        			'cursor'=>'pointer',
		       				'depth'=>35,
						'dataLabels'=>[
							'enabled'=>false
					    	 ],
						 'showInLegend'=>true,
					],	
					'series'=>[
						'pointPadding'=>0,
						'groupPadding'=>0,      
					 ],
				],
                                        'title' => ['text' => 'Modalidade - Projetos'],
                                       'xAxis' => [
                                           'categories' => ['Fomento Interno', 'Fomento Externo', 'Voluntário']
                                       ],
                                       'yAxis' => [
                                           'title' => ['text' => 'Modalidade']
                                       ],
                                   'series'=> [
					[
						'name'=>'Modalidade',
						'data'=>[1,5,6],
					]
				]
			],
		]);
	 
	?>
                            
                            
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



