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

use yii\grid\GridView;
use app\models\Projetos;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjetosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

//*********************Quantidade total de projetos*********************
$total = Projetos::find()->count();
//******************************* Quantidade total de Projetos Voluntários
$totalVoluntario = Projetos::find()->where(['isControle' => 1])->count();
//******************************* Quantidade total de Projetos com Bolsa
$totalFomento = Projetos::find()->where(['isControle' => 2])->count();
//******************************* Quantidade total de Projetos Tecnologico
$totalTecnologico = Projetos::find()->where(['isTipo' => 1])->count();
//******************************* Quantidade total de Projetos Empreendedor
$totalEmpreendedor = Projetos::find()->where(['isTipo' => 2])->count();
//******************************* Quantidade total de Projetos Social
$totalSocial = Projetos::find()->where(['isTipo' => 3])->count();
//******************************* Quantidade total de Projetos Cultural
$totalCultural = Projetos::find()->where(['isTipo' => 4])->count();
//******************************* Quantidade total de Projetos Artistico
$totalArtistico = Projetos::find()->where(['isTipo' => 5])->count();
//******************************* Quantidade total de Projetos Esportivo
$totalEsportivo = Projetos::find()->where(['isTipo' => 6])->count();

//******************************* Quantidade total de alunos participantes:
//$query = (new Query())->from('projetos')->where(['isAtivo'=>1]);
//$sum = $query->sum('numeroAlunos');
?>


<!--?=
GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
        'titulo',
        'coordenador',
            [
            'label' => 'Data de Início',
            'format' => 'raw',
            'value' => function ($model) {
                if ($model->dataInicio != null) {
                    return Yii::$app->formatter->asDate($model->dataInicio);
                } else {
                    return 'Não informado';
                }
            },
        ],
            [
            'label' => 'Data de Término',
            'format' => 'raw',
            'value' => function ($model) {
                if ($model->datafim != null) {
                    return Yii::$app->formatter->asDate($model->datafim);
                } else {
                    return 'Não informado';
                }
            },
        ],
    // ['class' => 'yii\grid\ActionColumn'],
    ],
]);
?-->

<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <header>
            <table> 
                <tr>
                    <th><img  width="100" height="90" src="<?= Url::to('@web/img/ifnmg.jpg') ?>"></img></th>
                    <th align="center"><h5 align="center"><strong><p>Ministério da Educação</p>
                                <p>Secretaria de Educação Profissional e Tecnológica</p>
                                <p>Instituto Federal do Norte de Minas Gerais – Campus Januária</p>
                               <p> Diretoria de Extensão</p></strong>
                        </h5></th>
                    <th><img class="pull-right" width="80" height="80" src="<?= Url::to('@web/img/br.png') ?>"></img>
                    </th>
                </tr>
                <tr><th colspan="3"><hr></th></tr>
            </table>
        </header>

        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong> Quantitativo dos Projetos de Extensão </strong></h4>
            </div>
            <div class="box-body">
                <table  border="1" cellspacing="1" >
                    <tr><th class="text-center">
                            <div text-align="center" class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12" text-align="center"><b align="center">Fomento Interno</b></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><b>Total</b></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><b>Fomento Interno e Externo</b></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><b>Voluntário</b></div>
                            </div>
                        </th>
                        <td class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><b>Docentes Participantes</b></div>
                            </div>
                            </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><b>TAEs Participantes</b></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><b>Discentes Bolsistas </b></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><b>Discentes Voluntários </b></div>
                            </div>
                        </th>

                    </tr>
                    <tr>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $total ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $total ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $total ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $total ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $total ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $total ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $total ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $total ?></div>
                            </div>
                        </th>
                    </tr>
                </table>
            </div>


        </div> 
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos de Extensão com Recursos Próprios</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Total</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Número de Coordenadores</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Número de Coordenadores</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Número de Bolsistas</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>População Atendida</b></div>
                                </div></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos de Extensão com Recursos Externos</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Total</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Número de Coordenadores</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Número de Coordenadores</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Número de Bolsistas</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>População Atendida</b></div>
                                </div></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos de Extensão Voluntários</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Total</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Número de Coordenadores</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Servidores Participantes</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>Discentes Participantes</b></div>
                                </div></th>
                            <th class="text-center"><div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><b>População Atendida</b></div>
                                </div></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $total ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-lg-12">
            <b>Quantidade Total de Projetos: </b> <?= $total ?> <br>
            <b>Quantidade total de Projeto Voluntário:</b><?= $totalVoluntario ?><br>
            <b>Quantidade total de Projeto com Bolsa:</b><?= $totalFomento ?><br>
            <b>Quantidade total de Projeto Tecnologico:</b><?= $totalTecnologico ?><br>
            <b>Quantidade total de Projeto Empreendedor:</b><?= $totalEmpreendedor ?><br>
            <b>Quantidade total de Projeto Social:</b><?= $totalSocial ?><br>
            <b>Quantidade total de Projeto Cultural:</b><?= $totalCultural ?><br>
            <b>Quantidade total de Projeto Artistico:</b><?= $totalArtistico ?><br>
            <b>Quantidade total de Projeto Esportivo:</b><?= $totalArtistico ?><br>
        </div>
        <div class="box-footer"></div>


    </body>
</html>