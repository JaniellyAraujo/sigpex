<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Municipio */

?>
<div class="area-view">

    <div class="panel panel-info">
        <div class="panel-heading">
        <h5 class="panel-title">DADOS DO MUNICÍPIO BENEFICIADO</h5>
        </div>
        <div class="panel-body">
             <p class="pull-right">
                <?= Html::a(Yii::t('app', 'Atualizar'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
                <?= Html::a(Yii::t('app', 'Excluir'), ['delete', 'id' => $model->id], [
                    'class' => 'btn btn-danger',
                    'data' => [
                        'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                        'method' => 'post',
                    ],
                ]) ?>
            </p>
            <?= DetailView::widget([
                'model' => $model,
                'attributes' => [
                    //'id',
                    'nome',
                ],
            ]) ?>

        </div>
    </div>
</div>

