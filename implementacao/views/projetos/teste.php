<?php

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
    $permission =  true;
} else {
    $permission = false ;
}
?>


<?php
\yii\bootstrap\Modal::begin([
    'header' => '<h3><i class="fa fa-institution"></i> Adicionar Parceiro</h3>',
    'id' => 'modal',
    'size' => 'modal-lg'
]);
echo "<div id='modalContent'></div>";
\yii\bootstrap\Modal::end();
?>
<?php
\yii\bootstrap\Modal::begin([
    'header' => '<h3><i class="fa fa-users"></i> Adicionar Participante</h3>',
    'id' => 'modal2',
    'size' => 'modal-lg'
]);
echo "<div id='modalContent2'></div>";


\yii\bootstrap\Modal::end();
?>
<?php $form = ActiveForm::begin(); ?>

<div class="box-primary box view-item col-xs-12 col-lg-12">
    
    <div class="box-body">
<div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
    <div class="box-header with-border">
        <h4 class="box-title"><i class="glyphicon glyphicon-th-large"></i> IDENTIFICAÇÃO DO PROJETO DE EXTENSÃO</h4>
    </div>
    <div class="box-body">

        <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">

            <div class="col-md-5"><?= $form->field($model, 'titulo')->textInput(['maxlength' => true, 'disabled' => $permission/* , 'style' => 'text-transform:uppercase' */]) ?></div>
            <div class="col-md-3"><?=
                                    $form->field($model, 'tipoProjeto')->widget(Select2::classname(), [
                                        'data' => ArrayHelper::map(\app\models\Project::find()->all(), 'nome', 'nome'),
                                        'disabled' => $permission,
                                        'options' => ['placeholder' => 'Selecione o tipo...'],
                                        'pluginOptions' => [
                                            'allowClear' => true
                                        ],
                                    ]);
                                    ?>
            </div>
            <div class="col-md-4"><?=
                $form->field($model, 'modalidade')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(\app\models\Modalidade::find()->orderBy('nome ASC')->all(), 'nome', 'nome'),
                    'disabled' => $permission,
                    'options' => ['placeholder' => 'Selecione a modalidade...'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
                ?>
            </div>
            <!--?=
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
                        'disabled' => $permission,
            ]])
                ?-->


        </div>

        <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">

            <div class="col-md-5"><?= $form->field($model, 'publicoAlvo')->textInput(['maxlength' => true, 'disabled' => $permission]) ?></div>
            <div class="col-md-5"><?=
                $form->field($model, 'municipio')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(\app\models\Municipio::find()->orderBy('nome ASC')->all(), 'nome', 'nome'),
                    'disabled' => $permission,
                    'options' => ['placeholder' => 'Selecione o município ...'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
                ?>
            </div>
            <div class="col-md-2"> <?= $form->field($model, 'multicampi')->radioList(array('Sim' => 'Sim', 'Não' => 'Não'), ['disabled' => $permission]); ?></div>

        </div>

        <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
            <div class="col-md-4"><?=
                $form->field($model, 'areaConhecimento')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(\app\models\Area::find()->all(), 'nome', 'nome'),
                    'disabled' => $permission,
                    'options' => ['placeholder' => 'Área de conhecimento...'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]);
                ?>

            </div>



            <div class="col-md-4"><?=
                $form->field($model, 'campusDesenvolvido')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(\app\models\Campus::find()->all(), 'nome', 'nome'),
                    'disabled' => $permission,
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
            <div class="col-md-3"><?= $form->field($model, 'cargHorariaSemanal')->textInput(['disabled' => $permission]) ?></div>
            <div class="col-md-3"><?= $form->field($model, 'cargHorariaTotal')->textInput(['disabled' => $permission]) ?> </div>
        </div>

    </div> 
 
</div>
<div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
    <div class="box-header with-border">
        <h4 class="box-title"><i class="fa fa-users"></i> EQUIPE EXECUTORA</h4>
    </div>
    <div class="box-body">
    <div class="pull-right">
        <?= Html::button('<b class="fa fa-users"></b> Adicionar', ['value' => Url::to('../projeto-equipe/create?id=' . $model->id), 'class' => 'btn btn-social btn-success showModalButton2']) ?>
    </div><br><br>
    <?php \yii\widgets\Pjax::begin(['id' => 'usuarios']) ?>   
        <?=kartik\grid\GridView::widget([
            'dataProvider' => $data2,
            'summary' => "<strong>Total </strong><strong>{totalCount}</strong>",
            'columns' => [
                'participante.nome',
                [
                    'label' => 'Tipo',
                    'attribute' => 'funcao.nome',
                ],
                ['class' => 'yii\grid\ActionColumn',
                'header' => "Remover",
                'headerOptions' => [ 'class' => 'CustomHeadClass '],
                'contentOptions' => ['class' => 'text-center'],
                'controller' => 'projeto-equipe',
                'template' => '{delete}',
                'buttons' => [
                    'delete' => function ($url) {
                        return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Excluir Participante',
                                    'class' => 'btn btn-danger ',
                                    'data-confirm' => 'Tem certeza de que deseja excluir este item?', // altera a mensagem de confirmação
                                    'data-method' => 'post',
                        ]);
                    },
                ]
            ]
          ],
        ]);
    ?>
    <?php \yii\widgets\Pjax::end(); ?>
    </div>
