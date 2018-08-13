<?php
/* @var $this EventsController */
/* @var $model Events */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'StartDate'); ?>
		<?php echo
        $form->widget( 'ext.jui.EJuiDateTimePicker', array(
            'model' => $model,
            'attribute' => 'StartDate',
            'options'=>array(
                'showAnim'=>'fold',
                'dateFormat'=>'yy-mm-dd',
                'changeMonth' => 'true',
                'changeYear'=>'true',
                'constrainInput' => 'false',
            ),
            'htmlOptions'=>array(

                'id'=> 'StartDate'
            ),
        ),true)
        ?>

	</div>

	<div class="row">
		<?php echo $form->label($model,'EndDate'); ?>
		<?php echo
        $form->widget( 'ext.jui.EJuiDateTimePicker', array(
            'model' => $model,
            'attribute' => 'EndDate',
            'options'=>array(
                'showAnim'=>'fold',
                'dateFormat'=>'yy-mm-dd',
                'changeMonth' => 'true',
                'changeYear'=>'true',
                'constrainInput' => 'false',
            ),
            'htmlOptions'=>array(

                'id'=> 'EndDate'
            ),
        ),true)
        ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->