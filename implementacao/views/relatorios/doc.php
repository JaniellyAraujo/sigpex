<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $model app\models\Relatorios */
/* @var $form yii\widgets\ActiveForm */

?>
<?php
\yii\bootstrap\Modal::begin([
    'header' => '<h3><i class="fa fa-file-text (alias)"></i> Adicionar Relatório</h3>',
    'id' => 'modal3',
    'size' => 'modal-lg'
]);
echo "<div id='modalContent3'></div>";
\yii\bootstrap\Modal::end();
?>
<div class="panel panel-info">
    <div class="panel-heading">
        <h5 class="panel-title"><i class="fa fa-paste (alias)"></i> Projeto com Relatórios em Andamento</h5>
    </div>
   
    <div class="box-body">
<div class="relatorios-form">

    <?php $form = ActiveForm::begin(); ?>

    <?=
    $form->field($model, 'projeto_id')->widget(kartik\select2\Select2::classname(), [
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
        <h4 class="box-title"><i class="fa fa-file-text (alias)"></i> Relatórios Entregues</h4>
    </div>
    <div class="box-body">
    <div class="pull-right">
        <?= Html::button('<b class="fa fa-file-text (alias)"></b>Adicionar ', ['value' => Url::to('../relatorios-projeto/create?id=' . $model->id), 'class' => 'btn btn-social btn-success showModalButton3']) ?>
    </div><br><br>
    <?php \yii\widgets\Pjax::begin(['id' => 'relatorios']) ?>   
        <?=GridView::widget([
            'dataProvider' => $data,
            'summary' => "<strong>Total </strong><strong>{totalCount}</strong>",
            'columns' => [
                'discente',
                'tipo',
                //'dataEntrega',
                [
                        'header' => 'Data de Entrega',
                        'headerOptions' => ['class' => 'CustomHeadClass'],
                        'contentOptions' => ['class' => 'text-center'],
                        'attribute' => 'dataEntrega',              
                        'format' => 'raw',
                        'value' => function ($model) {
                            if ($model->dataEntrega != null) {
                                return Yii::$app->formatter->asDate($model->dataEntrega);
                            } else {
                                return 'Não informado';
                            }
                        },
                    ],
                [
                        'header' => 'Mês',
                        'format' => 'raw',
                        'headerOptions' => [ 'class' => 'CustomHeadClass'],
                        'contentOptions' => ['class' => 'text-center'],
                        'value' => function($data) {
                            if ($data->mes == 1) {
                                return 'Janeiro';
                            }
                            if ($data->mes == 2) {
                                return 'Fevereiro';
                            }
                            if ($data->mes == 3) {
                                return 'Março';
                            }
                            if ($data->mes == 4) {
                                return 'Abril';
                            }
                            if ($data->mes == 5) {
                                return 'Maio';
                            }
                            if ($data->mes == 6) {
                                return 'Junho';
                            }
                            if ($data->mes == 7) {
                                return 'Julho';
                            }
                            if ($data->mes == 8) {
                                return 'Agosto';
                            }
                             if ($data->mes == 9) {
                                return 'Setembro';
                            }
                            if ($data->mes == 10) {
                                return 'Outubro';
                            }
                            if ($data->mes == 11) {
                                return 'Novembro';
                            }
                            if ($data->mes == 12) {
                                return 'Dezembro';
                            }
                        }
                        ],
                //'mes',
                ['class' => 'yii\grid\ActionColumn',
                'header' => "Remover",
                'headerOptions' => [ 'class' => 'CustomHeadClass '],
                'contentOptions' => ['class' => 'text-center'],
                'controller' => 'relatorios-projeto',
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