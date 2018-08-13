<?php
/* @var $this UserController */
/* @var $model User */

$this->pageTitle=Yii::app()->name . ' - Admin area';


Yii::app()->clientScript->registerScript('allUserTypes',"

// we have just user Type as a select input

$('select').each(function(idx,el){

var JcurrentElem = $(el);

JcurrentElem.find('option').each(function(idx,opt){

		var JcurrentOpt = $(opt);
		
		if(JcurrentOpt.val() == ''){
		
			JcurrentOpt.html('All');
		
		}


});

});



");



?>



<?php $this->widget('bootstrap.widgets.TbGridView', array(
    'id'=>'user-grid',
    'dataProvider'=>$model->search(),
    'afterAjaxUpdate'=>"function(){
	jQuery('#date_input').datepicker(jQuery.extend({showMonthAfterYear:false}, jQuery.datepicker.regional['id'], {'showAnim':'fold','dateFormat':'yy-mm-dd','changeMonth':'true','showButtonPanel':'true','changeYear':'true','constrainInput':'false'}));
	$('select').each(function(idx,el){

var JcurrentElem = $(el);
JcurrentElem.find('option').each(function(idx,opt){

		var JcurrentOpt = $(opt);

		if(JcurrentOpt.val() == ''){

			JcurrentOpt.html('All');

		}


});

});



	}",

    'filter'=>$model,
    'columns'=>array(
        array(
            'name' => 'Name',
            'header' => 'Name',
        ),
        array(
            'name' => 'Mail',
            'header' => 'Mail',
        ),
        array(
            'name'=>'Type',
            'header' => 'Type',
            'value' => '$data->Type == 4 ? "Admin" :($data->Type == 3 ? "Editor" : ($data->Type == 2 ? "Organizer" : "Normal"))',
            'type'=>'raw',
            'filter' => array('1' => 'Normal', '2' => 'Organizer', '3' => 'Editor', '4' => 'Admin'),

        ),
        array(
            'name' => 'Timestamp',
            'header' => 'Timestamp',
            'value' => 'date("Y-m-d", strtotime($data->Timestamp))',
            'filter'=>  $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                'model' => $model,
                'attribute' => 'Timestamp',
                'options'=>array(
                    'showAnim'=>'fold',
                    'dateFormat'=>'yy-mm-dd',
                    'changeMonth' => 'true',
                    'changeYear'=>'true',
                    'constrainInput' => 'false',
                ),
                'htmlOptions'=>array(

                    'id'=> 'date_input'
                ),
            ),true)

        ),
        array(
            'class' => 'CButtonColumn',
        ),
    ),
)); ?>
