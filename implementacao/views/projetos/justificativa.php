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
/* @var $model app\models\Projetos */
/* @var $form yii\widgets\ActiveForm */
//$this->params['breadcrumbs'][] = 'Solicitar Modificação - Cadastro de Projetos';
?>
<?php $form = ActiveForm::begin(); ?>
<div class="projetos-justificativa">
    <h3 class="box-title"><i class="fa fa-list-ul"></i> Gerenciar Projetos</h3>
    <div class="panel-body">

        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil-square-o"></i> Solicitar Modificação - Cadastro de Projetos</h3>
            </div>


            <div class="panel-body">     

                <?php if (Yii::$app->user->can('coordenador') || (Yii::$app->user->can('servidor'))) { ?>

                    <?= $form->field($model, 'justificativa')->textarea(['rows' => 6], ['responsive' => TRUE]) ?>

                    <div class="form-group">
                        <?= Html::a('Cancelar', ['projetos/solicitacao'], ['class' => 'btn btn-default']) ?>
                        <?= Html::submitButton('Registrar', ['class' => 'btn btn-success']) ?>
                    </div>

                <?php } ?>  

            </div>

        </div>
    </div>
</div>   
<?php ActiveForm::end(); ?> 




