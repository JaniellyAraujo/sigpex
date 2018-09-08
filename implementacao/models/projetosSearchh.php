<?php

/*****************************************************************
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

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Projetos;

/**
 * ProjetosSearch represents the model behind the search form of `app\models\Projetos`.
 */
class ProjetosSearch extends Projetos {

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
                [['id', 'idUser', 'pesAtendidas', 'cargHorariaSemanal', 'cargHorariaTotal', 'isAtivo'], 'integer'],
                [['titulo', 'coordenador', 'justificativa', 'tipoProjeto', 'modalidade', 'objetivo', 'isTipo', 'isStatus', 'resumo', 'municipio', 'descricaoPopulacao', 'publicoAlvo', 'localExecucao', 'dataInicio', 'datafim', 'parceiros', 'vinculo', 'citarVinculo', 'convenio', 'citarConvenio', 'gerFundacao', 'citarFundacao', 'multicampi', 'financiamento', 'tipoFinanciamento', 'citarFinanciamento', 'areaConhecimento', 'campusDesenvolvido'], 'safe'],
                [['valorFinanciamento'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios() {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params) {
        $query = Projetos::find()->where(['AND', ['isAtivo' => 1], ['isAtivo' => 2], ['isAtivo' => 3]]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                    'defaultOrder' => [
                    'isAtivo' => [
                    'asc' => ['isAtivo' == 0 => SORT_ASC, 'isAtivo' == 1 => SORT_ASC, 'isAtivo' == 2 => SORT_ASC, 'isAtivo' == 3 => SORT_ASC, 'isAtivo' == 4 => SORT_ASC, 'isAtivo' == 5 => SORT_ASC, 'isAtivo' == 6 => SORT_ASC],
      
                ],
                ]
            ],
        ]);


        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
        ]);

        $query->andFilterWhere(['between', 'datafim', $this->dataInicio, $this->datafim]);


        return $dataProvider;
    }

}
