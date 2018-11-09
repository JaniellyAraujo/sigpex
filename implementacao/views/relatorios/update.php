<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Relatorios */

?>
<div class="relatorios-update">

    <h3 class="box-title"><i class="fa fa-pencil-square"></i> Atualizar Relatório</h3>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
