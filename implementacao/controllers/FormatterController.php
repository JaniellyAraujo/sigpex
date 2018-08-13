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

namespace app\controllers;
use yii\web\Controller;
use Yii;

class FormatterController extends Controller {

    public function actionIndex() {
        /*         * @var MyFormatter $formatter */

        // $appLang = Yii::$app -> language;
        $formatter = Yii::$app->formatter;

        echo"<h2>[$appLang]</h2>";

        echo"<p>Datas formato:{$formatter->asDate("2018-02-13")}</p>";
        echo "<p>CPF:{$formatter->asCpf('99999999999')}</p>";
    }

}
