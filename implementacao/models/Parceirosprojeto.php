<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "parceirosprojeto".
 *
 * @property int $id
 * @property int $id_parceiro
 * @property int $id_projeto
 *
 * @property Parceiros $parceiro
 * @property Projetos $projeto
 */
class Parceirosprojeto extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'parceirosprojeto';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_parceiro', 'id_projeto'], 'integer'],
            [['id_parceiro'], 'exist', 'skipOnError' => true, 'targetClass' => Parceiros::className(), 'targetAttribute' => ['id_parceiro' => 'id']],
            [['id_projeto'], 'exist', 'skipOnError' => true, 'targetClass' => Projetos::className(), 'targetAttribute' => ['id_projeto' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'id_parceiro' => Yii::t('app', 'Nome'),
            'id_projeto' => Yii::t('app', 'Id Projeto'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getParceiro()
    {
        return $this->hasOne(Parceiros::className(), ['id' => 'id_parceiro']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjeto()
    {
        return $this->hasOne(Projetos::className(), ['id' => 'id_projeto']);
    }
}
