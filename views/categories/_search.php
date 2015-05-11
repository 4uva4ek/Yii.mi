<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\CategoriesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="categories-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?//= $form->field($model, 'id') ?>

    <?//= $form->field($model, 'tree_id') ?>

    <?= $form->field($model, 'published') ?>

    <?//= $form->field($model, 'cat_left') ?>

    <?//= $form->field($model, 'cat_right') ?>

    <?php // echo $form->field($model, 'cat_level') ?>

    <?php  echo $form->field($model, 'title') ?>

    <?php // echo $form->field($model, 'seotitle') ?>

    <?php  echo $form->field($model, 'description') ?>

    <?php  echo $form->field($model, 'date_creat') ?>

    <?php  echo $form->field($model, 'date_update') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
