<?php
/* @var $this UserController */
/* @var $model User */

?>

<?php 

$this->pageTitle=Yii::app()->name . ' - Add an account';


$this->renderPartial('_formWithoutType', array('model'=>$model)); ?>