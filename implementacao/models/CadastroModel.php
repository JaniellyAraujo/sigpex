<?php

/* * ***************************************************************
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

namespace app\models;

use yii\base\Model;

class CadastroModel extends Model {

    public $nome;
    public $email;
    public $idade;

    public function rules() {
        return[
                [['nome', 'email', 'idade'], 'requirid'],
                ['email', 'email'],
                ['idade', 'number', 'integerOnly' => true]
        ];
    }

    public function attributeLabels() {
        return[
            'nome' => 'Nome Completo',
            'email' => 'E-mail',
            'idade' => 'Idade'
        ];
    }

}
