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
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjetosSearchh */
/* @var $dataProvider yii\data\ActiveDataProvider */


//$titulo = \app\models\Projetos::getnome($dataProvider->models, 'titulo');
//$nome = \app\models\User::getnome($dataProvider->models, 'nome');
//$participante = Yii::$app->declaracao->participante;
//$data = new \yii\db\Expression('NOW()');

?>
<div class="declaracao-index">
  
    <!--div class="panel panel-heading">
        <h3>  < ?php $files = glob("img/*.*");  
            for ($i=0; $i<count ($files); $i++){
                $num = $files[$i];
                echo '<img src="'.$num.'" align="center width="80" height="80"" /> ';
            }
            ?> Instituto Federal do Norte de Minas Gerais - Campus Januária</h3> 
    </div-->
    <div class="panel-body"> 
        <div class="panel panel-heading">
            
            <table align="center"> 
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
            
        
                <br>
        <br><br>
        <br>
                <div class="panel-heading">
                    <h1 class="panel-title" align="center" style="font-size:20px;"><strong>DECLARAÇÃO</strong></h1>
        </div>
        <br><br><br><br>
        <br>
        <br>
        <br>
        <br>
        <br>
    <br><br>

       
            <div class="row">
                <div class="col-lg-12"> 
                    <b><h5 class="text-justify" style="font-size:16px;line-height:25px;">
                        Declaramos para os fins que se fizerem necessários que <strong><?= Html::encode($model->participante) ?></strong>
                        participou do projeto <strong> <?= Html::encode($model->projeto->titulo) ?> </strong>realizado no Instituto Federal de Educação 
                        Ciência e Tecnologia do Norte de Minas Gerais - Campus Januária, <strong><?= Html::encode($model->projeto->municipio) ?></strong> no período de 
                        <strong><?= Html::encode(Yii::$app->formatter->asDate($model->projeto->dataInicio)) ?></strong> à <strong><?= Html::encode(Yii::$app->formatter->asDate($model->projeto->datafim)) ?></strong>, 
                        perfazendo uma carga horária total de <strong><?= Html::encode($model->projeto->cargHorariaTotal) ?></strong> horas.
                     
                    </h5></b>
                </div>
            </div>
        <br>
       
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
         <br>
        <br>
        <br>
        <br>
         
        
       
                   <b><h5 class="text-center">________________________________________</h5></b>
                   <b><h5 class="text-center"> Januária, <?php echo Html::encode(Yii::$app->formatter->asDate($model->dataEmissao));?></h5></b>
    </div>
    </div>
    

</div>
<style media="print">
.main-footer{
display: none;
}
</style>
