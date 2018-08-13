
<div class="form">
<?php 
$this->pageTitle=Yii::app()->name . ' - Register';
?>

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'register-form',
	'enableClientValidation'=>true,
	'clientOptions'=>array(
		'validateOnSubmit'=>true,
	),
)); ?>

    <div class="row">
    	<?php echo $form->labelEx($model,'Mail'); ?>
		<?php echo $form->textField($model,'Mail'); ?>
		<?php echo $form->error($model,'Mail'); ?>
    </div>
    
    <div class="row">
    	<?php echo $form->labelEx($model,'Name'); ?>
		<?php echo $form->textField($model,'Name'); ?>
		<?php echo $form->error($model,'Name'); ?>

    </div>

    <div class="row">
        <?php echo $form->labelEx($model,'Password'); ?>
		<?php echo $form->passwordField($model,'Pass'); ?>
		<?php echo $form->error($model,'Pass'); ?>
    </div>

    <div class="row">
        <?php echo $form->labelEx($model,'Repeat password'); ?>
		<?php echo $form->passwordField($model,'RePass'); ?>
		<?php echo $form->error($model,'RePass'); ?>
    </div>

    <div class="row submit">
        <?php echo CHtml::submitButton('Register',array('class'=>'btn btn-primary')); ?>
    </div>


<?php $this->endWidget(); ?>
</div>