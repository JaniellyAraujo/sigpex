<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CidadesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

?>
<div class="cidades-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Cidades'), null, ['value' => Url::to(['create']), 'title' => 'Create', 'class' => 'showModalButton btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'nome',
            'estados_id',

            ['class' => 'chaofei\ajaxmodal\ActionColumn'],
        ],
    ]); ?>
</div>

<?= \chaofei\ajaxmodal\AjaxModalWidget::widget() ?>
