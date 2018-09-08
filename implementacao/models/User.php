<?php

/*****************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO
 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
 * /******************************************************************/

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

//use yii\helpers\Security;

/**
 * This is the model class for table "usuarios".
 *
 * @property int $id
 * @property string $nome
 * @property string $cpf
 * @property string $rg
 * @property string $rua
 * @property int $numero
 * @property string $complemento
 * @property string $bairro
 * @property string $cidade
 * @property string $estado
 * @property string $email
 * @property string $telefone
 * @property int $role
 * @property string $password_hash
 * @property string $codigoVerificacao
 * @property strigg $password_reset_token
 * @property int @isAtivo
 */
class User extends ActiveRecord implements IdentityInterface
{

    /**
     * @inheritdoc
     */
    public $password_hash_repeat;

    //public $verification_code;

    public static function tableName()
    {
        return 'usuarios';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nome', 'cpf', 'email', 'password_hash', 'role', 'password_hash_repeat'], 'required'],
            [['nome', 'email'], 'trim'],
            //['nome', 'match', 'pattern' => '/^[a-záéíóúñ\s]+$/i', 'message' => 'Somente letras são aceitas.'],
            ['nome', 'match', 'pattern' => '/^.{3,30}$/', 'message' => 'Mínimo 3 e máximo de 30 caracteres.'],
            [['rua'], 'string', 'max' => 50],
            ['cpf', 'string'],
            [['rg'], 'string', 'min' => 9, 'max' => 12],
            [['complemento', 'bairro', 'cidade', 'estado', 'email'], 'string', 'max' => 30],
            ['telefone', 'string'],
            [['password_hash'], 'string', 'max' => 250],
            [['password_hash'], 'string', 'min' => 3],
            ['password_hash_repeat', 'compare', 'compareAttribute' => 'password_hash', 'message' => 'As senhas não correspondem.'],
            [['role', 'numero'], 'number', 'integerOnly' => true],
            ['email', 'email'],
            ['email', 'unique'],
            ['cpf', 'unique'],
            ['rg', 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Id',
            'nome' => 'Nome',
            'cpf' => 'CPF',
            'rg' => 'RG',
            'rua' => 'Rua',
            'numero' => 'Numero',
            'complemento' => 'Complemento',
            'bairro' => 'Bairro',
            'cidade' => 'Cidade',
            'estado' => 'Estado',
            'email' => 'Email',
            'telefone' => 'Telefone',
            'role' => 'Perfil',
            'password_hash' => 'Senha',
            'password_hash_repeat' => 'Repita a Senha',
            'isAtivo' => 'Status:'
        ];
    }

    public function getAuthKey()
    {
        return null;
    }

    public function getId()
    {
        return $this->getPrimaryKey();
    }

    public function validateAuthKey($authKey)
    {
        return null;
    }

    public static function findIdentity($id)
    {
        return static::findOne(['id' => $id]);
    }

    public static function findIdentityByAccessToken($token, $type = null)
    {
        return null;
    }

    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }

    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    public static function isUserAdmin($id)
    {
        if (User::findOne(['id' => $id, 'role' => 1])) {
            return true;
        } else {

            return false;
        }
    }

    public static function isUserCoordenador($id)
    {
        if (User::findOne(['id' => $id, 'role' => 2])) {
            return true;
        } else {
            return false;
        }
    }

    public static function isUserServidor($id)
    {
        if (User::findOne(['id' => $id, 'role' => 3])) {
            return true;
        } else {
            return false;
        }
    }

    public static function isUserDiscente($id)
    {
        if (User::findOne(['id' => $id, 'role' => 4])) {
            return true;
        } else {
            return false;
        }
    }

    public function generatePasswordResetToken()
    {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }


    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }


    public static function findByPasswordResetToken($token)
    {
        if (!static::isPasswordResetTokenValid($token))
            return null;

        return static::findOne([
            'password_reset_token' => $token,
            'isAtivo' => 1,
        ]);
    }

    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }

        $timestamp = (int)substr($token, strrpos($token, '_') + 1);
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        return $timestamp + $expire >= time();
    }


    public function generateAccountActivationToken()
    {
        $this->account_activation_token = Yii::$app->security->generateRandomString() . '_' . time();
    }


    public function removeAccountActivationToken()
    {
        $this->account_activation_token = null;
    }
}
