<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Relatorios */
/* @var $modelsRelatorio app\models\Relatorios */


?>
<div class="relatorios-create">

    <?= $this->render('_form', [
        'model' => $model,
        'models' => $models,
    ]) ?>

</div>