</div>
        
<div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
    <div class="box-header with-border">
        <h4 class="box-title"><i class="fa fa-institution"></i> PARCEIROS</h4>
    </div>
    <div class="box-body">
    <div class="pull-right">
        <?= Html::button('<b class="fa fa-institution"></b>Adicionar ', ['value' => Url::to('../parceirosprojetos/create?id=' . $model->id), 'class' => 'btn btn-social btn-success showModalButton']) ?>
    </div><br><br>
    <?php \yii\widgets\Pjax::begin(['id' => 'parceiros']) ?>   
        <?=kartik\grid\GridView::widget([
            'dataProvider' => $data,
            'summary' => "<strong>Total </strong><strong>{totalCount}</strong>",
            'columns' => [
                'parceiro.nome',
                ['class' => 'yii\grid\ActionColumn',
                'header' => "Remover",
                'headerOptions' => [ 'class' => 'CustomHeadClass '],
                'contentOptions' => ['class' => 'text-center'],
                'controller' => 'parceirosprojetos',
                'template' => '{delete}',
                'buttons' => [
                    'delete' => function ($url) {
                        return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Excluir Parceiro',
                                    'class' => 'btn btn-danger ',
                                    'data-confirm' => 'Tem certeza de que deseja excluir este item?', // altera a mensagem de confirmação
                                    'data-method' => 'post',
                        ]);
                    },
                ]
            ]
          ],
        ]);
    ?>
    <?php \yii\widgets\Pjax::end(); ?>
    </div>
</div>

<div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
    <div class="box-header with-border">
        <h4 class="box-title"><i class="fa fa-building-o"></i> DETALHAMENTO DO PROJETO DE EXTENSÃO</h4>
    </div>
    <div class="box-body">

        <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
            <div class="col-md-12"><?= $form->field($model, 'objetivo')->textarea(['rows' => 3, 'disabled' => $permission]) ?></div>
        </div>

        <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
            <div class="col-md-12"><?= $form->field($model, 'resumo')->textarea(['rows' => 3, 'disabled' => $permission]) ?></div>
        </div>
    </div>

</div>

<div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
    <div class="box-header with-border">
        <h4 class="box-title"><i class="glyphicon glyphicon-th-list"></i> OUTRAS ESPECIFICAÇÕES</h4>
    </div>
    <div class="box-body">

        <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                <div class="col-md-6"><?= $form->field($model, 'descricaoPopulacao')->textarea(['rows' => 1, 'disabled' => $permission]) ?></div>
                <div class="col-md-6"><?= $form->field($model, 'localExecucao')->textInput(['maxlength' => true, 'disabled' => $permission]) ?></div>
            </div>
            <div class="col-md-3"><?= $form->field($model, 'vinculo')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
            <div class="col-md-3"><?= $form->field($model, 'citarVinculo')->textInput(['maxlength' => true, 'disabled' => $permission]) ?></div>
            <div class="col-md-3"><?= $form->field($model, 'gerFundacao')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
            <div class="col-md-3"><?= $form->field($model, 'citarFundacao')->textInput(['maxlength' => true, 'disabled' => $permission]) ?></div>
            
        </div>


        <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
            <div class="col-md-3"><?= $form->field($model, 'convenio')->radioList(array('Sim' => 'Sim', 'Não' => 'Não')); ?></div>
            <div class="col-md-3"><?= $form->field($model, 'citarConvenio')->textInput(['maxlength' => true, 'disabled' => $permission]) ?></div> 
             <div class="col-md-6"><?php if (Yii::$app->user->identity->role == 2) { echo $form->field($model, 'dataAnalise')->Input('date'); }?></div>
        </div>

    </div>
</div>

<div class="box-footer">
    <?php if (Yii::$app->user->identity->role == 2) {
     echo Html::a(Yii::t('app', '<b class="fa fa-arrow-left"></b> Voltar'), ['projetos/aprovados'], ['class' => 'btn btn-social btn-default', 'style' => 'margin-left:10px']);}?>
    <?php if (Yii::$app->user->identity->role == 3) {
     echo Html::a(Yii::t('app', '<b class="fa fa-arrow-left"></b> Voltar'), ['projetos/index'], ['class' => 'btn btn-social btn-default', 'style' => 'margin-left:10px']);}?>
    <button type="submit" class="btn btn-social btn-info pull-right"><b class="fa fa-check-square-o"></b>Salvar</button>
</div>

<?php ActiveForm::end(); ?>
</div>
</div>
<style>
.CustomHeadClass {
  width: 25%;
  text-align:center;
}
</style>