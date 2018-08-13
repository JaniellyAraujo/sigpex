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
        background-color: #dddddd;
    }
    .sigpex-link-box-text {
        text-transform: uppercase;
    }

</style>
<div class="box-info box view-item col-xs-12 col-lg-12">
    <h4 class="box-title"><p><i class="fa fa-file-text-o"></i> DADOS DO PROJETO</p></h4>

    <div class="box-body">
        <div class="pull-right">
            <button onClick="history.go(-1)" class="btn btn-social btn-default" ><b class="fa fa-arrow-left"></b> Voltar</button> <!--Exemmlo botão voltar -->           
             <?= Html::a('<b class="fa fa-download"></b>', [''], ['target' => '_blank', 'class' => 'btn btn-default', 'title' => 'Exportar', 'id' => 'modal-btn-pdf']) ?>


        </div> <br><br>

        <div class="box box-solid box-success col-xs-12 col-lg-12 no-padding"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title"><i class="fa fa-info-circle"></i> IDENTIFICAÇÃO DO PROJETO DE EXTENSÃO</h4>
            </div>
            <div class="box-body">
                <div class="col-lg-12 table-responsive  no-padding " style="margin-bottom:15px">

                    <table class="table table-striped">
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-7"><b>TÍTULO: </b><?= Html::encode($model->titulo) ?></div>
                                    <div class="col-md-2"><b>TIPO: </b><?= Html::encode($model->tipoProjeto) ?></div>
                                    <div class="col-md-3"><b>MODALIDADE: </b><?= Html::encode($model->modalidade) ?></div><br><br>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>MUNICÍPIO BENEFICIADO: </b><?= Html::encode($model->municipio) ?></div>
                                    <div class="col-md-6"><b>PÚBLICO ALVO: </b><?= Html::encode($model->publicoAlvo) ?></div><br><br>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-3"><b>ÁREA DE CONHECIMENTO: </b><?= Html::encode($model->areaConhecimento) ?></div>
                                    <div class="col-md-3"><b>CAMPUS ONDE O PROJETO SERÁ DESENVOLVIDO: </b><?= Html::encode($model->campusDesenvolvido) ?></div>
                                    <div class="col-md-3"><b>Nº DE PESSOAS ATENDIDAS: </b><?= Html::encode($model->pesAtendidas) ?></div>
                                    <div class="col-md-3"><b>O PROJETO É MULTICAMPI? </b><?= Html::encode($model->multicampi) ?></div><br><br><br>
                                </div></td>
                        </tr>

                        <tr>
                            <td><div class="sigpex-link-box-text" class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-3"><b>DATA DE INÍCIO: </b><?= Html::encode($model->dataInicio) ?></div>
                                    <div class="col-md-3"><b>DATA DE TÉRMINO: </b><?= Html::encode($model->datafim) ?></div>
                                    <div class="col-md-3"><b>CARGA HORÁRIA SEMANAL: </b><?= Html::encode($model->cargHorariaSemanal) ?></div>
                                    <div class="col-md-3"><b>CARGA HORÁRIA TOTAL: </b><?= Html::encode($model->cargHorariaTotal) ?></div><br><br>
                                </div></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <div class="box box-solid box-info col-xs-12 col-lg-12 no-padding">
            <div class="box-header with-border">
                <h4 class="box-title"><i class="fa fa-info-circle"></i> DETALHAMENTO DO PROJETO DE EXTENSÃO</h4>
            </div>
            <div class="box-body">
                <div class="col-lg-12 table-responsive  no-padding " style="margin-bottom:15px">
                    <table class="table table-striped">
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>DESCRIÇÃO DA POPULAÇÃO: </b><p align="justify"><?= Html::encode($model->descricaoPopulacao) ?></p></div><br><br><br>

                                </div></td></tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b> OBJETIVO: </b><p align="justify"><?= Html::encode($model->objetivo) ?></p></div><br><br><br>
                                </div></td></tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>RESUMO: </b><p align="justify"><?= Html::encode($model->resumo) ?></p></div><br><br><br>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-4"><b>LOCAL DE EXECUÇÃO: </b><?= Html::encode($model->localExecucao) ?></div>
                                    <div class="col-md-8"><b>PARCEIROS: </b><?= Html::encode($model->parceiros) ?></div><br><br>

                                </div></td></tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>POSSUI VÍNCULO COM ALGUM PROGRAMA/EVENTO/CURSO? </b><?= Html::encode($model->vinculo) ?></div>
                                    <div class="col-md-3"><b>CITAR VÍNCULO: </b><?= Html::encode($model->citarVinculo) ?></div><br><br>
                                </div></td></tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>É GERENCIADO POR FUNDAÇÃO? </b><?= Html::encode($model->gerFundacao) ?></div>
                                    <div class="col-md-6"><b>CITAR FUNDAÇÃO: </b><?= Html::encode($model->citarFundacao) ?></div><br><br>
                                </div></td></tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>O PROJETO PREVÊ CONVÊNIO COM OUTRA INSTITUIÇÃO OU EMPRESA? </b><?= Html::encode($model->convenio) ?></div>
                                    <div class="col-md-6"><b>CITAR CONVÊNIO: </b><?= Html::encode($model->citarConvenio) ?></div><br><br>
                                </div></td></tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>HÁ NECESSIDADE DE FINANCIAMENTO? </b><?= Html::encode($model->financiamento) ?></div>
                                    <div class="col-md-6"><b>TIPO DE FINANCIAMENTO: </b><?= Html::encode($model->tipoFinanciamento) ?></div><br><br>
                                </div></td></tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>CITAR A FONTE DO FINANCIAMENTO: </b><?= Html::encode($model->citarFinanciamento) ?></div>
                                    <div class="col-md-6"><P><b>VALOR DO FINANCIAMENTO: </b><?= Html::encode($model->valorFinanciamento) ?> R$</P></div><br><br>
                                </div></td></tr>
                    </table>
                </div>

            </div>
        </div>

        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title"><i class="fa fa-info-circle"></i> EQUIPE EXECUTORA</h4>
            </div>
            <div class="box-body">
                <div class="col-lg-12 table-responsive  no-padding " style="margin-bottom:15px">
                    <table class="table table-striped">
                        <tr><td>
                                <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="sigpex-link-box-text" class="col-md-7"><b>NOME: </b><?= Html::encode($model->participante) ?></div>
                                    <div class="sigpex-link-box-text" class="col-md-2"><b>TIPO: </b><?= Html::encode($model->tipoUsuario) ?></div>
                                </div>
                            </td></tr>
                    </table>
                </div>
            </div>
        </div>




    </div>
</div>
<?php $this->registerJs("(function($) {
      fakewaffle.responsiveTabs(['xs', 'sm']);
  })(jQuery);", yii\web\View::POS_END, 'responsive-tab'); ?>

