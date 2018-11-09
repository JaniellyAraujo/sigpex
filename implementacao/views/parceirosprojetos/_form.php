<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Parceirosprojeto */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="parceirosprojeto-form">

    <?php $form = ActiveForm::begin(['id' => $model->formName()]); ?>

    
    <?=
    $form->field($model, 'id_parceiro')->widget(kartik\select2\Select2::classname(), [
    'data' => \yii\helpers\ArrayHelper::map(\app\models\Parceiros::find()->orderBy('nome ASC' )->all(), 'id', 'nome'),
    'options' => ['placeholder' => 'Selecione o parceiro...'],
    'pluginOptions' => [
        'allowClear' => true
    ],
]);
?>


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
                                $.pjax.reload({container:'#parceiros'});
            
                         
                            
                            console.log(result);
                        }).fail(function(){
                                    console.log(result);
                                });            
                return false;
                });
                    
                    
JS;


$this->registerJs($script)
?>
