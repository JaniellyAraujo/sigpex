<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Relatorios;

/**
 * RelatoriosSearch represents the model behind the search form of `app\models\Relatorios`.
 */
class RelatoriosSearch extends Relatorios
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'mes','projeto_id','status'], 'integer'],
            [[ 'discente', 'tipo', 'dataEntrega'], 'safe'],
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
        $query = Relatorios::find();

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
            'dataEntrega' => $this->dataEntrega,
            'mes' => $this->mes,
            'status' => $this->status,
            'projeto_id'=> $this->projeto_id,
        ]);

           $query->andFilterWhere(['like', 'discente', $this->discente])
            ->andFilterWhere(['like', 'tipo', $this->tipo]);

        return $dataProvider;
    }
}
