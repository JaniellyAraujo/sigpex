<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RelatoriosProjeto */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="relatorios-projeto-form">

    <?php $form = ActiveForm::begin(); ?>
    
    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
        <div class="col-md-6"> <?= $form->field($model, 'discente')->textInput(['maxlength' => true]) ?></div>
       
        <div class="col-md-6"><?=
    $form->field($model, 'tipo')->widget(kartik\select2\Select2::classname(), [
    'data' => \yii\helpers\ArrayHelper::map(\app\models\TipoRelatorio::find()->orderBy('nome ASC' )->all(), 'nome', 'nome'),
    'options' => ['placeholder' => 'Selecione o tipo...'],
    'pluginOptions' => [
        'allowClear' => true
    ],
]);
?></div>
    </div>
    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
        <div class="col-md-6"> <?= $form->field($model, 'dataEntrega')->Input('date') ?></div>   
        <div class="col-md-6"><?= $form->field($model, 'mes')->dropDownList(array('1' => 'Janeiro',
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
                                                                                  '12' => 'Dezembro'),
                                                                                   ['prompt' => 'Selecione'], array('selected' => true))?></div>
    </div>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Salvar'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?php
$script = <<< JS
            
            $('form#{$model->formname()}').on('beforeSubmit', function(e)
            {
                var \$form = $(this);
                    $.post(
                        \$form.attr("action"),
                        \$form.serialize()               
                    )      
                        
                        .done(function(result){                           
                                $(\$form).trigger("reset");
                                $.pjax.reload({container:'#relatorios'});
            
                         
                            
                            console.log(result);
                        }).fail(function(){
                                    console.log(result);
                                });            
                return false;
                });
                    
                    
JS;


$this->registerJs($script)
?>
