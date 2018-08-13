<?php
/* @var $this UserController */
/* @var $data User */
?>

<div class="view">


	<b><?php echo CHtml::encode($data->getAttributeLabel('Name')); ?>:</b>
	<?php echo CHtml::encode($data->Name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Mail')); ?>:</b>
	<?php echo CHtml::encode($data->Mail); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Timestamp')); ?>:</b>
	<?php echo CHtml::encode(date('Y-m-d', strtotime($data->Timestamp))); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Type')); ?>:</b>
	<?php echo CHtml::encode($data->Type == 4 ? "Admin" :($data->Type == 3 ? "Editor" : ($data->Type == 2 ? "Organizer" : "Normal"))); ?>
	<br />


</div>