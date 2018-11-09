<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\DeclaracaoProjetoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="declaracao-projeto-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'id_declaracao') ?>

    <?= $form->field($model, 'id_projeto') ?>

    <?= $form->field($model, 'dataEmissao') ?>

    <?= $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'participante_id') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
