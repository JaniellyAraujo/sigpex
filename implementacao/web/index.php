<?php

// comente as duas linhas a seguir quando implantadas para produção
defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'dev');

require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . '/../vendor/yiisoft/yii2/Yii.php';


$yii=dirname(__FILE__).'/../yii/framework/yii.php'; //add 24/06
$config = require __DIR__ . '/../config/web.php';

(new yii\web\Application($config))->run();
