<?php

/******************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
 /******************************************************************/

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \app\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

?>
<div class="site-contact">



    <div class="col-md-5 well bs-component">

        <p>
            <?= Yii::t('app', 'Se você tiver dúvidas sobre outras questões, preencha o formulário a seguir para entrar em contato conosco. Obrigado.'); ?>
        </p>

        <?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>

        <?= $form->field($model, 'name')->textInput(
                ['placeholder' => Yii::t('app', 'Informe seu nome'), 'autofocus' => true])
        ?>

        <?= $form->field($model, 'email')->input('email', ['placeholder' => Yii::t('app', 'Informe seu e-mail')]) ?>

        <?= $form->field($model, 'subject')->textInput(['placeholder' => Yii::t('app', 'Informe o assunto')]) ?>

        <?= $form->field($model, 'body')->textArea(['rows' => 6]) ?>

        <?=
        $form->field($model, 'verifyCode')->widget(Captcha::className(), [
            'template' =>
            '<div class="row">
                        <div class="col-lg-4">{image}</div>
                        <div class="col-lg-8">{input}</div>
                    </div>',
            'options' => ['placeholder' => Yii::t('app', 'Informe o código de verificação'), 'class' => 'form-control'],
        ])
        ?>

        <div class="form-group">
<?= Html::submitButton(Yii::t('app', 'Enviar'), ['class' => 'btn btn-primary', 'name' => 'contact-button'])
?>
        </div>

<?php ActiveForm::end(); ?>

    </div>

</div>
