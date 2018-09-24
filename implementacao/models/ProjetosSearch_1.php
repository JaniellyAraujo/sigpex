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

use app\models\Projetos;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * ProjetosSearch represents the model behind the search form of `app\models\Projetos`.
 */
class ProjetosSearch extends Projetos {

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
                [['id', 'pesAtendidas', 'cargHorariaSemanal', 'cargHorariaTotal', 'isAtivo'], 'integer'],
               // [['titulo', 'coordenador', 'justificativa', 'tipoProjeto', 'modalidade', 'objetivo', 'isTipo', 'isStatus', 'resumo', 'municipio', 'descricaoPopulacao', 'publicoAlvo', 'localExecucao', 'dataInicio', 'datafim', 'parceiros', 'vinculo', 'citarVinculo', 'convenio', 'citarConvenio', 'gerFundacao', 'citarFundacao', 'multicampi', 'publico', 'contPublico', 'isUsuario', 'areaConhecimento', 'campusDesenvolvido', 'participante', 'tipoUsuario'], 'safe'],
                [['titulo', 'modalidade', 'dataInicio', 'datafim'], 'safe'],
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
        $query = Projetos::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);
        /*$dataProvider->setSort([
            'attributes' => [
                'titulo',
                'modalidade',
                'dataInicio' => [
                    'asc' => ['dataInicio' => SORT_ASC],
                    'desc' => ['dataInicio' => SORT_DESC],
                    'default' => SORT_ASC
                ],
                'datafim' => [
                    'asc' => ['datafim' => SORT_ASC],
                    'desc' => ['datafim' => SORT_DESC],
                    'default' => SORT_ASC,
                ],
                'isAtivo' => [
                    'asc' => ['isAtivo' == 0 => SORT_ASC, 'isAtivo' == 1 => SORT_ASC, 'isAtivo' == 2 => SORT_ASC, 'isAtivo' == 3 => SORT_ASC, 'isAtivo' == 4 => SORT_ASC, 'isAtivo' == 5 => SORT_ASC, 'isAtivo' == 6 => SORT_ASC],
                    'desc' => ['isAtivo' == 0 => SORT_DESC, 'isAtivo' == 1 => SORT_DESC, 'isAtivo' == 2 => SORT_DESC, 'isAtivo' == 3 => SORT_DESC, 'isAtivo' == 4 => SORT_DESC, 'isAtivo' == 5 => SORT_DESC, 'isAtivo' == 6 => SORT_DESC],
                    'default' => SORT_ASC,
                ],
                'defaultOrder' => [
                    'isAtivo' => SORT_ASC,
                ]
            ],
            
        ]);*/

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
       
        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'pesAtendidas' => $this->pesAtendidas,
            'dataInicio' => $this->dataInicio,
            'datafim' => $this->datafim,
            'cargHorariaSemanal' => $this->cargHorariaSemanal,
            'cargHorariaTotal' => $this->cargHorariaTotal,
            'valorFinanciamento' => $this->valorFinanciamento,
            'isAtivo' => $this->isAtivo,
        ]);

        $query->andFilterWhere(['like', 'titulo', $this->titulo])
                ->andFilterWhere(['like', 'coordenador', $this->coordenador])
                ->andFilterWhere(['like', 'tipoProjeto', $this->tipoProjeto])
                ->andFilterWhere(['like', 'objetivo', $this->objetivo])
                ->andFilterWhere(['like', 'resumo', $this->resumo])
                ->andFilterWhere(['like', 'modalidade', $this->modalidade])
                ->andFilterWhere(['like', 'municipio', $this->municipio])
                ->andFilterWhere(['like', 'descricaoPopulacao', $this->descricaoPopulacao])
                ->andFilterWhere(['like', 'publicoAlvo', $this->publicoAlvo])
                ->andFilterWhere(['like', 'localExecucao', $this->localExecucao])
                ->andFilterWhere(['like', 'parceiros', $this->parceiros])
                ->andFilterWhere(['like', 'vinculo', $this->vinculo])
                ->andFilterWhere(['like', 'citarVinculo', $this->citarVinculo])
                ->andFilterWhere(['like', 'convenio', $this->convenio])
                ->andFilterWhere(['like', 'citarConvenio', $this->citarConvenio])
                ->andFilterWhere(['like', 'gerFundacao', $this->gerFundacao])
                ->andFilterWhere(['like', 'citarFundacao', $this->citarFundacao])
                ->andFilterWhere(['like', 'multicampi', $this->multicampi])
                ->andFilterWhere(['like', 'publico', $this->publico])
                ->andFilterWhere(['like', 'contPublico', $this->contPublico])
                ->andFilterWhere(['like', 'isUsuario', $this->isUsuario])
                ->andFilterWhere(['like', 'areaConhecimento', $this->areaConhecimento])
                ->andFilterWhere(['like', 'participante', $this->participante])
                ->andFilterWhere(['like', 'tipoUsuario', $this->tipoUsuario])
                ->andFilterWhere(['like', 'campusDesenvolvido', $this->campusDesenvolvido]);

        return $dataProvider;
    }

}
