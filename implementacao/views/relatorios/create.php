<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Relatorios */

?>
<div class="relatorios-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelRelatorios' => $modelRelatorios,
    ]) ?>
</div>
