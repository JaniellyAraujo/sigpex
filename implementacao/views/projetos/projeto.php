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

$this->params['breadcrumbs'][] = $this->title;
?>
<div class="projetos-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]);  ?>

    <p>
        <?= Html::a(Yii::t('app', 'Novo'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <div class="box box-default color-palette">
        <div class="box-body">
            <h4 class="box-title"><i class="fa fa-list-ul"></i> Listagem de Projetos</h4>

            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                //'filterModel' => $searchModel,
                'rowOptions' => function($model) {
                    if ($model->isAtivo == '2') {
                        return ['class' => 'success'];
                    } else if ($model->isAtivo == '3') {
                        return ['class' => 'danger'];
                    } else {
                        return ['class' => 'warning'];
                    }
                },
                'columns' => [
                    'titulo',
                    [
                        'attribute'  => 'Coordenador:',
                        'value' => 'user.nome',
                      ],
                    'tipoProjeto',
                    'dataInicio',
                    'datafim',
                        [
                        'label' => 'Ação',
                        'format' => 'raw',
                        'value' => function ($data) {
                            return Html::a('Visualizar', ['projetos/view2', 'id' => $data->id], ['class' => 'profile-link']);
                        },
                    ],
                ],
            ]);
            ?>         
            <!--div class="box-footer">
                <a href="gerar" target="_blank" class="btn btn-default"><i class="fa fa-print"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> Impressão</font></font></a>
            </div-->
        </div>
    </div>
</div>
