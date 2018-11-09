-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 09-Nov-2018 às 17:10
-- Versão do servidor: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cleianec_sigpex`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `areaconhecimento`
--

CREATE TABLE `areaconhecimento` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `areaconhecimento`
--

INSERT INTO `areaconhecimento` (`id`, `nome`) VALUES
(1, 'Tecnologia '),
(15, 'Humanas'),
(16, 'Física'),
(17, 'Ciências '),
(14, 'Computação'),
(18, 'tetse'),
(19, 'oi'),
(21, 'novidade'),
(22, 'oig'),
(23, 'cnvvn'),
(24, 'jhg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1523756062),
('admin', '12', 1527807125),
('admin', '6', 1523756044),
('coordenador', '10', 1527798669),
('coordenador', '33', 1529100175),
('coordenador', '40', 1540681829),
('coordenador', '7', 1540681825),
('discente', '22', 1528837345),
('discente', '34', 1539006944),
('discente', '35', 1535386692),
('discente', '39', 1538918421),
('discente', '4', 1529020175),
('discente', '5', 1523755901),
('servidor', '15', 1528835551),
('servidor', '28', 1531697509),
('servidor', '3', 1529784281),
('servidor', '32', 1537217742),
('servidor', '37', 1538396751),
('servidor', '41', 1540411831),
('servidor', '8', 1523874464),
('servidor', '9', 1523886166);

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, 'userGroup', NULL, 1523755729, 1523755729),
('coordenador', 1, NULL, 'userGroup', NULL, 1523755729, 1523755729),
('createPost', 2, 'Create a post', NULL, NULL, 1523755728, 1523755728),
('deletePost', 2, 'Delete a post', NULL, NULL, 1523755729, 1523755729),
('discente', 1, NULL, 'userGroup', NULL, 1523755729, 1523755729),
('indexPost', 2, 'Index a post', NULL, NULL, 1523755729, 1523755729),
('servidor', 1, NULL, 'userGroup', NULL, 1523755729, 1523755729),
('updatePost', 2, 'Update a post', NULL, NULL, 1523755729, 1523755729),
('viewPost', 2, 'View a post', NULL, NULL, 1523755729, 1523755729);

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'createPost'),
('coordenador', 'createPost'),
('discente', 'createPost'),
('servidor', 'createPost'),
('admin', 'deletePost'),
('coordenador', 'deletePost'),
('admin', 'indexPost'),
('coordenador', 'indexPost'),
('admin', 'updatePost'),
('coordenador', 'updatePost'),
('admin', 'viewPost'),
('coordenador', 'viewPost'),
('discente', 'viewPost'),
('servidor', 'viewPost');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('userGroup', 0x4f3a32323a226170705c726261635c5573657247726f757052756c65223a333a7b733a343a226e616d65223b733a393a227573657247726f7570223b733a393a22637265617465644174223b693a313532333735353732393b733a393a22757064617465644174223b693a313532333735353732393b7d, 1523755729, 1523755729);

-- --------------------------------------------------------

--
-- Estrutura da tabela `campus`
--

CREATE TABLE `campus` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `campus`
--

INSERT INTO `campus` (`id`, `nome`) VALUES
(1, 'IFNMG - Januária');

-- --------------------------------------------------------

--
-- Estrutura da tabela `declaracao`
--

CREATE TABLE `declaracao` (
  `id` int(11) NOT NULL,
  `id_projeto` int(11) NOT NULL,
  `dataInicio` date DEFAULT NULL,
  `dataFim` date DEFAULT NULL,
  `dataEmissao` date DEFAULT NULL,
  `cargaHoraria` int(11) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `participante_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `declaracao`
--

