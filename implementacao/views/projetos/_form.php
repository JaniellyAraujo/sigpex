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
                    <h4 class="box-title"><i class="fa fa-info-circle"></i> IDENTIFICAÇÃO DO PROJETO DE EXTENSÃO</h4>
                </div>
                <div class="box-body">

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">

                        <div class="col-md-5"><?= $form->field($model, 'titulo')->textInput(['maxlength' => true, 'autofocus' => true/* , 'style' => 'text-transform:uppercase' */]) ?></div>
                        <div class="col-md-2"><?= $form->field($model, 'tipoProjeto')->dropDownList(ArrayHelper::map(\app\models\Project::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'modalidade')->dropDownList(ArrayHelper::map(\app\models\Modalidade::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?></div>
                        <div class="col-md-2"><?=
                            $form->field($model, 'valorFinanciamento', [
                                'template' =>
                                '<label class="control-label">Valor</label>
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

            <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
                <div class="box-header with-border">
                    <h4 class="box-title"><i class="fa fa-info-circle"></i> DETALHAMENTO DO PROJETO DE EXTENSÃO</h4>
                </div>
                <div class="box-body">

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-12"><?= $form->field($model, 'objetivo')->textarea(['rows' => 3]) ?></div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-12"><?= $form->field($model, 'resumo')->textarea(['rows' => 3]) ?></div>
                    </div>
                </div>

            </div>

            <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
                <div class="box-header with-border">
                    <h4 class="box-title"><i class="fa fa-info-circle"></i> OUTRAS ESPECIFICAÇÕES</h4>
                </div>
                <div class="box-body">

                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                            <div class="col-md-6"><?= $form->field($model, 'descricaoPopulacao')->textarea(['rows' => 1]) ?></div>
                            <div class="col-md-6"><?= $form->field($model, 'localExecucao')->textInput(['maxlength' => true]) ?></div>
                        </div>
                        <div class="col-md-3"><?= $form->field($model, 'vinculo')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'citarVinculo')->textInput(['maxlength' => true]) ?></div>
                        <div class="col-md-4"><?= $form->field($model, 'parceiros')
                                ->dropDownList(ArrayHelper::map(\app\models\Parceiros::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true))
                            ?>
                        </div>
                        <div class="col-md-2" style="padding-top: 15px;" >
                            
                                <div  class="btn btn-default" data-toggle="popover" data-trigger="hover" title="Adicionar Parceiro" data-placement="top" data-content="Clique aqui caso deseja adicionar um novo parceiro!">
                                    <?=
                                    Html::beginTag('a ', [
                                        'href' => '../parceiros/create',
                                        'target' => '_blank'
                                    ]) . Html::tag('i ', '', [
                                        'class' => 'fa fa-plus',
                                              
                                            //'class' => 'fa fa-plus fa-white',
                                             'color'=>"#737373;"
                                    ]) . Html::endTag('a ');
                                    ?>
                                </div>
                                <div class="btn btn-default" data-toggle="popover" data-trigger="hover" title="Atualizar Parceiros" data-placement="bottom" data-content="Clique aqui caso tenha adicionado um novo parceiro!">

                                    <?=
                                    Html::beginTag('a', [
                                        'href' => '#',
                                        'target' => '_blank',
                                        'class' => 'reload'
                                    ]) . Html::tag('i', '', [
                                            'class' => 'fa fa-rotate-left',
                                            //'style' => 'font-size:29px;padding-top: 29px;float:left;'
                                    ]) . Html::endTag('a ');
                                    ?>
                                </div>
                            
                        </div>

                    </div>


                    <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                        <div class="col-md-3"><?= $form->field($model, 'gerFundacao')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'citarFundacao')->textInput(['maxlength' => true]) ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'convenio')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
                        <div class="col-md-3"><?= $form->field($model, 'citarConvenio')->textInput(['maxlength' => true]) ?></div> 
                    </div>

                </div>
            </div>

            <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
                <div class="box-header with-border">
                    <h4 class="box-title"><i class="fa fa-info-circle"></i> EQUIPE EXECUTORA</h4>
                </div>
                <div class="box-body">
                    <ul id="item-usuario" class="list-unstyled" >
                                        <?php $first = true; ?>
                                        <?php foreach ($modelUsuarios as $modelUsuario) { ?>
                            <div id="div<?= $modelUsuario->idForm ?>" data-id="<?= $modelUsuario->idForm ?>" class="usuario">
                                <li id="subitem-usr" class="row mb-20 usr">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <?php $usuarios = User::find()->asArray()->all(); ?>
                                            <label class="control-label" for="projetos-participante">Participante:</label>
                                            <select id="projetos-participante" class="form-control" name="ProjetosUsuariosForm[<?= $modelUsuario->idForm ?>][usuario]" aria-invalid="false">
                                                <option value="">Selecione</option>
                                                    <?php foreach ($usuarios as $usuario) { ?>

                                                    <option value="<?= $usuario['id'] ?>" <?= ($modelUsuario->usuario == $usuario['id'] ? 'selected=""' : '') ?>><?= $usuario['nome'] ?></option>

                                                    <?php } ?>}
                                            </select>

                                            <div class="help-block"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                                <?php $tipos = Users::find()->asArray()->all(); ?>  <!--//->where(['OR', ['role'=> 2], ['role'=> 3], ['role'=> 4]]); ?-->
                                            <label class="control-label" for="projetos-participante">Tipo:</label>
                                            <select id="projetos-participante" class="form-control" name="ProjetosUsuariosForm[<?= $modelUsuario->idForm ?>][tipo]" aria-invalid="false">
                                                <option value="">Selecione</option>
                                                    <?php foreach ($tipos as $tipo) { ?>
                                                    <option value="<?= $tipo['nome'] ?>" <?= ($modelUsuario->tipo == $tipo['nome'] ? 'selected=""' : '') ?>><?= $tipo['nome'] ?></option>
                                                    <?php } ?>
                                            </select>

                                            <div class="help-block"></div>
                                        </div>
                                    </div>

                                    <div class="col-sm-12 col-md-2">
                                        <div class="form-group">
                                            <label class="control-label" style="display:block;">&nbsp;</label>
                                                <?php if ($first) { ?>
                                                <div class="pull-left">
                                                    <a class="btn btn-success btn-add-item">Adicionar</a></div>
                                                <?php $first = false; ?>
                                                <?php } else { ?>

                                                <button type='button' id="btn-remove-item" class='btn btn-remover btn-danger' onclick="$(this).closest('#div<?= $modelUsuario->idForm ?>').remove();">Remover</button>

                                        <?php } ?>
                                        </div>
                                    </div>

                                </li>
                                <hr>
                            </div>
                            <?php } ?>
                    </ul><!-- /#item-nf -->

                </div>
            </div>


            <div class="box-footer">
                <button onClick="history.go(-1)" class="btn btn-default" > Cancelar </button> <!--Exemmlo botão voltar -->           
                <button type="submit" class="btn btn-info pull-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Salvar</font></font></button>
            </div>

        <?php } ?>

    <?php ActiveForm::end(); ?>

    </div>
