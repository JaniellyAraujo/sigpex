-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 14-Set-2018 às 18:06
-- Versão do servidor: 10.1.35-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
(1, 'Tecnologia'),
(5, 'Administração');

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
('admin', '1', 1534692565),
('admin', '6', 1523756044),
('coordenador', '10', 1529696481),
('coordenador', '2', 1523755883),
('discente', '23', 1529104176),
('discente', '4', 1523755896),
('discente', '5', 1523755901),
('servidor', '12', 1529696941),
('servidor', '3', 1523755892),
('servidor', '7', 1523821181),
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
('admin', 'deletePost'),
('admin', 'indexPost'),
('admin', 'updatePost'),
('admin', 'viewPost'),
('coordenador', 'createPost'),
('coordenador', 'deletePost'),
('coordenador', 'indexPost'),
('coordenador', 'updatePost'),
('coordenador', 'viewPost'),
('discente', 'createPost'),
('discente', 'viewPost'),
('servidor', 'createPost'),
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
-- Estrutura da tabela `j_particprojetos`
--

CREATE TABLE `j_particprojetos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `tipoUsuario` varchar(20) DEFAULT NULL,
  `justificativa` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
-- Estrutura da tabela `parceiros`
--

CREATE TABLE `parceiros` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `parceiros`
--

INSERT INTO `parceiros` (`id`, `nome`) VALUES
(13, 'Carlos'),
(10, 'Bruna');

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
  `parceiros` varchar(30) DEFAULT NULL,
  `vinculo` varchar(5) DEFAULT NULL,
  `citarVinculo` varchar(100) DEFAULT NULL,
  `convenio` varchar(10) DEFAULT NULL,
  `citarConvenio` varchar(50) DEFAULT NULL,
  `gerFundacao` varchar(10) DEFAULT NULL,
  `citarFundacao` varchar(50) DEFAULT NULL,
  `multicampi` varchar(100) DEFAULT NULL,
  `publico` int(11) DEFAULT NULL,
  `valorFinanciamento` double DEFAULT NULL,
  `contPublico` int(50) DEFAULT NULL,
  `isUsuario` int(11) DEFAULT NULL,
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
  `participante` varchar(500) DEFAULT NULL,
  `tipoUsuario` varchar(30) DEFAULT NULL,
  `dataSolicitacao` date DEFAULT NULL,
  `dataAnalise` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projetos`
--

