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
            <?php if (Yii::$app->user->identity->role == 1) {?>
            <h5 class="panel-title"><i class="fa fa-user"></i> Dados do Usuário</h5>
           <?php } ?>
           <?php if (Yii::$app->user->identity->role != 1) {?>
            <h5 class="panel-title"><i class="fa fa-user"></i> Meus Dados</h5>
           <?php } ?>
        </div>

        <div class="box-body">
            <div class="pull-right">
                <?php if (Yii::$app->user->identity->role == 1) {?>
                    <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['usuarios/index'], ['class' => 'btn btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar']) ?>
                <?php } ?>
                <?php if (Yii::$app->user->identity->role != 1) {?>
                    <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['usuarios/index0'], ['class' => 'btn btn-default', 'title' => 'Voltar', 'id' => 'modal-btn-voltar']) ?>
                <?php } ?>
                <?php if (!Yii::$app->user->identity->role == 1) {?>
                      <?= Html::a('Atualizar', ['atualiza', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
                <?php } ?>
                    <?php if (Yii::$app->user->identity->role == 1) {?>
                
                     <?= Html::a(Yii::t('app', 'Atualizar'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
                <?php } ?>
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
                        
                    [
                        'label' => 'Perfil',
                        'format' => 'raw',
                        'visible' => Yii::$app->user->identity->role == 1,
                        'value' => function($data) {
                            if ($data->role == 1) {
                                return 'Administrador';
                            }
                            if ($data->role == 2) {
                                return 'Coordenador';
                            }
                            if ($data->role == 3) {
                                return 'Servidor';
                            }
                            if ($data->role == 4) {
                                return 'Discente';
                            }
                        }
                        ],
                    
                ],
            ])
            ?>
        </div>
    </div>

</div>
