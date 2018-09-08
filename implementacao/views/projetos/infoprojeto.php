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
<div class="projetos-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]);  ?>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-list-ul"></i> Projetos em Andamento</h5>
        </div>
        <div class="box-body">
         <div class="pull-right">
                    <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['site/index'], ['class' => 'btn  btn-social btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar', 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3]) ?>
                </div><br>
            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                'columns' => [
                    'titulo',
                    'tipoProjeto',
                    ['class' => 'yii\grid\ActionColumn',
                        'header' => "Visualizar",
                        'headerOptions' => [
                            'class' => 'CustomHeadClass ',
                            ],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => '{viewinfo} ',
                        'buttons' => [
                            'viewinfo' => function ($url, $data) {
                                
                                    return Html::a('<span class="btn btn-info " role="button" title = "Visualizar"><i class="fa fa-eye fa fa-white" /n ></i></span> ', ['projetos/viewinfo', 'id' => $data->id], ['class' => 'profile-link']);
                               
                            },
                            'update' => function ($url, $model) {
                                return Html::a('<i class="fa  fa-eyedropper fa fa-white"></i>', $url, ['title' => 'Editar',
                                            'class' => 'btn btn-primary disabled',
                                ]);
                            },
                            'delete' => function ($url, $model) {
                                return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Excluir',
                                            'class' => 'btn btn-danger disabled',
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
<style>
 .CustomHeadClass {
  color: #3c8dbc;
  width: 15%;
  text-align:center;
}
</style>