INSERT INTO `projetos` (`id`, `titulo`, `coordenador`, `tipoProjeto`, `objetivo`, `resumo`, `municipio`, `descricaoPopulacao`, `publicoAlvo`, `pesAtendidas`, `localExecucao`, `dataInicio`, `datafim`, `cargHorariaSemanal`, `cargHorariaTotal`, `parceiros`, `vinculo`, `citarVinculo`, `convenio`, `citarConvenio`, `gerFundacao`, `citarFundacao`, `multicampi`, `publico`, `valorFinanciamento`, `contPublico`, `isUsuario`, `areaConhecimento`, `campusDesenvolvido`, `isStatus`, `isControle`, `modalidade`, `isTipo`, `isAtivo`, `justificativa`, `mes`, `atividesenvolvidas`, `avaliacao`, `observacoes`, `objetalcancados`, `etapas`, `materiasutiliz`, `metodosutiliz`, `caracfacilitadora`, `caractdificultadora`, `contribuicao`, `avaliacao2`, `isAndamento`, `participante`, `tipoUsuario`, `dataSolicitacao`, `dataAnalise`) VALUES
(40, 'Projeto Exemplo I', NULL, 'Tecnológico', 'O Sistema de Gerenciamento de Projetos de Extensão visa proporcionar benefícios como: maior velocidade de aquisição de dados, maior rapidez na geração de documentos, maior segurança de informações, menor probabilidade de erros, controle em tempo real, otimização do tempo de tomada de decisões e redução das dificuldades de produção. Esse gerenciamento envolve o cadastro do projeto, cadastro de servidores e discentes envolvidos, acompanhamento dos relatórios periódicos e finais, acompanhamento da realização das atividades propostas, emissão de certificados para participantes das ações de extensão, emissão de declarações para os responsáveis pelas ações, geração de relatórios periódicos e anuais para acompanhamento da ação da instituição na comunidade.', 'O Sistema de Gerenciamento de Projetos de Extensão visa proporcionar benefícios como: maior velocidade de aquisição de dados, maior rapidez na geração de documentos, maior segurança de informações, menor probabilidade de erros, controle em tempo real, otimização do tempo de tomada de decisões e redução das dificuldades de produção. Esse gerenciamento envolve o cadastro do projeto, cadastro de servidores e discentes envolvidos, acompanhamento dos relatórios periódicos e finais, acompanhamento da realização das atividades propostas, emissão de certificados para participantes das ações de extensão, emissão de declarações para os responsáveis pelas ações, geração de relatórios periódicos e anuais para acompanhamento da ação da instituição na comunidade.', 'Januária', 'O Sistema de Gerenciamento de Projetos de Extensão visa proporcionar benefícios como: maior velocidade de aquisição de dados, maior rapidez na geração de documentos, maior segurança de informações, menor probabilidade de erros, controle em tempo real, otimização do tempo de tomada de decisões e redução das dificuldades de produção. Esse gerenciamento envolve o cadastro do projeto, cadastro de servidores e discentes envolvidos, acompanhamento dos relatórios periódicos e finais, acompanhamento da realização das atividades propostas, emissão de certificados para participantes das ações de extensão, emissão de declarações para os responsáveis pelas ações, geração de relatórios periódicos e anuais para acompanhamento da ação da instituição na comunidade.', 'Acadêmicos ', 33, 'IFNMG', '2018-08-01', '2018-10-31', 30, 400, '', 'Não', '---', 'Não', '', 'Não', '', 'Não', 0, NULL, 0, NULL, 'Tecnologia', 'IFNMG - Januária', NULL, 1, 'Fomento Interno', '1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Projeto Exemplo II', '', 'Esportivo', 'O acompanhamento dos projetos de extensão no DEX é realizado com o auxílio de editores de texto e planilhas eletrônicas. Assim, as informações não estão relacionadas e várias conferências, inclusive, em papéis impressos precisam ser realizadas para a geração de documentos. Há também o tempo gasto em copiar todos os dados preenchidos no formulário de cadastro dos projetos para a planilha eletrônica que é utilizada.', 'O acompanhamento dos projetos de extensão no DEX é realizado com o auxílio de editores de texto e planilhas eletrônicas. Assim, as informações não estão relacionadas e várias conferências, inclusive, em papéis impressos precisam ser realizadas para a geração de documentos. Há também o tempo gasto em copiar todos os dados preenchidos no formulário de cadastro dos projetos para a planilha eletrônica que é utilizada.', 'Januária', 'O acompanhamento dos projetos de extensão no DEX é realizado com o auxílio de editores de texto e planilhas eletrônicas. Assim, as informações não estão relacionadas e várias conferências, inclusive, em papéis impressos precisam ser realizadas para a geração de documentos.', 'Crianças e adolescentes', 35, 'IFNMG', '2018-08-01', '2018-12-31', 30, 60, 'Bruna', 'Não', '---', 'Não', '--', 'Não', '--', 'Não', 0, NULL, 0, 0, 'Administração', 'IFNMG - Januária', NULL, 3, 'Voluntário', '6', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Projeto Exemplo III', '', 'Artístico', '', '', '', '', '', NULL, '', '2018-08-01', '2018-08-30', 30, 80, '', '', '', '', '', '', '', '', 0, NULL, 0, NULL, '', '', NULL, 1, 'Fomento Interno', '5', 4, 'Há também o tempo gasto em copiar todos os dados preenchidos no formulário de cadastro dos projetos para a planilha eletrônica que é utilizada.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Projeto Exemplo IV', NULL, 'Empreendedor', '', '', '', '', '', NULL, '', '2018-08-01', '2018-08-31', 40, 80, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', NULL, 1, 'Fomento Interno', '2', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Projeto Exemplo V ', NULL, 'Social', '', '', '', '', '', NULL, '', '2018-08-01', '2018-08-31', 30, 80, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', NULL, 2, 'Fomento Externo', '3', 3, 'Preencha os formulários', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'Projeto Exemplo VI', NULL, 'Artístico', '', '', '', '', '', NULL, '', '2018-08-01', '2018-08-31', 30, 80, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', NULL, 3, 'Voluntário', '5', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'Projeto  Exemplo VII', NULL, 'Cultural', '', '', '', '', '', NULL, '', '2018-08-01', '2018-08-01', 30, 80, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', NULL, 1, 'Fomento Interno', '4', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Projeto Exemplo VIII', NULL, 'Esportivo', '', '', '', '', '', NULL, '', '2018-08-01', '2018-08-30', 30, 60, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', NULL, 1, 'Fomento Interno', '6', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'para servidor sem acesso', NULL, 'Tecnológico', '', '', '', '', '', NULL, '', '2018-01-01', '2019-01-01', 10, 10, '', '', '', '', '', '', '', '', NULL, NULL, NULL, 10000, '', '', NULL, 3, 'Voluntário', '1', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'sem servidor2', NULL, 'Tecnológico', '', '', '', '', '', NULL, '', '2018-01-01', '2019-01-01', 10, 10, '', '', '', '', '', '', '', '', NULL, NULL, NULL, 1000, '', '', NULL, 1, 'Fomento Interno', '1', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'xxxx', NULL, 'Tecnológico', '', '', '', '', '', NULL, '', '2018-12-01', '2019-01-01', 10, 10, '', '', '', '', '', '', '', '', NULL, NULL, NULL, 22, '', '', NULL, 1, 'Fomento Interno', '1', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'projeto Exemplo', NULL, 'Empreendedor', '', '', '', '', '', NULL, '', '2018-09-07', '2018-09-29', 30, 60, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', NULL, 3, 'Voluntário', '2', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto_usuario`
--

CREATE TABLE `projeto_usuario` (
  `id` int(11) NOT NULL,
  `projeto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projeto_usuario`
--

INSERT INTO `projeto_usuario` (`id`, `projeto_id`, `usuario_id`, `tipo`) VALUES
(1, 40, 4, 'Discente Voluntário'),
(2, 40, 7, 'Colaborador'),
(3, 40, 26, 'Técnico Administrativo'),
(9, 43, 7, 'Docente - Coordenador'),
(10, 43, 4, 'Discente Bolsista'),
(11, 44, 7, 'Docente - Coordenador'),
(12, 44, 2, 'Técnico Administrativo - Colaborador'),
(13, 45, 7, 'Docente - Coordenador'),
(14, 45, 28, 'Discente Bolsista'),
(15, 45, 4, 'Discente Bolsista'),
(16, 46, 7, 'Docente - Coordenador'),
(17, 46, 28, 'Discente Voluntário'),
(18, 46, 4, 'Discente Bolsista'),
(19, 41, 7, 'Docente - Coordenador'),
(20, 41, 4, 'Discente Voluntário'),
(21, 41, 26, 'Docente - Colaborador'),
(22, 47, 7, 'Docente - Coordenador'),
(23, 47, 28, 'Discente Voluntário'),
(24, 48, 7, 'Docente - Coordenador'),
(25, 49, 28, 'Docente - Coordenador'),
(26, 42, 7, 'Docente - Coordenador'),
(27, 42, 28, 'Discente Bolsista'),
(28, 50, 7, 'Docente - Coordenador'),
(29, 51, 7, 'Docente - Coordenador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorios`
--

CREATE TABLE `relatorios` (
  `id` int(11) NOT NULL,
  `projeto_id` int(11) NOT NULL,
  `discente` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `dataEntrega` date DEFAULT NULL,
  `mes` int(11) NOT NULL,
  `status` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `relatorios`
--

INSERT INTO `relatorios` (`id`, `projeto_id`, `discente`, `tipo`, `dataEntrega`, `mes`, `status`) VALUES
(9, 53, 'jany', '2', '2020-10-18', 2, 0),
(11, 51, 'jany', '2', '2018-09-14', 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`id`, `nome`) VALUES
(1, 'teste'),
(4, 'Pendente');

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
  `nome` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `nome`) VALUES
(1, 'Discente Voluntário'),
(15, 'Docente - Colaborador'),
(6, 'Discente Bolsista'),
(13, 'Técnico Administrativo - Colaborador'),
(14, 'Técnico Administrativo - Coordenador'),
(16, 'Docente - Coordenador');

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
  `dtnascimento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `rg`, `email`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `telefone`, `role`, `siapeMatric`, `formacaoCurso`, `instituicao`, `password_hash`, `isAtivo`, `codVerificacao`, `password_reset_token`, `dtnascimento`) VALUES
(1, 'admin', '111.111.111-11', '111111111111', 'admin@gmail.com', '11', 11, '7', '11', '11', 'Minas Gerais', '(11)11111-1111', '1', NULL, NULL, NULL, '$2y$13$Yvh4pSLejR1v3XOxWLrcX.cFmeKwZGt71I3/mMvIZb2oXVakZB0.y', 1, '0', NULL, ''),
(2, 'Coordenador', '222.222.222-22', '222222222222', 'coordenador@gmail.com', '22', 22, '22', '22', '22', 'Minas Gerais', '(22)22222-2222', '2', NULL, NULL, NULL, '$2y$13$rYb/myNAYrnesofWzvyrLO2/r/og/jQfMNdwsalBsrT5ruB73HA0u', 1, '0', NULL, ''),
(4, 'Discente', '444.444.444-44', '444444444444', 'discente@gmail.com', '44', 44, '44', '44', '44', 'Minas Gerais', '(44)44444-4444', '4', NULL, NULL, NULL, '$2y$13$ptipbCV7NBdqsR1Fx87yv.BEHdrp0wbLNT0WcudIHILhdZ/LTuV8y', 1, '0', NULL, ''),
(7, 'Servidor', '122.121.211-21', '111212112121', 'servidor@gmail.com', '12', 12, '12', '12', '12', 'Minas Gerais', '(21)21212-1212', '3', NULL, NULL, NULL, '$2y$13$ii2SquRkTxoNkF0cBRoIkuWY34HZgP8xQuZR5H0C8ZRxDeNoyxd3m', 1, '0', NULL, NULL),
(26, 'Maria', '857.898.787-87', '', 'maria@gmail.com', '', NULL, '', '', '', '', '', '3', NULL, NULL, NULL, '$2y$13$SSqTAYza/UHImL8pc6.1oOKlzZG9HLddqDqjx4YRpZz8nakYBuzzy', 2, '0', NULL, NULL),
(27, 'João', '767.575.565-77', '', 'joao@gmail.com', '', NULL, '', '', '', '', '', '3', NULL, NULL, NULL, '$2y$13$HQgjy4CbBQz73awdI21BWe2jkiywcAKHnnIZfA1f.Q642xJICDtYO', 0, '0', NULL, NULL),
(28, 'jany araujo', '838.358.357-35', '', 'janielly300@gmail.com', '', NULL, '', '', 'januaria', 'Minas Gerais', '', '4', NULL, NULL, NULL, '$2y$13$1l/wGNytZMvCGkRHTJ766.1CR7G/qqE8m7LZMFs6cf6l5YGqR8hSK', 1, '0', NULL, NULL);

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
-- Indexes for table `j_particprojetos`
--
ALTER TABLE `j_particprojetos`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `parceiros`
--
ALTER TABLE `parceiros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projeto_usuario`
--
ALTER TABLE `projeto_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projeto_id` (`projeto_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `relatorios`
--
ALTER TABLE `relatorios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projeto_id` (`projeto_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areaconhecimento`
--
ALTER TABLE `areaconhecimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `campus`
--
ALTER TABLE `campus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `j_particprojetos`
--
ALTER TABLE `j_particprojetos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modalidade`
--
ALTER TABLE `modalidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parceiros`
--
ALTER TABLE `parceiros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `projetos`
--
ALTER TABLE `projetos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `projeto_usuario`
--
ALTER TABLE `projeto_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `relatorios`
--
ALTER TABLE `relatorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tipoprojeto`
--
ALTER TABLE `tipoprojeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
-- Limitadores para a tabela `projeto_usuario`
--
ALTER TABLE `projeto_usuario`
  ADD CONSTRAINT `projeto_usuario_ibfk_1` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`),
  ADD CONSTRAINT `projeto_usuario_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
