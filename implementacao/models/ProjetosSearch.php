<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Projetos;

/**
 * ProjetosSearch represents the model behind the search form of `app\models\Projetos`.
 */
class ProjetosSearch extends Projetos
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'pesAtendidas', 'cargHorariaSemanal', 'cargHorariaTotal', 'contPublico', 'isControle', 'isAtivo', 'idUser', 'isUsuario', 'publico'], 'integer'],
            [['titulo', 'coordenador', 'tipoProjeto', 'objetivo', 'resumo', 'municipio', 'descricaoPopulacao', 'publicoAlvo', 'localExecucao', 'dataInicio', 'datafim', 'parceiros', 'vinculo', 'citarVinculo', 'convenio', 'citarConvenio', 'gerFundacao', 'citarFundacao', 'multicampi', 'areaConhecimento', 'campusDesenvolvido', 'isStatus', 'modalidade', 'isTipo', 'justificativa', 'mes', 'atividesenvolvidas', 'avaliacao', 'observacoes', 'objetalcancados', 'etapas', 'materiasutiliz', 'metodosutiliz', 'caracfacilitadora', 'caractdificultadora', 'contribuicao', 'avaliacao2', 'isAndamento', 'editaAluno', 'editaCoordenador', 'dataSolicitacao', 'dataAnalise', 'participante', 'tipoUsuario'], 'safe'],
            [['valorFinanciamento'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
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
    public function search($params)
    {
        $query = Projetos::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 10]
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
            'pesAtendidas' => $this->pesAtendidas,
            'dataInicio' => $this->dataInicio,
            'datafim' => $this->datafim,
            'cargHorariaSemanal' => $this->cargHorariaSemanal,
            'cargHorariaTotal' => $this->cargHorariaTotal,
            'valorFinanciamento' => $this->valorFinanciamento,
            'contPublico' => $this->contPublico,
            'isControle' => $this->isControle,
            'isAtivo' => $this->isAtivo,
            'dataSolicitacao' => $this->dataSolicitacao,
            'dataAnalise' => $this->dataAnalise,
            'idUser' => $this->idUser,
            'isUsuario' => $this->isUsuario,
            'publico' => $this->publico,
        ]);

        $query->andFilterWhere(['like', 'titulo', $this->titulo])
            ->andFilterWhere(['like', 'coordenador', $this->coordenador])
            ->andFilterWhere(['like', 'tipoProjeto', $this->tipoProjeto])
            ->andFilterWhere(['like', 'objetivo', $this->objetivo])
            ->andFilterWhere(['like', 'resumo', $this->resumo])
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
            ->andFilterWhere(['like', 'areaConhecimento', $this->areaConhecimento])
            ->andFilterWhere(['like', 'campusDesenvolvido', $this->campusDesenvolvido])
            ->andFilterWhere(['like', 'isStatus', $this->isStatus])
            ->andFilterWhere(['like', 'modalidade', $this->modalidade])
            ->andFilterWhere(['like', 'isTipo', $this->isTipo])
            ->andFilterWhere(['like', 'justificativa', $this->justificativa])
            ->andFilterWhere(['like', 'mes', $this->mes])
            ->andFilterWhere(['like', 'atividesenvolvidas', $this->atividesenvolvidas])
            ->andFilterWhere(['like', 'avaliacao', $this->avaliacao])
            ->andFilterWhere(['like', 'observacoes', $this->observacoes])
            ->andFilterWhere(['like', 'objetalcancados', $this->objetalcancados])
            ->andFilterWhere(['like', 'etapas', $this->etapas])
            ->andFilterWhere(['like', 'materiasutiliz', $this->materiasutiliz])
            ->andFilterWhere(['like', 'metodosutiliz', $this->metodosutiliz])
            ->andFilterWhere(['like', 'caracfacilitadora', $this->caracfacilitadora])
            ->andFilterWhere(['like', 'caractdificultadora', $this->caractdificultadora])
            ->andFilterWhere(['like', 'contribuicao', $this->contribuicao])
            ->andFilterWhere(['like', 'avaliacao2', $this->avaliacao2])
            ->andFilterWhere(['like', 'isAndamento', $this->isAndamento])
            ->andFilterWhere(['like', 'editaAluno', $this->editaAluno])
            ->andFilterWhere(['like', 'editaCoordenador', $this->editaCoordenador])
            ->andFilterWhere(['like', 'participante', $this->participante])
            ->andFilterWhere(['like', 'tipoUsuario', $this->tipoUsuario]);

        return $dataProvider;
    }
}
