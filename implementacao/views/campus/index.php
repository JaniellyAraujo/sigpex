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
/* @var $searchModel app\models\CampusSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

?>
<?php
if ($model->isNewRecord)
    echo $this->render('create', ['model' => $model]);
else
    echo $this->render('update', ['model' => $model]);
?>
<div class="panel panel-info">
    <div class="panel-heading">
        <h5 class="panel-title"><i class="fa fa-list-ul"></i> Lista de Campus</h5>
    </div>
    <div class="box-body">
       
        <?=
        GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
            'columns' => [
                //'id',
                'nome',
                    [
                    'class' => 'yii\grid\ActionColumn',
                    'header' => "Ações",
                    'headerOptions' => ['style' => 'width: 25%;'],
                    'contentOptions' => ['class' => 'text-center'],
                    'visible'=>!Yii::$app->user->isGuest && Yii::$app->user->identity->role == 2,
                    'template' => "{view} {update} {delete}  ", // altera a forma de exibição dos botões
                    'buttons' => [
                        'view' => function ($url, $model) {
                            return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualizar',
                                        'class' => 'btn btn-info',
                            ]);
                        },
                        'update' => function ($url, $model) {
                            return Html::a('<i class="fa fa-pencil fa fa-white"></i>', $url, ['title' => 'Editar',
                                        'class' => 'btn btn-primary',
                            ]);
                        },
                        'delete' => function ($url, $model) {
                            return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Excluir',
                                        'class' => 'btn btn-danger',
                                        'data-confirm' => 'Tem certeza de que deseja excluir este item?', // altera a mensagem de confirmação
                                        'data-method' => 'post',
                            ]);
                        }
                    ]
                ]
            ],
        ]);
        ?>
    </div>
</div>
