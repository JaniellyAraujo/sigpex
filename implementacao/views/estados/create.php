<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Estados */

?>
<div class="estados-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
