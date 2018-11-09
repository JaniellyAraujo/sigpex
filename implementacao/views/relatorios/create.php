<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Relatorios */
?>
<div class="relatorios-create">

    <h3 class="box-title"><i class="fa fa-plus"></i> Adicionar Gerenciador de Relatório</h3>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
