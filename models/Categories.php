<?php

namespace app\models;

use Yii;
use creocoder\nestedsets\NestedSetsBehavior;

/**
 * This is the model class for table "categories".
 *
 * @property integer $id
 * @property integer $tree_id
 * @property integer $published
 * @property string $cat_left
 * @property string $cat_right
 * @property string $cat_level
 * @property string $title
 * @property string $seotitle
 * @property string $description
 * @property string $date_creat
 * @property string $date_update
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
                'treeAttribute' => 'tree_id',
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
        return $this->hasOne(Categories::className(), ['id' => 'id']);
    }



    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tree_id', 'published', 'cat_left', 'cat_right', 'cat_level'], 'integer'],
            //[['cat_left', 'cat_right', 'cat_level'], 'required'],
            [['description'], 'string'],
           // [['date_creat', 'date_update'], 'safe'],
            [['title', 'seotitle'], 'string', 'max' => 250],
            [['image'], 'string'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tree_id' => 'Tree ID',
            'published' => 'Published',
            'title' => 'Title',
            'seotitle' => 'Seotitle',
            'description' => 'Description',
            'date_creat' => 'Date Creat',
            'date_update' => 'Date Update',
        ];
    }
}