</div>
<script>
<?php $this->beginBlock('page-script') ?>
    (function () {
        var parceiros = '[name="' + '<?php echo Html::getInputName($model, 'parceiros'); ?>' + '"]';

        $('.reload').on('click', function () {
            $.ajax({
                type: 'get',
                url: '../parceiros/parceiros-ajax',
            }).done(function (retorno) {
                $(parceiros).empty().append('<option value="">Selecione</option>');

                for (var i = 0; i < retorno.length; i++) {
                    var parceiro = retorno[i];
                    $('<option>').val(parceiro.parceiros_id).html(parceiro.primaryText).appendTo(parceiros);
                }
                $(parceiros).selectpicker('refresh');
            });

            return false;
        });


        var users = document.getElementById('item-usuario').getElementsByClassName('usuario');
        var last = users[users.length - 1];
        var id = last.dataset.id;

        $('.btn-add-item').click(function () {
            id++;

            var lista = document.getElementById("item-usuario");

            let contentHTML = `
            <div id="div${id}">
                <li>
         
                    <div class="col-md-8">
                        <div class="form-group">
                            <?php $usuarios = User::find()->asArray()->all(); ?>
                            <label class="control-label" for="projetos-participante">Participante:</label>
                            <select id="projetos-participante" class="form-control" name="ProjetosUsuariosForm[${id}][usuario]" aria-invalid="false">
                                <option value="">Selecione</option>
                                <?php foreach ($usuarios as $usuario) { ?>
                                        <option value="<?= $usuario['id'] ?>"><?= $usuario['nome'] ?></option>
<?php } ?>
                            </select>

                            <div class="help-block"></div>
                        </div>
                    </div>
                                            
                    <div class="col-md-2">
                        <div class="form-group">
                            <?php $usuarios = Users::find()->asArray()->all(); ?>
                            <label class="control-label" for="projetos-participante">Tipo:</label>
                            <select id="projetos-participante" class="form-control" name="ProjetosUsuariosForm[${id}][tipo]" aria-invalid="false">
                                <option value="">Selecione</option>
                                    <?php foreach ($usuarios as $usuario) { ?>
                                        <option value="<?= $usuario['nome'] ?>"><?= $usuario['nome'] ?></option>
                                    <?php } ?>
                            </select>

                            <div class="help-block"></div>
                        </div>
                    </div>
                                            
                    <div class="col-sm-12 col-md-2">
                        <div class="form-group">
                            <label class="control-label" style="display:block;">&nbsp;</label>
                            <button type='button' id="btn-remove-item" class='btn btn-remover btn-danger' onclick="$(this).closest('#div${id}').remove();"><i class="fa fa-trash"></i></button>
                        </div>
                    </div>
                    
                </li>
            </div>`;


            lista.insertAdjacentHTML('beforeend', contentHTML);

            var lis = document.getElementById("item-usuario").getElementsByTagName('li');
            for (var i = 0; i < lis.length; i++) {
                var list = lis[i].className = 'row mt-20 itens-checklist:' + i;
            }
        });

    })();
    $(function () {
        $('[data-toggle="popover"]').popover()
    })
 
<?php $this->endBlock() ?>
</script>

<?php $this->registerJs($this->blocks['page-script']) ?>
