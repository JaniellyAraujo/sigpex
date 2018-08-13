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

use Kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjetoEquipeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

?>
<div class="projeto-equipe-index">

    
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php //Html::a('Create Produto Prato', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            
            [
                'label' => 'Participantes',
                'value' => 'equipe.nome',
            ],
            [
                'label' => 'Tipo de usuario',
                'value' => 'tipoUsuario',
            ],
            

            //['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>


