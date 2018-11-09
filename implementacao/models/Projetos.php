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
 /******************************************************************/

namespace app\models;

use Yii;

/**
 * This is the model class for table "projetos".
 *
 * @property int $id
 * @property string $titulo
 * @property string $tipoProjeto
 * @property string $objetivo
 * @property string $resumo
 * @property string $municipio
 * @property string $descricaoPopulacao
 * @property string $publicoAlvo  
 * @property string $modalidade
 * @property int $pesAtendidas
 * @property string $localExecucao
 * @property string $dataInicio
 * @property string $datafim
 * @property int $cargHorariaSemanal
 * @property int $cargHorariaTotal
 * @property int $parceiros
 * @property string $vinculo
 * @property string $citarVinculo
 * @property string $convenio
 * @property string $citarConvenio
 * @property string $gerFundacao
 * @property string $citarFundacao
 * @property string $multicampi
 * @property string $areaConhecimento
 * @property string $campusDesenvolvido
 * @property integer $isControle
 * @property int $isStatus
 * @property int $isTipo
 * @property int @isAtivo
 * @property string $justificativa
 * @property string $dataSolicitacao
 * @property string $dataAnalise   
 * @property string $participante
 * @property string $tipoUsuario 
 * 
 * 
 * @property string $coordenador_id
 * @property string $mensal
 * @property string $final
 * @property int $publico
 * @property int $contPublico
 * @property int $isUsuario
 * @property double $valorFinanciamento
 *  
 * @property User $idUser
 * @property Users $tipoUsuario0
 * @property RelatoriosProjetos[] $relatoriosProjetos
 */
