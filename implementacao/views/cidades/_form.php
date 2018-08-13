<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\Cidades */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cidades-form">

    <?php $form = ActiveForm::begin([
        'id' => Yii::$app->controller->id . '-' . Yii::$app->controller->action->id,
        'enableAjaxValidation' => true,
        'validationUrl' => Url::toRoute(['validate-form', 'id' => $model->id ?? null]),
    ]); ?>

    <?= $form->field($model, 'id')->textInput() ?>

    <?= $form->field($model, 'nome')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'estados_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
