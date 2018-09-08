<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model app\models\Relatorios */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="box box-success">
    <div class="box-header with-border">
        <h3 class="box-title"><i class="fa fa-cubes"></i> Dados do Relatório</h3>
    </div>
    <div class="box-body">
        <div  class="panel-group collapse in">
            <div class="relatorios-form">

                <?php $form = ActiveForm::begin(['id' => $model->formName(), 'options' => ['enctype' => 'multipart/form-data']]) ?>

                <div class="row">
                    <div class="col-md-3">
                        <?= $form->field($model, 'versao')->textInput(['maxlength' => true]) ?>
                    </div> 
                    <div class="col-md-9">
                        <?= $form->field($model, 'descricao')->textInput(); ?>
                    </div> 
                    <div class="col-md-9">
                        <?= $form->field($model, 'status')->textInput(); ?>
                    </div>

                </div>

                <div class="box-footer text-right" style="margin-top: 20px"> 

                    <?= Html::a('Voltar', ['index'], ['class' => 'btn btn-warning']) ?>
                    <?= Html::submitButton('Salvar', ['class' => 'btn btn-success', 'style' => 'margin-left: 20px']) ?>
                    <?php ActiveForm::end(); ?>

                </div>
            </div>
        </div>


    </div>
    

</div>


