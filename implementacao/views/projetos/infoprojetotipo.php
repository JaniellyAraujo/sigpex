<?php
/* * ****************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
  /***************************************************************** */

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjetosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
?>

<div class="projetos-index">


    <div class="row">
        <div class="col-md-4 col-sm-1 col-xs-4">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-dashboard"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong> PROJETOS</strong></span>
                    <span class="sigpex-link-box-text"><strong> ARTÍSTICOS:</strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]])->where(['isTipo' => 5])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><div class="color"><i class="fa fa-dashboard"></i></div></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-music"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>PROJETOS </strong></span>
                    <span class="sigpex-link-box-text"><strong>CULTURAIS: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]])->where(['isTipo' => 4])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><div class="color"><i class="fa fa-music"></i></div></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-credit-card"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>PROJETOS</strong></span>
                    <span class="sigpex-link-box-text"><strong>EMPREENDEDORES: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]])->where(['isTipo' => 2])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><div class="color"> <i class="fa fa-credit-card"></i></div></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-soccer-ball-o"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>PROJETOS</strong></span>
                    <span class="sigpex-link-box-text"><strong>ESPORTIVOS: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]])->where(['isTipo' => 6])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><div class="color"> <i class="fa fa-futbol-o"></i></div></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-leaf"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>PROJETOS</strong></span>
                    <span class="sigpex-link-box-text"><strong>SOCIAIS: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]])->where(['isTipo' => 3])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><div class="color"><i class="fa fa-leaf"></i></div></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-code-fork"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>PROJETOS</strong></span>
                    <span class="sigpex-link-box-text"><strong>TECNOLÓGICOS: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]])->where(['isTipo' => 1])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><div class="color"><i class="fa fa-code-fork"></i></div></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-money"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>FOMENTO</strong></span>
                    <span class="sigpex-link-box-text"><strong>INTERNO: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]])->where(['isControle' => 1])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><div class="color"><i class="fa fa-money fa fa-blue"></i></div></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-barcode"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>FOMENTO</strong></span>
                    <span class="sigpex-link-box-text"><strong>EXTERNO: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]])->where(['isControle' => 2])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><div class="color"><i class="fa fa-barcode"></i></div></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-lightbulb-o"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>PROJETO</strong></span>
                    <span class="sigpex-link-box-text"><strong>VOLUNTÁRIO </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]])->where(['isControle' => 3])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><div class="color"><div class="color"> <i class="fa fa-lightbulb-o"></i></div></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div></div>

    </div> <br>



<?php // echo $this->render('_search', ['model' => $searchModel]);   ?>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-list-ul"></i> Projetos em Andamento e Encerrados</h5>
        </div>
        <div class="box-body">
            <div class="pull-right">
<?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['site/index'], ['class' => 'btn  btn-social btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar', 'visible' => !Yii::$app->user->isGuest && Yii::$app->user->identity->role == 3]) ?>
            </div><br>
                <?=
                GridView::widget([
                    'dataProvider' => $dataProvider,
                    //'responsive'=>true,
                    
                    'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                    'columns' => [
                        'titulo',
                        'tipoProjeto',
                            ['class' => 'yii\grid\ActionColumn',
                            'header' => "Visualizar",
                            'headerOptions' => [ 'class' => 'CustomHeadClass ',],
                            ///'headerOptions' => ['style' => 'width: 15%;'],
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
    .sigpex-link-box {
        background: none repeat scroll 0 0 #fff;
        border-radius: 1px;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        display: block;
        margin-bottom: 10px;
        min-height: 40px;
        width: 50%;
        border: 1px solid #ddd;
        position:relative;
    }
    .sigpex-link-box-icon {
        background: none repeat scroll 0 0 rgba(0, 0, 0, 0.2);
        border-radius: 2px 0 0 2px;
        display: block;
        float: left;
        font-size: 25px;
        height: 70px;
        line-height: 70px;
        text-align: center;
        width: 50px;
    }
    .sigpex-link-box-content {
        margin-left: 50px;
        padding: 2px 3px;
    }
    .sigpex-link-box-text {
        text-transform: uppercase;
        display: block;
        font-size: 12px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .sigpex-link-box-number {
        display: block;
        font-size: 20px;
        font-weight: bold;
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
        bottom:3px;
        right:4px;
    }
    .grow:hover{
        -webkit-transform: scale(1.3);
        -ms-transform: scale(1.3);
        transform: scale(1.3);
}
.color{
        color:#53a7ea;
}
.CustomHeadClass {
  color: #3c8dbc;
  width: 15%;
  text-align:center;
}
</style>