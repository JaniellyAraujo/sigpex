<?php

//CONEXÃO COM O BANCO DE DADOS
return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=localhost;dbname=cleianec_sigpex',
    'username' => 'root',
    'password' => '',
    'charset' => 'utf8',
        // Schema cache options (for production environment)
        //'enableSchemaCache' => true,
        //'schemaCacheDuration' => 60,
        //'schemaCache' => 'cache',
];
