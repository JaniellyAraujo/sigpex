<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "relatorios".
 *
 * @property int $id
 * @property int $projeto_id
 *
 * @property Projetos $projeto
 * @property Relatoriosprojeto[] $relatoriosprojetos
 */
class Relatorios extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'relatorios';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['projeto_id'], 'required'],
            //[['projeto_id'], 'unique'],
            [['projeto_id','status'], 'integer'],
            [['projeto_id'], 'exist', 'skipOnError' => true, 'targetClass' => Projetos::className(), 'targetAttribute' => ['projeto_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'projeto_id' => Yii::t('app', 'Projeto'),
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
    public function getRelatoriosprojetos()
    {
        return $this->hasMany(Relatoriosprojeto::className(), ['id_relatorio' => 'id']);
    }
}
