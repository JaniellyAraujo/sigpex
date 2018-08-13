<?php

/* @var $this EventsController */
/* @var $model Events */

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#events-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");

?>

<?php echo CHtml::link('Date Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
    <?php $this->renderPartial('_search',array(
        'model'=>$model,
    )); ?>
</div><!-- search-form -->


<?php $this->widget('bootstrap.widgets.TbGridView', array(
	'id'=>'events-grid',
	'dataProvider'=>$model->search(),
    'afterAjaxUpdate'=>"function(){

	}",
	'filter'=>$model,
	'columns'=>array(
		'Title',
        array( 'name'=>'category_search', 'value'=>'$data->category->Name' ),
		'Address',
        array( 'name'=>'city_search', 'value'=>'$data->city->Name' ),
        array( 'name'=>'country_search', 'value'=>'$data->country->Name' ),
        array(
            'name' => 'StartDate',
            'header' => 'Start Date',
            'value' => '$data->StartDate',
            'filter'=>false,
        ),
        array(
            'name' => 'EndDate',
            'header' => 'End Date',
            'value' => '$data->EndDate',
            'filter'=>false,
            ),
        array(
        'class' => 'CButtonColumn',
        ),

),
)); ?>
