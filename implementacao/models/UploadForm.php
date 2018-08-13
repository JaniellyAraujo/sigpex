<?php

/*****************************************************************
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

namespace app\models;

use yii\base\Model;

/**
 * Backup
 *
 * Yii module to backup, restore databse
 *
 * @version 1.0
 * @author Shiv Charan Panjeta <shiv@toxsl.com> <shivcharan.panjeta@outlook.com>
 */

/**
 * UploadForm class.
 * UploadForm is the data structure for keeping
 */
class UploadForm extends Model {

    public $upload_file;

    /**
     * Declares the validation rules.
     * The rules state that username and password are required,
     * and password needs to be authenticated.
     */
    public function rules() {
        if (!isset($this->scenario))
            $this->scenario = 'upload';

        /*
          return array(
          array('upload_file', 'required'),
          );
         */
        return [
                [['upload_file'], 'file', 'skipOnEmpty' => false, 'extensions' => 'sql'],
        ];
    }

    /**
     * Declares attribute labels.
     */
    public function attributeLabels() {
        return array(
            'upload_file' => 'Arquivo SQL',
        );
    }

    public static function label($n = 1) {
        return Yii::t('app', 'Arquivo | Arquivos', $n);
    }

}
