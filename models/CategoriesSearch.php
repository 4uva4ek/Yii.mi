<?php

namespace app\models;

use Yii;
use creocoder\nestedsets\NestedSetsQueryBehavior;

/**
 * CategoriesSearch represents the model behind the search form about `app\models\Categories`.
 */
class CategoriesSearch extends \yii\db\ActiveQuery
{
    public function behaviors() {
        return [
            NestedSetsQueryBehavior::className(),
        ];
    }
}
