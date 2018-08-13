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

use Yii;

/**
 * This is the model class for table "projeto_equipe".
 *
 * @property int $id
 * @property int $projeto_id
 * @property int $participante_id
 *
 * @property Projetos $projeto
 * @property User $idUser
 * * 
 */
class ProjetoEquipe extends \yii\db\ActiveRecord {

    //use \mootensai\relation\RelationTrait;
    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'projeto_equipe';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
                [['projeto_id', 'participante_id'], 'required'],
                [['projeto_id', 'participante_id'], 'integer'],
                [['projeto_id'], 'exist', 'skipOnError' => true, 'targetClass' => Projetos::className(), 'targetAttribute' => ['projeto_id' => 'id']],
                [['participante_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['participante_id' => 'idUser']],
                [['tipoUsuario'], 'exist', 'skipOnError' => true, 'targetClass' => Equipe::className(), 'targetAttribute' => ['tipoUsuario' => 'tipoUsuario']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => Yii::t('app', 'ID'),
            'projeto_id' => Yii::t('app', 'Projeto ID'),
            'participante_id' => Yii::t('app', 'Participante ID'),
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
     */
    public function getParticipante() {
        return $this->hasMany(Equipe::className(), ['id' => 'participante_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     
    public function getTipoUsuario() {
        return $this->hasMany(Equipe::className(), ['id' => 'tipoUsuario']);
    }*/

}
