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
use yii\helpers\ArrayHelper;


/* @var $this yii\web\View */
/* @var $model app\models\Projetos */
/* @var $form yii\widgets\ActiveForm */
//$this->params['breadcrumbs'][] = 'Justificativa de Reprovação - Cadastro de Projetos';
?>



<?php $form = ActiveForm::begin(); ?>


<div class="panel-body">
    <div class="panel panel-danger">
        <div class="panel-heading">
            <h3 class="panel-title">Gerenciar Equipe - Cadastro de Projetos</h3>
        </div>


        <div class="panel-body">     

            <?php if (Yii::$app->user->can('coordenador') || (Yii::$app->user->can('servidor'))) { ?>

                
               <?= $form->field($model, 'nome')->dropDownList(ArrayHelper::map(\app\models\User::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?>
                <?= $form->field($model, 'tipoUsuario')->dropDownList(ArrayHelper::map(\app\models\Users::find()->asArray()->all(), 'nome', 'nome'), ['prompt' => 'Selecione'], array('selected' => true)) ?>

                <div class="form-group">
                    <?= Html::submitButton('Registrar', ['class' => 'btn btn-success']) ?>
                </div>

            <?php } ?>  

        </div>

    </div>
</div>   
<?php ActiveForm::end(); ?> 




