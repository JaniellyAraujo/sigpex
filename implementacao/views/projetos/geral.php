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

use yii\grid\GridView;
use app\models\Projetos;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjetosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

//*********************Quantidade total de projetos*********************
$total = Projetos::find()->count();
//******************************* Quantidade total de Projetos Voluntários
$totalVoluntario = Projetos::find()->where(['isControle' => 1])->count();
//******************************* Quantidade total de Projetos com Bolsa
$totalFomento = Projetos::find()->where(['isControle' => 2])->count();
//******************************* Quantidade total de Projetos Tecnologico
$totalTecnologico = Projetos::find()->where(['isTipo' => 1])->count();
//******************************* Quantidade total de Projetos Empreendedor
$totalEmpreendedor = Projetos::find()->where(['isTipo' => 2])->count();
//******************************* Quantidade total de Projetos Social
$totalSocial = Projetos::find()->where(['isTipo' => 3])->count();
//******************************* Quantidade total de Projetos Cultural
$totalCultural = Projetos::find()->where(['isTipo' => 4])->count();
//******************************* Quantidade total de Projetos Artistico
$totalArtistico = Projetos::find()->where(['isTipo' => 5])->count();
//******************************* Quantidade total de Projetos Esportivo
$totalEsportivo = Projetos::find()->where(['isTipo' => 6])->count();

//******************************* Quantidade total de alunos participantes:
//$query = (new Query())->from('projetos')->where(['isAtivo'=>1]);
//$sum = $query->sum('numeroAlunos');
?>
<div class="projetos-geral">
    <div class="box box-default color-palette">
        <div class="box-body">

            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                'columns' => [
                    'titulo',
                    'coordenador',
                        [
                        'label' => 'Data de Início',
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
                        'label' => 'Data de Término',
                        'format' => 'raw',
                        'value' => function ($model) {
                            if ($model->datafim != null) {
                                return Yii::$app->formatter->asDate($model->datafim);
                            } else {
                                return 'Não informado';
                            }
                        },
                    ],
                // ['class' => 'yii\grid\ActionColumn'],
                ],
            ]);
            ?>

            <div class="col-lg-12">
                <b>Quantidade Total de Projetos: </b> <?= $total ?> <br>
                <b>Quantidade total de Projeto Voluntário:</b><?= $totalVoluntario ?><br>
                <b>Quantidade total de Projeto com Bolsa:</b><?= $totalFomento ?><br>
                <b>Quantidade total de Projeto Tecnologico:</b><?= $totalTecnologico ?><br>
                <b>Quantidade total de Projeto Empreendedor:</b><?= $totalEmpreendedor ?><br>
                <b>Quantidade total de Projeto Social:</b><?= $totalSocial ?><br>
                <b>Quantidade total de Projeto Cultural:</b><?= $totalCultural ?><br>
                <b>Quantidade total de Projeto Artistico:</b><?= $totalArtistico ?><br>
                <b>Quantidade total de Projeto Esportivo:</b><?= $totalArtistico ?><br>
            </div>
            <div class="box-footer"></div>
        </div>
        <!-- /.box-body -->
    </div>           
</div>

