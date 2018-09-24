<?php

$params = require __DIR__ . '/params.php';
$db = require __DIR__ . '/db.php';

$config = [
    'id' => 'sigpex',
    'language' => 'pt_BR',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'modules' => [
        'gridview' => [
            'class' => '\kartik\grid\Module'
        ],
    ],
    /** ..........
    'aliases' => [
        '@nineinchnick/usr' => '@vendor/nineinchnick/yii2-usr',
    ],
    'modules' => [
        'usr' => [
            'class' => 'nineinchnick\usr\Module',
        ],
    ],
    'components' => [
        'user' => [
            'identityClass' => 'app\models\User',
            'loginUrl' => ['usr/login'],
        ],
        'mail' => [
            'class' => 'yii\swiftmailer\Mailer',
            'useFileTransport' => YII_DEBUG,
            'messageConfig' => [
                'from' => 'noreply@yoursite.com',
            ],
        ],
    
    ],
    */// ..........
    'layout' => 'column2',
    'layoutPath' => '@app/themes/adminLTE/layouts',
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm' => '@vendor/npm-asset',
        '@adminlte/widgets' => '@vendor/adminlte/yii2-widgets'
    ],
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '-GkW8WcfydCPmWlWaxGyHB3T-Lf7toHh',
            'enableCsrfValidation' => false,
        //'baseUrl' => '/sigpex/',
        ],
        /* 'view' => [
          'theme' => [
          'pathMap' => ['@app/views' => '@app/themes/adminLTE'],
          'baseUrl' => '@web/../themes/adminLTE',
          ],
          ], */
        'formatter' => [
            'class' => 'yii\i18n\Formatter',
            'dateFormat' => 'dd/MM/yyyy',
            'datetimeFormat' => 'php:d-M-Y H:i:s',
            'timeFormat' => 'php:H:i:s',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
        ],
        
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@app/mail',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => 'mail.cleiane.com.br',
                //'username' => 'sigpex@cleiane.com.br',
                'password' => "sigpexjanu2018",
                'port' => 465,
                'encryption' => 'ssl',
            ],
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                    [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => $db,
        'urlManager' => [
            'class' => 'yii\web\UrlManager',
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
                '' => 'site/index',
                '<action:(index|login|logout|request-password-reset)>' => 'site/<action>',
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>'
            ],
        ],
    /* 'mailer' => [
      'class' => 'yii\swiftmailer\Mailer',
      // send all mails to a file by default. You have to set
      // 'useFileTransport' to false and configure a transport
      // for the mailer to send real emails.
      'useFileTransport' => true,
      ], */

    /*
      'urlManager' => [
      'enablePrettyUrl' => true,
      'showScriptName' => false,
      'rules' => [
      ],
      ],
     */
    ],
    'params' => $params,
];

/* if (YII_ENV_DEV) {
  // configuration adjustments for 'dev' environment
  // $config['bootstrap'][] = 'debug';
  // $config['modules']['debug'] = [
  //   'class' => 'yii\debug\Module',
  // uncomment the following to add your IP if you are not connecting from localhost.
  //'allowedIPs' => ['127.0.0.1', '::1'],
  //];

  $config['bootstrap'][] = 'gii';
  $config['modules']['gii'] = [
  'class' => 'yii\gii\Module',
  'generators' => [ //here
  'crud' => [ // generator name
  'class' => 'yii\gii\generators\crud\Generator', // generator class
  'templates' => [ //setting for out templates
  'custom' =>'@vendor/bmsrox/yii-adminlte-crud-template', // template name => path to template
  ]
  ]
  ],

  'modules' => [

  // Gii templates
  'gii' =>[
  'class' => 'yii\gii\Module',
  'generators' => [
  'crud' => [
  'class' => 'yii\gii\generators\crud\Generator',
  'templates' => ['grCrudViews' => '@/themes\gii\crud\default'],
  ],
  'model' => [
  'class' => 'yii\gii\generators\model\Generator',
  'templates' => ['grModels' => '@themes\gii\crud\default'],
  ],
  ],
  ],
  // end Gii templates
  ],
  ];
  } */
if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    //$config['bootstrap'][] = 'debug';
    //$config['modules']['debug'] = [
    //'class' => 'yii\debug\Module',
    // uncomment the following to add your IP if you are not connecting from localhost.
    //'allowedIPs' => ['127.0.0.1', '::1'],
    //];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        'generators' => [
                'crud' => [
                    'class' => 'yii\gii\generators\crud\Generator',
                    'templates' => [
                        'ajax-modal' => '@vendor/dchaofei/yii2-ajaxmodal/gii-template/curd/default',
                    ]
                ]
            ],
            // uncomment the following to add your IP if you are not connecting from localhost.
            //'allowedIPs' => ['127.0.0.1', '::1'],
    ];
   
}

return $config;
