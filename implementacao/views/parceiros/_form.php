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
/* @var $model app\models\Parceiros */
/* @var $form yii\widgets\ActiveForm */
?>

<?php if (($model->isNewRecord) != false) { ?> 
    <h3 class="box-title"><i class="fa fa-plus"></i> Adicionar Parceiros</h3>
<?php } ?>
<?php if (($model->isNewRecord) == false) { ?> 
    <h3 class="box-title"><i class="fa fa-pencil-square"></i> Atualizar Parceiro</h3>
<?php } ?>
<div class="panel panel-info">
    <div class="panel-heading">
        <h5 class="panel-title"><i class="fa fa-gear (alias)"></i> Preencha o Campo</h5>
    </div>
    <div class="box-body">


        <?php
        if ($this->context->action->id == 'update')
            $action = ['update', 'id' => $model['id']];
        else
            $action = ['create'];
        ?>

        <?php
        $form = ActiveForm::begin([
            'id' => 'panel panel-info',
            'enableAjaxValidation' => true,
            'action' => $action,
            'fieldConfig' => [
                'template' => " <strong>Nome</strong> {input}{error}",
            ],
        ]);
        ?>


        <div class="box-header with-border-md-12">
            <div class="row">
                <div class="col-md-12"><?= $form->field($model, 'nome')->textInput(['maxlength' => false]) ?></div>
            </div>
        </div>
        <!--?= $form->field($model, 'nome')->textInput(['maxlength' => true]) ?-->

        <div class="form-group">
            <div class="pull-left">
                <?php if (($model->isNewRecord) == false) { ?> 
                <?= Html::a('Cancelar', ['parceiros/index'], ['class' => 'btn btn-default','style' => 'margin-right:10px']) ?>
                 <?php } ?>
            </div>
            <div class="pull-left">
                <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Salvar') : Yii::t('app', 'Alterar'), ['class' => $model->isNewRecord ? 'btn btn-block btn-success' : 'btn btn-block btn-primary']) ?>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>
