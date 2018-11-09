<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ProjetoEquipe */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="projeto-equipe-form">

    <?php $form = ActiveForm::begin(['id' => $model->formName()]); ?>
    
    <?=$form->field($model, 'participante_id')->widget(kartik\select2\Select2::classname(), [
        'data' => \yii\helpers\ArrayHelper::map(\app\models\User::find()->orderBy('nome ASC' )->all(), 'id', 'nome'),
        'options' => ['placeholder' => 'Selecione o participante...'],
        'pluginOptions' => [
            'allowClear' => true
        ],
       ]);
    ?>
    <!--?php if ($model->participante_id == (Yii::$app->user->identity->role == 2)) { ?-->
    <?=$form->field($model, 'tipo')->widget(kartik\select2\Select2::classname(), [
        'data' => \yii\helpers\ArrayHelper::map(\app\models\Users::find()->orderBy('nome ASC' )->all(), 'id', 'nome'),
        'options' => ['placeholder' => 'Selecione o tipo...'],
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
                                $.pjax.reload({container:'#usuarios'});
            
                         
                            
                            console.log(result);
                        }).fail(function(){
                                    console.log(result);
                                });            
                return false;
                });
                    
                    
JS;


$this->registerJs($script)
?>