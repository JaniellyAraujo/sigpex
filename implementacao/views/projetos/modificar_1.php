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

    <div class="panel panel-danger">

        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-exclamation-circle"></i> Cadastros Pendentes</h5>
        </div>

        <div class="panel-body">
            <div class="pull-right">
            <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['projetos/index'], ['class' => 'btn  btn-social btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar', 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3]) ?>
            </div><br>
            <?php // echo $this->render('_search', ['model' => $searchModel]);   ?>

            <?=
            GridView::widget([
                //'filterModel' => $searchModel,
                'dataProvider' => $dataProvider,
                'columns' => [
                    'titulo',
                    'coordenador',
                        [
                        'attribute' => 'isAtivo',
                        'value' => 'Status',
                        'format' => 'raw',
                        'contentOptions' => ['class' => 'text-center'],
                        'headerOptions' => ['style' => 'width: 10%;'],
                        'value' => function ($data) {
                            if ($data->isAtivo == 3) {
                                $icon = ' <label class="badge bg-red  ">Solicitado Modificação</label> ';
                                $label = $icon;
                                return Html::a($label);
                            } else if ($data->isAtivo == 4) {
                                $icon = ' <label class="badge bg-olive">Modificado</label> ';
                                $label = $icon;
                                return Html::a($label);
                            }
                        },
                    ],
                        ['class' => 'yii\grid\ActionColumn',
                        'header' => "Ações",
                        'headerOptions' => ['style' => 'width: 25%;'],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => ' {visualizar} {aprovar}  {status}  ',
                        'buttons' => [
                            'visualizar' => function ($url, $data) {
                                return Html::a('<span class="btn btn-info " role="button" title = "Visualizar"><i class="fa fa-eye fa fa-white" /n ></i></span> ', ['projetos/visualizar', 'id' => $data->id], ['class' => 'profile-link']);
                            },
                            'status' => function ($url, $data) {
                                if ($data->isAtivo == 3) {
                                    $icon = '<span class="btn btn-warning " role="button" title = "Solicitar Nova Modificação",><i class="fa fa-pencil-square-o" /n ></i> </span> '; //fa-history
                                    $label = $icon;
                                    $url = Yii::$app->urlManager->createUrl(["/projetos/update1", "id" => $data->id]);
                                    return Html::a($label, $url);
                                }
                            },
                            'aprovar' => function ($url, $data) {
                                if ($data->isAtivo == 4) {
                                    $icon = '<span class="btn btn-success " role="button" title = "Aprovar Projeto",><i class="fa fa-check-square-o" /n ></i> </span> '; //fa-history
                                    $label = $icon;
                                    $url = Yii::$app->urlManager->createUrl(["/projetos/aprovar", "id" => $data->id]);
                                    return Html::a($label, $url);
                                }
                            },
                        ]
                    ]
                ],
            ]);
            ?>
        </div>
    </div>
</div>




