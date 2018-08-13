<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user app\models\User */

$resetLink = Yii::$app->urlManager->createAbsoluteUrl(['site/reset-password', 
    'token' => $user->password_reset_token]);
?>

Hello <?= Html::encode($user->nome) ?>,

Siga este link abaixo para redefinir sua senha:

<?= Html::a('Por favor, clique aqui para redefinir sua senha.', $resetLink) ?>
