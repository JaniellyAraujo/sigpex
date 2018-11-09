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
        <?php if (Yii::$app->user->can('admin')) { ?>
        <div class="row">
        <div class="table-responsive">
            <?php if (\app\models\User::find()->where(['isAtivo' => 0])->count() != 0) { ?> 


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="sigpex-link-box bg-gray-active">
                        <span class="sigpex-link-box-icon bg-orange"><div class="grow"><i class="fa fa-user-plus"></i></div></span>
                        <div class="sigpex-link-box-content">
                            <span class="sigpex-link-box-text"><strong> Novos</strong></span>
                            <span class="sigpex-link-box-text"><strong> Usuários:</strong></span>
                            <span class="sigpex-link-box-number"><?= \app\models\User::find()->where(['isAtivo' => 0])->count(); ?></span>
                            <span class="sigpex-link-box-desc"></span>
                            <span class="sigpex-link-box-bottom"></span>
                        </div><!-- /.info-box-content -->
                    </div><!-- /.info-box -->
                </div>
            <?php } ?>


            <?php if (\app\models\User::find()->where(['isAtivo' => 1])->count() != 0) { ?> 


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="sigpex-link-box bg-gray-active">

                        <span class="sigpex-link-box-icon bg-green-gradient"><div class="grow"><i class="fa fa-user"></i></div></span>
                        <div class="sigpex-link-box-content">
                            <span class="sigpex-link-box-text"><strong> Usuários</strong></span>
                            <span class="sigpex-link-box-text"><strong> Ativos:</strong></span>
                            <span class="sigpex-link-box-number"><?= \app\models\User::find()->where(['isAtivo' => 1])->count(); ?></span>
                            <span class="sigpex-link-box-desc"></span>
                            <span class="sigpex-link-box-bottom"></span>
                        </div><!-- /.info-box-content -->
                    </div><!-- /.info-box -->
                </div>
            <?php } ?>


            <?php if (\app\models\Projetos::find()->where(['isAtivo' => 2])->count() != 0) { ?> 


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="sigpex-link-box bg-gray-active">
                        <span class="sigpex-link-box-icon bg-red-gradient"><div class="grow"><i class="fa fa-user-times"></i></div></span>
                        <div class="sigpex-link-box-content">
                            <span class="sigpex-link-box-text"><strong> Usuários </strong></span>
                            <span class="sigpex-link-box-text"><strong> Desativados:</strong></span>
                            <span class="sigpex-link-box-number"><?= \app\models\User::find()->where(['isAtivo' => 2])->count(); ?></span>
                            <span class="sigpex-link-box-desc"></span>
                            <span class="sigpex-link-box-bottom"></span>
                        </div><!-- /.info-box-content -->
                    </div><!-- /.info-box -->
                </div>
            <?php } ?>


            <?php if (\app\models\Projetos::find()->count() != 0) { ?> 


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="sigpex-link-box bg-gray-active">
                        <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-users"></i></div></span>
                        <div class="sigpex-link-box-content">
                            <span class="sigpex-link-box-text"><strong> Total de</strong></span>
                            <span class="sigpex-link-box-text"><strong> Usuários:</strong></span>
                            <span class="sigpex-link-box-number"><?= \app\models\User::find()->count(); ?></span>
                            <span class="sigpex-link-box-desc"></span>
                            <span class="sigpex-link-box-bottom"></span>
                        </div><!-- /.info-box-content -->
                    </div><!-- /.info-box -->
                </div>
            <?php } ?>
        </div>

    </div>
    <?php }  ?>
    <div class="panel panel-info">

        <div class="panel-heading">
            <?php if (Yii::$app->user->identity->role == 1) {?>
                <h5 class="panel-title"><i class="fa fa-user"></i> Listagem de Usuário</h5>
            <?php } ?>
            <?php if (Yii::$app->user->identity->role != 1) {?>
                <h5 class="panel-title"><i class="fa fa-user"></i> Perfil</h5>
            <?php } ?>
            
        </div>

        <div class="box-body">
            <div class="pull-right">       

                <?= Html::a('<b class="fa fa-plus"></b> Novo', ['create'], ['class' => 'btn btn-success']) ?>

            </div><br>
            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                //'filterModel' => $searchModel,
                //'summary' => '',
                //'layout'=> "{summary}\n{items}\n{pager}",
                'responsive'=>true,
                'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                'columns' => [
                    'nome',
                    'cpf',
                        [
                        'attribute'=> 'role',
                        'format' => 'raw',
                        'visible' => Yii::$app->user->identity->role == 1,
                        'value' => function($data) {
                            if ($data->role == 1) {
                                return 'Administrador';
                            }
                            if ($data->role == 2) {
                                return 'Coordenador';
                            }
                            if ($data->role == 3) {
                                return 'Servidor';
                            }
                            if ($data->role == 4) {
                                return 'Discente';
                            }
                        }],
                                
                                
                
                                
                    'email:email',
                        [
                        'attribute'=> 'isAtivo',
                        'format' => 'raw',
                        'contentOptions' => ['class' => 'text-center'],
                        'headerOptions' => ['style' => 'width: 10%;'],
                        'visible' => Yii::$app->user->identity->role == 1,
                        'value' => function ($data) {
                            if ($data->isAtivo == 0) {
                                $icon = '<span class="btn btn-warning btn-xs" title = "Aprovar Usuário",role="button"> Novo </span> '
                                        . ' <label class="badge bagde-danger"></label> ';
                                $label = $icon;
                                $url = Yii::$app->urlManager->createUrl(["/usuarios/ativar", "id" => $data->id]);
                                return Html::a($label, $url);
                            } else if ($data->isAtivo == 1) {
                                $icon = '<span class="btn btn-success btn-xs" title = "Desativar Usuário" role="button"> Ativo </span> '
                                        . ' <label class="badge bagde-success"></label> ';
                                $label = $icon;
                                $url = Yii::$app->urlManager->createUrl(["/usuarios/desativar", "id" => $data->id]);
                                return Html::a($label, $url);
                            } else if ($data->isAtivo == 2) {
                                $icon = '<span class="btn btn-danger btn-xs" title = "Reativar Usuário" role="button"> Desativado </span> '
                                        . ' <label class="badge bagde-danger"></label> ';
                                $label = $icon;
                                
                                $url = Yii::$app->urlManager->createUrl(["/usuarios/reativar", "id" => $data->id]);
                                
                                return Html::a($label, $url);
                               
                            }
                        },
                    ],
                    //['class' => 'yii\grid\ActionColumn'],
                    /* ['class' => 'yii\grid\ActionColumn',
                      'header' => "Ações",
                      'template' => '{view} {update}',
                      'buttons' => [
                      'view' => function ($url, $model, $key) {
                      return Html::a('', $url, ['title' => 'Visualizar Usuário', 'class' => 'glyphicon glyphicon-eye-open']);
                      },
                      'update' => function ($url, $model, $key) {
                      return Html::a('', $url, ['title' => 'Editar Usuário', 'class' => 'glyphicon glyphicon-user']);
                      },
                      /*'delete' => function ($url, $model, $key) {
                      return Html::a('', $url, ['title' => 'Excluir Usuário',
                      'class' => 'glyphicon glyphicon-trash',
                      'data' => [
                      'confirm' => Yii::t('app', 'Confirma exclusão de usuário?'),
                      'method' => 'post']
                      ]);
                      }
                      ]
                      ], */
                        [
                        'class' => 'yii\grid\ActionColumn',
                        'header' => "Ações",
                        //'headerOptions' => ['style' => 'width: 15%;'],
                        'headerOptions' => [
                            'class' => 'CustomHeadClass ',
                            ],
                        'contentOptions' => ['class' => 'text-center'],
                        'template' => "{view} {update}", // altera a forma de exibição dos botões
                        'buttons' => [
                            'view' => function ($url, $model) {
                                return Html::a('<i class="fa fa-eye fa fa-white"></i>', $url, ['title' => 'Visualizar Usuário',
                                            'class' => 'btn btn-info',
                                ]);
                            },
                            'update' => function ($url, $model) {
                                if (Yii::$app->user->identity->role == 1) {
                                return Html::a('<i class="fa fa-user fa fa-white"></i>', $url, ['title' => 'Editar Usuário',
                                            'class' => 'btn btn-primary',
                                ]);
                                } 
                            },
                            'delete' => function ($url, $model) {
                                 if (Yii::$app->user->identity->role == 1) {
                                return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Não Permitido',
                                            'class' => 'btn btn-danger',
                                            'data-confirm' => 'Tem certeza de que deseja excluir este item?', // altera a mensagem de confirmação
                                            'data-method' => 'post',
                                ]);
                            }
                          }
                        ]
                    ]
                ],
            ]);
            ?>
        </div> 


    </div>
