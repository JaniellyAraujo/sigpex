<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\RelatoriosProjetos */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title"><i class="fa fa-cubes"></i> Dados do Projeto</h3>
    </div>
    <div class="box-body">
        <div  class="panel-group collapse in">
            <div class="relatorios-projetos-form">

                <?php $form = ActiveForm::begin(['id' => $model->formName()]); ?>

                <div class="row" >
                    <div class="col-md-6" style="display: none">
                        <?= $form->field($model, 'id_relatorios')->textInput() ?>
                    </div>    

                </div>

                <div class="row" >
                    <div class="col-md-4" >
                        <?= $form->field($model, 'id_projeto')->dropDownList(ArrayHelper::map(app\models\Projetos::find()->asArray()->all(), 'id', 'nome')) ?>

                    </div>    


                </div>

                <div class="row">

                    <div class="col-md-4" >
                        <?= $form->field($model, 'bolsista')->textInput() ?>

                    </div> 
                    <div class="col-md-4" >
                        <?= $form->field($model, 'mes')->textInput() ?>

                    </div> 

                    <!--div class="col-md-4" >
                        <--?= $form->field($model, 'coordenador')->textInput() ?>

                    </div>
                    <div class="col-md-4" >
                        <--?= $form->field($model, 'atividades')->textInput() ?>

                    </div>
                    <div class="col-md-4" >
                        <-?= $form->field($model, 'periodo1')->textInput(['maxlength' => true]) ?>

                    </div>
                    <div class="col-md-4" >
                        < ?= $form->field($model, 'periodo2')->textInput(['maxlength' => true]) ?>

                    </div>
                    <div class="col-md-4" >
                        < ?= $form->field($model, 'periodo3')->textInput(['maxlength' => true]) ?>

                    </div>
                    <div class="col-md-4" >
                        < ?= $form->field($model, 'periodo4')->textInput(['maxlength' => true]) ?>

                    </div>
                    <div class="col-md-4" >
                        < ?= $form->field($model, 'carga1')->textInput(['maxlength' => true]) ?>

                    </div>
                   <div class="col-md-4" >
                        < ?= $form->field($model, 'carga2')->textInput(['maxlength' => true]) ?>

                    </div>
                    <div class="col-md-4" >
                        < ?= $form->field($model, 'carga3')->textInput(['maxlength' => true]) ?>

                    </div>
                    <div class="col-md-4" >
                        < ?= $form->field($model, 'carga4')->textInput(['maxlength' => true]) ?>

                    </div>
                    <div class="col-md-4" >
                        < ?= $form->field($model, 'total')->textInput(['maxlength' => true]) ?>

                    </div>
                    <div class="col-md-4" >
                        < ?= $form->field($model, 'avaliacao')->textInput(['maxlength' => true]) ?>

                    </div>
                    <div class="col-md-4" >
                        < ?= $form->field($model, 'observacao')->textInput() ?>

                    </div-->
                    
                    
                </div>

                <div class="box-footer text-right" style="margin-top: 20px"> 
                    <?= Html::submitButton('Adicionar', ['class' => 'btn btn-success']) ?>
                </div>

                <?php ActiveForm::end(); ?>

            </div>



        </div>


    </div>







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
                                $.pjax.reload({container:'#projetos'});
            
                         
                            
                            console.log(result);
                        }).fail(function(){
                                    console.log(result);
                                });            
                return false;
                });
                    
                    
JS;

$this->registerJs($script)

?>
<script>
$(function () {
    $('#modalButton').click(function () {
        $('#modal').modal('show')
                .find('#modalContent')
                .load($(this).attr('value'));
    });
});
</script>
