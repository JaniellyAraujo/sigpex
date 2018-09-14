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
$totalVoluntario = Projetos::find()->where(['isControle' => 3])->count();
//******************************* Quantidade total de Projetos com Bolsa
$totalFomentoInt = Projetos::find()->where(['isControle' => 1])->count();
//******************************* Quantidade total de Projetos com Bolsa
$totalFomentoExt = Projetos::find()->where(['isControle' => 2])->count();

$totalIE = Projetos::find()->where(['OR',['isControle' => 1],['isControle' => 2]])->count();
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
//******************************* Quantidade total de Projetos Artistico
$totalAC = Projetos::find()->where(['OR',['isTipo' => 4],['isTipo' => 5]])->count();
//******************************* Quantidade total de Projetos Esportivo
$totalEsportivo = Projetos::find()->where(['isTipo' => 6])->count();

//******************************* Quantidade total de alunos participantes:
$query = (new yii\db\Query())->from('projetos')->where(['isControle'=>1]);
$sum = $query->sum('pesAtendidas');
$interno = $sum;

$query = (new yii\db\Query())->from('projetos')->where(['isControle'=>2]);
$sum = $query->sum('pesAtendidas');
$externo = $sum;

$query = (new yii\db\Query())->from('projetos')->where(['isControle'=>3]);
$sum = $query->sum('pesAtendidas');
$voluntario = $sum;

$query = (new yii\db\Query())->from('projetos')->where(['isTipo'=>3]);
$sum = $query->sum('pesAtendidas');
$soc = $sum;

$query = (new yii\db\Query())->from('projetos')->where(['isTipo'=>1]);
$sum = $query->sum('pesAtendidas');
$tec = $sum;

$query = (new yii\db\Query())->from('projetos')->where(['isTipo'=>2]);
$sum = $query->sum('pesAtendidas');
$emp = $sum;

$query = (new yii\db\Query())->from('projetos')->where(['OR',['isTipo' => 4],['isTipo' => 5]]);
$sum = $query->sum('pesAtendidas');
$cul = $sum;

$query = (new yii\db\Query())->from('projetos')->where(['isTipo'=>6]);
$sum = $query->sum('pesAtendidas');
$esp = $sum;


$div = Projetos::find()->where(['isUsuario' => 1])->count();
$dib = Projetos::find()->where(['isUsuario' => 2])->count();
$dov = Projetos::find()->where(['isUsuario' => 3])->count();
$doc = Projetos::find()->where(['isUsuario' => 4])->count();
$totdoc = Projetos::find()->where(['OR',['isUsuario' => 3],['isUsuario' => 4]])->count();
$taev = Projetos::find()->where(['isUsuario' => 5])->count();
$taec = Projetos::find()->where(['isUsuario' => 6])->count();
$tottae = Projetos::find()->where(['OR',['isUsuario' => 5],['isUsuario' => 6]])->count();

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
                <h4 class="box-title" align="center"><strong>Quantitativo dos Projetos de Extensão</strong> </h4>
            </div>
            <div class="box-body">
                <table  border="1" cellspacing="1">
                    
                    <tr style="background: palegreen;"><th class="text-center">
                            <div class="text-center">
                                <div class="col-md-12" text-align="center"><b align="center" >Fomento Interno</b></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><b>Fomento Externo</b></div>
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
                   
                    <tr  style="background: whitesmoke;">
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $totalFomentoInt ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $totalFomentoExt ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $totalIE ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $totalVoluntario ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $totdoc ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $tottae ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $dib ?></div>
                            </div>
                        </th>
                        <th class="text-center">
                            <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                <div class="col-md-12"><?= $div ?></div>
                            </div>
                        </th>
                    </tr>
                </table>
            </div>
        </div><br> 
        
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos de Extensão com Recursos Próprios</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr style="background: palegreen;">
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
                        <tr style="background: whitesmoke;">
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $totalFomentoInt ?></div>
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
                                    <div class="col-md-12"><?= $interno ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div><br>
        
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos de Extensão com Recursos Externos</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr style="background: palegreen;">
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
                        <tr style="background: whitesmoke;">
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $totalFomentoExt ?></div>
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
                                    <div class="col-md-12"><?= $externo ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div><br>
        
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos de Extensão Voluntários</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr style="background: palegreen;">
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
                        <tr style="background: whitesmoke;">
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $totalVoluntario ?></div>
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
                                    <div class="col-md-12"><?= $voluntario ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div><br>
        
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos Sociais</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr style="background: palegreen;">
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
                        <tr style="background: whitesmoke;">
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $totalSocial ?></div>
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
                                    <div class="col-md-12"><?= $soc ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div><br>
        
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos Artísticos e Culturais</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr style="background: palegreen;">
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
                        <tr style="background: whitesmoke;">
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $totalAC ?></div>
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
                                    <div class="col-md-12"><?= $cul ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div><br><br><br>
        
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos Esportivos</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr style="background: palegreen;">
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
                        <tr style="background: whitesmoke;">
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $totalEsportivo ?></div>
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
                                    <div class="col-md-12"><?= $esp ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div><br>
        
        
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos e Serviços Tecnológicos</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr style="background: palegreen;">
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
                        <tr style="background: whitesmoke;">
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $totalTecnologico ?></div>
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
                                    <div class="col-md-12"><?= $tec ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div><br>
        
        <div class="box box-solid box-primary col-xs-12 col-lg-12 no-padding" border="1" border-color="#e6e6e6;"> <!--Exemmlo botão voltar -->
            <div class="box-header with-border">
                <h4 class="box-title" align="center"><i class="fa fa-info-circle"></i><strong>Projetos de Desenvolvimento Empreendedor</strong></h4>
            </div>
            <div class="box-body">
                <table border="1" cellspacing="1">
                    <thead>
                        <tr style="background: palegreen;">
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
                        <tr style="background: whitesmoke;">
                            <td class="text-center"> <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                                    <div class="col-md-12"><?= $totalEmpreendedor ?></div>
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
                                    <div class="col-md-12"><?= $emp ?></div>
                                </div></td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div><br>
        
        
        <!--div class="col-lg-12">
            <b>Quantidade Total de Projetos: </b> < ?= $total ?> <br>
            <b>Quantidade total de Projeto Voluntário:</b>< ?= $totalVoluntario ?><br>
            <b>Quantidade total de Projeto com Bolsa:</b>< ?= $totalFomentoInt ?><br>
            <b>Quantidade total de Projeto Tecnologico:</b>< ?= $totalTecnologico ?><br>
            <b>Quantidade total de Projeto Empreendedor:</b>< ?= $totalEmpreendedor ?><br>
            <b>Quantidade total de Projeto Social:</b>< ?= $totalSocial ?><br>
            <b>Quantidade total de Projeto Cultural:</b>< ?= $totalCultural ?><br>
            <b>Quantidade total de Projeto Artistico:</b>< ?= $totalArtistico ?><br>
            <b>Quantidade total de Projeto Esportivo:</b>< ?= $totalArtistico ?><br>
        </div-->
        <div class="box-footer"></div>


    </body>
</html>

    