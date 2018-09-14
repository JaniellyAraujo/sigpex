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
use kartik\grid\GridView;


/* @var $this yii\web\View */
/* @var $searchModel app\models\UsuariosSearch */

?>
<div class="usuarios-index">
      
    <div class="panel panel-info">

        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-user"></i> Dados Pessoais</h5>
        </div>

        <div class="box-body">
            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                //'filterModel' => $searchModel,
                'summary' => '',
                //'layout'=> "{summary}\n{items}\n{pager}",
                //'responsive'=>true,
                //'summary' => false,
                'columns' => [
                    'nome',
                    'cpf',
                                
                    'email:email',
                  
                        [
                        'class' => 'yii\grid\ActionColumn',
                        'header' => "Detalhes",
                        //'headerOptions' => ['style' => 'width: 15%;'],
                        'headerOptions' => [
                            'class' => 'CustomHeadClass ',
                            ],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => "{view}", // altera a forma de exibição dos botões
                        'buttons' => [
                            'view' => function ($url, $model) {
                                return Html::a('<i class="fa fa-search fa fa-white"></i>', $url, ['title' => 'Detalhes',
                                            'class' => 'btn btn-info',
                                ]);
                            },
                        ]
                    ]
                ],
            ]);
            ?>
        </div> 


    </div>
    
    <div class="media">

                                <div class="pull-right">
                                    <div class="clearfix">
                                        <div class="g__c6 g__c12--md" >
                                            <div class="sp__2 sp__0--md"></div>
                                            <img src="<?= yii\helpers\Url::to('@web/img/art.png') ?>" width="200" height="250" class="img-responsive"/><hr>
                                        </div>
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

