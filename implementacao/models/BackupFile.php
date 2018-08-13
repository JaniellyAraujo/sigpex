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

namespace spanjeta\modules\backup\models;

use yii\base\Model;

/**
 * Backup
 *
 * Yii module to backup, restore databse
 *
 * @version 1.0
 * @author Shiv Charan Panjeta <shiv@toxsl.com> <shivcharan.panjeta@gmail.com>
 */

/**
 * UploadForm class.
 * UploadForm is the data structure for keeping
 */
class BackupFile extends Model {

    public $id;
    public $name;
    public $size;
    public $create_time;
    public $modified_time;

    /**
     * Declares the validation rules.
     * The rules state that username and password are required,
     * and password needs to be authenticated.
     */
    public function rules() {
        return array(
            array(['id', 'name', 'size', 'create_time', 'modified_time'], 'required'),
        );
    }

    /**
     * Declares attribute labels.
     */
    public function attributeLabels() {
        return array(
            'name' => 'Nome do arquivo',
            'size' => 'Volume',
            'create_time' => 'Data de criação',
            'modified_time' => 'Data de renovação',
        );
    }

    public static function label($n = 1) {
        return Yii::t('app', 'Arquivo de Backup | Arquivos de Backup', $n);
    }

}
