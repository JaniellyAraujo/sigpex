<?php

namespace app\models;

use Yii;
use yii\base\Model;

class ProjetosUsuariosForm extends Model
{
    /**
     * @var integer
     */
    public $idForm;

    /**
     * @var integer
     */
    public $usuario;

    /**
     * @var integer
     */
    public $tipo;

    /**
     * @var integer
     */
    public $projeto;

    /**
     * @var ProjetoUsuario
     */
    public $_projetoUsuario;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['usuario', 'tipo'], 'required'],
            [['usuario', 'tipo', 'idForm', 'projeto'], 'safe'],
        ];
    }

    public function __construct($projetoUsuario = null, $config = [])
    {
        if ($projetoUsuario) {
            /* @var $projetoUsuario ProjetoUsuario */
            $this->_projetoUsuario = $projetoUsuario;
            $this->setAttributes([
                'idForm' => $projetoUsuario->id,
                'usuario' => $projetoUsuario->usuario_id,
                'tipo' => $projetoUsuario->tipo,
            ]);
        } else {
            $this->idForm = 1;
        }

        parent::__construct($config);
    }

    public function attributeLabels()
    {
        return [
            'usuario' => 'Participante',
            'tipo' => 'Tipo de participante',
        ];
    }

    /**
     * @return bool
     */
    public function create()
    {
        $projetoUsuario = new ProjetoUsuario();
        $projetoUsuario->usuario_id = $this->usuario;
        $projetoUsuario->projeto_id = $this->projeto;
        $projetoUsuario->tipo = $this->tipo;

        if (!$projetoUsuario->save()) {
            return false;
        }

        return true;
    }
}
