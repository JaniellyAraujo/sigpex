<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user app\models\User */

$resetLink = Yii::$app->urlManager->createAbsoluteUrl(['site/reset-password', 
    'token' => $user->password_reset_token]);
?>

Olá <?= Html::encode($user->nome) ?>,

<p>Siga este link abaixo para redefinir sua senha:</p>

<p><?= Html::a('Por favor, clique aqui para redefinir sua senha.', $resetLink) ?></p>