class Projetos extends \yii\db\ActiveRecord {

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'projetos';
    }

    // use \mootensai\relation\RelationTrait;

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
                [['titulo', 'tipoProjeto', 'modalidade', 'dataInicio', 'datafim', 'cargHorariaSemanal', 'cargHorariaTotal'], 'required'],
                [['objetivo', 'resumo', 'descricaoPopulacao', 'justificativa', 'isTipo', 'isStatus', 'tipoUsuario', 'participante','mensal','final'], 'string'],
                [['id', 'pesAtendidas', 'cargHorariaSemanal', 'cargHorariaTotal', 'isControle', 'isUsuario','publico','parceiros', 'coordenador_id'], 'integer'],
            //['pesAtendidas','max'=> 6],
            [['dataInicio', 'datafim', 'dataSolicitacao', 'dataAnalise','modalidade'], 'safe'],
            //[['dataInicio', 'datafim'], 'date'],
            [['valorFinanciamento'], 'number'],
                [['titulo'], 'string', 'max' => 500],
                [[ 'citarConvenio', 'citarFundacao', 'areaConhecimento', 'campusDesenvolvido'], 'string', 'max' => 50],
                [['tipoProjeto', 'modalidade'], 'string', 'max' => 40],
                [['municipio', 'publicoAlvo', 'localExecucao'], 'string', 'max' => 30],
                [['vinculo',], 'string', 'max' => 5],
                [['citarVinculo'], 'string', 'max' => 100],
                [['convenio', 'gerFundacao', 'multicampi', 'dataInicio', 'datafim'], 'string', 'max' => 10],
                ['titulo', 'unique'],
                [['dataInicio', 'datafim'], 'date', 'format' => 'yyyy-mm-dd'],
                ['datafim', 'compare', 'compareAttribute' => 'dataInicio', 'operator' => '>=',
                'skipOnEmpty' => true, 'message' => 'Data do término deve ser maior ou igual a Data do Inicio.'],
                ['cargHorariaTotal', 'compare', 'compareAttribute' => 'cargHorariaSemanal', 'operator' => '>=',
                'skipOnEmpty' => true, 'message' => 'Carga horária total deve ser maior ou igual a Carga Horária Semanal.'],
                [['idUser'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(),
                'targetAttribute' => ['idUser' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => Yii::t('app', 'ID'),
            'idUser' => 'Coordenador:',
            'titulo' => Yii::t('app', 'Título'),
            //'coordenador' => Yii::t('app', 'Coordenador'),
            'modalidade' => Yii::t('app', 'Modalidade'),
            'tipoProjeto' => Yii::t('app', 'Tipo de Projeto'),
            'objetivo' => Yii::t('app', 'Objetivo'),
            'resumo' => Yii::t('app', 'Resumo'),
            'municipio' => Yii::t('app', 'Município Beneficiado:'),
            'descricaoPopulacao' => Yii::t('app', 'Descrição da População'),
            'publicoAlvo' => Yii::t('app', 'Público Alvo'),
            'pesAtendidas' => Yii::t('app', 'Nº de Pessoas Atendidas:'),
            'localExecucao' => Yii::t('app', 'Local de Execução'),
            'dataInicio' => Yii::t('app', 'Data de Início'),
            'datafim' => Yii::t('app', 'Data de Término'),
            'cargHorariaSemanal' => Yii::t('app', 'Carga Horária Semanal'),
            'cargHorariaTotal' => Yii::t('app', 'Carga Horária Total'),
            'parceiros' => Yii::t('app', 'Parceiros'),
            'vinculo' => Yii::t('app', 'Tem vínculo com algum programa/evento/curso?'),
            'citarVinculo' => Yii::t('app', 'Citar Vínculo'),
            'convenio' => Yii::t('app', 'O projeto prevê convênio com outra Instituição ou empresa?'),
            'citarConvenio' => Yii::t('app', 'Citar Convenio'),
            'gerFundacao' => Yii::t('app', 'O projeto é gerenciado por alguma fundação?'),
            'citarFundacao' => Yii::t('app', 'Citar Fundação'),
            'multicampi' => Yii::t('app', 'O projeto é multicampi?'),
            //'financiamento' => Yii::t('app', 'Há necessidade de Financiamento?'),
            //'tipoFinanciamento' => Yii::t('app', 'Tipo de Financiamento'),
            //'isUsuario' => Yii::t('app', 'Citar a Fonte:'),
            'valorFinanciamento' => Yii::t('app', ' Financiamento'),
            'areaConhecimento' => Yii::t('app', 'Área de Conhecimento'),
            'campusDesenvolvido' => Yii::t('app', 'Campus onde o projeto será desenvolvido:'),
            'justificativa' => Yii::t('app', 'Informe o(s) motivo(s) da necessidade de modificação do projeto:'),
            'participante' => Yii::t('app', 'Participante:'),
            'isAtivo' => Yii::t('app', 'Status'),
            'dataAnalise'=> Yii::t('app', 'Data de Envio à Reitoria'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdUser() {
        return $this->hasOne(User::className(), ['id' => 'idUser']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getId() {
        return $this->hasOne(User::className(), ['id' => 'idUser']);
    }

    //public function getUser1() {
    //return $this->hasOne(User::className(), ['id' => 'idUser']);
    //}
    public function getIdUser0() {
        return $this->hasOne(User::className(), ['id' => 'idUser']);
    }
 
        /**
     * @return \yii\db\ActiveQuery
     */
    public function getRelatoriosProjetos()
    {
        return $this->hasMany(RelatoriosProjetos::className(), ['id_projeto' => 'id']);
    }
 
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCoordenador()
    {
        return $this->hasOne(\User::className(), ['idUser' => 'coordenador']);
    }
    
    /* public function geTipoUsuario()
      {
      return $this->hasOne(Users::className(), ['tipoUsuario' => 'tipoUsuario']);
      }
      /**
     * @return \yii\db\ActiveQuery
     */
    /* public function getProjetoEquipe()
      {
      return $this->hasMany(ProjetoEquipe::className(), ['projeto_id' => 'id']);
      }

      public static function participanteSession($items = [])
      {
      $session = Yii::$app->session;
      if (!$session->has('participantes'))
      $session->set('participantes', $items);

      return $session->get('participantes');
      }

      public function afterSave ($insert, $changedAttributes)
      {
      $this->salvaParticipantes ();
      Yii::$app->session->remove ('participantes');

      return parent::afterSave ($insert, $changedAttributes);
      }

      private function salvaParticipantes()
      {
      $participanteModel = $this->getProjetoEquipe()->modelClass;
      $participantes = self::participanteSession ();
      if (!empty($participantes)) {
      $participanteModel::deleteAll(['projeto_id' => $this->id]);
      foreach ($participantes as $participante) {
      $model = new $participanteModel;
      $model->setAttributes(array_merge ($participante, [
      'projeto_id' => $this->id
      ]));
      $model->save();
      }
      }
      }

      public function carregaParticipantes()
      {
      if (!Yii::$app->session->has('participantes')) {
      $items = [];
      $participantes = $this->projetoEquipe;

      if (!empty($participantes)) {

      foreach ($participantes as $key => $participante) {
      $equipe = $participante->projeto;
      $id = $participante->projeto_id;
      $items[$id]['nome'] = (!empty($equipe)) ? $equipe->nome : null;
      $items[$id]['tipoUsuario'] = $participante->tipoUsuario;
      $items[$id]['participante_id'] = $id;
      }

      self::participanteSession($items);
      }
      }
      } */
}
