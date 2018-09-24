<!--?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Relatorios */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="relatorios-form">

    < ?php $form = ActiveForm::begin(); ?>

    <!--?= $form->field($model, 'projeto_id')->textInput(['maxlength' => true]) ?>
    < ?= $form->field($model, 'projeto_id')->dropDownList(yii\helpers\ArrayHelper::map(\app\models\Projetos::find()->asArray()->all(), 'id', 'titulo'), ['prompt' => 'Selecione'], array('selected' => true)) ?>

    < ?= $form->field($model, 'discente')->textInput(['maxlength' => true]) ?>

    < ?= $form->field($model, 'tipo')->textInput(['maxlength' => true]) ?>

    < ?= $form->field($model, 'dataEntrega')->textInput() ?>

    < ?= $form->field($model, 'mes')->textInput() ?>

    <div class="form-group">
        < ?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    < ?php ActiveForm::end(); ?>

</div-->
<!----------------------------------------------------------------------------------------------------------------->

<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use wbraganca\dynamicform\DynamicFormWidget;

/* @var $this yii\web\View */
/* @var $model app\models\Relatorios */
/* @var $modelsRelatorio app\models\Relatorios */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="relatorios-form">

    <?php $form = ActiveForm::begin(['id' => 'dynamic-form']); ?>


    <div class="panel panel-info">
        <div class="panel-heading"><h4><i class="glyphicon glyphicon-list-alt"></i> Relatórios de Projetos em Andamento</h4></div>
        
        <div class="panel-body">
        <div class="row">
            <div class="col-sm-6">
                <?= $form->field($model, 'projeto_id')->dropDownList(yii\helpers\ArrayHelper::map(\app\models\Projetos::find()->asArray()->all(), 'id', 'titulo'), ['prompt' => 'Selecione'], array('selected' => true)) ?>
            </div>
        </div>
        
             <?php DynamicFormWidget::begin([
                'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                'widgetBody' => '.container-items', // required: css class selector
                'widgetItem' => '.item', // required: css class
                'limit' => 10, // the maximum times, an element can be cloned (default 999)
                'min' => 1, // 0 or 1 (default 1)
                'insertButton' => '.add-item', // css class
                'deleteButton' => '.remove-item', // css class
                'model' => $models[0],
                'formId' => 'dynamic-form',
                'formFields' => [
                    'discente',
                    'tipo',
                    'dataEntrega',
                    'mes',
                ],
            ]); ?>

            <div class="container-items"><!-- widgetContainer -->
            <?php foreach ($models as $i => $model): ?>
                <div class="item panel panel-default"><!-- widgetBody -->
                    <div class="panel-heading">
                        <h3 class="panel-title pull-left"><i class="fa fa-file-text (alias)"></i> Relatórios Entregues</h3>
                        <div class="pull-right">
                            <button type="button" class="add-item btn btn-success btn-xs"><i class="glyphicon glyphicon-plus"></i></button>
                            <button type="button" class="remove-item btn btn-danger btn-xs"><i class="glyphicon glyphicon-minus"></i></button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <?php
                            // necessary for update action.
                            if (! $model->isNewRecord) {
                                echo Html::activeHiddenInput($model, "[{$i}]id");
                            }
                        ?>
                        
                        <div class="row">
                            <div class="col-sm-6">
                                <?= $form->field($model, "[{$i}]discente")->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-sm-6">
                                <?= $form->field($model, "[{$i}]tipo")->textInput(['maxlength' => true]) ?>
                            </div>
                        </div><!-- .row -->
                        <div class="row">
                            <div class="col-sm-6">
                                <?= $form->field($model, "[{$i}]dataEntrega")->textInput() ?>
                            </div>
                            <div class="col-sm-6">
                                <?= $form->field($model, "[{$i}]mes")->textInput() ?>
                            </div>
                        </div><!-- .row -->
                    </div>
                </div>
            <?php endforeach; ?>
            </div>
            <div class="form-group pull-right">
                <?= Html::submitButton($model->isNewRecord ? 'Salvar' : 'Atualizar', ['class' => 'btn btn-success']) ?>
            </div>
            <?php DynamicFormWidget::end(); ?>
            
        </div>
    </div>



    <?php ActiveForm::end(); ?>

</div>
