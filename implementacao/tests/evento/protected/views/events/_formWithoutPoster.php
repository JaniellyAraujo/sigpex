<?php
/* @var $this EventsController */
/* @var $model Events */
/* @var $form CActiveForm */

/**
 * Created by JetBrains PhpStorm.
 * User: Razvan
 * Date: 4/20/14
 * Time: 4:14 PM
 * To change this template use File | Settings | File Templates.
 */

?>

<div class="form">

    <?php

    $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
        'id'=>'events-form',
        'enableAjaxValidation'=>false,
        'htmlOptions' => array('enctype' => 'multipart/form-data'),
    )); ?>

    <p class="note">Fields with <span class="required">*</span> are required.</p>

    <div class="row">

        <?php echo $form->textFieldControlGroup($model, 'Title',
            array('size'=>60,'maxlength'=>256)); ?>

    </div>

    <div class="row">

        <?php echo $form->textFieldControlGroup($model, 'Link',
            array('size'=>60,'maxlength'=>256)); ?>
    </div>

    <div class="row">

        <?php echo $form->textFieldControlGroup($model, 'Headline',
            array('size'=>60,'maxlength'=>256)); ?>
    </div>

    <div class="row">

        <?php echo $form->textAreaControlGroup($model, 'Content',
            array('rows'=>6, 'cols'=>50)); ?>
    </div>


    <div class="row" style="display:none">
        <?php echo $form->textFieldControlGroup($model, 'MainImagePath',
            array('size'=>60,'maxlength'=>256)); ?>
    </div>


    <div class="row">
        <?php echo
        $form->dropDownListControlGroup($model, 'Id_Category',
            CHtml::listData(Categories::model()->findAll(array('order' => 'Name')),'Id','Name'), array(
                'empty' => 'Choose',
                'style'=>'width:45%',
            ));

        ?>
    </div>

    <div class="row">

        <?php echo $form->textFieldControlGroup($model, 'Address',
            array('size'=>60,'maxlength'=>512)); ?>
    </div>

    <div class="row">
        <?php echo
        $form->dropDownListControlGroup($model, 'Id_City',
            CHtml::listData(Cities::model()->findAll(array('order' => 'CountryCode,Name')),'ID','Name','CountryCode'), array(
                'empty' => 'Choose',
                'style'=>'width:45%',
            ));

        ?>
    </div>

    <div class="row">
        <?php echo
        $form->dropDownListControlGroup($model, 'Id_Country',
            CHtml::listData(Countries::model()->findAll(array('order' => 'Code')),'Code','Code'), array(
                'empty' => 'Choose',
            ));
        ?>
    </div>

    <div class="row">

        <?php echo $form->labelEx($model,'StartDate'); ?>
        <?php echo $form->widget( 'ext.jui.EJuiDateTimePicker', array(
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
        ),true) ?>
        <?php echo $form->error($model,'StartDate'); ?>
    </div>

    <div class="row">
        <?php echo $form->labelEx($model,'EndDate'); ?>
        <?php echo $form->widget( 'ext.jui.EJuiDateTimePicker', array(
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
        ),true) ?>
        <?php echo $form->error($model,'EndDate'); ?>
    </div>

    <div class="row buttons">
        <?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save',array("class" => "btn btn-primary")); ?>
    </div>

    <?php $this->endWidget(); ?>

</div><!-- form -->