</div>
<style>
    .sigpex-link-box {
        background: none repeat scroll 0 0 #fff;
        border-radius: 2px;
        box-shadow: 0 2px 2px rgba(0, 0, 0, 0.2);
        display: block;
        margin-bottom: 15px;
        min-height: 70px;
        width: 100%;
        border: 1px solid #ddd;
        position:relative;
    }
    .sigpex-link-box-icon {
        background: none repeat scroll 0 0 rgba(0, 0, 0, 0.2);
        border-radius: 2px 0 0 2px;
        display: block;
        float: left;
        font-size: 35px;
        height: 75px;
        line-height: 70px;
        text-align: center;
        width: 70px;
    }
    .sigpex-link-box-content {
        margin-left: 50px;
        //margin-right:10px;
        padding: 2px 3px;
    }
    .sigpex-link-box-text {
        text-transform: uppercase;
        display: block;
        font-size: 13px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        margin-left: 30px;
    }
    .sigpex-link-box-number {
        display: block;
        font-size:25px;
        font-weight: bold;
        margin-left: 30px;
    }
    .sigpex-link-box-desc {
        color:#aaa;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        display: block;
    }
    .sigpex-link-box-bottom {
        position:absolute;
        bottom:5px;
        right:6px;
    }
         .grow:hover{
        -webkit-transform: scale(1.3);
        -ms-transform: scale(1.3);
        transform: scale(1.3);
    }
     .CustomHeadClass {
    color: #3c8dbc;
    width: 15%;
    text-align:center;
    }

</style>

