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
/* @var $model app\models\Projetos */

$this->title = 'Atualizar Dados do Projeto: ' . $model->titulo;

?>
<div class="projetos-update">

    <?= $this->render('_form', [
        'model' => $model,
         'model2' => $model2,
       'data2' => $data2,  //ADICIONEI
        'data' => $data
    ]) ?>

</div>

