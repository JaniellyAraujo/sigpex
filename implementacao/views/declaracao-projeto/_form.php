<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\DeclaracaoProjeto */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="declaracao-projeto-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'dataEmissao')->Input('date') ?>

     <?=$form->field($model, 'participante_id')->widget(kartik\select2\Select2::classname(), [
        'data' => \yii\helpers\ArrayHelper::map(\app\models\User::find()->orderBy('nome ASC' )->all(), 'id', 'nome'),
         'options' => ['placeholder' => 'Selecione o participante...'],
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
                                $.pjax.reload({container:'#declaracao'});
            
                         
                            
                            console.log(result);
                        }).fail(function(){
                                    console.log(result);
                                });            
                return false;
                });
                    
                    
JS;


$this->registerJs($script)
?>
