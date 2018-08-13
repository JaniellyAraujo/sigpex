<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\file\FileInput;

/* @var $this yii\web\View */
/* @var $model app\models\Document */
/* @var $form yii\widgets\ActiveForm */

$this->title = 'Base de Dados - Administrador';
//$this->params['breadcrumbs'][] = ['label' => 'Administrador','url' => array('upload')];
?>

<?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>


<?=
$form->field($model, 'upload_file')->widget(FileInput::classname(), [
    'options' => ['accept' => 'mysql/*.sql'],
    'pluginLoading' => false,
    'pluginOptions' => [
        'showPreview' => false,
        'allowedFileExtensions' => ['sql'],
    ],
]);
?>


<div class="form-group">
    <?= Html::submitButton('Salvar', ['class' => 'btn btn-success'])?>
</div>

<?php ActiveForm::end(); ?>

<!-- form -->
