<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->
	<?php Yii::app()->bootstrap->register(); ?>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />



	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<?php 

$currentPage = Yii::app()->request->url;
$IP = $_SERVER["HTTP_HOST"];

$sql = "insert into tracker (page, ip) values (:Page, :IP)";
$parameters = array(":Page"=>$currentPage, ':IP' => $IP);
Yii::app()->db->createCommand($sql)->execute($parameters);



?>


<body>

<header>
    <?php echo TbHtml::tabs(array(
        array('label'=>'Home', 'url'=>array('/')),
        array('label'=>'About', 'url'=>array('/site/page/', 'view'=>'about')),
        array('label'=>'Contact', 'url'=>array('/site/contact')),
        array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
        array('label'=>'Register', 'url'=>array('/site/register'), 'visible'=>Yii::app()->user->isGuest),
        array('label' => 'Users', 'items' => array(
            array('label'=>'Add an account', 'url' => array('users/create'),'visible'=>!Yii::app()->user->isGuest && !Yii::app()->user->isNormal() ),
            array('label'=>'Admin area', 'url' => array('users/admin'), 'visible'=> !Yii::app()->user->isGuest && Yii::app()->user->isAdmin()),
        ),'visible'=> !Yii::app()->user->isGuest && !Yii::app()->user->isNormal() || !Yii::app()->user->isGuest && Yii::app()->user->isAdmin() ),
        array('label' => 'Events', 'items' => array(
            array('label'=>'Add an event', 'url' => array('events/create'),'visible'=>!Yii::app()->user->isGuest && !Yii::app()->user->isNormal() && !Yii::app()->user->isEditor() ),
            array('label'=>'Admin area', 'url' => array('events/admin'), 'visible'=> !Yii::app()->user->isGuest && Yii::app()->user->isAdmin() || !Yii::app()->user->isGuest && Yii::app()->user->isOrganizer()),
            array('label'=>'Statistics area', 'url'=> array('events/statistics'),'visible'=>!Yii::app()->user->isGuest && Yii::app()->user->isAdmin() || !Yii::app()->user->isGuest && Yii::app()->user->isOrganizer())
        ),'visible'=> !Yii::app()->user->isGuest && Yii::app()->user->isAdmin() || !Yii::app()->user->isGuest && Yii::app()->user->isOrganizer() ),
        array('label'=>'Logout ('.Yii::app()->user->getName().')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest),

    )); ?>
</header>

<div class="clearfix"></div>

<div class="container-fluid">

<?php echo $content; ?>

<div class="clear"></div>

</div><!-- page -->

<div class="clearfix"></div>

<footer>
<div id="footer">

    Copyright &copy; <?php echo date('Y'); ?> by Razvan Dumitru.<br/>
    All Rights Reserved.<br/>
    <?php

    $query = "SELECT DATE_FORMAT(calendar.datefield, '%Y/%m/%d') AS date,
      IFNULL(count(id),0) AS views FROM tracker RIGHT JOIN calendar
      ON (DATE(timestamp) = calendar.datefield) WHERE calendar.datefield
      BETWEEN DATE(DATE_SUB(NOW(), INTERVAL 6 DAY)) AND DATE(NOW())
      GROUP BY calendar.datefield
      ORDER BY calendar.datefield desc";

    $data = Yii::app()->db->createCommand($query)->queryAll();

    $currentChart = CHtml::listData($data, 'date', 'views');

    $currentDays = array_values(array_reverse($currentChart));

    $this->widget('yiiwheels.widgets.sparklines.WhSparklines', array(
        'data' => $currentDays ,
        'pluginOptions' => array(
            'type' => 'bar', 'barColor' => 'green'
        )
    ));


    ?>
</div><!-- footer -->

</footer>



</body>



</html>
