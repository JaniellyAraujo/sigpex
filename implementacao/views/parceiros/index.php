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
/* @var $searchModel app\models\ParceirosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

?>
<?php if($model->isNewRecord) 
	echo $this->render('create', ['model' => $model]); 
   else
	echo $this->render('update', ['model' => $model]); 	
?>
<h3 class="box-title"><i class="fa fa-list-ul"></i> Lista de Parceiros</h3>
<div class="panel panel-info">
    <div class="panel-heading">
        <h5 class="panel-title"><i class="fa fa-gear (alias)"></i> </h5>
    </div>
    <div class="box-body">
        
   
       

        <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
        'columns' => [
            //'id',
            'nome',
            [
                        'class' => 'yii\grid\ActionColumn',
                        'header' => "Ações",
                        'headerOptions' => ['style' => 'width: 25%;'],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => "{view} {update} {delete}  ", // altera a forma de exibição dos botões
                        'buttons' => [
                            'view' => function ($url, $model) {
                                return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualisar Parceiro',
                                            'class' => 'btn btn-info',
                                ]);
                            },
                            /*'update' => function ($url, $model) {
                                return Html::a('<i class="fa fa-user fa fa-white"></i>', $url, ['title' => 'Editar Parceiro',
                                             ['update', 'id' => $model['id']],'class' => 'btn btn-primary',
                                ]);
                            },*/
                            'update' => function($url, $model) {
                                return Html::a('<span class="btn btn-primary"><b class="fa fa-user"></b></span>', ['update', 'id' => $model['id']], ['title' => 'Alterar', 'id' => 'modal-btn-view']);
                             },        
                            
                            'delete' => function ($url, $model) {
                                return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Excluir Parceiro',
                                            'class' => 'btn btn-danger',
                                            'data-confirm' => 'Tem certeza de que deseja excluir este item?', // altera a mensagem de confirmação
                                            'data-method' => 'post',
                                ]);
                            }
                        ]
                    ]
        ],
    ]); ?>
    </div>
