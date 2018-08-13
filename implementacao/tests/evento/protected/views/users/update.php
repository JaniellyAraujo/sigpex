<?php
/* @var $this UserController */
/* @var $model User */
?>

<?php

$this->pageTitle=Yii::app()->name . ' - Modify an account';


$this->renderPartial('_formWithoutPass', array('model'=>$model)); ?>