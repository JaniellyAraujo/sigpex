<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "relatorios".
 *
 * @property int $id
 * @property string $projeto_id
 * @property string $discente
 * @property string $tipo
 * @property string $dataEntrega
 * @property int $mes
 * 
 * @property Projetos $projeto
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
            //[['projeto_id'], 'unique'],
            [['projeto_id', 'discente', 'tipo', 'mes'], 'required'],
            [['dataEntrega'], 'safe'],
            [['mes','projeto_id'], 'integer'],
            [['discente', 'tipo'], 'string', 'max' => 50],
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
            'discente' => Yii::t('app', 'Discente'),
            'tipo' => Yii::t('app', 'Tipo'),
            'dataEntrega' => Yii::t('app', 'Data Entrega'),
            'mes' => Yii::t('app', 'Mes'),
        ];
    }
    
    
        /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjetos()
    {
        return $this->hasOne(Projetos::className(), ['id' => 'projeto_id']);
    }
            /**
     * @return \yii\db\ActiveQuery
     */
    public function getRelatorios()
    {
        return $this->hasOne(Relatorios::className(), ['id' => 'id']);
    }
    
}
