<?php

/******************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
 /******************************************************************/

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\UsuariosSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="usuarios-search">

    <?php
    $form = ActiveForm::begin([
                'action' => ['index'],
                'method' => 'get',
    ]);
    ?>

<?php // $form->field($model, 'id_usuario')  ?>

    <div class="row">
        <div class="col-md-3"><?= $form->field($model, 'nome') ?></div>
        <div class="col-md-3"><?= $form->field($model, 'cpf') ?></div>
        <div class="col-md-3"><?= $form->field($model, 'role') ?></div>
        <div class="col-md-3"><?= $form->field($model, 'email') ?></div>
    </div>

    <?php //$form->field($model, 'rua') ?>

    <?php //$form->field($model, 'rg') ?>

    <?php // echo $form->field($model, 'numero') ?>

    <?php // echo $form->field($model, 'complemento') ?>

    <?php // echo $form->field($model, 'bairro') ?>

    <?php // echo $form->field($model, 'cidade') ?>

    <?php // echo $form->field($model, 'estado') ?>

    <?php // echo $form->field($model, 'telefone') ?>

        <?php // echo $form->field($model, 'senha')  ?>

    <div class="form-group">
<?= Html::submitButton('Buscar', ['class' => 'btn btn-primary']) ?>
    <?= Html::resetButton('Limpar', ['class' => 'btn btn-default']) ?>
    </div>

<?php ActiveForm::end(); ?>

</div>
