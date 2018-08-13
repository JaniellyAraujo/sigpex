<?php
/* @var $this EventsController */
/* @var $model Events */

?>

<h3> <?php echo $model->Title; ?></h3>

<?php $this->renderPartial('_formWithoutPoster', array('model'=>$model)); ?>