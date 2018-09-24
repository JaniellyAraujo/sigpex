<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "declaracao".
 *
 * @property int $id
 * @property int $projeto_id
 * @property string $participante
 * @property string $dataInicio
 * @property string $dataFim
 * @property string $dataEmissao
 * @property int $cargaHoraria
 * @property int $status
 *
 * @property Projetos $projeto
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
            [['projeto_id', 'participante'], 'required'],
            [['projeto_id', 'cargaHoraria', 'status'], 'integer'],
            [['dataInicio', 'dataFim', 'dataEmissao','cargaHoraria'], 'safe'],
            [['participante'], 'string', 'max' => 50],
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
            'participante' => Yii::t('app', 'Participante'),
            'dataInicio' => Yii::t('app', 'Data Inicio'),
            'dataFim' => Yii::t('app', 'Data Fim'),
            'dataEmissao' => Yii::t('app', 'Data Emissao'),
            'cargaHoraria' => Yii::t('app', 'Carga Horaria'),
            'status' => Yii::t('app', 'Status'),
        ];
    }

   
        /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjetos()
    {
        return $this->hasOne(Projetos::className(), ['id' => 'projeto_id']);
    }
}
