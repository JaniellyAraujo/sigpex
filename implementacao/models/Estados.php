<?php

/******************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
 /******************************************************************/

namespace app\models;

use Yii;

/**
 * This is the model class for table "estados".
 *
 * @property int $id
 * @property string $nome
 * @property string $sigla
 *
 * @property Cidades[] $cidades
 */
class Estados extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'estados';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'nome', 'sigla'], 'required'],
            [['id'], 'integer'],
            [['nome'], 'string', 'max' => 45],
            [['sigla'], 'string', 'max' => 2],
            [['sigla'], 'unique'],
            [['id', 'sigla'], 'unique', 'targetAttribute' => ['id', 'sigla']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'nome' => Yii::t('app', 'Nome'),
            'sigla' => Yii::t('app', 'Sigla'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCidades()
    {
        return $this->hasMany(Cidades::className(), ['estados_id' => 'id']);
    }
}
