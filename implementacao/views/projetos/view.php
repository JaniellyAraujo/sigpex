<?php
/* * ****************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
  /***************************************************************** */

use yii\helpers\Url;
use yii\helpers\Html;
use app\models\User;

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
    //.sigpex-link-box-text {
     //   text-transform: uppercase;
    //}

</style>
<div class="box-primary box view-item col-xs-12 col-lg-12">
    <?php if (((($model->dataSolicitacao) != null)&&($model->isAtivo) == 0)) { ?>
    <p class="note">Criado em <?= Html::encode(Yii::$app->formatter->asDate($model->dataSolicitacao)) ?>  <?php } ?>
    <?php if (((($model->dataSolicitacao) != null)&&(($model->isAtivo) == 1)||($model->isAtivo) == 5)) { ?>
    <p class="note">Registrado em <?= Html::encode(Yii::$app->formatter->asDate($model->dataSolicitacao)) ?> -- <?php } ?>

    <?php if (($model->dataAnalise) != null) { ?>
    Analisado em <?= Html::encode(Yii::$app->formatter->asDate($model->dataAnalise)) ?> pelo Departamento de Extensão</p>
    <?php } ?>

    <div class="box-body">
        <div class="pull-right">
            <!--?php
            echo Html::a('<b class="fa fa-building-o fa fa-white"></b> Relatório Mensal', ['/relatorios-projetos/create', "id" => $model->id], ['class' => 'btn btn-social btn-primary', 'style' => 'margin-left:10px']);
            echo Html::a('<b class="fa fa-building fa fa-white"></b> Relatório Final', ['/relatorios-projetos/create', "id" => $model->id], ['class' => 'btn btn-social btn-primary', 'style' => 'margin-left:10px']);?-->

            <?php
            if (($model->isAtivo == 0)&&(Yii::$app->user->identity->nome == $model->coordenador)) {
                echo Html::a(Yii::t('app', '<b class="fa fa-eyedropper fa fa-white"></b> Atualizar'), ['projetos/salvar?id=' . $model->id], ['class' => 'btn btn-social btn-primary', 'style' => 'margin-left:10px']);
                echo Html::a(Yii::t('app', '<b class="fa fa-trash fa fa-white"></b> Excluir'), ['delete', 'id' => $model->id], [
                    'class' => 'btn btn-social btn-danger', 'style' => 'margin-left:10px',
                    'data' => [
                        'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                        'method' => 'post',
                    ],
                ]);
            }
            ?>
            <?php if ($model->isAtivo == 7) {
                echo Html::a('<b class="fa fa-file-text-o fa fa-white"></b> Declaração', ['/projetos/declaracao', "id" => $model->id], ['class' => 'btn btn-social btn-primary', 'style' => 'margin-left:10px']);
            }?>

        </div> <br><br>

        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title"><i class="glyphicon glyphicon-th-large"></i> IDENTIFICAÇÃO DO PROJETO DE EXTENSÃO</h4>
            </div>
            <div class="box-body">
                <div class="col-lg-12 table-responsive  no-padding " style="margin-bottom:15px">

                    <table class="table table-striped">
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>TÍTULO: </b><?= Html::encode($model->titulo) ?></div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>TIPO: </b><?= Html::encode($model->tipoProjeto) ?></div>
                                    <div class="col-md-6"><b>MODALIDADE: </b><?= Html::encode($model->modalidade) ?></div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>MUNICÍPIO BENEFICIADO: </b><?= Html::encode($model->municipio) ?></div>
                                    <div class="col-md-6"><b>PÚBLICO ALVO: </b><?= Html::encode($model->publicoAlvo) ?></div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>Nº DE PESSOAS ATENDIDAS: </b><?= Html::encode($model->pesAtendidas) ?></div>
                                    <div class="col-md-6"><b>O PROJETO É MULTICAMPI? </b><?= Html::encode($model->multicampi) ?></div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>ÁREA DE CONHECIMENTO: </b><?= Html::encode($model->areaConhecimento) ?></div>
                                    <div class="col-md-6"><b>CAMPUS ONDE O PROJETO SERÁ DESENVOLVIDO: </b><?= Html::encode($model->campusDesenvolvido) ?></div>
                                </div></td>
                        </tr>

                        <tr>
                            <td><div class="sigpex-link-box-text" class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>DATA DE INÍCIO: </b><?= Html::encode(Yii::$app->formatter->asDate($model->dataInicio)) ?></div>
                                    <div class="col-md-6"><b>CARGA HORÁRIA SEMANAL: </b><?= Html::encode($model->cargHorariaSemanal) ?></div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>DATA DE TÉRMINO: </b><?= Html::encode(Yii::$app->formatter->asDate($model->datafim)) ?></div>
                                    <div class="col-md-6"><b>CARGA HORÁRIA TOTAL: </b><?= Html::encode($model->cargHorariaTotal) ?></div><br><br>
                                </div></td>
                        </tr>
                        <?php if (($model->dataAnalise) != null) { ?>
                            <tr>
                                <td><div class="sigpex-link-box-text" class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                        <div class="col-md-12"><b>DATA DE ENVIO PARA REITORIA: </b><?= Html::encode(Yii::$app->formatter->asDate($model->dataAnalise)) ?></div>
                                    </div></td>
                            </tr>
                        <?php } ?>
                    </table>
                </div>
            </div>
        </div>
                <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
            <div class="box-header with-border">
                <h4 class="box-title"><i class="fa fa fa-users"></i> EQUIPE EXECUTORA</h4>
            </div>
            <div class="box-body">

                <?php \yii\widgets\Pjax::begin(['id' => 'usuarios']) ?>
                <?=kartik\grid\GridView::widget([
                    'dataProvider' => $data2,
                    'summary' => "<div class='pull-right'><strong>Total </strong><strong>{totalCount}</strong></div><br>",
                    'columns' => [
                        'participante.nome',
                        [
                        'label' => 'Tipo',
                        'attribute' => 'funcao.nome',
                         ],
                    ],
                ]);
                ?>
                <?php \yii\widgets\Pjax::end(); ?>
            </div>
        </div>
        
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
            <div class="box-header with-border">
                <h4 class="box-title"><i class="fa fa-institution"></i> PARCEIROS</h4>
            </div>
            <div class="box-body">
                <?php \yii\widgets\Pjax::begin(['id' => 'parceiros']) ?>
                <?=kartik\grid\GridView::widget([
                    'dataProvider' => $data,
                    'summary' => "<div class='pull-right'><strong>Total </strong> <strong>{totalCount}</strong></div><br>",
                    'columns' => [
                        'parceiro.nome',
                        ],
                    ]);
                ?>
                <?php \yii\widgets\Pjax::end(); ?>
            </div>
        </div>
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
            <div class="box-header with-border">
                <h4 class="box-title"><i class="fa fa-building-o"></i> DETALHAMENTO DO PROJETO DE EXTENSÃO</h4>
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

                                </div></td></tr>

                    </table>
                </div>

            </div>
        </div>
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding">
            <div class="box-header with-border">
                <h4 class="box-title"><i class="glyphicon glyphicon-th-list"></i> OUTRAS ESPECIFICAÇÕES</h4>
            </div>
            <div class="box-body">
                <div class="col-lg-12 table-responsive  no-padding " style="margin-bottom:15px">
                  <table class="table table-striped">

                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>POSSUI VÍNCULO COM ALGUM PROGRAMA/EVENTO/CURSO? </b><?= Html::encode($model->vinculo) ?></div>
                                    <div class="col-md-3"><b>CITAR VÍNCULO: </b><?= Html::encode($model->citarVinculo) ?></div><br><br>
                                </div></td></tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>É GERENCIADO POR FUNDAÇÃO? </b><?= Html::encode($model->gerFundacao) ?></div>
                                    <div class="col-md-6"><b>CITAR FUNDAÇÃO: </b><?= Html::encode($model->citarFundacao) ?></div>
                                </div></td></tr>
                        <tr>
                            <td><div class="sigpex-link-box-text" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-6"><b>O PROJETO PREVÊ CONVÊNIO COM OUTRA INSTITUIÇÃO OU EMPRESA? </b><?= Html::encode($model->convenio) ?></div>
                                    <div class="col-md-6"><b>CITAR CONVÊNIO: </b><?= Html::encode($model->citarConvenio) ?></div><br><br>
                                </div></td></tr>

                    </table>
                </div>

            </div>
        </div>

        <div class="box-footer text-right" style="margin-top: 20px">
            <button onClick="history.go(-1)" class="btn btn-social btn-default" ><b class="fa fa-arrow-left"></b> Voltar</button>
            <?php
            //if (($model->isAtivo == 5 && (($model->tipoUsuario == 'Técnico Administrativo - Coordenador')||($model->tipoUsuario == 'Docente - Coordenador')))) {
            if (($model->isAtivo == 5) && (Yii::$app->user->identity->nome == $model->coordenador)) {
                echo Html::a('<b class="fa fa-unlock-alt fa fa-white"></b> Encerrar', ['/projetos/encerrar', "id" => $model->id], ['class' => 'btn btn-social btn-bitbucket', 'style' => 'margin-left:10px']);
            } else if (($model->isAtivo == 0)&&(Yii::$app->user->identity->nome == $model->coordenador)) {
                echo Html::a('<b class="glyphicon glyphicon-open"></b> Enviar', ['/projetos/submeter', "id" => $model->id], ['class' => 'btn btn-social btn-success', 'style' => 'margin-left:10px']);
            }?>
            <?php if ((($model->isAtivo == 1) || ($model->isAtivo == 4)) && ((Yii::$app->user->identity->role == 2))) {
                echo Html::a('<b class="fa fa-pencil-square-o"></b> Solicitar Modificação', ['/projetos/update1', "id" => $model->id], ['class' => 'btn btn-social btn-danger', 'style' => 'margin-left:10px']);
                echo Html::a('<b class="fa fa-check-square-o"></b> Confirmar', ['/projetos/update3', "id" => $model->id], ['class' => 'btn btn-social btn-success', 'style' => 'margin-left:10px']);
                 
            }
            ?>
            <?php if (($model->isAtivo == 6) && ((Yii::$app->user->identity->role == 2))) {
                echo Html::a('<b class="fa fa-folder-open fa fa-white"></b> Arquivar', ['/projetos/arquivar', "id" => $model->id], ['class' => 'btn btn-social btn-bitbucket', 'style' => 'margin-left:10px']);
            }?>

        </div>

    </div>
</div>
<?php $this->registerJs("(function($) {fakewaffle.responsiveTabs(['xs', 'sm']);})(jQuery);", yii\web\View::POS_END, 'responsive-tab'); ?>
<style media="print">
.btn {
display: none;
}
</style>