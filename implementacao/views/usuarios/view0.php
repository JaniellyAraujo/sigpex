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
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Usuarios */

?>
<?php $this->beginContent('@app/themes/adminLTE/layouts/main.php'); ?>
<div class="usuarios-view">


    <br>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-user"></i> Meus Dados</h5>
        </div>

        <div class="box-body">
            <div class="pull-right">
                <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['#'], ['class' => 'btn btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar']) ?>
                <?= Html::a('Atualizar', ['update0', 'id' => $model->idUser], ['class' => 'btn btn-primary']) ?>
                </div> <br><br>
            <?=
            DetailView::widget([
                'model' => $model,
                'attributes' => [
                    'nome',
                    'cpf',
                    'rg',
                    'rua',
                    'numero',
                    'complemento',
                    'bairro',
                    'cidade',
                    'estado',
                    'email:email',
                    'telefone',
                ],
            ])
            ?>
        </div>
    </div>

</div>
<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nome')); ?>:</b>
	<?php echo CHtml::encode($data->nome); ?>
	<br />
</div>