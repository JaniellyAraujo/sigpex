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
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ProjetosSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="projetos-search">

    <?php
    $form = ActiveForm::begin([
                'action' => ['index'],
                'method' => 'get',
    ]);
    ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'titulo') ?>

    <?= $form->field($model, 'coordenador') ?>

    <?= $form->field($model, 'tipoProjeto') ?>

    <?= $form->field($model, 'objetivo') ?>

    <?php // echo $form->field($model, 'resumo') ?>

    <?php // echo $form->field($model, 'municipio') ?>

    <?php // echo $form->field($model, 'descricaoPopulacao') ?>

    <?php // echo $form->field($model, 'publicoAlvo') ?>

    <?php // echo $form->field($model, 'pesAtendidas') ?>

    <?php // echo $form->field($model, 'localExecucao') ?>

    <?php // echo $form->field($model, 'dataInicio') ?>

    <?php // echo $form->field($model, 'datafim') ?>

    <?php // echo $form->field($model, 'cargHorariaSemanal') ?>

    <?php // echo $form->field($model, 'cargHorariaTotal') ?>

    <?php // echo $form->field($model, 'parceiros') ?>

    <?php // echo $form->field($model, 'vinculo') ?>

    <?php // echo $form->field($model, 'citarVinculo') ?>

    <?php // echo $form->field($model, 'convenio') ?>

    <?php // echo $form->field($model, 'citarConvenio') ?>

    <?php // echo $form->field($model, 'gerFundacao') ?>

    <?php // echo $form->field($model, 'citarFundacao') ?>

    <?php // echo $form->field($model, 'multicampi') ?>

    <?php // echo $form->field($model, 'publico') ?>

    <?php // echo $form->field($model, 'contPublico') ?>

    <?php // echo $form->field($model, 'isUsuario') ?>

    <?php // echo $form->field($model, 'valorFinanciamento') ?>

    <?php // echo $form->field($model, 'areaConhecimento') ?>

    <?php // echo $form->field($model, 'campusDesenvolvido') ?>

        <?php // echo $form->field($model, 'isAtivo')  ?>

    <div class="form-group">
    <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
    <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

<?php ActiveForm::end(); ?>

</div>
