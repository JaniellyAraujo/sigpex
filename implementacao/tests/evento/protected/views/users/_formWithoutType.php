<?php
/* @var $this UserController */
/* @var $model User */
/* @var $form CActiveForm */
?>

<div class="form"><?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-form',
	'enableAjaxValidation'=>true,
	'htmlOptions' => array(
            'enableClientValidation'=>true
)
)); ?>

<div class="row"><?php echo $form->labelEx($model,'Mail'); ?> 
<?php echo $form->textField($model, 'Mail',array('size'=>60,'maxlength'=>256))?>
<?php echo $form->error($model,'Mail'); ?></div>

<div class="row"><?php echo $form->labelEx($model,'Pass'); ?> 
<?php echo $form->passwordField($model,'Pass',array('size'=>60,'maxlength'=>256)); ?>
<?php echo $form->error($model,'Pass'); ?></div>

<div class="row"><?php echo $form->labelEx($model,'Name'); ?> 
<?php echo $form->textField($model,'Name',array('size'=>60,'maxlength'=>256)); ?>
<?php echo $form->error($model,'Name'); ?></div>


<div class="row buttons"><?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save',array('class'=>'btn btn-primary')); ?>
</div>

<?php $this->endWidget(); ?></div>
<!-- form -->
