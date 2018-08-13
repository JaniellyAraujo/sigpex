<?php
/* @var $this UserController */
/* @var $model User */

$this->pageTitle=Yii::app()->name . ' - View an account';


?>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(		
		'Name',		
		'Mail',
		'Timestamp',
array('name'=>'Type', 'type'=>'raw', 'value'=>$model->Type == 4 ? "Admin" :($model->Type == 3 ? "Editor" : ($model->Type == 2 ? "Organizer" : "Normal"))),
),
));


?>
