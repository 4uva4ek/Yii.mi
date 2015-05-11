<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Categories;

/**
 * CategoriesSearch represents the model behind the search form about `app\models\Categories`.
 */
class CategoriesSearch extends Categories
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'tree_id', 'published', 'cat_left', 'cat_right', 'cat_level'], 'integer'],
            [['title', 'seotitle', 'description', 'date_creat', 'date_update'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
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
        $query = Categories::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'tree_id' => $this->tree_id,
            'published' => $this->published,
            'cat_left' => $this->cat_left,
            'cat_right' => $this->cat_right,
            'cat_level' => $this->cat_level,
            'date_creat' => $this->date_creat,
            'date_update' => $this->date_update,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'seotitle', $this->seotitle])
            ->andFilterWhere(['like', 'description', $this->description]);

        return $dataProvider;
    }
}
