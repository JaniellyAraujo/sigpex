<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "relatorios_projetos".
 *
 * @property int $id
 * @property int $id_relatorios
 * @property int $id_projeto
 * @property string $bolsista
 * @property string $mes
 * @property string $coordenador
 * @property string $atividades
 * @property string $periodo1
 * @property string $periodo2
 * @property string $periodo3
 * @property string $periodo4
 * @property int $carga1
 * @property int $carga2
 * @property int $carga3
 * @property int $carga4
 * @property int $total
 * @property string $avaliacao
 * @property string $observacao
 *
 * @property Relatorios $relatorio
 * @property Projetos $projeto
 */
class RelatoriosProjetos extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'relatorios_projetos';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [         
            [['id_projeto','mes','bolsista', 'atividades'], 'required'],
            [['id_relatorios', 'id_projeto', 'carga1', 'carga2','carga3','carga4','total'], 'integer'],
            [['bolsista', 'mes', 'coordenador', 'atividades', 'avaliacao', 'observacao', 'periodo1', 'periodo2', 'periodo3', 'periodo4'], 'string'],
            [['id_projeto'], 'exist', 'skipOnError' => true, 'targetClass' => Projetos::className(), 'targetAttribute' => ['id_projeto' => 'id']],
//              
            //[['id_relatorios'], 'exist', 'skipOnError' => true, 'targetClass' => Relatorios::className(), 'targetAttribute' => ['id_relatorios' => 'id']],
            //[['id_projeto'], 'exist', 'skipOnError' => true, 'targetClass' => Projetos::className(), 'targetAttribute' => ['id_projeto' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_relatorios' => 'Id Relatorio',
            'id_projeto' => 'Projeto',
            /*'bolsista' => 'Bolsista',
            'mes' => 'Mes',
            'coordenador' => 'Coordenador',
            'atividades' => 'Atividades Desenvolvidas',
            'avaliacao' => 'Avaliação',
            'observacao' => 'Observação',
            'carga1' => 'Carga Horária',
            'carga2' => 'Carga Horária',
            'carga3' => 'Carga Horária',
            'carga4' => 'Carga Horária',
            'total' => 'Total',
            'periodo1' => 'Periodo (Intervalo Semanal)',
            'periodo2' => 'Periodo (Intervalo Semanal)',
            'periodo3' => 'Periodo (Intervalo Semanal)',
            'periodo4' => 'Periodo (Intervalo Semanal)',*/
            
            
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRelatorios()
    {
        return $this->hasOne(Relatorios::className(), ['id' => 'id_relatorios']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjetos()
    {
        return $this->hasOne(Projetos::className(), ['id' => 'id_projeto']);
    }
    
        public function getRelatoriosProjetos()
{
    return $this->hasMany(RelatoriosProjetos::className(), ['id_projeto' => 'id']);
}
}
