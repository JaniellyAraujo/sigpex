<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Relatorios */
/* @var $form yii\widgets\ActiveForm */
?>
<div class="panel panel-info">
    <div class="panel-heading">
        <h5 class="panel-title"><i class="fa fa-file-text (alias)"></i> Informe o Projeto </h5>
    </div>
   
    <div class="box-body">
<div class="relatorios-form">

   <?php $form = ActiveForm::begin(['id' => $model->formName()]); ?>

    
    <?=
    $form->field($model, 'projeto_id')->widget(kartik\select2\Select2::classname(), [
    'data' => \yii\helpers\ArrayHelper::map(\app\models\Projetos::find()->orderBy('titulo ASC' )->all(), 'id', 'titulo'),
    'options' => ['placeholder' => 'Selecione o Projeto...'],
    'pluginOptions' => [
        'allowClear' => true
    ],
]);
?>


            <div class="pull-right">
                <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Criar') : Yii::t('app', 'Próximo'), ['class' => $model->isNewRecord ? 'btn btn-block btn-success' : 'btn btn-block btn-primary']) ?>
            </div>

    <?php ActiveForm::end(); ?>

</div>
        </div>
    </div>
