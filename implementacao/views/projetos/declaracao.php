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

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProjetosSearchh */
/* @var $dataProvider yii\data\ActiveDataProvider */


$nome = \app\models\Projetos::getnome($dataProvider->models, 'nome');

?>
<div class="declaracao-index">
    <div class="panel panel-heading">
        <h3>  <?php $files = glob("img/*.*");  
            for ($i=0; $i<count ($files); $i++){
                $num = $files[$i];
                echo '<img src="'.$num.'" align="center width="80" height="80"" /> ';
            }
            ?> Instituto Federal do Norte de Minas Gerais - Campus Januária</h3> 
    </div>  

    <div class="panel panel-heading">
        <div class="panel-heading">
        <h5 class="panel-title">DECLARAÇÃO</h5>
        </div>
    <div class="panel-body"> 
            <div class="row">
                <div class="col-lg-12">      
                    <b>Durante o período, </b>  <?= $quantidade ?>
                    <b> alunos foram contemplados com viagens técnicas.</b>  
                </div>
            </div>
    </div>
    </div>
</div>

