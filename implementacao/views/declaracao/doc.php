<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $model app\models\Declaracao */
/* @var $form yii\widgets\ActiveForm */

?>
<?php
\yii\bootstrap\Modal::begin([
    'header' => '<h3><i class="fa fa-file-text (alias)"></i> Adicionar Declaração</h3>',
    'id' => 'modal4',
    'size' => 'modal-lg'
]);
echo "<div id='modalContent4'></div>";
\yii\bootstrap\Modal::end();
?>
<div class="panel panel-info">
    <div class="panel-heading">
        <h5 class="panel-title"><i class="fa fa-paste (alias)"></i> Declarações Relacionadas ao Projeto</h5>
    </div>
   
    <div class="box-body">
<div class="relatorios-form">

    <?php $form = ActiveForm::begin(); ?>

    <?=
    $form->field($model, 'id_projeto')->widget(kartik\select2\Select2::classname(), [
    'data' => \yii\helpers\ArrayHelper::map(\app\models\Projetos::find()->orderBy('titulo ASC' )->all(), 'id', 'titulo'),
    'options' => ['placeholder' => 'Selecione o projeto...'],
    'pluginOptions' => [
        'allowClear' => true
    ],
]);
?>
    <div class="box-body">
    <div class="box box-solid box-default col-xs-12 col-lg-12 no-padding">
    <div class="box-header with-border">
        <h4 class="box-title"><i class="fa fa-file-text (alias)"></i> Declarações Emitidas</h4>
    </div>
    <div class="box-body">
    <div class="pull-right">
        <?= Html::button('<b class="fa fa-file-text (alias)"></b> Adicionar ', ['value' => Url::to('../declaracao-projeto/create?id=' . $model->id), 'class' => 'btn btn-social btn-success showModalButton4']) ?>
    </div><br><br>
    <?php \yii\widgets\Pjax::begin(['id' => 'declaracao']) ?>   
        <?=GridView::widget([
            'dataProvider' => $data,
            'summary' => "<strong>Total </strong><strong>{totalCount}</strong>",
            'columns' => [
                [
                        'attribute' => 'participante.nome',
                        'header' => 'Participante',
                        'headerOptions' => ['class' => 'CustomHeadClass'],
                        'contentOptions' => ['class' => 'text-center'],
                    ],
                [
                'header' => 'Data de Emissão',
                'headerOptions' => ['class' => 'CustomHeadClass'],
                'contentOptions' => ['class' => 'text-center'],
                'attribute' => 'dataEmissao',
                'format' => 'raw',
                'value' => function ($model) {
                    if ($model->dataEmissao != null) {
                        //return Yii::$app->formatter->asDate($model->dataEmissao);
                        return Html::encode(Yii::$app->formatter->asDate($model->dataEmissao));
                         
                    } else {
                        return 'Não informado';
                    }
                },
            ],
                //'mes',
                ['class' => 'yii\grid\ActionColumn',
                'header' => "Remover",
                'headerOptions' => [ 'class' => 'CustomHeadClass '],
                'contentOptions' => ['class' => 'text-center'],
                'controller' => 'declaracao-projeto',
                'template' => '{delete}',
                'buttons' => [
                    'delete' => function ($url) {
                        return Html::a('<i class="fa fa-trash fa fa-white"></i>', $url, ['title' => 'Excluir Membro',
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
</div>

    <div class="form-group">
        <button type="submit" class="btn btn-social btn-success pull-right"><b class="fa fa-check-square-o"></b>Salvar</button>
    </div>

    <?php ActiveForm::end(); ?>

</div>
        </div>
    </div>
<style>
.CustomHeadClass {
  color: #3c8dbc;
  width: 15%;
  text-align:center;
}
</style>