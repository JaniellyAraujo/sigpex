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
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-user"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong> DOCENTES</strong></span>
                    <span class="sigpex-link-box-text"><strong> COLABORADORES:</strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['isAtivo' => 5])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><i class="fa fa-user"></i></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><div class="color1"><i class="fa fa-user"></i></div></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>TAS </strong></span>
                    <span class="sigpex-link-box-text"><strong>COLABORADORES: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6], ['isAtivo' => 7]])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><i class="fa fa-user-plus"></i></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><div class="color2"><i class="fa fa-user"></i></div></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>DISCENTES</strong></span>
                    <span class="sigpex-link-box-text"><strong>VOLUNTÁRIOS: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\User::find()->where(['OR', ['role' => 3], ['role' => 4]])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><i class="fa fa-user"></i></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><i class="fa fa-user-plus"></i></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>DOCENTES</strong></span>
                    <span class="sigpex-link-box-text"><strong>COORDENADORES: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\User::find()->where(['OR', ['role' => 3], ['role' => 4]])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><i class="fa fa-user-plus"></i></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><div class="color1"><i class="fa fa-user-plus"></i></div></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>TAS</strong></span>
                    <span class="sigpex-link-box-text"><strong>COORDENADORES: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\User::find()->where(['OR', ['role' => 3], ['role' => 4]])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><i class="fa fa-user-plus"></i></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>

        <div class="col-md-4 col-sm-3 col-xs-6">
            <div class="sigpex-link-box bg-gray-active">
                <span class="sigpex-link-box-icon bg-light-blue-gradient"><div class="grow"><div class="color2"><i class="fa fa-user-plus"></i></div></div></span>
                <div class="sigpex-link-box-content">
                    <span class="sigpex-link-box-text"><strong>DISCENTES</strong></span>
                    <span class="sigpex-link-box-text"><strong>BOLSISTA: </strong></span>
                    <span class="sigpex-link-box-number"><?= \app\models\User::find()->where(['OR', ['role' => 3], ['role' => 4]])->count(); ?></span>
                    <span class="sigpex-link-box-desc"></span>
                    <span class="sigpex-link-box-bottom"><i class="fa fa-user-plus"></i></span>
                </div><!-- /.info-box-content -->
            </div><!-- /.info-box -->
        </div>


    </div> <br>



<?php // echo $this->render('_search', ['model' => $searchModel]);   ?>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-list-ul"></i> Discentes e Servidores Ativos</h5>
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
                        'nome',
                        [
                        'attribute'=> 'role',
                        'format' => 'raw',
                        'headerOptions' => ['class' => 'text-center','style' => 'width: 25%;'],
                        'contentOptions' => ['class' => 'text-center'],
                        'value' => function($data) {
                
                            if ($data->role == 3) {
                                return 'Servidor';
                            }
                            if ($data->role == 4) {
                                return 'Discente';
                            }
                        }],
                            
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
        color:#000080;
}
.color1{
        color:#737373;
}
.color2{
        color:#000000;
}
</style>