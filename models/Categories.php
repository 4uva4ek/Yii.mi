<?php

namespace app\models;

use Yii;
use creocoder\nestedsets\NestedSetsBehavior;

/**
 * This is the model class for table "categories".
 *
 * @property integer $cat_id
 * @property string $cat_left
 * @property string $cat_right
 * @property string $cat_level
 *
 * @property CategoriesData $categoriesData
 */
class Categories extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'categories';
    }

    public function behaviors() {
        return [
            'tree' => [
                'class' => NestedSetsBehavior::className(),
                 //'treeAttribute' => 'tree',
                 'leftAttribute' => 'cat_left',
                 'rightAttribute' => 'cat_right',
                 'depthAttribute' => 'cat_level',
            ],
        ];
    }

    public function transactions()
    {
        return [
            self::SCENARIO_DEFAULT => self::OP_ALL,
        ];
    }


    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategoriesData()
    {
        return $this->hasOne(CategoriesData::className(), ['cat_id' => 'cat_id']);
    }

    public static function find()
    {
        return new CategoriesSearch(get_called_class());
    }
}
