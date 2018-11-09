<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Declaracao;

/**
 * DeclaracaoSearch represents the model behind the search form of `app\models\Declaracao`.
 */
class DeclaracaoSearch extends Declaracao
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'id_projeto', 'status', 'participante_id'], 'integer'],
            [[ 'dataEmissao'], 'safe'],
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
        $query = Declaracao::find();

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
            'id_projeto' => $this->id_projeto,
            'dataEmissao' => $this->dataEmissao,
            'status' => $this->status,
            'participante_id' => $this->participante_id,
        ]);

        return $dataProvider;
    }
}
