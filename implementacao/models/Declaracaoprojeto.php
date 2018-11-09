<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "declaracaoprojeto".
 *
 * @property int $id
 * @property int $id_declaracao
 * @property int $id_projeto
 * @property string $dataEmissao
 * @property int $status
 * @property int $participante_id
 *
 * @property Declaracao $declaracao
 * @property Projetos $projeto
 * @property User $participante
 */
class Declaracaoprojeto extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'declaracaoprojeto';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [[  'dataEmissao','participante_id'], 'required'],
            [['id_declaracao', 'status', 'id_projeto', 'participante_id'], 'integer'],
            [['dataEmissao'], 'safe'],
            [['id_declaracao'], 'exist', 'skipOnError' => true, 'targetClass' => Declaracao::className(), 'targetAttribute' => ['id_declaracao' => 'id']],
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
            'id_declaracao' => Yii::t('app', 'Id Declaracao'),
            
            'id_projeto' => Yii::t('app', 'Id Projeto'),
            'dataEmissao' => Yii::t('app', 'Data Emissao'),
            'status' => Yii::t('app', 'Status'),
            'participante_id' => Yii::t('app', 'Participante'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDeclaracao()
    {
        return $this->hasOne(Declaracao::className(), ['id' => 'id_declaracao']);
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
}
