<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user app\models\User */

$resetLink = Yii::$app->urlManager->createAbsoluteUrl(['site/activate-account', 
    'token' => $user->account_activation_token]);
?>

Olá <?= Html::encode($user->nome) ?>,

Follow this link to activate your account:

<?= Html::a('Please, click here to activate your account.', $resetLink) ?>
