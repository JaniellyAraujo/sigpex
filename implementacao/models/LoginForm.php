<?php

/* * ***************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
  /***************************************************************** */

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * LoginForm is the model behind the login form.
 *
 * @property User|null $user This property is read-only.
 *
 */
class LoginForm extends Model {

    public $email;
    public $password_hash;
    public $rememberMe = true;
    private $_user = false;

    /**
     * @return array the validation rules.
     */
    public function rules() {
        return [
                [['email', 'password_hash'], 'required', 'message' => 'Insira um valor para {attribute}'],
                ['rememberMe', 'boolean'],
                ['password_hash', 'validatePassword'],
                ['email', 'email'],
        ];
    }

    public function attributeLabels() {
        return array(
            'rememberMe' => 'Manter conectado',
            'email' => 'E-mail',
            'password_hash' => 'Senha',
        );
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */

    /**
     * @param $password
     * @return User|null
     */
    public function validatePassword($attribute, $params) {
        if (!$this->hasErrors()) {
            $user = $this->getUser();

            if (!$user || !$user->validatePassword($this->password_hash)) {
                $this->addError($attribute, 'E-mail ou senha incorretos.');
            } else if ($user || $user->validatePassword($this->password_hash)) {
                $ativo = $user->isAtivo;
                if ($ativo == 0) {
                    $this->addError($attribute, 'Aguardando aprovação do administrador.');
                }
                if ($ativo == 2) {
                    $this->addError($attribute, 'Usuário Desativado! Entre em contato com o administrador.');
                }
            }
        }
    }

    /**
     * Logs in a user using the provided username and password.
     * @return bool whether the user is logged in successfully
     */
    public function login() {
        if ($this->validate()) {
            return Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600 * 24 * 30 : 0);
        }
        return false;
    }

    /**
     * Finds user by [[email]]
     *
     * @return User|null
     */
    public function getUser() {
        if ($this->_user === false) {
            $this->_user = User::findOne(['email' => $this->email]);
        }
        return $this->_user;
    }

}
