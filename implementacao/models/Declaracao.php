<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "declaracao".
 *
 * @property int $id
 * @property int $id_projeto
 * @property string $dataEmissao
 * @property int $status
 * @property int $participante_id
 *
 * @property Projetos $projeto
 * @property Usuarios $participante
 */
class Declaracao extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'declaracao';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_projeto'], 'required'],
            [['id_projeto', 'status', 'participante_id'], 'integer'],
            [['dataEmissao'], 'safe'],
            [['id_projeto'], 'exist', 'skipOnError' => true, 'targetClass' => Projetos::className(), 'targetAttribute' => ['id_projeto' => 'id']],
            [['participante_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['participante_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'id_projeto' => Yii::t('app', 'Projeto ID'),
            'dataEmissao' => Yii::t('app', 'Data Emissao'),
            'status' => Yii::t('app', 'Status'),
            'participante_id' => Yii::t('app', 'Participante ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjeto()
    {
        return $this->hasOne(Projetos::className(), ['id' => 'id_projeto']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParticipante()
    {
        return $this->hasOne(User::className(), ['id' => 'participante_id']);
    }
    
     /**
     * @return \yii\db\ActiveQuery
     */
    public function getDeclaracaoprojetos()
    {
        return $this->hasMany(Declaracaoprojeto::className(), ['id_declaracao' => 'id']);
    }
}
