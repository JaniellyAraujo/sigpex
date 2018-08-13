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

use yii\widgets\ActiveForm;
use \yii\helpers\ArrayHelper;
use yii\helpers\Html;
use app\models\User;
use app\models\Users;

/* @var $this yii\web\View */
/* @var $model app\models\Projetos */
/* @var $form yii\widgets\ActiveForm */
?>
<style>
    .box .box-solid {
        background-color: #F8F8F8;
    }
</style>
<div class="box-info box view-item col-xs-12 col-lg-12">
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
            <div class="box box-solid box-success col-xs-12 col-lg-12 no-padding">
                <div class="box-header with-border">
                    <h4 class="box-title"><i class="fa fa-info-circle"></i> IDENTIFICAÇÃO DO PROJETO DE EXTENSÃO</h4>
                </div>
                <div class="box-body">

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">

                        <div class="col-md-5"><?= $form->field($model, 'titulo')->textInput(['maxlength' => true, 'autofocus' => true/* , 'style' => 'text-transform:uppercase' */]) ?></div>
                        <div class="col-md-2"><?= $form->field($model, 'coordenador')->dropDownList(ArrayHelper::map(User::find()->where(['role' => 3])->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>
                        <div class="col-md-2"><?= $form->field($model, 'tipoProjeto')->dropDownList(ArrayHelper::map(\app\models\Project::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'modalidade')->dropDownList(ArrayHelper::map(\app\models\Modalidade::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>


                    </div>

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-6"> <?= $form->field($model, 'municipio')->textInput(['maxlength' => true]) ?></div>
                        <div class="col-md-6"><?= $form->field($model, 'publicoAlvo')->textInput(['maxlength' => true]) ?></div>

                    </div>

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-2"><?= $form->field($model, 'areaConhecimento')->dropDownList(ArrayHelper::map(\app\models\Area::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>
                        <div class="col-md-4"><?= $form->field($model, 'campusDesenvolvido')->dropDownList(ArrayHelper::map(\app\models\Campus::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'pesAtendidas')->textInput() ?></div>
                        <div class="col-md-3"> <?= $form->field($model, 'multicampi')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
                    </div>



                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-3"> <?= $form->field($model, 'dataInicio')->Input('date') ?></div>   
                        <div class="col-md-3"><?= $form->field($model, 'datafim')->Input('date') ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'cargHorariaSemanal')->textInput() ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'cargHorariaTotal')->textInput() ?> </div>
                    </div>


                </div> 
            </div>

            <div class="box box-solid box-info col-xs-12 col-lg-12 no-padding">
                <div class="box-header with-border">
                    <h4 class="box-title"><i class="fa fa-info-circle"></i> DETALHAMENTO DO PROJETO DE EXTENSÃO</h4>
                </div>
                <div class="box-body">

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-6"><?= $form->field($model, 'descricaoPopulacao')->textarea(['rows' => 3]) ?></div>
                        <div class="col-md-6"><?= $form->field($model, 'localExecucao')->textInput(['maxlength' => true]) ?></div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-12"><?= $form->field($model, 'objetivo')->textarea(['rows' => 3]) ?></div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-12"><?= $form->field($model, 'resumo')->textarea(['rows' => 3]) ?></div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-4"><?= $form->field($model, 'vinculo')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
                        <div class="col-md-4"><?= $form->field($model, 'citarVinculo')->textInput(['maxlength' => true]) ?></div>
                        <div class="col-md-4"><?= $form->field($model, 'parceiros')->dropDownList(ArrayHelper::map(\app\models\Parceiros::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>

                    </div>


                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-3"><?= $form->field($model, 'gerFundacao')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'citarFundacao')->textInput(['maxlength' => true]) ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'convenio')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'citarConvenio')->textInput(['maxlength' => true]) ?></div> 
                    </div>
                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-3"><?= $form->field($model, 'financiamento')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
                        <div class="col-md-3"><?=
    $form->field($model, 'tipoFinanciamento')->dropDownList(array('Interno' => 'Interno',
        'Próprio' => 'Próprio',), ['prompt' => 'Selecione'], array('selected' => true))
    ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'citarFinanciamento')->textInput(['maxlength' => true]) ?></div>

                        <div class="col-md-3"><?=
                        $form->field($model, 'valorFinanciamento', [
                            'template' =>
                            '<label class="control-label">Citar Financiamento</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">$</span>
                                        {input}
                                        <span class="input-group-addon">.00</span>
                                    </div>
                                {error}',
                            'inputOptions' => [
                                // 'placeholder' => 'Username ...',
                                'class' => 'form-control',
                    ]])
    ?>
                        </div>
                    </div>

                </div>
            </div>

            <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
                <div class="box-header with-border">
                    <h4 class="box-title"><i class="fa fa-info-circle"></i> EQUIPE EXECUTORA</h4>
                </div>
                <div class="box-body">

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">

                        <div class="row"><div class="col-md-7">
    <!--?php
    $url = Yii::$app->urlManager->createUrl(["/projetos/inserir-participante"]);
    $url = Url::to(['/projetos/inserir-participante']);

    echo $form->field($model, 'participante')->widget(Select2::classname(), [
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
    ?--></div>


                        </div>


                        <div class="col-md-8"><?= $form->field($model, 'participante')->dropDownList(ArrayHelper::map(User::find()->where(['OR', ['role' => 3], ['role' => 4]])->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>
                        <div class="col-md-4"><?= $form->field($model, 'tipoUsuario')->dropDownList(ArrayHelper::map(Users::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>
                    </div>

                </div> 
            </div>


            <div class="box-footer">
                <?= Html::a('Cancelar', ['projetos/index'], ['class' => 'btn btn-default']) ?>
             <button type="submit" class="btn btn-info pull-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Salvar</font></font></button>
            </div>

<?php } ?>

<?php ActiveForm::end(); ?>

    </div>
</div>
