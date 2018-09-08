<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\RelatoriosProjetos;

/**
 * RelatoriosProjetosSearch represents the model behind the search form of `app\models\RelatoriosProjetos`.
 */
class RelatoriosProjetosSearch extends RelatoriosProjetos
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'id_relatorios', 'id_projeto', 'carga1', 'carga2','carga3','carga4','total'], 'integer'],
            [['bolsista', 'mes', 'coordenador', 'atividades', 'avaliacao', 'observacao', 'periodo1', 'periodo2', 'periodo3', 'periodo4'], 'safe'],
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
        $query = RelatoriosProjetos::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
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
            'id_relatorios' => $this->id_relatorios,
            'id_projeto' => $this->id_projeto,
            'mes' => $this->mes,
            'bolsista' => $this->bolsista,
            'coordenador' => $this->coordenador,
            'atividades' => $this->atividades,
            'periodo1' => $this->periodo1,
            'periodo2' => $this->periodo2,
            'periodo3' => $this->periodo3,
            'periodo4' => $this->periodo4,
            'carga1' => $this->carga1,
            'carga2' => $this->carga2,
            'carga3' => $this->carga3,
            'carga4' => $this->carga4,
            'observacao' => $this->observacao,
            'avaliacao' => $this->avaliacao,
            'total' => $this->total,
            
            
        ]);

        return $dataProvider;
    }
}
