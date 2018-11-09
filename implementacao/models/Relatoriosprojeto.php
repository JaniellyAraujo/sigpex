<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "relatoriosprojeto".
 *
 * @property int $id
 * @property int $id_relatorio
 * @property int $id_projeto  
 * @property string $discente
 * @property string $tipo
 * @property string $dataEntrega
 * @property int $mes
 * @property int $istipo
 *
 * @property Relatorios $relatorio
 * @property Projetos $projeto
 */
class Relatoriosprojeto extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'relatoriosprojeto';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_relatorio', 'id_projeto', 'mes', 'istipo'], 'integer'],
            [['discente', 'tipo', 'mes'], 'required'],
            [['dataEntrega'], 'safe'],
            [['discente', 'tipo'], 'string', 'max' => 50],
            [['id_relatorio'], 'exist', 'skipOnError' => true, 'targetClass' => Relatorios::className(), 'targetAttribute' => ['id_relatorio' => 'id']],
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
            'id_relatorio' => Yii::t('app', 'Id Relatorio'),
            'id_projeto' => Yii::t('app', 'Id Projeto'),
            'discente' => Yii::t('app', 'Aluno'),
            'tipo' => Yii::t('app', 'Tipo de Relatório'),
            'dataEntrega' => Yii::t('app', 'Data de Entrega'),
            'mes' => Yii::t('app', 'Mês'),
            //'istipo' => Yii::t('app', 'Status'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRelatorio()
    {
        return $this->hasOne(Relatorios::className(), ['id' => 'id_relatorio']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjeto()
    {
        return $this->hasOne(Projetos::className(), ['id' => 'id_projeto']);
    }
    
    public function actionRelatoriosAjax()
    {
        $retorno = [];

        $model = Relatorios::find()->all();

        if ($model) {
            /* @var $parceiro Relatorios */
            foreach ($model as $relatorio) {
                $saida = new \stdClass();
                $saida->relatorio_id = $relatorio->id;
                $saida->primaryText = $$relatorio->titulo;

                $retorno[] = $saida;
            }
        }

        Yii::$app->response->format = Response::FORMAT_JSON;

        return $retorno;
    }

}
