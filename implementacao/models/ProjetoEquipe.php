<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "projeto_equipe".
 *
 * @property int $id
 * @property int $projeto_id
 * @property int $participante_id
 * @property string $tipo
 *
 * @property Projetos $projeto
 * @property User $participante
 * @property Users $funcao
 */
class ProjetoEquipe extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'projeto_equipe';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['projeto_id', 'participante_id'], 'required'],
            [['projeto_id', 'participante_id'], 'integer'],
            [['tipo'], 'string', 'max' => 255],
            [['projeto_id'], 'exist', 'skipOnError' => true, 'targetClass' => Projetos::className(), 'targetAttribute' => ['projeto_id' => 'id']],
            [['participante_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['participante_id' => 'id']],
            [['tipo'], 'exist', 'skipOnError' => true, 'targetClass' => Users::className(), 'targetAttribute' => ['tipo' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'projeto_id' => Yii::t('app', 'Projeto ID'),
            'participante_id' => Yii::t('app', 'Participante'),
            'tipo' => Yii::t('app', 'Tipo'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjeto()
    {
        return $this->hasOne(Projetos::className(), ['id' => 'projeto_id']);
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
    public function getFuncao()
    {
        return $this->hasOne(Users::className(), ['id' => 'tipo']);
    }
}