INSERT INTO `declaracao` (`id`, `id_projeto`, `dataInicio`, `dataFim`, `dataEmissao`, `cargaHoraria`, `status`, `participante_id`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `declaracaoprojeto`
--

CREATE TABLE `declaracaoprojeto` (
  `id` int(11) NOT NULL,
  `id_declaracao` int(11) NOT NULL,
  `id_projeto` int(11) DEFAULT NULL,
  `dataEmissao` date DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `participante_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `declaracaoprojeto`
--

INSERT INTO `declaracaoprojeto` (`id`, `id_declaracao`, `id_projeto`, `dataEmissao`, `status`, `participante_id`) VALUES
(1, 1, NULL, '2018-10-27', NULL, 4),
(2, 1, NULL, '2018-10-27', NULL, 41);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modalidade`
--

CREATE TABLE `modalidade` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `modalidade`
--

INSERT INTO `modalidade` (`id`, `nome`) VALUES
(1, 'Fomento Interno'),
(2, 'Voluntário'),
(4, 'Fomento Externo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `municipio`
--

CREATE TABLE `municipio` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `estados_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `municipio`
--

INSERT INTO `municipio` (`id`, `nome`, `estados_id`) VALUES
(1, 'Januária', NULL),
(2, 'Pedras de Maria da Cruz', NULL),
(3, 'Montes Claros', NULL),
(4, 'Bonito de Minas', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `parceiros`
--

CREATE TABLE `parceiros` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) NOT NULL,
  `projeto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `parceiros`
--

INSERT INTO `parceiros` (`id`, `nome`, `projeto_id`) VALUES
(4, 'João', NULL),
(6, 'Cecília', NULL),
(7, 'Bruna', NULL),
(12, 'isaque', NULL),
(13, 'teste', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `parceirosprojeto`
--

CREATE TABLE `parceirosprojeto` (
  `id` int(11) NOT NULL,
  `id_parceiro` int(11) DEFAULT NULL,
  `id_projeto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `parceirosprojeto`
--

INSERT INTO `parceirosprojeto` (`id`, `id_parceiro`, `id_projeto`) VALUES
(1, 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projetos`
--

CREATE TABLE `projetos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `coordenador` varchar(50) DEFAULT NULL,
  `tipoProjeto` varchar(20) DEFAULT NULL,
  `objetivo` text,
  `resumo` text,
  `municipio` varchar(30) DEFAULT NULL,
  `descricaoPopulacao` text,
  `publicoAlvo` varchar(30) DEFAULT NULL,
  `pesAtendidas` int(6) DEFAULT NULL,
  `localExecucao` varchar(30) DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  `datafim` date DEFAULT NULL,
  `cargHorariaSemanal` int(10) DEFAULT NULL,
  `cargHorariaTotal` int(10) DEFAULT NULL,
  `parceiro` varchar(30) DEFAULT NULL,
  `vinculo` varchar(5) DEFAULT NULL,
  `citarVinculo` varchar(100) DEFAULT NULL,
  `convenio` varchar(10) DEFAULT NULL,
  `citarConvenio` varchar(50) DEFAULT NULL,
  `gerFundacao` varchar(10) DEFAULT NULL,
  `citarFundacao` varchar(50) DEFAULT NULL,
  `multicampi` varchar(100) DEFAULT NULL,
  `valorFinanciamento` double DEFAULT NULL,
  `contPublico` int(11) DEFAULT NULL,
  `areaConhecimento` varchar(50) DEFAULT NULL,
  `campusDesenvolvido` varchar(50) DEFAULT NULL,
  `isStatus` varchar(45) DEFAULT NULL,
  `isControle` int(10) DEFAULT NULL,
  `modalidade` varchar(45) NOT NULL,
  `isTipo` varchar(45) DEFAULT NULL,
  `isAtivo` tinyint(1) NOT NULL DEFAULT '0',
  `justificativa` varchar(500) DEFAULT NULL,
  `mes` varchar(45) DEFAULT NULL,
  `atividesenvolvidas` text,
  `avaliacao` varchar(10) DEFAULT NULL,
  `observacoes` text,
  `objetalcancados` text,
  `etapas` text,
  `materiasutiliz` text,
  `metodosutiliz` text,
  `caracfacilitadora` text,
  `caractdificultadora` text,
  `contribuicao` text,
  `avaliacao2` text,
  `isAndamento` varchar(45) DEFAULT NULL,
  `final` varchar(45) DEFAULT NULL,
  `mensal` varchar(45) DEFAULT NULL,
  `dataSolicitacao` date DEFAULT NULL,
  `dataAnalise` date DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `participante` varchar(500) DEFAULT NULL,
  `tipoUsuario` varchar(45) DEFAULT NULL,
  `isUsuario` int(11) DEFAULT NULL,
  `publico` int(11) DEFAULT NULL,
  `parceiros` int(50) DEFAULT NULL,
  `coordenador_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projetos`
--

INSERT INTO `projetos` (`id`, `titulo`, `coordenador`, `tipoProjeto`, `objetivo`, `resumo`, `municipio`, `descricaoPopulacao`, `publicoAlvo`, `pesAtendidas`, `localExecucao`, `dataInicio`, `datafim`, `cargHorariaSemanal`, `cargHorariaTotal`, `parceiro`, `vinculo`, `citarVinculo`, `convenio`, `citarConvenio`, `gerFundacao`, `citarFundacao`, `multicampi`, `valorFinanciamento`, `contPublico`, `areaConhecimento`, `campusDesenvolvido`, `isStatus`, `isControle`, `modalidade`, `isTipo`, `isAtivo`, `justificativa`, `mes`, `atividesenvolvidas`, `avaliacao`, `observacoes`, `objetalcancados`, `etapas`, `materiasutiliz`, `metodosutiliz`, `caracfacilitadora`, `caractdificultadora`, `contribuicao`, `avaliacao2`, `isAndamento`, `final`, `mensal`, `dataSolicitacao`, `dataAnalise`, `idUser`, `participante`, `tipoUsuario`, `isUsuario`, `publico`, `parceiros`, `coordenador_id`) VALUES
(1, 'Exemplo l', 'jany araujo', 'Cultural', 'teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste vteste teste teste teste teste teste teste teste teste ', 'teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste teste ', 'Januária', 'teste teste teste teste teste teste teste teste teste teste teste ', 'Crianças e adolescentes', 35, 'teste teste teste ', '2018-10-27', '2018-11-03', 30, 60, NULL, 'Não', '', 'Não', '', 'Não', '', 'Não', NULL, NULL, 'Computação', 'IFNMG - Januária', NULL, 1, 'Fomento Interno', '0', 5, 'teste teste teste teste teste teste ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-27', '2018-10-27', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(2, 'Exemplo ll', 'jany araujo', 'Empreendedor', 'teste', 'teste', 'Januária', 'teste', '', 12, 'IFNMG', '2018-11-07', '2018-12-01', 30, 60, NULL, 'Não', '', 'Não', '', 'Não', '', 'Não', NULL, NULL, 'Computação', 'IFNMG - Januária', NULL, 1, 'Fomento Interno', '2', 6, 'teste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-07', '2018-11-08', NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto_equipe`
--

CREATE TABLE `projeto_equipe` (
  `id` int(11) NOT NULL,
  `projeto_id` int(11) NOT NULL,
  `participante_id` int(11) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projeto_equipe`
--

INSERT INTO `projeto_equipe` (`id`, `projeto_id`, `participante_id`, `tipo`) VALUES
(1, 1, 41, '4'),
(2, 1, 4, '2'),
(3, 2, 41, '4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorios`
--

CREATE TABLE `relatorios` (
  `id` int(11) NOT NULL,
  `projeto_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `relatorios`
--

INSERT INTO `relatorios` (`id`, `projeto_id`, `status`) VALUES
(1, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatoriosprojeto`
--

CREATE TABLE `relatoriosprojeto` (
  `id` int(11) NOT NULL,
  `id_relatorio` int(11) DEFAULT NULL,
  `id_projeto` int(11) DEFAULT NULL,
  `discente` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `dataEntrega` date DEFAULT NULL,
  `mes` int(11) NOT NULL,
  `istipo` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `relatoriosprojeto`
--

INSERT INTO `relatoriosprojeto` (`id`, `id_relatorio`, `id_projeto`, `discente`, `tipo`, `dataEntrega`, `mes`, `istipo`) VALUES
(1, 1, NULL, 'Mariah ', 'Mensal', '2018-10-27', 10, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoprojeto`
--

CREATE TABLE `tipoprojeto` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipoprojeto`
--

INSERT INTO `tipoprojeto` (`id`, `nome`) VALUES
(7, 'Tecnológico'),
(2, 'Empreendedor'),
(3, 'Social'),
(4, 'Cultural'),
(5, 'Artístico'),
(6, 'Esportivo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) NOT NULL,
  `id_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `nome`, `id_role`) VALUES
(1, 'Aluno Voluntário', NULL),
(2, 'Aluno Bolsista', NULL),
(3, 'Docente - Colaborador', NULL),
(4, 'Docente - Coordenador', NULL),
(5, 'Técnico Administrativo - Colaborador', NULL),
(6, 'Técnico Administrativo - Coordenador', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_relatorio`
--

CREATE TABLE `tipo_relatorio` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_relatorio`
--

INSERT INTO `tipo_relatorio` (`id`, `nome`) VALUES
(1, 'Mensal'),
(2, 'Final');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `rg` varchar(13) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `numero` int(6) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  `siapeMatric` varchar(10) DEFAULT NULL,
  `formacaoCurso` varchar(500) DEFAULT NULL,
  `instituicao` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `isAtivo` tinyint(1) NOT NULL DEFAULT '0',
  `codVerificacao` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(45) DEFAULT NULL,
  `dtnascimento` varchar(45) DEFAULT NULL,
  `projeto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `rg`, `email`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `telefone`, `role`, `siapeMatric`, `formacaoCurso`, `instituicao`, `password_hash`, `isAtivo`, `codVerificacao`, `password_reset_token`, `dtnascimento`, `projeto_id`) VALUES
(1, 'admin', '111.111.111-11', '111111111111', 'admin@gmail.com', '11', 11, '7', '11', '11', 'Minas Gerais', '(11)11111-1111', '1', NULL, NULL, NULL, '$2y$13$PzIX61Z6oC6Hi5yX.WvNQOQmqkKTUWWrcvGkfYXWf6U9YrarBZf/i', 1, '0', NULL, '', NULL),
(4, 'Mariah Mendes', '444.444.444-44', '444444444444', 'janielly300@gmail.com', '44', 44, '44', '44', '44', 'Minas Gerais', '(44)44444-4444', '4', NULL, NULL, NULL, '$2y$13$ptipbCV7NBdqsR1Fx87yv.BEHdrp0wbLNT0WcudIHILhdZ/LTuV8y', 1, '0', NULL, '', NULL),
(7, 'Bruna Dias Lopes', '122.121.211-21', '111212112121', 'janiellyaraujo@yahoo.com', '12', 12, '12', '12', '12', 'Minas Gerais', '(21)21212-1212', '2', NULL, NULL, NULL, '$2y$13$ii2SquRkTxoNkF0cBRoIkuWY34HZgP8xQuZR5H0C8ZRxDeNoyxd3m', 1, '0', NULL, NULL, NULL),
(32, 'Tiago', '310.627.298-89', '334935155', 'thiagovidal@gmail.com', '', NULL, '', '', 'Barueri', 'SÃ£o Paulo', '(11)43757-084_', '3', NULL, NULL, NULL, '$2y$13$EO4HcJszfcg9tVd0YuB1AeAMsgNDdOLrtgiNlEdZ39daQRS9N0k/2', 1, '0', NULL, NULL, NULL),
(38, 'Helena Guedes Souza', '093.509.590-39', '2222222222', 'city.janu@gmail.com', 'Av. ItapiraÃ§aba', 12, '-', 'JatobÃ¡', 'januaria', 'Minas Gerais', '(38)94538-9494', '4', NULL, NULL, NULL, '$2y$13$XDIauhZ60UDgQItUUUvS5Oz1iJqS3eQGV.sTpHAq8RGrrmFe8bTaO', 1, '0', NULL, NULL, NULL),
(40, 'coordenador', '983.939.839-89', '989892898989', 'coordenador@gmail.com', 'São Mateus', 567, 'A', 'Centro', 'januaria', 'Minas Gerais', '(09)09039-4093', '2', NULL, NULL, NULL, '$2y$13$9VhVYlPbMM5oyuVkHS2cy.HfP643dC3.ugREwOQL4cvO2ld8yPi4i', 1, '0', NULL, NULL, NULL),
(41, 'jany araujo', '232.232.333-23', '', 'janielly@gmail.com', '', NULL, '', '', 'januaria', 'Minas Gerais', '', '3', NULL, NULL, NULL, '$2y$13$ZpSKf.Dvkj1vbkPiO7EmiuJhIu3U75vaB.V.eamoEceuuaWvoeNeO', 1, '0', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areaconhecimento`
--
ALTER TABLE `areaconhecimento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_idx` (`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `declaracao`
--
ALTER TABLE `declaracao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projeto_id` (`id_projeto`),
  ADD KEY `usuarios_ibfk_2` (`participante_id`);

--
-- Indexes for table `declaracaoprojeto`
--
ALTER TABLE `declaracaoprojeto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `declaracaoprojeto_ibfk_1` (`id_declaracao`),
  ADD KEY `declaracaoprojeto_ibfk_2` (`id_projeto`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `modalidade`
--
ALTER TABLE `modalidade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_municipio_estados1` (`estados_id`);

--
-- Indexes for table `parceiros`
--
ALTER TABLE `parceiros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parceiros_ibfk_2` (`projeto_id`);

--
-- Indexes for table `parceirosprojeto`
--
ALTER TABLE `parceirosprojeto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_parceiro` (`id_parceiro`),
  ADD KEY `id_projeto` (`id_projeto`);

--
-- Indexes for table `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projeto_equipe`
--
ALTER TABLE `projeto_equipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projeto_id` (`projeto_id`),
  ADD KEY `participante_id` (`participante_id`);

--
-- Indexes for table `relatorios`
--
ALTER TABLE `relatorios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projeto_id` (`projeto_id`);

--
-- Indexes for table `relatoriosprojeto`
--
ALTER TABLE `relatoriosprojeto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_relatorio` (`id_relatorio`),
  ADD KEY `id_projeto` (`id_projeto`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipoprojeto`
--
ALTER TABLE `tipoprojeto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipousuario_ibfk_2` (`id_role`);

--
-- Indexes for table `tipo_relatorio`
--
ALTER TABLE `tipo_relatorio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_ibfk_2` (`projeto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areaconhecimento`
--
ALTER TABLE `areaconhecimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `campus`
--
ALTER TABLE `campus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `declaracao`
--
ALTER TABLE `declaracao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `declaracaoprojeto`
--
ALTER TABLE `declaracaoprojeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `modalidade`
--
ALTER TABLE `modalidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `parceiros`
--
ALTER TABLE `parceiros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `parceirosprojeto`
--
ALTER TABLE `parceirosprojeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `projetos`
--
ALTER TABLE `projetos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `projeto_equipe`
--
ALTER TABLE `projeto_equipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `relatorios`
--
ALTER TABLE `relatorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `relatoriosprojeto`
--
ALTER TABLE `relatoriosprojeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tipoprojeto`
--
ALTER TABLE `tipoprojeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tipo_relatorio`
--
ALTER TABLE `tipo_relatorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `declaracao`
--
ALTER TABLE `declaracao`
  ADD CONSTRAINT `declaracao_ibfk_2` FOREIGN KEY (`id_projeto`) REFERENCES `projetos` (`id`);

--
-- Limitadores para a tabela `declaracaoprojeto`
--
ALTER TABLE `declaracaoprojeto`
  ADD CONSTRAINT `declaracaoprojeto_ibfk_1` FOREIGN KEY (`id_declaracao`) REFERENCES `declaracao` (`id`),
  ADD CONSTRAINT `declaracaoprojeto_ibfk_2` FOREIGN KEY (`id_projeto`) REFERENCES `projetos` (`id`);

--
-- Limitadores para a tabela `parceiros`
--
ALTER TABLE `parceiros`
  ADD CONSTRAINT `parceiros_ibfk_2` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

--
-- Limitadores para a tabela `parceirosprojeto`
--
ALTER TABLE `parceirosprojeto`
  ADD CONSTRAINT `parceirosprojeto_ibfk_1` FOREIGN KEY (`id_parceiro`) REFERENCES `parceiros` (`id`),
  ADD CONSTRAINT `parceirosprojeto_ibfk_2` FOREIGN KEY (`id_projeto`) REFERENCES `projetos` (`id`);

--
-- Limitadores para a tabela `projeto_equipe`
--
ALTER TABLE `projeto_equipe`
  ADD CONSTRAINT `projeto_equipe_ibfk_1` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`),
  ADD CONSTRAINT `projeto_equipe_ibfk_2` FOREIGN KEY (`participante_id`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `relatorios`
--
ALTER TABLE `relatorios`
  ADD CONSTRAINT `relatorios_ibfk_2` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

--
-- Limitadores para a tabela `relatoriosprojeto`
--
ALTER TABLE `relatoriosprojeto`
  ADD CONSTRAINT `relatoriosprojeto_ibfk_1` FOREIGN KEY (`id_relatorio`) REFERENCES `relatorios` (`id`),
  ADD CONSTRAINT `relatoriosprojeto_ibfk_2` FOREIGN KEY (`id_projeto`) REFERENCES `projetos` (`id`);

--
-- Limitadores para a tabela `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD CONSTRAINT `tipousuario_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
