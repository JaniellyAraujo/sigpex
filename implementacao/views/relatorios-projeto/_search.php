<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RelatoriosProjetoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="relatorios-projeto-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'id_relatorio') ?>

    <?= $form->field($model, 'id_projeto') ?>

    <?= $form->field($model, 'discente') ?>

    <?= $form->field($model, 'tipo') ?>

    <?php // echo $form->field($model, 'dataEntrega') ?>

    <?php // echo $form->field($model, 'mes') ?>

    <?php // echo $form->field($model, 'status') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
