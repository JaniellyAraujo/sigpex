<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Declaracao */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="declaracao-form">
    <h3 class="box-title"><i class="fa fa-list"></i> Registro de Emissão de Declaração</h3>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-gear (alias)"></i> Preencha os Campos</h5>
        </div>
        <div class="box-body">

    <?php $form = ActiveForm::begin(); ?>
            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                <div class="col-md-6"><?= $form->field($model, 'projeto_id')->dropDownList(yii\helpers\ArrayHelper::map(\app\models\Projetos::find()->where(['isAtivo' => 7])->asArray()->all(), 'id', 'titulo'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>
                <div class="col-md-6"><?= $form->field($model, 'participante')->textInput(['maxlength' => true]) ?></div>
            </div>


    <!--?= $form->field($model, 'dataInicio')->textInput() ?>

    < ?= $form->field($model, 'dataFim')->textInput() ?>

    < ?= $form->field($model, 'dataEmissao')->textInput() ?>

    < ?= $form->field($model, 'cargaHoraria')->textInput() ?>

    < ?= $form->field($model, 'status')->textInput() ?-->
    <div class="form-group pull-right">
        <?= Html::a('Cancelar', ['declaracao/index'], ['class' => 'btn btn-default']) ?>
        <?= Html::submitButton(Yii::t('app', 'Gerar'), ['class' => 'btn btn-success']) ?>
    </div>


    <?php ActiveForm::end(); ?>

</div></div></div>
