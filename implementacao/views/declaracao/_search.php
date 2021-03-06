<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\DeclaracaoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="declaracao-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'id_projeto') ?>

    <?= $form->field($model, 'dataInicio') ?>

    <?= $form->field($model, 'dataFim') ?>

    <?= $form->field($model, 'dataEmissao') ?>

    <?php // echo $form->field($model, 'cargaHoraria') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'participante_id') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
