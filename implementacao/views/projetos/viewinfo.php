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
use yii\helpers\Url;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Projetos */
/* @var $form yii\widgets\ActiveForm */
?>
<style>
    .box .box-solid {
        background-color: #f2f2f2;
    }

    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #ffffff;
    }
    .sigpex-link-box-text {
        text-transform: uppercase;
    }

</style>

    <div class="box-body">
        

        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title"><i class="fa fa-info-circle"></i> IDENTIFICAÇÃO DO PROJETO DE EXTENSÃO</h4>
            </div>
            <div class="box-body">
                <div class="pull-right">
                    <button onClick="history.go(-1)" class="btn btn-social btn-default" ><b class="fa fa-arrow-left"></b> Voltar</button> <!--Exemmlo botão voltar -->           
               </div><br><br>
                <div class="col-lg-12 table-responsive  no-padding " style="margin-bottom:15px">

                    <table class="table table-striped">
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>TÍTULO: </b><?= Html::encode($model->titulo) ?></div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>COORDENADOR: </b><?= Html::encode($model->coordenador) ?></div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>TIPO: </b><?= Html::encode($model->tipoProjeto) ?></div>
                                   </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>MODALIDADE: </b><?= Html::encode($model->modalidade) ?></div><br><br>
                                </div></td>
                        </tr>
                        

                        <tr>
                            <td><div class="sigpex-link-box-text" class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-3"><b>DATA DE INÍCIO: </b><?= Html::encode($model->dataInicio) ?></div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-3"><b>DATA DE TÉRMINO: </b><?= Html::encode($model->datafim) ?></div>
                           </div></td>
                        </tr>
                        <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>RESUMO: </b><p align="justify"><?= Html::encode($model->resumo) ?></p></div><br><br><br>
                                </div></td>
                    </table>
                </div>
            </div>
        </div>
       
    </div>

<?php $this->registerJs("(function($) {
      fakewaffle.responsiveTabs(['xs', 'sm']);
  })(jQuery);", yii\web\View::POS_END, 'responsive-tab'); ?>

