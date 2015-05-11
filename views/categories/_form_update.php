<?php

use yii\helpers\Html;
?>
<div class="categories-form">

    <?php foreach (explode(',',$model->image) as $src){
        echo  Html::img('@web/images/'.$src,['style'=>'width:200px;']);
    }?>

</div>
