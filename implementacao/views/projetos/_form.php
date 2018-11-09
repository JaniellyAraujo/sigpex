<?php
/* * ****************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
  /***************************************************************** */

use yii\widgets\ActiveForm;
use \yii\helpers\ArrayHelper;
use yii\helpers\Html;
use app\models\User;
use app\models\Users;
use yii\helpers\Url;
use kartik\select2\Select2;
use yii\web\JsExpression;
use kartik\dialog\Dialog;
use yii\bootstrap\Modal;

if ($model->isAtivo == 5) {
    $permission = true;
} else {
    $permission = false;
}
echo Dialog::widget(['overrideYiiConfirm' => true]);

/* @var $this yii\web\View */
/* @var $model app\models\Projetos */
/* @var $form yii\widgets\ActiveForm */
?>
<style>
    .box .box-solid {
        background-color: #F8F8F8;
    }
</style>
<div class="box-primary box view-item col-xs-12 col-lg-12">
    <p class="note">Os campos com <span class="required"> <b style=color:red;>*</b></span> são obrigatórios.</p>

    <div class="box-body">
        
        <?php $form = ActiveForm::begin(); ?>
        <?= $form->errorSummary($model); ?>
        <?php if (Yii::$app->user->can('createPost')) { ?>
        
            <?php if (($model->justificativa) != null) { ?> 
                <div class="box box-solid box-warning col-xs-12 col-lg-12 no-padding"> <!--Exemmlo botão voltar -->
                    <div class="box-header with-border">
                        <h4 class="box-title"><i class="fa fa-info-circle"></i> JUSTIFICATIVA</h4>
                    </div>
                    <div class="box-body">
                        <table class="table table-striped">
                            <tr><td>
                                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                        <div class="col-md-12"><b>JUSTIFICATIVA: </b><?= Html::encode($model->justificativa) ?></div>
                                    </div>
                                </td></tr></table>


                    </div> 
                </div>
            <?php } ?>
            <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
                <div class="box-header with-border">
                    <h4 class="box-title"><i class="glyphicon glyphicon-th-large"></i> IDENTIFICAÇÃO DO PROJETO DE EXTENSÃO</h4>
                </div>
                <div class="box-body">

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">

                        <div class="col-md-5"><?= $form->field($model, 'titulo')->textInput(['maxlength' => true, 'autofocus' => true, 'disabled' => $permission/* , 'style' => 'text-transform:uppercase' */]) ?></div>
                       <div class="col-md-3"><?=
                                $form->field($model, 'tipoProjeto')->widget(Select2::classname(), [
                                    'data' => ArrayHelper::map(\app\models\Project::find()->orderBy('nome ASC' )->all(), 'nome', 'nome'),
                                    'options' => ['placeholder' => 'Selecione o tipo...'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                                ?>
                        </div>
                         <div class="col-md-4"><?=
                                $form->field($model, 'modalidade')->widget(Select2::classname(), [
                                    'data' => ArrayHelper::map(\app\models\Modalidade::find()->orderBy('nome ASC' )->all(), 'nome', 'nome'),
                                    'options' => ['placeholder' => 'Selecione a modalidade...'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                                ?>
                        </div>
                        
                    </div>

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                       
                        <div class="col-md-4"><?= $form->field($model, 'publicoAlvo')->textInput(['maxlength' => true, 'disabled' => $permission]) ?></div>
                        <div class="col-md-4"><?=
                                $form->field($model, 'municipio')->widget(Select2::classname(), [
                                    'data' => ArrayHelper::map(\app\models\Municipio::find()->orderBy('nome ASC' )->all(), 'nome', 'nome'),
                                    'options' => ['placeholder' => 'Selecione o município ...'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                                ?>
                        </div>
                          <div class="col-md-4"> <?= $form->field($model, 'multicampi')->radioList(array('Sim' => 'Sim', 'Não' => 'Não'),['disabled' => $permission ]); ?></div>
                       
                        </div>
                        
                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-3"><?=
                                $form->field($model, 'areaConhecimento')->widget(Select2::classname(), [
                                    'data' => ArrayHelper::map(\app\models\Area::find()->orderBy('nome ASC' )->all(), 'nome', 'nome'),
                                    'options' => ['placeholder' => 'Área de conhecimento...'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                                ?>
                            
                        </div>
                        
                                  
                                   
                        <div class="col-md-4"><?=
                                $form->field($model, 'campusDesenvolvido')->widget(Select2::classname(), [
                                    'data' => ArrayHelper::map(\app\models\Campus::find()->orderBy('nome ASC' )->all(), 'nome', 'nome'),
                                    'options' => ['placeholder' => 'Selecione o campus...'],
                                    'pluginOptions' => [
                                        'allowClear' => true
                                    ],
                                ]);
                                ?>
                        </div>
                        <div class="col-md-4"><?= $form->field($model, 'pesAtendidas')->textInput(['disabled' => $permission]) ?></div>
                    </div>

                    


                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-3"> <?= $form->field($model, 'dataInicio')->Input('date') ?></div>   
                        <div class="col-md-3"><?= $form->field($model, 'datafim')->Input('date') ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'cargHorariaSemanal')->textInput(['disabled' => $permission ]) ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'cargHorariaTotal')->textInput(['disabled' => $permission ]) ?> </div>
                    </div>


                </div> 
             
            </div>

           

    <?php } ?>
    <div class="box-footer">
                <button onClick="history.go(-1)" class="btn btn-default" > Cancelar </button> <!--Exemmlo botão voltar -->           
                <button type="submit" class="btn btn-info pull-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Próximo</font></font></button>
            </div>
    <?php ActiveForm::end(); ?>

    </div>
</div>





