<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\widgets\MaskedInput;

/* @var $this yii\web\View */
/* @var $model app\models\User */
/* @var $form yii\widgets\ActiveForm */
$this->params['breadcrumbs'][] = 'Atualização de Dados Cadastrais';
?>

<div class="user-formulario">

    <?php $form = ActiveForm::begin(); ?>
    
    <div class="panel panel-success">
        <div class="panel-body">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">ATUALIZAÇÃO DE DADOS CADASTRAIS</h3>
                </div>
                    <div class="panel-body">  
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h5 class="panel-title">IDENTIFICAÇÃO</h5>
                        </div>
                        
                        <div class="panel-body">    
                        <div class="row">
                            <div class="col-lg-6">
                                <?= $form->field($model, 'nome')->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-lg-6">
                                <?= $form->field($model, 'sexo')->radioList(array('1' => 'Feminino', '2' => 'Masculino'))?>
                            </div>       
                        </div>
                            
                        <div class="row">
                            <div class="col-lg-4">
                                <?= $form->field($model, 'dataNascimento')->input('date'); ?>
                            </div>
                            <div class="col-lg-4">
                                <?= $form->field($model, 'telefone')->textInput(['maxlength' => true]) ?>
                            </div> 
                            <div class="col-lg-4">
                                <?php if (Yii::$app->user->can('admin')) { ?>

                                <?= $form->field($model, 'group')->dropDownList(array('1'=>'Administrador',
                                                                                      '2'=>'Servidor',
                                                                                      '3'=>'Departamento de Extensão', 
                                                                                      '4'=>'Departamento de Administração e Infraestrutura',
                                                                                      '5'=>'Direção Geral',
                                                                                      //'6'=>'Departamento de Gestão de Pessoas',
                                                                                      '7'=>'Oficina'),
                                                                                        ['prompt'=>'Selecione']) ?>
                                <?php } else { ?>
                                
                                <?= $form->field($model, 'group')->dropDownList(array(//'1'=>'Administrador',
                                                                                      '2'=>'Servidor',
                                                                                      '3'=>'Departamento de Extensão', 
                                                                                      '4'=>'Departamento de Administração e Infraestrutura',
                                                                                      '5'=>'Direção Geral',
                                                                                      //'6'=>'Departamento de Gestão de Pessoas',
                                                                                      '7'=>'Oficina'),
                                                                                        ['disabled' => 'disabled']) ?>
                                <?php }  ?>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-4">
                                <?= $form->field($model, 'cpf')->textInput(['maxlength' => true])  ?>
                            </div>
                            <div class="col-lg-4">
                                <?= $form->field($model, 'identidade')->textInput(['maxlength' => true]) ?>
                            </div>  
                            <div class="col-lg-4">
                                <?= $form->field($model, 'orgao')->textInput(['maxlength' => true]) ?>
                            </div>
                        </div>   

                        <div class="row">
                            <div class="col-lg-4">
                                <?= $form->field($model, 'rua')->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-lg-4">
                                <?= $form->field($model, 'numero')->textInput(['maxlength' => true]) ?>
                            </div>  
                            <div class="col-lg-4">
                                <?= $form->field($model, 'complemento')->textInput(['maxlength' => true]) ?>
                            </div>
                        </div>   

                        <div class="row">
                            <div class="col-lg-4">                            
                                <?= $form->field($model, 'bairro')->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-lg-4">
                                <?= $form->field($model, 'cidade')->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-lg-4">
                                <?= $form->field($model, 'estado')->dropDownList(array('1'=>'Acre', '2'=>'Alagoas',
                                                               '3'=>'Amapá', '4'=>'Amazonas',
                                                               '5'=>'Bahia', '6'=>'Ceará',
                                                               '7'=>'Distrito Federal', '8'=>'Espírito Santo',
                                                               '9'=>'Goiás', '10'=>'Maranhão',
                                                               '11'=>'Mato Grosso', '12'=>'Mato Grosso do Sul',
                                                               '13'=>'Minas Gerais', '14'=>'Pará',
                                                               '15'=>'Paraíba', '16'=>'Paraná',
                                                               '17'=>'Pernambuco', '18'=>'Piauí',
                                                               '19'=>'Rio de Janeiro', '20'=>'Rio Grande do Norte',
                                                               '21'=>'Rio Grande do Sul', '22'=>'Rondônia',
                                                               '23'=>'Roraima', '24'=>'Santa Catarina',
                                                               '25'=>'São Paulo', '26'=>'Sergipe', '27'=>'Tocantins')) ?>
                            </div>       
                        </div>        

                        <div class="row">
                            <div class="col-lg-4">
                                <?= $form->field($model, 'cargo')->textInput(['maxlength' => true]) ?>
                            </div>
                            <div class="col-lg-4">                           
                                <?= $form->field($model, 'funcao')->textInput(['maxlength' => true]) ?>
                            </div> 
                            <div class="col-lg-4">     
                                <?= $form->field($model, 'nivel')->radioList(array('1' => 'NM',
                                                                                   '2' => 'NS'))?>                           
                            </div> 
                        </div>     

                        </div>
                        </div>                     

                        <div class="panel panel-info">
                        <div class="panel-heading">
                        <h5 class="panel-title">DADOS LOGIN</h5>
                        </div>
                        <div class="panel-body">    

                        <div class="row">
                                <div class="col-lg-4">
                                    <?= $form->field($model, 'password_hash')->passwordInput(['maxlength' => true]) ?>
                                </div>
                                <div class="col-lg-4">
                                    <?= $form->field($model, 'password_hash_repeat')->passwordInput(['maxlength' => true]) ?>
                                </div>  
                                <div class="col-lg-4">
                                    <?= $form->field($model, 'email')->textInput(['maxlength' => true])?>   
                                </div>
                        </div>                                                              
                        </div>
                        </div> 
                        
                        <div class="panel panel-info">
                        <div class="panel-heading">
                        <h5 class="panel-title">DADOS BANCÁRIOS</h5>
                        </div>
                        <div class="panel-body">    

                        <div class="row">
                                <div class="col-lg-4">
                                    <?= $form->field($model, 'banco')->textInput(['maxlength' => true]) ?>
                                </div>
                                <div class="col-lg-4">
                                    <?= $form->field($model, 'agencia')->textInput(['maxlength' => true]) ?>
                                </div>  
                                <div class="col-lg-4">
                                    <?= $form->field($model, 'contaCorrente')->textInput(['maxlength' => true])?>   
                                </div>
                        </div>                                                              
                        </div>
                        </div> 
                                                                           
     <div class="form-group">
        <?= Html::submitButton('Atualizar', ['class' => 'btn btn-primary']) ?>
    </div> 
       
    </div>
    </div>                 
    </div>
    </div>    

    <?php ActiveForm::end(); ?>

</div>