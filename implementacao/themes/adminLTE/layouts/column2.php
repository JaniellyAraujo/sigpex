<?php

use yii\helpers\Html;
use yii\widgets\Menu;
use yii\widgets\Breadcrumbs;
use app\themes\adminLTE\components\ThemeNav;
?>
<?php $this->beginContent('@app/themes/adminLTE/layouts/main.php'); ?>
<!-- Left side column. contains the logo and sidebar -->
<!-- Right side column. Contains the navbar and content of the page -->
<div class="content">

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1> <?php echo Html::encode($this->title); ?> </h1>
        <?=
        Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ])
        ?>
    </section>

    <!-- Main content -->
    <section class="content">

        <?php echo $content; ?>
        

    </section>
</div><!-- /.right-side -->
<?php
$this->endContent();
