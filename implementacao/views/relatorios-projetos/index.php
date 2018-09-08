<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\bootstrap\Modal;
use yii\helpers\Url;


/* @var $this yii\web\View */
/* @var $searchModel app\models\RelatoriosProjetosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

?>
<div class="relatorios-projetos-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    
    
      <?= Html::button('Adicionar', ['value' => Url::to('create'), 'class' => 'btn btn-success', 'id' => 'modalButton']) ?>

                <?php
                Modal::begin([
                    'header' => '<h2>Adicionar item</h2>',
                    'id' => 'modal',
                    'size' => 'modal-lg'
                ]);

                echo "<div id='modalContent'></div>";

                Modal::end();
                ?> 


    

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'id',
            'id_relatorios',
            'id_projeto',
            'mes',
            'bolsista',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
