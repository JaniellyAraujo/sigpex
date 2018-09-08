<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "relatorios".
 *
 * @property int $id
 * @property string $versao
 * @property string $descricao
 * @property int $status
 * 
 * @property RelatoriosProjetos[] $relatoriosProjetos
 */
class Relatorios extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    
    use \mootensai\relation\RelationTrait;
    
    public static function tableName()
    {
        return 'relatorios';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['versao', 'descricao'], 'required'],
            [['versao'], 'string', 'max' => 15],
            [['descricao'], 'string', 'max' => 500],
            [['status'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'versao' => Yii::t('app', 'Versao'),
            'descricao' => Yii::t('app', 'Descricao'),
            'status' => Yii::t('app', 'Status'),
        ];
    }
    
        /**
     * @return \yii\db\ActiveQuery
     */
    public function getRelatoriosProjetos()
    {
        return $this->hasMany(RelatoriosProjetos::className(), ['id_relatorios' => 'id']);
    }
}
