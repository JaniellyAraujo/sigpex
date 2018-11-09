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

use Yii;

/**
 * This is the model class for table "parceiros".
 *
 * @property int $id
 * @property string $nome
 * 
 * @property Projetos $projeto
 * @property ParceirosProjeto[] $parceirosProjeto
 */
class Parceiros extends \yii\db\ActiveRecord {

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'parceiros';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
                [['id'], 'integer'],
                [['nome'], 'required'],
                [['nome'], 'string', 'max' => 500],
                [['projeto_id'], 'exist', 'skipOnError' => true, 'targetClass' => Projetos::className(), 'targetAttribute' => ['projeto_id' => 'id']],
        
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => Yii::t('app', 'ID'),
            'nome' => Yii::t('app', 'Nome'),
            'projeto_id' => Yii::t('app', 'Projeto'),
        ];
    }
    
        /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjeto() {
        return $this->hasOne(Projetos::className(), ['id' => 'projeto_id']);
    }
    
    /**
     * @return \yii\db\ActiveQuery
     
    public function getParceirosProjeto()
    {
        return $this->hasMany(Parceiros::className(), ['id_parceiros' => 'id']);
    }*/

}
