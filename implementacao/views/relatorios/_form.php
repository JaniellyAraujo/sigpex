<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Relatorios */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="panel panel-info">
    <div class="panel-heading">
        <h5 class="panel-title"><i class="fa fa-file-text"></i> Preencha os Dados</h5>
    </div>
    
    <div class="box-body" >
<div class="relatorios-form">

    <?php $form = ActiveForm::begin(); ?>

    <!--?= $form->field($model, 'projeto_id')->textInput(['maxlength' => true]) ?-->
   

    
    

    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
        <div class="col-md-6">  <?= $form->field($model, 'projeto_id')->dropDownList(yii\helpers\ArrayHelper::map(\app\models\Projetos::find()->where(['OR', ['isAtivo' => 5], ['isAtivo' => 6]])->asArray()->all(),'id', 'titulo'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>
        <div class="col-md-6"><?= $form->field($model, 'discente')->textInput(['maxlength' => true]) ?></div>
    </div>
    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
        <div class="col-md-4"> <?= $form->field($model, 'tipo')->dropDownList(array('2' => 'Final',
        '1' => 'Mensal'), ['prompt' => 'Selecione'], array('selected' => true))?></div>   
        <div class="col-md-4"><?= $form->field($model, 'dataEntrega')->Input('date') ?></div>
        <div class="col-md-4"> <?=$form->field($model, 'mes')->dropDownList(array('1' => 'Janeiro',
                                                    '2' => 'Fevereiro',
                                                    '3' => 'Março',
                                                    '4' => 'Abril',
                                                    '5' => 'Maio',
                                                    '6' => 'Junho',
                                                    '7' => 'Julho',
                                                    '8' => 'Agosto',
                                                    '9' => 'Setembro',
                                                    '10' => 'Outubro',
                                                    '11' => 'Novembro',
                                                    '12' => 'Dezembro',), ['prompt' => 'Selecione'], array('selected' => true))?></div>
    </div>
    <div class="box-footer">
        <button onClick="history.go(-1)" class="btn btn-default" > Cancelar </button> <!--Exemmlo botão voltar -->           
        <button type="submit" class="btn btn-info pull-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Salvar</font></font></button>
    </div>

<?php ActiveForm::end(); ?>

   </div>
 </div>
</div>
