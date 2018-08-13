<?php
/* @var $this EventsController */
/* @var $data Events */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('Id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->Id), array('view', 'id'=>$data->Id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Title')); ?>:</b>
	<?php echo CHtml::encode($data->Title); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Link')); ?>:</b>
	<?php echo CHtml::encode($data->Link); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Headline')); ?>:</b>
	<?php echo CHtml::encode($data->Headline); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('MainImagePath')); ?>:</b>
	<?php echo CHtml::encode($data->MainImagePath); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Content')); ?>:</b>
	<?php echo CHtml::encode($data->Content); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('PublishedBy')); ?>:</b>
	<?php echo CHtml::encode($data->PublishedBy); ?>
	<br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('StartDate')); ?>:</b>
    <?php echo CHtml::encode($data->StartDate); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('EndDate')); ?>:</b>
    <?php echo CHtml::encode($data->EndDate); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('Address')); ?>:</b>
    <?php echo CHtml::encode($data->Address); ?>
    <br />

    <b><?php echo CHtml::encode($data->getAttributeLabel('PublishedAt')); ?>:</b>
    <?php echo CHtml::encode($data->PublishedAt); ?>
    <br />

	<?php /*


	<b><?php echo CHtml::encode($data->getAttributeLabel('Id_Category')); ?>:</b>
	<?php echo CHtml::encode($data->Id_Category); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Id_City')); ?>:</b>
	<?php echo CHtml::encode($data->Id_City); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Id_Country')); ?>:</b>
	<?php echo CHtml::encode($data->Id_Country); ?>
	<br />



	*/ ?>

</div>