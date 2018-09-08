<?php

namespace app\models;

use Yii;
use yii\base\Model;

class RelatoriosProjetosForm extends Model
{
    /**
     * @var integer
     */
    public $idForm;

    /**
     * @var integer
     */
    public $relatorio;

        /**
     * @var string
     */
    public $mes;
    
        /**
     * @var string
     */
    public $bolsista;
    
        /**
     * @var string
     */
    public $coordenador;
    
        /**
     * @var string
     */
    public $atividades;
    
        /**
     * @var string
     */
    public $periodo1;
    
           /**
     * @var string
     */
    public $periodo2;
    
           /**
     * @var string
     */
    public $periodo3;
    
           /**
     * @var string
     */
    public $periodo4;
    
           /**
     * @var integer
     */
    public $carga1;
    
               /**
     * @var integer
     */
    public $carga2;
    
               /**
     * @var integer
     */
    public $carga3;
    
               /**
     * @var integer
     */
    public $carga4;
    
               /**
     * @var integer
     */
    public $total;
    
    /**
     * @var string
     */
    public $avaliacao;
    
    /**
     * @var string
     */
    public $observacao;
    
    /**
     * @var string
     */
    public $projeto;

    /**
     * @var RelatoriosProjetos
     */
    public $_realatorioProjeto;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['projeto',], 'required'],
            [['projeto', 'bolsista', 'idForm', 'mes', 'coordenador', 'atividades', 'periodo1','periodo2','periodo3','periodo4','carga1','carga2','carga3','carga4','total','avaliacao','observacao'], 'safe'],
        ];
    }

    public function __construct($projetoUsuario = null, $config = [])
    {
        if ($relatorioProjeto) {
            /* @var $relatorioProjeto RelattoriosProjetos */
            $this->_relatorioProjeto = $relatorioProjeto;
            $this->setAttributes([
                'idForm' => $relatorioProjeto->id,
                'projeto' => $relatorioProjeto->id_projeto,
                'mes' => $relatorioProjeto->mes,
                'bolsista' => $relatorioProjeto->bolsista,
                'coordenador' => $relatorioProjeto->coordenador,
                'atividades' => $relatorioProjeto->atividades,
                'periodo1' => $relatorioProjeto->periodo1,
                'periodo2' => $relatorioProjeto->periodo2,
                'periodo3' => $relatorioProjeto->periodo3,
                'periodo4' => $relatorioProjeto->periodo4,
                'carga1' => $relatorioProjeto->carga1,
                'carga2' => $relatorioProjeto->carga2,
                'carga3' => $relatorioProjeto->carga3,
                'carga4' => $relatorioProjeto->carga4,
                'total' => $relatorioProjeto->total,
                'avaliacao' => $relatorioProjeto->avaliacao,
                'observacao' => $relatorioProjeto->observacao,
            ]);
        } else {
            $this->idForm = 1;
        }

        parent::__construct($config);
    }

    public function attributeLabels()
    {
        return [
            
            'mes' => 'Mês',
            'bolsista' => 'Bolsista',
            'coordenador' => 'Coordenador',
            'atividades' => 'Atividades Desenvolvidas',
            'periodo1' => 'Período',
            'periodo2' => '',
            'periodo3' => '',
            'periodo4' => '',
            'carga1' => 'Carga Horária',
            'carga2' => '',
            'carga3' => '',
            'carga4' => '',
            'total' => 'Total',
            'avaliacao' => 'Avaliação',
            'observacao' => 'Observaões',
        ];
    }

    /**
     * @return bool
     */
    public function create()
    {
        $relatorioProjeto = new RelatoriosProjetos();
        $relatorioProjeto->id_relatorios = $this->relatorio;
        $relatorioProjeto->id_projeto = $this->projeto;
        $relatorioProjeto->mes = $this->mes;
        $relatorioProjeto->bolsista = $this->bolsista;
        $relatorioProjeto->coordenador = $this->coordenador;
        $relatorioProjeto->atividades = $this->atividades;
        $relatorioProjeto->periodo1 = $this->periodo1;
        $relatorioProjeto->periodo2 = $this->periodo2;
        $relatorioProjeto->periodo3 = $this->periodo3;
        $relatorioProjeto->periodo4 = $this->periodo4;
        $relatorioProjeto->carga1 = $this->carga1;
        $relatorioProjeto->carga2 = $this->carga2;
        $relatorioProjeto->carga3 = $this->carga3;
        $relatorioProjeto->carga4 = $this->carga4;
        $relatorioProjeto->total = $this->total;
        $relatorioProjeto->avaliacao = $this->avaliacao;
        $relatorioProjeto->observacao = $this->observacao;

        if (!$relatorioProjeto->save()) {
            return false;
        }

        return true;
    }
}
