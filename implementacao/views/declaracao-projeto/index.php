<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DeclaracaoProjetoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Declaracao Projetos');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="declaracao-projeto-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Declaracao Projeto'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'id_declaracao',
            'id_projeto',
            'dataEmissao',
            'status',
            //'participante_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
