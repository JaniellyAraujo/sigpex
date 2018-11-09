<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\TipoRelatorio */

$this->title = Yii::t('app', 'Create Tipo Relatorio');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Tipo Relatorios'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tipo-relatorio-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
