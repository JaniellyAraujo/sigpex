<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RelatoriosProjetosSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="relatorios-projetos-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'id_relatorios') ?>

    <?= $form->field($model, 'id_projetos') ?>

    <?= $form->field($model, 'mes') ?>

    <?= $form->field($model, 'bolsista') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
