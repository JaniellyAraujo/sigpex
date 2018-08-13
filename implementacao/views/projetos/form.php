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
use kartik\widgets\Select2;
use yii\helpers\ArrayHelper;
use yii\web\JsExpression;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $participanteModel app\models\ProjetoEquipe */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="box box-solid box-info col-xs-12 col-lg-12 no-padding">
                <div class="box-header with-border">
                    <h4 class="box-title"><i class="fa fa-info-circle"></i> EQUIPE EXECUTORA</h4>
                </div>
                <div class="box-body"></div>

                <?php
                //$form = ActiveForm::begin();
                $form = ActiveForm::begin(['action' => Url::to(['projetos/adicionaequipe'])]);
                ?>

                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Adicionar Participantes</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row"><div class="col-md-7"><?= $form->field($participanteModel, 'projeto_id')->textInput() ?></div></div>

                        <div class="row"><div class="col-md-7">
            <?php
            
            $url = Yii::$app->urlManager->createUrl(["/projetos/inserir-participante"]);
            $url = Url::to(['/projetos/inserir-participante']);

            echo $form->field($participanteModel, 'participante_id')->widget(Select2::classname(), [
                'options' => ['placeholder' => 'Buque pelo nome do participante...'],
                'pluginOptions' => [
                    'allowClear' => false,
                    'minimumInputLength' => 2, 
                    'language' => [
                        'errorLoading' => new JsExpression("function () { return 'Aguarde...'; }"),
                    ],
                    'ajax' => [
                        'url' => $url,
                        'dataType' => 'json',
                        'data' => new JsExpression('function(params) { return {q:params.term}; }')
                    ],
                    'escapeMarkup' => new JsExpression('function (markup) { return markup; }'),
                    'templateResult' => new JsExpression('function(j_usuarios) { return nome.text; }'),
                    'templateSelection' => new JsExpression('function (j_usuarios) { return nome.text; }'),
                ],
            ]);
            echo $form->field($model, 'tipoUsuario')->dropDownList(ArrayHelper::map(\app\models\Users::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true));
    ?></div>


                        </div>
                        <div class="form-group">
                            <br><?= Html::submitButton($participanteModel->isNewRecord ? 'Salvar' : 'Atualizar', ['class' => $participanteModel->isNewRecord ? 'btn btn-success' : 'btn btn-success']) ?>
                        </div>
                    </div>
    <?php ActiveForm::end(); ?>

 </div></div>


