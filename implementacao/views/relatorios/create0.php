<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\grid\GridView;
use yii\helpers\Url;
use kartik\datecontrol\DateControl;
use yii\bootstrap\Modal;

$permission = true;
/* if ($relatorio->status == 0 || $relatorio->status == 1|| $relatorio->status == 2) {
  $permission = true;
  } else {
  $permission = false;
  } */
?>

<?php
Modal::begin([
    'header' => '<h2>Adicionar item para relatório</h2>',
    'id' => 'modal',
    'size' => 'modal-lg'
]);
echo "<div id='modalContent'></div>";
Modal::end();
?> 

<div class="relatorios-index">

    <div class="panel panel-info">

        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-file-text-o"></i> Dados do Relatório</h5>
        </div>

        <div class="box-body">


            <?php
            $relatorio->id = Yii::$app->request->get('id');
            $form = ActiveForm::begin(['action' => ['relatorios/update?id=' . $relatorio->id], 'id' => $relatorio->formName(), 'options' => ['enctype' => 'multipart/form-data']]);
            ?>
            <div class="row">
                <div class="col-md-3">
                    <?= $form->field($relatorio, 'versao')->textInput(['disabled' => $permission]); ?>
                </div>   
                <div class="col-md-8">
                    <?= $form->field($relatorio, 'descricao')->textInput(['disabled' => $permission]); ?>
                </div> 
                <div class="col-md-1">
                    <label class="control-label" style="color:#fff">.</label>
                    <?= Html::button('Salvar', ['value' => Url::to('/relatorios/update?id=' . $relatorio->id), 'class' => 'btn btn-success', 'type' => 'submit', 'id' => 'saveRelatorio', 'disabled' => $permission]) ?>
                    <?php ActiveForm::end(); ?>
                </div> 
            </div> <br>

            <div class="row">
                <div class="col-md-8">
                    <?= Html::button('Criar Relatório', ['value' => Url::to('../relatorios-projetos/create?id=' . $relatorio->id), 'class' => 'btn btn-success', 'id' => 'modalButton', /* 'disabled' => $permission */]) ?>

                </div>
            </div>

            <?php yii\widgets\Pjax::begin(['id' => 'projetos']) ?>
            <br>
            <?=
            GridView::widget([
                'dataProvider' => $dataProvider,
                'columns' => [
                    //['class' => 'kartik\grid\SerialColumn'],
                    'projetos.titulo',
                    'bolsista',
                    'mes',
                    'coordenador',
                        [
                        'header' => 'Ações',
                        'content' => function (\app\models\RelatoriosProjetos $model, $key, $index, $column) {
                            $permission = true;
                            //if ($model->relatorio->status == 0 || $model->relatorio->status == 1) {
                            //  $permission = true;
                            // } else {
                            //$permission = false;
                            //}
                            return Html::a('', ['relatorios-projetos/delete?id=' . $model->id . ''], ['class' => 'btn btn-sm btn-danger fa fa-trash', 'disabled' => $permission]);
                        },
                    ],
                ],
            ]);
            ?>

            <?php yii\widgets\Pjax::end() ?>

            <div class="box-footer text-right" style="margin-top: 20px"> 
                <?= Html::a('Voltar', ['index'], ['class' => 'btn btn-warning']) ?>                   
                <?php
                if ($relatorio->status == 0) {
                    echo Html::a('Enviar Relatório', ['/relatorios/enviar?id=' . $relatorio->id], ['class' => 'btn btn-success', 'style' => 'margin-left:20px']);
                } elseif ($relatorio->status == 2) {
                    echo Html::a('Confirmar Relatorio', ['/relatorios/confirmar?id=' . $relatorio->id], ['class' => 'btn btn-danger', 'style' => 'margin-left:20px']);
                } else {
                    
                }
                ?>
            </div>

        </div>
    </div>
</div>

<?php
$script = <<< JS
            
            $('form#{$relatorio->formname()}').on('beforeSubmit', function(e)
            {
                var \$form = $(this);
                    $.post(
                        \$form.attr("action"),
                        \$form.serialize()               
                    )                              
                        .done(function(result){                           
                                $(\$form).trigger("reset");  
                                $(\$form).refresh();
                            console.log(result);
                        }).fail(function(){
                                    console.log(result);
                                });            
                return false;
                });               
                    
JS;

$this->registerJs($script);
?>






