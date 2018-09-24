-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `areaconhecimento`
-- -------------------------------------------
DROP TABLE IF EXISTS `areaconhecimento`;
CREATE TABLE IF NOT EXISTS `areaconhecimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `auth_assignment`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `auth_item`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `auth_item_child`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `auth_rule`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `campus`
-- -------------------------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE IF NOT EXISTS `campus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `cidades`
-- -------------------------------------------
DROP TABLE IF EXISTS `cidades`;
CREATE TABLE IF NOT EXISTS `cidades` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `estados_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cidades_estados1` (`estados_id`),
  CONSTRAINT `fk_cidades_estados1` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `estados`
-- -------------------------------------------
DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sigla` varchar(2) NOT NULL,
  PRIMARY KEY (`id`,`sigla`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `j_atividades`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_atividades`;
CREATE TABLE IF NOT EXISTS `j_atividades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(500) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `localExecucao` varchar(30) DEFAULT NULL,
  `pesAtendidas` int(6) DEFAULT NULL,
  `classificacaoAtivi` varchar(30) DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  `datafim` date DEFAULT NULL,
  `cargHoraria` int(10) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `areaConhecimento` varchar(30) DEFAULT NULL,
  `descricao` text,
  `publicoAlvo` varchar(30) DEFAULT NULL,
  `isAtivo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_certificados`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_certificados`;
CREATE TABLE IF NOT EXISTS `j_certificados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `atividade` varchar(500) NOT NULL,
  `projetoevento` varchar(500) NOT NULL,
  `dia` int(2) NOT NULL,
  `mes` varchar(30) NOT NULL,
  `ano` varchar(30) NOT NULL,
  `cargahoraria` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_declaracoes`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_declaracoes`;
CREATE TABLE IF NOT EXISTS `j_declaracoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `anoletivo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_particeventos`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_particeventos`;
CREATE TABLE IF NOT EXISTS `j_particeventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(500) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_particprojetos`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_particprojetos`;
CREATE TABLE IF NOT EXISTS `j_particprojetos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(500) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `tipoUsuario` varchar(20) DEFAULT NULL,
  `justificativa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_usuarios`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_usuarios`;
CREATE TABLE IF NOT EXISTS `j_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `migration`
-- -------------------------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `modalidade`
-- -------------------------------------------
DROP TABLE IF EXISTS `modalidade`;
CREATE TABLE IF NOT EXISTS `modalidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `parceiros`
-- -------------------------------------------
DROP TABLE IF EXISTS `parceiros`;
CREATE TABLE IF NOT EXISTS `parceiros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `projeto_equipe`
-- -------------------------------------------
DROP TABLE IF EXISTS `projeto_equipe`;
CREATE TABLE IF NOT EXISTS `projeto_equipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projeto_id` int(11) NOT NULL,
  `participante_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projeto_id` (`projeto_id`),
  KEY `participante_id` (`participante_id`),
  CONSTRAINT `projeto_equipe_ibfk_1` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`),
  CONSTRAINT `projeto_equipe_ibfk_2` FOREIGN KEY (`participante_id`) REFERENCES `j_particprojetos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `projeto_usuario`
-- -------------------------------------------
DROP TABLE IF EXISTS `projeto_usuario`;
CREATE TABLE IF NOT EXISTS `projeto_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projeto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projeto_id` (`projeto_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `projeto_usuario_ibfk_1` FOREIGN KEY (`projeto_id`) REFERENCES `projetos` (`id`),
  CONSTRAINT `projeto_usuario_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `j_usuarios` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `projetos`
-- -------------------------------------------
DROP TABLE IF EXISTS `projetos`;
CREATE TABLE IF NOT EXISTS `projetos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `financiamento` varchar(10) DEFAULT NULL,
  `tipoFinanciamento` varchar(5) DEFAULT NULL,
  `citarFinanciamento` varchar(50) DEFAULT NULL,
  `valorFinanciamento` float DEFAULT NULL,
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
  `editaAluno` varchar(45) DEFAULT NULL,
  `editaCoordenador` varchar(45) DEFAULT NULL,
  `dataSolicitacao` date DEFAULT NULL,
  `dataAnalise` date DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `participante` varchar(500) DEFAULT NULL,
  `tipoUsuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `relatorios`
-- -------------------------------------------
DROP TABLE IF EXISTS `relatorios`;
CREATE TABLE IF NOT EXISTS `relatorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versao` varchar(15) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `relatorios_projetos`
-- -------------------------------------------
DROP TABLE IF EXISTS `relatorios_projetos`;
CREATE TABLE IF NOT EXISTS `relatorios_projetos` (
  `id` int(11) NOT NULL,
  `id_projetos` int(11) DEFAULT NULL,
  `id_relatorios` int(11) DEFAULT NULL,
  `coordenador` varchar(50) DEFAULT NULL,
  `bolsista` varchar(50) DEFAULT NULL,
  `mes` varchar(50) DEFAULT NULL,
  `projeto` varchar(50) DEFAULT NULL,
  `atividades` text NOT NULL,
  `periodo1` varchar(50) DEFAULT NULL,
  `periodo2` varchar(50) DEFAULT NULL,
  `periodo3` varchar(50) DEFAULT NULL,
  `periodo4` varchar(50) DEFAULT NULL,
  `carga1` int(10) DEFAULT NULL,
  `carga2` int(10) DEFAULT NULL,
  `carga3` int(10) DEFAULT NULL,
  `carga4` int(10) DEFAULT NULL,
  `total` int(10) DEFAULT NULL,
  `avaliacao` varchar(10) DEFAULT NULL,
  `observacao` text,
  PRIMARY KEY (`id`),
  CONSTRAINT `relatorios_projetos_ibfk_1` FOREIGN KEY (`id`) REFERENCES `projetos` (`id`),
  CONSTRAINT `relatorios_projetos_ibfk_2` FOREIGN KEY (`id`) REFERENCES `relatorios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `status`
-- -------------------------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tipoprojeto`
-- -------------------------------------------
DROP TABLE IF EXISTS `tipoprojeto`;
CREATE TABLE IF NOT EXISTS `tipoprojeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tipousuario`
-- -------------------------------------------
DROP TABLE IF EXISTS `tipousuario`;
CREATE TABLE IF NOT EXISTS `tipousuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE DATA areaconhecimento
-- -------------------------------------------
INSERT INTO `areaconhecimento` (`id`,`nome`) VALUES
('1','Tecnologia');



-- -------------------------------------------
-- TABLE DATA auth_assignment
-- -------------------------------------------
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('admin','1','1523756062');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('admin','12','1527807125');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('admin','6','1523756044');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('coordenador','10','1527798669');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('coordenador','33','1529100175');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('discente','22','1528837345');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('discente','35','1535386692');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('discente','4','1529020175');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('discente','5','1523755901');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('servidor','15','1528835551');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('servidor','28','1531697509');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('servidor','3','1529784281');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('servidor','7','1523821181');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('servidor','8','1523874464');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('servidor','9','1523886166');



-- -------------------------------------------
-- TABLE DATA auth_item
-- -------------------------------------------
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('admin','1','','userGroup','','1523755729','1523755729');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('coordenador','1','','userGroup','','1523755729','1523755729');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('createPost','2','Create a post','','','1523755728','1523755728');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('deletePost','2','Delete a post','','','1523755729','1523755729');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('discente','1','','userGroup','','1523755729','1523755729');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('indexPost','2','Index a post','','','1523755729','1523755729');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('servidor','1','','userGroup','','1523755729','1523755729');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('updatePost','2','Update a post','','','1523755729','1523755729');
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('viewPost','2','View a post','','','1523755729','1523755729');



-- -------------------------------------------
-- TABLE DATA auth_item_child
-- -------------------------------------------
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','createPost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('coordenador','createPost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('discente','createPost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('servidor','createPost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','deletePost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('coordenador','deletePost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','indexPost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('coordenador','indexPost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','updatePost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('coordenador','updatePost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','viewPost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('coordenador','viewPost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('discente','viewPost');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('servidor','viewPost');



-- -------------------------------------------
-- TABLE DATA auth_rule
-- -------------------------------------------
INSERT INTO `auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('userGroup','O:22:\"app\\rbac\\UserGroupRule\":3:{s:4:\"name\";s:9:\"userGroup\";s:9:\"createdAt\";i:1523755729;s:9:\"updatedAt\";i:1523755729;}','1523755729','1523755729');



-- -------------------------------------------
-- TABLE DATA campus
-- -------------------------------------------
INSERT INTO `campus` (`id`,`nome`) VALUES
('1','IFNMG - Januária');



-- -------------------------------------------
-- TABLE DATA cidades
-- -------------------------------------------
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3','Brasiléia','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4','Bujari','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5','Capixaba','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6','Cruzeiro do Sul','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7','Epitaciolândia','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8','Feijó','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9','Jordão','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('10','Mancio Lima','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('11','Manoel Urbano','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('12','Marechal Thaumaturgo','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('13','Plácido de Castro','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('14','Porto Acre','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('15','Porto Walter','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('16','Rio Branco','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('17','Rodrigues Alves','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('18','Santa Rosa do Purus','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('19','Sena Madureira','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('20','Senador Guiomard','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('21','Tarauaca','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('22','Xapuri','1');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('23','Água Branca','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('24','Alazão','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('25','Alecrim','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('26','Anadia','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('27','Anel','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('28','Anum Novo','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('29','Anum Velho','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('30','Arapiraca','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('31','Atalaia','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('32','Baixa da Onça','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('33','Baixa do Capim','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('34','Bálsamo','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('35','Bananeiras','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('36','Barra de Santo Antônio','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('37','Barra de São Miguel','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('38','Barra do Bonifácio','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('39','Barra Grande','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('40','Batalha','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('41','Batingas','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('42','Belém','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('43','Belo Monte','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('44','Boa Sorte','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('45','Boa Vista','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('46','Boca da Mata','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('47','Bom Jardim','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('48','Bonifácio','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('49','Branquinha','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('50','Cacimbinhas','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('51','Cajarana','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('52','Cajueiro','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('53','Caldeirões de Cima','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('54','Camadanta','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('55','Campo Alegre','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('56','Campo Grande','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('57','Canaa','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('58','Canafistula','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('59','Canapi','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('60','Canastra','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('61','Cangandu','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('62','Capela','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('63','Carneiros','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('64','Carrasco','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('65','Chá Preta','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('66','Coite do Noia','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('67','Colônia Leopoldina','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('68','Coqueiro Seco','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('69','Coruripe','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('70','Coruripe da Cal','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('71','Craibas','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('72','Delmiro Gouveia','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('73','Dois Riachos','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('74','Entremontes','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('75','Estrela de Alagoas','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('76','Feira Grande','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('77','Feliz Deserto','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('78','Fernão Velho','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('79','Flexeiras','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('80','Floriano Peixoto','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('81','Gaspar','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('82','Girau do Ponciano','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('83','Ibateguara','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('84','Igaci','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('85','Igreja Nova','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('86','Inhapi','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('87','Jacaré dos Homens','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('88','Jacuipe','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('89','Japaratinga','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('90','Jaramataia','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('91','Jenipapo','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('92','Joaquim Gomes','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('93','Jundia','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('94','Junqueiro','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('95','Lagoa da Areia','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('96','Lagoa da Canoa','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('97','Lagoa da Pedra','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('98','Lagoa Dantas','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('99','Lagoa do Caldeirão','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('100','Lagoa do Canto','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('101','Lagoa do Exu','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('102','Lagoa do Rancho','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('103','Lajes do Caldeirão','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('104','Laranjal','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('105','Limoeiro de Anadia','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('106','Maceió','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('107','Major Isidoro','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('108','Mar Vermelho','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('109','Maragogi','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('110','Maravilha','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('111','Marechal Deodoro','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('112','Maribondo','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('113','Massaranduba','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('114','Mata Grande','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('115','Matriz de Camaragibe','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('116','Messias','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('117','Minador do Negrão','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('118','Monteirópolis','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('119','Moreira','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('120','Munguba','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('121','Murici','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('122','Novo Lino','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('123','Olho D\'Água Grande','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('124','Olho D\'Água das Flores','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('125','Olho D\'Água de Cima','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('126','Olho D\'Água do Casado','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('127','Olho D\'Água dos Dandanhas','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('128','Olivenca','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('129','Ouro Branco','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('130','Palestina','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('131','Palmeira de Fora','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('132','Palmeira dos Índios','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('133','Pão de Açúcar','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('134','Pariconha','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('135','Paripueira','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('136','Passo de Camaragibe','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('137','Pau D\'Arco','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('138','Pau Ferro','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('139','Paulo Jacinto','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('140','Penedo','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('141','Piacabucu','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('142','Pilar','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('143','Pindoba','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('144','Piranhas','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('145','Poção','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('146','Poço da Pedra','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('147','Poço das Trincheiras','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('148','Porto Calvo','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('149','Porto de Pedras','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('150','Porto Real do Colégio','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('151','Poxim','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('152','Quebrângulo','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('153','Riacho do Sertão','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('154','Riacho Fundo de Cima','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('155','Rio Largo','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('156','Rocha Cavalcante','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('157','Roteiro','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('158','Santa Efigênia','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('159','Santa Luzia do Norte','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('160','Santana do Ipanema','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('161','Santana do Mundau','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('162','Santo Antônio','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('163','São Brás','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('164','São José da Laje','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('165','São José da Tapera','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('166','São Luis do Quitunde','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('167','São Miguel dos Campos','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('168','São Miguel dos Milagres','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('169','São Sebastiao','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('170','Sapucaia','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('171','Satuba','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('172','Senador Rui Palmeira','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('173','Serra da Mandioca','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('174','Serra do São José','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('175','Taboleiro do Pinto','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('176','Taboquinha','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('177','Tanque D\'Arca','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('179','Tatuamunha','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('180','Teotônio Vilela','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('181','Traipu','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('182','União dos Palmares','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('183','Usina Camaçari','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('184','Viçosa','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('185','Vila Aparecida','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('186','Vila São Francisco','2');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('187','Alvaraes','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('188','Amatari','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('189','Amatura','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('190','Anama','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('191','Anori','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('192','Apui','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('193','Ariau','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('194','Atalaia do Norte','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('195','Augusto Montenegro','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('196','Autazes','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('197','Axinim','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('198','Badajós','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('199','Balbina','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('200','Barcelos','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('201','Barreirinha','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('202','Benjamin Constant','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('203','Beruri','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('204','Boa Vista do Ramos','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('205','Boca do Acre','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('206','Borba','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('207','Caapiranga','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('208','Cameta','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('209','Canuma','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('210','Canutama','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('211','Carauari','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('212','Careiro','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('213','Careiro da Varzea','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('214','Carvoeiro','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('215','Coari','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('216','Codajas','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('217','Cucui','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('218','Eirunepe','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('219','Envira','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('220','Floriano Peixoto','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('221','Fonte Boa','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('222','Freguesia do Andira','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('223','Guajara','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('224','Humaita','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('225','Iauarete','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('226','Icana','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('227','Ipixuna','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('228','Iranduba','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('229','Itacoatiara','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('230','Itamarati','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('231','Itapiranga','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('232','Japura','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('233','Jurua','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('234','Jutai','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('235','Labrea','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('236','Lago Preto','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('237','Manacapuru','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('238','Manaquiri','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('239','Manaus','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('240','Manicore','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('241','Maraa','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('242','Massauari','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('243','Maues','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('244','Mocambo','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('245','Moura','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('246','Murutinga','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('247','Nhamunda','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('248','Nova Olinda do Norte','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('249','Novo Airão','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('250','Novo Aripuana','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('251','Osório da Fonseca','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('252','Parintins','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('253','Pauini','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('254','Pedras','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('255','Presidente Figueiredo','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('256','Repartimento','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('257','Rio Preto da Eva','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('258','Santa Isabel do Rio Negro','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('259','Santa Rita','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('260','Santo Antônio do Ica','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('261','São Felipe','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('262','São Gabriel da Cachoeira','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('263','São Paulo de Olivenca','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('264','São Sebastiao do Uatuma','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('265','Silves','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('266','Tabatinga','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('267','Tapaua','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('268','Tefe','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('269','Tonantins','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('270','Uarini','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('271','Urucara','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('272','Urucurituba','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('273','Vila Pitinga','3');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('274','Abacate da Pedreira','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('275','Água Branca do Amapari','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('276','Amapá','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('277','Amapari','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('278','Ambe','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('279','Aporema','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('280','Ariri','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('281','Bailique','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('282','Boca do Jari','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('283','Calcoene','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('284','Cantanzal','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('285','Carmo','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('286','Clevelândia do Norte','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('287','Corre Água','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('288','Cunani','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('289','Curiau','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('290','Cutias','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('291','Fazendinha','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('292','Ferreira Gomes','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('293','Fortaleza','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('294','Gaivota','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('295','Gurupora','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('296','Igarapé do Lago','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('297','Ilha de Santana','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('298','Inaja','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('299','Itaubal','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('300','Laranjal do Jari','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('301','Livramento do Pacui','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('302','Lourenço','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('303','Macapá','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('304','Mazagão','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('305','Mazagão Velho','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('306','Oiapoque','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('307','Paredão','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('308','Porto Grande','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('309','Pracuuba','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('310','Santa Luzia do Pacui','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('311','Santa Maria','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('312','Santana','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('313','São Joaquim do Pacui','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('314','São Sebastião do Livramento','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('315','São Tomé','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('316','Serra do Navio','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('317','Sucuriju','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('318','Tartarugalzinho','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('319','Vila Velha','4');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('320','Abadia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('321','Abaira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('322','Abare','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('323','Abelhas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('324','Abóbora','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('325','Abrantes','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('326','Acajutiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('327','Acu da Torre','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('328','Acudina','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('329','Acupe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('330','Adustina','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('331','Afligidos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('332','Afrânio Peixoto','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('333','Água Doce','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('334','Água Fria','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('335','Águas do Paulista','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('336','Aiquara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('337','Alagoinhas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('338','Alcobaca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('339','Algodão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('340','Algodões','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('341','Almadina','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('342','Alto Bonito','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('343','Amado Bahia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('344','Amaniu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('345','Amaral Ferreira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('346','Amargosa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('347','Amélia Rodrigues','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('348','America Dourada','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('349','Americo Alves','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('350','Anage','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('351','Andarai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('352','Angical','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('353','Anguera','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('354','Antas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('355','Antônio Cardoso','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('356','Antônio Gonçalves','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('357','Apora','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('358','Apuarema','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('359','Aracas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('360','Aracatu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('361','Araci','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('362','Aramari','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('363','Arapiranga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('364','Arataca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('365','Aratuipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('366','Argoim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('367','Argolo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('368','Aribice','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('369','Aritagua','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('370','Aurelino Leal','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('371','Baianópolis','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('372','Baixa do Palmeira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('373','Baixa Grande','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('374','Baixão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('375','Baixinha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('376','Baluarte','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('377','Banco Central','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('378','Banco da Vitória','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('379','Bandeira do Almada','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('380','Bandeira do Colonia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('381','Banzae','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('382','Baraunas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('383','Barcelos do Sul','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('384','Barra','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('385','Barra da Estiva','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('386','Barra do Choca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('387','Barra do Mendes','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('388','Barra do Rocha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('389','Barracas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('390','Barreiras','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('391','Barro Alto','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('392','Barro Preto','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('393','Barro Vermelho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('394','Barrocas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('395','Bastião','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('396','Batinga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('397','Bela Flor','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('398','Belém da Cachoeira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('399','Belmonte','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('400','Belo Campo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('401','Bem-Bom','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('402','Bendego','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('403','Bento Simões','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('404','Biritinga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('405','Boa Esperança','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('406','Boa Nova','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('407','Boa União','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('408','Boa Vista do Lagamar','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('409','Boa Vista do Tupim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('410','Boacu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('411','Boca do Corrego','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('412','Bom Jesus da Lapa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('413','Bom Jesus da Serra','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('414','Bom Sossego','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('415','Bonfim da Feira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('416','Boninal','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('417','Bonito','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('418','Boquira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('419','Bossoroca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('420','Botupora','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('421','Botuquara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('422','Brejinho das Ametistas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('423','Brejo da Serra','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('424','Brejo Luiza do Brito','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('425','Brejo Novo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('426','Brejões','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('427','Brejolândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('428','Brotas de Macaubas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('429','Brumado','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('430','Bucuituba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('431','Buerarema','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('432','Buracica','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('433','Buranhem','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('434','Buritirama','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('435','Caatiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('436','Cabaceiras do Paraguaçu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('437','Cabralia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('438','Cacha Pregos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('439','Cachoeira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('440','Cachoeira do Mato','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('441','Cacule','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('442','Caem','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('443','Caetanos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('444','Caete-Açu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('445','Caetite','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('446','Cafarnaum','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('447','Caiçara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('448','Caimbe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('449','Cairu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('450','Caiubi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('451','Cajui','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('452','Caldas do Jorro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('453','Caldeirão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('454','Caldeirão Grande','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('455','Caldeiras','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('456','Camacan','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('457','Camaçari','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('458','Camamu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('459','Camassandi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('460','Camirim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('461','Campinhos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('462','Campo Alegre de Lourdes','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('463','Campo Formoso','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('464','Camurugi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('465','Canabravinha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('466','Canápolis','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('467','Canarana','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('468','Canatiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('469','Canavieiras','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('470','Canche','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('471','Candeal','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('472','Candeias','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('473','Candiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('474','Cândido Sales','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('475','Cansanção','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('476','Canudos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('477','Capão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('478','Capela do Alto Alegre','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('479','Capim Grosso','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('480','Caraguatai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('481','Caraibas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('482','Caraibuna','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('483','Caraipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('484','Caraiva','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('485','Caravelas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('486','Cardeal da Silva','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('487','Carinhanha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('488','Caripare','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('489','Carnaíba do Sertão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('490','Carrapichel','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('491','Casa Nova','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('492','Castelo Novo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('493','Castro Alves','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('494','Catinga do Moura','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('495','Catingal','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('496','Catolândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('497','Catoles','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('498','Catolezinho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('499','Catu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('500','Caturama','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('501','Cavunge','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('502','Central','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('503','Centro Industrial de Aratu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('504','Ceraima','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('505','Chorrocho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('506','Cicero Dantas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('507','Cinco Rios','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('508','Cipo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('509','Coaraci','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('510','Côcos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('511','Comércio','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('512','Conceição da Feira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('513','Conceição do Almeida','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('514','Conceição do Coite','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('515','Conceição do Jacuipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('516','Conde','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('517','Condeuba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('518','Contendas do Sincora','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('519','Copixaba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('520','Coqueiros','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('521','Coquinhos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('522','Coração de Maria','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('523','Cordeiros','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('524','Coribe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('525','Coronel João Sá','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('526','Correntina','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('527','Corta Mão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('528','Cotegipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('529','Coutos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('530','Cravolândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('531','Crisópolis','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('532','Cristalândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('533','Cristópolis','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('534','Crussai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('535','Cruz das Almas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('536','Cumuruxatiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('537','Cunhangi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('538','Curaca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('539','Dario Meira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('540','Delfino','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('541','Dias Coelho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('542','Dias D\'Ávila','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('543','Diógenes Sampaio','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('544','Dom Basilio','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('545','Dom Macedo Costa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('546','Duas Barras do Morro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('547','Elisio Medrado','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('548','Encruzilhada','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('549','Engenheiro Franca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('550','Engenheiro Pontes','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('551','Entre Rios','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('552','Erico Cardoso','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('553','Esplanada','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('554','Euclides da Cunha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('555','Eunápolis','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('556','Fátima','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('557','Feira da Mata','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('558','Feira de Santana','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('559','Ferradas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('560','Filadélfia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('561','Filanésia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('562','Firmino Alves','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('563','Floresta Azul','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('564','Formosa do Rio Preto','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('565','Franca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('566','Gabiarra','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('567','Galeão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('568','Gamboa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('569','Gameleira da Lapa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('570','Gameleira do Assurua','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('571','Gandu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('572','Gavião','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('573','Gentio do Ouro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('574','Geolândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('575','Gloria','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('576','Gongogi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('577','Governador Joao Durval Carneir','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('578','Governador Mangabeira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('579','Guai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('580','Guajeru','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('581','Guanambi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('582','Guapira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('583','Guaratinga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('584','Guerem','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('585','Guiné','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('586','Guirapa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('587','Gurupa Mirim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('588','Heliópolis','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('589','Helvecia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('590','Hidrolândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('591','Humildes','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('592','Iacu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('593','Ibatui','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('594','Ibiacu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('595','Ibiajara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('596','Ibiapora','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('597','Ibiassuce','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('598','Ibicarai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('599','Ibicoara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('600','Ibicui','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('601','Ibipeba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('602','Ibipetum','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('603','Ibipitanga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('604','Ibiquera','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('605','Ibiraba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('606','Ibiraja','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('607','Ibiranhem','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('608','Ibirapitanga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('609','Ibirapua','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('610','Ibirataia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('611','Ibitiara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('612','Ibitiguira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('613','Ibitira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('614','Ibitita','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('615','Ibitunane','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('616','Ibitupa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('617','Ibo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('618','Ibotirama','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('619','Ichu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('620','Ico','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('621','Igapora','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('622','Igara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('623','Igarite','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('624','Igatu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('625','Igrapiuna','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('626','Igua','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('627','Iguai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('628','Iguaibi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('629','Iguatemi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('630','Iguira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('631','Iguitu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('632','Ilhéus','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('633','Indai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('634','Inema','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('635','Inhambupe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('636','Inhata','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('637','Inhaumas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('638','Inhobim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('639','Inubia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('640','Ipecaeta','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('641','Ipiau','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('642','Ipira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('643','Ipiuna','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('644','Ipucaba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('645','Ipupiara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('646','Irajuba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('647','Iramaia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('648','Iraporanga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('649','Iraquara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('650','Irara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('651','Irece','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('652','Irundiara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('653','Itabela','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('654','Itaberaba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('655','Itabuna','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('656','Itacare','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('657','Itacava','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('658','Itachama','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('659','Itaete','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('660','Itagi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('661','Itagiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('662','Itagimirim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('663','Itaguaçu da Bahia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('664','Itaia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('665','Itaibo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('666','Itaipu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('667','Itaitu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('668','Itajai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('669','Itaju do Colônia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('670','Itajubaquara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('671','Itajuipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('672','Itajuru','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('673','Itamaraju','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('674','Itamari','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('675','Itambe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('676','Itamira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('677','Itamotinga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('678','Itanage','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('679','Itanagra','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('680','Itanhem','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('681','Itanhi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('682','Itaparica','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('683','Itape','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('684','Itapebi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('685','Itapeipu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('686','Itapetinga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('687','Itapicuru','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('688','Itapirema','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('689','Itapitanga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('690','Itapora','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('691','Itapura','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('692','Itaquara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('693','Itaquarai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('694','Itarantim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('695','Itati','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('696','Itatim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('697','Itatingui','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('698','Itirucu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('699','Itiuba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('700','Itororo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('701','Ituacu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('702','Itubera','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('703','Itupeva','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('704','Iuiu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('705','Jaborandi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('706','Jacaraci','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('707','Jacobina','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('708','Jacu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('709','Jacuipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('710','Jacuruna','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('711','Jaguaquara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('712','Jaguara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('713','Jaguarari','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('714','Jaguaripe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('715','Jaiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('716','Jandaira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('717','Japomirim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('718','Japu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('719','Jequié','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('720','Jequitiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('721','Jeremoabo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('722','Jiquirica','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('723','Jiribatuba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('724','Jitauna','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('725','João Amaro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('726','João Correia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('727','João Dourado','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('728','José Gonçalves','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('729','Juacema','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('730','Juazeiro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('731','Jucurucu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('732','Juerana','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('733','Junco','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('734','Jupagua','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('735','Juraci','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('736','Juremal','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('737','Jussara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('738','Jussari','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('739','Jussiape','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('740','Km Sete','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('741','Lafaiete Coutinho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('742','Lagoa Clara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('743','Lagoa de Melquiades','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('744','Lagoa do Boi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('745','Lagoa Grande','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('746','Lagoa José Luis','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('747','Lagoa Preta','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('748','Lagoa Real','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('749','Laje','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('750','Laje do Banco','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('751','Lajedão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('752','Lajedinho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('753','Lajedo Alto','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('754','Lajedo do Tabocal','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('755','Lamarão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('756','Lamarão do Passe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('757','Lapão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('758','Largo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('759','Lauro de Freitas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('760','Lençóis','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('761','Licinio de Almeida','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('762','Limoeiro do Bom Viver','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('763','Livramento do Brumado','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('764','Lucaia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('765','Luis Viana','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('766','Lustosa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('767','Macajuba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('769','Macaubas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('770','Macurure','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('771','Madre de Deus','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('772','Maetinga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('773','Maiquinique','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('774','Mairi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('775','Malhada','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('776','Malhada de Pedras','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('777','Mandiroba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('778','Mangue Seco','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('779','Maniacu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('780','Manoel Vitorino','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('781','Mansidão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('782','Mantiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('783','Mar Grande','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('784','Maracas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('785','Maragogipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('786','Maragogipinho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('787','Marau','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('788','Marcionilio Souza','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('789','Marcolino Moura','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('790','Maria Quitéria','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('791','Maricoabo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('792','Mariquita','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('793','Mascote','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('794','Massacara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('795','Massaroca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('796','Mata da Aliança','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('797','Mata de São João','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('798','Mataripe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('799','Matina','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('800','Matinha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('801','Medeiros Neto','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('802','Miguel Calmon','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('803','Milagres','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('804','Minas do Espírito Santo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('805','Minas do Mimoso','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('806','Mirandela','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('807','Miranga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('808','Mirangaba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('809','Mirante','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('810','Mocambo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('811','Mogiquicaba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('812','Monte Cruzeiro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('813','Monte Gordo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('814','Monte Recôncavo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('815','Monte Santo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('816','Morpara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('817','Morrinhos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('818','Morro das Flores','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('819','Morro do Chapéu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('820','Mortugaba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('821','Mucuge','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('822','Mucuri','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('823','Mulungu do Morro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('824','Mundo Novo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('825','Muniz Ferreira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('826','Muquem do São Francisco','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('827','Muritiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('828','Mutas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('829','Mutuipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('830','Nage','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('831','Nazaré','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('832','Nilo Peçanha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('833','Nordestina','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('834','Nova Brasília','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('835','Nova Canaã','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('836','Nova Fátima','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('837','Nova Ibia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('838','Nova Itaipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('839','Nova Itarana','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('840','Nova Lidice','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('841','Nova Redenção','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('842','Nova Soure','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('843','Nova Viçosa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('844','Novo Acre','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('845','Novo Horizonte','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('846','Novo Triunfo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('847','Núcleo Residencial Pilar','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('848','Nuguaçu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('849','Olhos D\'Água do Seco','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('850','Olhos D\'Água do Serafim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('851','Olindina','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('852','Oliveira dos Brejinhos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('853','Olivença','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('854','Onha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('855','Oriente Novo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('856','Ouricana','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('857','Ouricangas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('858','Ouricuri do Ouro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('859','Ourolândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('860','Outeiro Redondo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('861','Paiol','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('862','Pajeu do Vento','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('863','Palame','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('864','Palmas de Monte Alto','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('865','Palmeiras','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('866','Paramirim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('867','Parateca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('868','Paratinga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('869','Paripiranga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('870','Pataiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('871','Patamute','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('872','Pau a Pique','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('873','Pau Brasil','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('874','Paulo Afonso','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('875','Pé de Serra','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('876','Pedrão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('877','Pedro Alexandre','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('878','Peixe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('879','Petim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('880','Piabanha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('881','Piata','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('882','Pilão Arcado','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('883','Pimenteira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('884','Pindai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('885','Pindobacu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('886','Pinhões','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('887','Pintadas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('888','Pirai do Norte','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('889','Pirajuia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('890','Piri','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('891','Piripa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('892','Piritiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('893','Pituba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('894','Planaltino','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('895','Planalto','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('896','Poço Central','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('897','Poço de Fora','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('898','Poções','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('899','Poços','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('900','Pojuca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('901','Pólo Petroquímico de Camaçari','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('902','Ponta da Areia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('903','Ponto Novo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('904','Porto Novo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('905','Porto Sauipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('906','Porto Seguro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('907','Posto da Mata','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('908','Potiragua','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('909','Poxim do Sul','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('910','Prado','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('911','Presidente Dutra','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('912','Presidente Jânio Quadros','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('913','Presidente Tancredo Neves','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('914','Prevenido','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('915','Queimadas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('916','Quijingue','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('917','Quixaba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('918','Quixabeira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('919','Rafael Jambeiro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('920','Recife','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('921','Remanso','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('922','Remédios','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('923','Retirolândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('924','Riachão das Neves','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('925','Riachão do Jacuipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('926','Riachão do Utinga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('927','Riacho da Guia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('928','Riacho de Santana','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('929','Riacho Seco','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('930','Ribeira do Amparo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('931','Ribeira do Pombal','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('932','Ribeirão do Largo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('933','Ribeirão do Salto','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('934','Rio da Dona','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('935','Rio de Contas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('936','Rio do Antônio','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('937','Rio do Braço','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('938','Rio do Meio','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('939','Rio do Pires','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('940','Rio Fundo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('941','Rio Real','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('942','Rodelas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('943','Rumo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('944','Ruy Barbosa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('945','Saldanha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('946','Salgadalia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('947','Salinas da Margarida','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('948','Salobrinho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('949','Salobro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('950','Salvador','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('951','Sambaiba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('952','Santa Barbara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('953','Santa Brigida','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('954','Santa Cruz Cabralia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('955','Santa Cruz da Vitoria','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('956','Santa Ines','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('957','Santa Luzia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('958','Santa Maria da Vitoria','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('959','Santa Rita de Cassia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('960','Santa Teresinha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('961','Santaluz','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('962','Santana','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('963','Santanópolis','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('964','Santiago do Iguape','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('965','Santo Amaro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('966','Santo Antônio de Barcelona','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('967','Santo Antônio de Jesus','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('968','Santo Estevão','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('969','Santo Inácio','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('970','São Desidério','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('971','São Domingos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('972','São Felipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('973','São Félix','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('974','São Félix do Coribe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('975','São Francisco do Conde','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('976','São Gabriel','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('977','São Gonçalo dos Campos','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('978','São João da Fortaleza','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('979','São João da Vitória','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('980','São José da Vitória','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('981','São José do Colônia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('982','São José do Jacuipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('983','São José do Paiaia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('984','São José do Prado','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('985','São José do Rio Grande','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('986','São Miguel das Matas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('987','São Roque do Paraguaçu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('988','São Sebastião do Passe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('989','São Timóteo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('990','Sapeaçu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('991','Satiro Dias','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('992','Saubara','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('993','Saudável','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('994','Saúde','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('995','Seabra','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('996','Sebastião Laranjeiras','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('997','Senhor do Bonfim','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('998','Sento Sé','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('999','Sergi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1000','Serra da Canabrava','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1001','Serra do Ramalho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1002','Serra Dourada','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1003','Serra Preta','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1004','Serrinha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1005','Serrolândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1006','Simões Filho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1007','Sítio da Barauna','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1008','Sítio do Mato','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1009','Sítio do Meio','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1010','Sítio do Quinto','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1011','Sítio Grande','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1012','Sítio Novo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1013','Soares','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1014','Sobradinho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1015','Sobrado','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1016','Souto Soares','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1017','Subauma','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1018','Sussuarana','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1019','Tabocas do Brejo Velho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1020','Taboleiro do Castro','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1021','Taboquinhas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1022','Tagua','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1023','Tamburil','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1024','Tanhacu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1025','Tanque Novo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1026','Tanquinho','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1027','Tanquinho Novo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1028','Taperoa','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1029','Tapiraipe','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1030','Tapirama','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1031','Tapiramuta','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1032','Tapiranga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1033','Tapuia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1034','Taquarendi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1035','Taquarinha','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1036','Tartaruga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1037','Tauape','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1038','Teixeira de Freitas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1039','Teodoro Sampaio','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1040','Teofilândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1041','Teolândia','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1042','Terra Nova','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1043','Tijuacu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1044','Tiquarucu','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1045','Tremedal','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1046','Triunfo do Sincora','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1047','Tucano','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1048','Uaua','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1049','Ubaira','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1050','Ubaitaba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1051','Ubata','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1052','Ubiraçaba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1053','Ubiraita','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1054','Uibai','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1055','Umburanas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1056','Una','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1057','Urandi','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1058','Urucuca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1059','Utinga','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1060','Vale Verde','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1061','Valenca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1062','Valente','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1063','Várzea da Roca','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1064','Várzea do Caldas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1065','Várzea do Cerco','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1066','Várzea do Poço','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1067','Várzea Nova','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1068','Várzeas','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1069','Varzedo','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1070','Velha Boipeba','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1071','Ventura','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1072','Vera Cruz','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1073','Vereda','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1074','Vitória da Conquista','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1075','Volta Grande','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1076','Wagner','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1077','Wanderley','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1078','Wenceslau Guimarães','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1079','Xique-Xique','5');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1080','Abaiara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1081','Abilio Martins','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1082','Acarape','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1083','Acarau','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1084','Acopiara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1085','Adrianópolis','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1086','Água Verde','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1087','Aguai','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1088','Aiua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1089','Aiuaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1090','Alagoinha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1091','Alcântaras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1092','Algodões','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1093','Almofala','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1094','Altaneira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1095','Alto Santo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1096','Amanaiara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1097','Amanari','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1098','Amaniutuba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1099','Amarelas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1100','Amaro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1101','América','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1102','Amontada','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1103','Anaua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1104','Aningas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1105','Anjinhos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1106','Antonina do Norte','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1107','Antonio Bezerra','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1108','Antonio Diogo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1109','Antonio Marques','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1110','Aprazivel','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1111','Apuiares','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1112','Aquinópolis','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1113','Aquiraz','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1114','Aracas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1115','Aracati','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1116','Aracatiacu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1117','Aracatiara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1118','Aracoiaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1119','Arajara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1120','Aranau','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1121','Arapa','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1122','Arapari','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1123','Araporanga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1124','Araquem','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1125','Ararenda','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1126','Araripe','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1127','Ararius','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1128','Aratama','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1129','Araticum','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1130','Aratuba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1131','Areial','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1132','Ariscos dos Marianos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1133','Arneiroz','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1134','Aroeiras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1135','Arrojado','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1136','Aruaru','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1137','Assare','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1138','Assunção','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1139','Aurora','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1140','Baixa Grande','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1141','Baixio','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1142','Baixio da Donana','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1143','Banabuiu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1144','Bandeira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1145','Barão de Aquiraz','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1146','Barbalha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1147','Barra','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1148','Barra do Sotero','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1149','Barra Nova','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1150','Barreira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1151','Barreira dos Vianas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1152','Barreiras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1153','Barreiros','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1154','Barrento','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1155','Barro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1156','Barro Alto','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1157','Barroquinha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1158','Baturite','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1159','Bau','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1160','Beberibe','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1161','Bela Cruz','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1162','Bela Vista','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1163','Betania','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1164','Bitupita','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1165','Bixopa','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1166','Boa Água','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1167','Boa Esperança','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1168','Boa Viagem','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1169','Boa Vista','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1170','Boa Vista do Caxitore','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1171','Bonfim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1172','Bonhu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1173','Bonito','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1174','Borges','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1175','Brejinho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1176','Brejo Grande','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1177','Brejo Santo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1178','Brotas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1179','Buritizal','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1180','Buritizinho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1181','Cabreiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1182','Cachoeira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1183','Cachoeira Grande','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1184','Caiçara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1185','Caiçarinha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1186','Caio Prado','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1187','Caioca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1188','Caipu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1189','Calabaca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1190','Caldeirão','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1191','Camara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1192','Camboas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1193','Camilos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1194','Camocim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1195','Campanario','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1196','Campos Sales','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1197','Canaan','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1198','Canafistula','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1199','Cangati','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1200','Caninde','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1201','Canindezinho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1202','Capistrano','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1203','Caponga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1204','Caponga da Bernarda','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1205','Caracara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1206','Caridade','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1207','Carire','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1208','Caririacu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1209','Carius','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1210','Cariutaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1211','Carmelópolis','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1212','Carnaubal','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1213','Carnaúbas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1214','Carnaubinha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1215','Carquejo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1216','Carrapateiras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1217','Caruatai','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1218','Carvalho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1219','Carvoeiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1220','Cascavel','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1221','Castanhão','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1222','Catarina','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1223','Catole','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1224','Catuana','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1225','Catunda','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1226','Caucaia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1227','Caxitore','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1228','Cedro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1229','Cemoaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1230','Chaval','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1231','Choro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1232','Chorozinho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1233','Cipó dos Anjos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1234','Cococi','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1235','Codia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1236','Coite','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1237','Colina','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1238','Conceição','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1239','Coreau','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1240','Córrego dos Fernandes','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1241','Crateus','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1242','Crato','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1243','Crioulos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1244','Croata','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1245','Cruxati','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1246','Cruz','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1247','Cruz de Pedra','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1248','Cruzeirinho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1249','Cuncas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1250','Curatis','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1251','Curupira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1252','Custódio','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1253','Daniel de Queirós','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1254','Delmiro Gouveia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1255','Deputado Irapuan Pinheiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1256','Deserto','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1257','Dom Leme','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1258','Dom Maurício','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1259','Dom Quintino','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1260','Domingos da Costa','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1261','Donato','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1262','Dourados','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1263','Ebron','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1264','Ema','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1265','Ematuba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1266','Encantado','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1267','Engenheiro João Tomé','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1268','Engenheiro José Lopes','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1269','Engenho Velho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1270','Erere','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1271','Esperança','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1272','Espinho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1273','Eusébio','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1274','Farias Brito','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1275','Fátima','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1276','Feiticeiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1277','Feitosa','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1278','Felizardo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1279','Flamengo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1280','Flores','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1281','Forquilha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1282','Fortaleza','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1283','Fortim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1284','Frecheirinha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1285','Gado','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1286','Gado dos Rodrigues','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1287','Gameleira de São Sebastião','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1288','Garças','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1289','Gazea','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1290','General Sampaio','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1291','General Tiburcio','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1292','Genipapeiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1293','Gererau','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1294','Giqui','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1295','Girau','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1296','Graça','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1297','Granja','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1298','Granjeiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1299','Groairas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1300','Guaiuba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1301','Guanaces','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1302','Guaraciaba do Norte','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1303','Guaramiranga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1304','Guararu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1305','Guassi','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1306','Guassosse','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1307','Guia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1308','Guriu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1309','Hidrolândia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1310','Holanda','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1311','Horizonte','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1312','Iapi','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1313','Iara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1314','Ibaretama','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1315','Ibiapaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1316','Ibiapina','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1317','Ibicatu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1318','Ibicua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1319','Ibicuitaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1320','Ibicuitinga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1321','Iborepi','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1322','Ibuacu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1323','Ibuguacu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1324','Icapui','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1325','Icarai','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1326','Ico','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1327','Icozinho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1328','Ideal','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1329','Igaroi','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1330','Iguatu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1331','Independência','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1332','Ingazeiras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1333','Inhamuns','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1334','Inhucu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1335','Inhuporanga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1336','Ipaporanga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1337','Ipaumirim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1338','Ipu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1339','Ipueiras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1340','Ipueiras dos Gomes','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1341','Iracema','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1342','Iraja','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1343','Irapua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1344','Iratinga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1345','Iraucuba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1346','Isidoro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1347','Itacima','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1348','Itagua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1349','Itaicaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1350','Itaipaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1351','Itaitinga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1352','Itans','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1353','Itapage','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1354','Itapebussu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1355','Itapeim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1356','Itapipoca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1357','Itapiuna','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1358','Itapo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1359','Itarema','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1360','Itatira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1361','Jaburuna','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1362','Jacampari','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1363','Jacarecoara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1364','Jacauna','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1365','Jaguarao','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1366','Jaguaretama','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1367','Jaguaribara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1368','Jaguaribe','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1369','Jaguaruana','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1370','Jaibaras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1371','Jamacaru','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1372','Jandrangoeira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1373','Jardim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1374','Jardimirim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1375','Jati','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1376','Jijoca de Jericoacoara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1377','João Cordeiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1378','Jordão','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1379','José de Alencar','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1380','Jua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1381','Juatama','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1382','Juazeiro de Baixo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1383','Juazeiro do Norte','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1384','Jubaia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1385','Jucas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1386','Jurema','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1387','Justiniano Serpa','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1388','Lacerda','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1389','Ladeira Grande','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1390','Lagoa de São José','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1391','Lagoa do Juvenal','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1392','Lagoa do Mato','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1393','Lagoa dos Crioulos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1394','Lagoa Grande','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1395','Lagoinha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1396','Lambedouro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1397','Lameiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1398','Lavras da Mangabeira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1399','Lima Campos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1400','Limoeiro do Norte','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1401','Lisieux','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1402','Livramento','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1403','Logradouro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1404','Macambira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1405','Macaoca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1406','Macarau','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1407','Madalena','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1408','Major Simplicio','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1409','Majorlândia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1410','Malhada Grande','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1411','Mangabeira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1412','Manibu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1413','Manituba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1414','Mapua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1415','Maracanau','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1416','Maragua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1417','Maranguape','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1418','Mararupa','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1419','Marco','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1420','Marinheiros','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1421','Marrecas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1422','Marrocos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1423','Marruas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1424','Martinopole','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1425','Massape','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1426','Mata Fresca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1427','Matias','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1428','Matriz','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1429','Mauriti','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1430','Mel','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1431','Meruoca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1432','Messejana','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1433','Miguel Xavier','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1434','Milagres','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1435','Milha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1436','Milton Belo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1437','Mineirolândia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1438','Miragem','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1439','Miraima','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1440','Mirambe','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1441','Missão Nova','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1442','Missão Velha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1443','Missi','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1444','Moitas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1445','Mombaca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1446','Mondubim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1447','Monguba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1448','Monsenhor Tabosa','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1449','Monte Alegre','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1450','Monte Castelo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1451','Monte Grave','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1452','Monte Sion','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1453','Montenebo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1454','Morada Nova','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1455','Moraujo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1456','Morrinhos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1457','Morrinhos Novos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1458','Morro Branco','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1459','Mucambo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1460','Mulungu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1461','Mumbaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1462','Mundau','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1463','Muribeca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1464','Muriti','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1465','Mutambeiras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1466','Naraniu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1467','Nascente','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1468','Nenenlândia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1469','Nossa Senhora do Livramento','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1470','Nova Betânia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1471','Nova Fátima','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1472','Nova Floresta','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1473','Nova Olinda','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1474','Nova Russas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1475','Nova Vida','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1476','Novo Assis','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1477','Novo Oriente','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1478','Ocara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1479','Oiticica','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1480','Olho-D\'Água','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1481','Olho-D\'Água da Bica','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1482','Oliveiras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1483','Oros','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1484','Pacajus','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1485','Pacatuba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1486','Pacoti','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1487','Pacuja','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1488','Padre Cicero','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1489','Padre Linhares','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1490','Padre Vieira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1491','Pajeu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1492','Pajucara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1493','Palestina','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1494','Palestina do Norte','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1495','Palhano','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1496','Palmacia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1497','Palmatoria','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1498','Panacui','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1499','Paracua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1500','Paracuru','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1501','Paraipaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1502','Parajuru','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1503','Parambu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1504','Paramoti','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1505','Parangaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1506','Parapui','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1507','Parazinho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1508','Paripueira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1509','Passagem','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1510','Passagem Funda','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1511','Pasta','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1512','Patacas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1513','Patriarca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1514','Pavuna','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1515','Pecem','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1516','Pedra Branca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1517','Pedras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1518','Pedrinhas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1519','Peixe','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1520','Peixe Gordo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1521','Penaforte','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1522','Pentecoste','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1523','Pereiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1524','Pernambuquinho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1525','Pessoa Anta','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1526','Pindoguaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1527','Pindoretama','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1528','Pio X','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1529','Piquet Carneiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1530','Pirabibu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1531','Pirangi','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1532','Pires Ferreira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1533','Pitombeira','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1534','Pitombeiras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1535','Plácido Martins','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1536','Poço','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1537','Poço Comprido','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1538','Poço Grande','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1539','Podimirim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1540','Ponta da Serra','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1541','Poranga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1542','Porfirio Sampaio','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1543','Porteiras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1544','Potengi','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1545','Poti','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1546','Potiretama','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1547','Prata','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1548','Prudente de Morais','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1549','Quatiguaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1550','Queimadas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1551','Quimami','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1552','Quincoe','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1553','Quincunca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1554','Quitaius','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1555','Quiterianópolis','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1556','Quixadá','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1557','Quixariu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1558','Quixelo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1559','Quixeramobim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1560','Quixere','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1561','Quixoa','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1562','Raimundo Martins','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1563','Redenção','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1564','Reriutaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1565','Riachão do Banabuiu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1566','Riacho Grande','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1567','Riacho Verde','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1568','Riacho Vermelho','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1569','Rinare','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1570','Roldão','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1571','Russas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1572','Sabiaguaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1573','Saboeiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1574','Sacramento','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1575','Salão','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1576','Salitre','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1577','Sambaiba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1578','Santa Ana','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1579','Santa Fé','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1580','Santa Felicia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1581','Santa Luzia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1582','Santa Quitéria','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1583','Santa Tereza','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1584','Santana','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1585','Santana do Acarau','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1586','Santana do Cariri','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1587','Santarem','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1588','Santo Antonio','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1589','Santo Antonio da Pindoba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1590','Santo Antonio dos Fernandes','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1591','São Bartolomeu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1592','São Benedito','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1593','São Domingos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1594','São Felipe','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1595','São Francisco','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1596','São Gerardo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1597','São Gonçalo do Amarante','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1598','São Gonçalo do Umari','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1599','São João de Deus','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1600','São João do Jaguaribe','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1601','São João dos Queiroz','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1602','São Joaquim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1603','São Joaquim do Salgado','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1604','São José','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1605','São José das Lontras','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1606','São José de Solonopole','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1607','São José do Torto','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1608','São Luís do Curu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1609','São Miguel','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1610','São Paulo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1611','São Pedro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1612','São Romão','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1613','São Sebastião','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1614','São Vicente','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1615','Sapo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1616','Sapupara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1617','Sebastião de Abreu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1618','Senador Carlos Jereissati','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1619','Senador Pompeu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1620','Senador Sá','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1621','Sereno de Cima','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1622','Serra do Felix','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1623','Serragem','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1624','Serrota','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1625','Serrote','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1626','Sitia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1627','Sítios Novos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1628','Siupe','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1629','Sobral','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1630','Soledade','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1631','Solonopole','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1632','Suassurana','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1633','Sucatinga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1634','Sucesso','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1635','Sussuanha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1636','Tabainha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1637','Taboleiro','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1638','Tabuleiro do Norte','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1639','Taiba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1640','Tamboril','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1641','Tanques','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1642','Tapera','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1643','Taperuaba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1644','Tapuiara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1645','Targinos','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1646','Tarrafas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1647','Taua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1648','Tejucuoca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1649','Tiangua','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1650','Timonha','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1651','Tipi','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1652','Tomé','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1653','Trairi','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1654','Trapia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1655','Trici','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1656','Troia','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1657','Trussu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1658','Tucunduba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1659','Tucuns','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1660','Tuina','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1661','Tururu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1662','Ubajara','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1663','Ubauna','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1664','Ubiracu','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1665','Uiraponga','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1666','Umari','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1667','Umarituba','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1668','Umburanas','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1669','Umirim','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1670','Uruburetama','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1671','Uruoca','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1672','Uruque','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1673','Varjota','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1674','Várzea','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1675','Várzea Alegre','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1676','Várzea da Volta','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1677','Várzea do Gilo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1678','Vazantes','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1679','Ventura','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1680','Vertentes do Lagedo','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1681','Viçosa do Ceará','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1682','Vila Soares','6');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1683','Brasília','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1684','Brazlândia','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1685','Ceilândia','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1686','Cruzeiro','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1687','Gama','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1688','Guará','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1689','Núcleo Bandeirante','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1690','Paranoa','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1691','Planaltina','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1692','Recanto das Emas','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1693','Samambaia','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1694','Santa Maria','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1695','Sobradinho','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1696','Taguatinga','7');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1697','Acioli','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1698','Afonso Claudio','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1699','Agha','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1700','Água Doce do Norte','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1701','Águia Branca','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1702','Airituba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1703','Alegre','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1704','Alfredo Chaves','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1705','Alto Calcado','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1706','Alto Caldeirão','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1707','Alto Mutum Preto','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1708','Alto Rio Novo','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1709','Alto Santa Maria','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1710','Anchieta','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1711','Angelo Frechiani','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1712','Anutiba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1713','Apiaca','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1714','Aracatiba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1715','Arace','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1716','Aracruz','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1717','Aracui','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1718','Araguaia','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1719','Ararai','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1720','Argolas','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1721','Atilio Vivacqua','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1722','Baia Nova','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1723','Baixo Guandu','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1724','Barra de Novo Brasil','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1725','Barra de São Francisco','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1726','Barra do Itapemirim','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1727','Barra Nova','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1728','Barra Seca','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1729','Baunilha','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1730','Bebedouro','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1731','Boa Esperanca','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1732','Boapaba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1733','Bom Jesus do Norte','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1734','Braco do Rio','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1735','Brejetuba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1736','Burarama','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1737','Cachoeirinha de Itauna','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1738','Cachoeiro de Itapemirim','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1739','Cafe','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1740','Calogi','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1741','Camara','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1742','Carapina','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1743','Cariacica','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1744','Castelo','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1745','Celina','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1746','Colatina','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1747','Conceicao da Barra','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1748','Conceicao do Castelo','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1749','Conceicao do Muqui','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1750','Conduru','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1751','Coqueiral','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1752','Corrego D\'Agua','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1753','Cotaxe','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1754','Cristal do Norte','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1755','Crubixa','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1756','Desengano','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1757','Divino de Sao Lourenco','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1758','Djalma Coutinho','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1759','Domingos Martins','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1760','Dona America','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1761','Dores do Rio Preto','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1762','Duas Barras','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1763','Ecoporanga','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1764','Estrela do Norte','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1765','Fartura','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1766','Fazenda Guandu','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1767','Fundao','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1768','Garrafao','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1769','Gironda','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1770','Goiabeiras','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1771','Governador Lacerda de Aguiar','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1772','Governador Lindenberg','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1773','Graca Aranha','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1774','Guacui','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1775','Guarana','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1776','Guarapari','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1777','Guararema','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1778','Ibatiba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1779','Ibes','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1780','Ibicaba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1781','Ibiracu','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1782','Ibitirama','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1783','Ibitirui','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1784','Ibituba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1785','Iconha','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1786','Imburana','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1787','Iriritiba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1788','Irundi','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1789','Irupi','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1790','Isabel','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1791','Itabaiana','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1792','Itacu','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1793','Itaguacu','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1794','Itaici','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1795','Itaimbe','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1796','Itaipava','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1797','Itamira','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1798','Itaoca','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1799','Itapecoa','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1800','Itapemirim','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1801','Itaperuna','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1802','Itapina','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1803','Itaquari','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1804','Itarana','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1805','Itaunas','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1806','Itauninhas','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1807','Iuna','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1808','Jabaquara','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1809','Jacaraipe','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1810','Jacigua','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1811','Jacupemba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1812','Jaguare','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1813','Jeronimo Monteiro','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1814','Joacuba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1815','Joao Neiva','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1816','Joatuba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1817','Jose Carlos','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1818','Jucu','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1819','Lajinha','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1820','Laranja da Terra','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1821','Linhares','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1822','Mangarai','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1823','Mantenopolis','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1824','Marataizes','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1825','Marechal Floriano','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1826','Marilandia','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1827','Matilde','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1828','Melgaco','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1829','Menino Jesus','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1830','Mimoso do Sul','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1831','Montanha','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1832','Monte Carmelo do Rio Novo','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1833','Monte Sinai','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1834','Mucurici','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1835','Mundo Novo','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1836','Muniz Freire','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1837','Muqui','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1838','Nestor Gomes','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1839','Nova Almeida','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1840','Nova Canaa','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1841','Nova Venecia','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1842','Nova Verona','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1843','Novo Brasil','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1844','Novo Horizonte','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1845','Pacotuba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1846','Paineiras','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1847','Palmerino','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1848','Pancas','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1849','Paraju','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1850','Paulista','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1851','Pedro Canario','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1852','Pendanga','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1853','Pequia','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1854','Perdicao','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1855','Piacu','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1856','Pinheiros','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1857','Piracema','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1858','Piuma','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1859','Ponte de Itabapoana','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1860','Pontoes','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1861','Poranga','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1862','Porto Barra do Riacho','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1863','Praia Grande','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1864','Presidente Kennedy','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1865','Princesa','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1866','Queimado','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1867','Quilometro 14 do Mutum','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1868','Regencia','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1869','Riacho','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1870','Ribeirao do Cristo','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1871','Rio Bananal','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1872','Rio Calcado','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1873','Rio Muqui','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1874','Rio Novo do Sul','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1875','Rio Preto','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1876','Rive','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1877','Sagrada Familia','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1878','Santa Angelica','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1879','Santa Cruz','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1880','Santa Julia','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1881','Santa Leopoldina','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1882','Santa Luzia de Mantenopolis','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1883','Santa Luzia do Azul','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1884','Santa Luzia do Norte','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1885','Santa Maria de Jetiba','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1886','Santa Marta','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1887','Santa Teresa','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1888','Santa Terezinha','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1889','Santissima Trindade','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1890','Santo Agostinho','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1891','Santo Antonio','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1892','Santo Antonio do Canaa','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1893','Santo Antonio do Muqui','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1894','Santo Antonio do Pousalegre','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1895','Santo Antonio do Quinze','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1896','Sao Domingos do Norte','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1897','Sao Francisco do Novo Brasil','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1898','Sao Gabriel da Palha','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1899','Sao Geraldo','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1900','Sao Jacinto','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1901','Sao Joao de Petropolis','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1902','Sao Joao de Vicosa','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1903','Sao Joao do Sobrado','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1904','Sao Jorge da Barra Seca','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1905','Sao Jorge do Tiradentes','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1906','Sao Jose das Torres','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1907','Sao Jose do Calcado','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1908','Sao Jose do Sobradinho','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1909','Sao Mateus','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1910','Sao Pedro de Itabapoana','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1911','Sao Pedro de Rates','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1912','Sao Rafael','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1913','Sao Roque','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1914','Sao Tiago','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1915','Sao Torquato','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1916','Sapucaia','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1917','Serra','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1918','Serra Pelada','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1919','Sobreiro','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1920','Timbui','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1921','Todos Os Santos','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1922','Urania','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1923','Valerio','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1924','Vargem Alta','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1925','Vargem Grande do Soturno','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1926','Venda Nova do Imigrante','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1927','Viana','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1928','Vieira Machado','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1929','Vila Nelita','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1930','Vila Nova de Bananal','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1931','Vila Pavao','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1932','Vila Velha','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1933','Vila Verde','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1934','Vinhatico','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1935','Vinte e Cinco de Julho','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1936','Vitoria','8');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1937','Abadia de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1938','Abadiania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1939','Acreuna','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1940','Adelandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1941','Agua Fria de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1942','Agua Limpa','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1943','Alexania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1944','Aloandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1945','Alto Alvorada','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1946','Alto Horizonte','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1947','Alto Paraiso de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1948','Alvorada do Norte','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1949','Americano do Brasil','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1950','Amorinopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1951','Anapolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1952','Anhanguera','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1953','Anicuns','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1954','Aparecida','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1955','Aparecida de Goiania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1956','Aparecida de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1957','Aparecida do Rio Claro','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1958','Aparecida do Rio Doce','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1959','Apore','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1960','Aracu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1961','Aragarcas','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1962','Aragoiania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1963','Araguapaz','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1964','Arenopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1965','Aruana','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1966','Aurilandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1967','Avelinopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1968','Bacilandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1969','Baliza','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1970','Bandeirantes','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1971','Barbosilandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1972','Barro Alto','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1973','Bela Vista de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1974','Bom Jardim de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1975','Bom Jesus de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1976','Bonfinopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1977','Bonopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1978','Brazabrantes','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1979','Britania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1980','Buenolandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1981','Buriti Alegre','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1982','Buriti de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1983','Buritinopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1984','Cabeceiras','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1985','Cachoeira Alta','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1986','Cachoeira de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1987','Cachoeira Dourada','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1988','Cacu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1989','Caiaponia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1990','Caicara','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1991','Calcilandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1992','Caldas Novas','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1993','Caldazinha','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1994','Calixto','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1995','Campestre de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1996','Campinacu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1997','Campinorte','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1998','Campo Alegre de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('1999','Campo Limpo','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2000','Campolandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2001','Campos Belos','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2002','Campos Verdes','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2003','Canada','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2004','Capelinha','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2005','Caraiba','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2006','Carmo do Rio Verde','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2007','Castelandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2008','Castrinopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2009','Catalao','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2010','Caturai','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2011','Cavalcante','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2012','Cavalheiro','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2013','Cebrasa','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2014','Ceres','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2015','Cezarina','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2016','Chapadao do Ceu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2017','Choupana','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2018','Cibele','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2019','Cidade Ocidental','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2020','Cirilandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2021','Cocalzinho de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2022','Colinas do Sul','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2023','Corrego do Ouro','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2024','Corrego Rico','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2025','Corumba de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2026','Corumbaiba','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2027','Cristalina','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2028','Cristianopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2029','Crixas','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2030','Crominia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2031','Cruzeiro do Norte','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2032','Cumari','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2033','Damianopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2034','Damolandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2035','Davidopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2036','Davinopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2037','Diolandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2038','Diorama','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2039','Divinopolis de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2040','Domiciano Ribeiro','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2041','Doverlandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2042','Edealina','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2043','Edeia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2044','Estrela do Norte','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2045','Faina','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2046','Fazenda Nova','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2047','Firminopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2048','Flores de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2049','Formosa','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2050','Formoso','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2051','Forte','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2052','Geriacu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2053','Goialandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2054','Goianapolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2055','Goiandira','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2056','Goianesia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2057','Goiania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2058','Goianira','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2059','Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2060','Goiatuba','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2061','Gouvelandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2062','Guapo','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2063','Guaraita','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2064','Guarani de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2065','Guarinos','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2066','Heitorai','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2067','Hidrolandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2068','Hidrolina','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2069','Iaciara','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2070','Inaciolandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2071','Indiara','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2072','Inhumas','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2073','Interlandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2074','Ipameri','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2075','Ipora','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2076','Israelandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2077','Itaberai','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2078','Itaguacu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2079','Itaguari','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2080','Itaguaru','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2081','Itaja','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2082','Itapaci','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2083','Itapirapua','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2084','Itapuranga','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2085','Itaruma','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2086','Itaucu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2087','Itumbiara','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2088','Ivolandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2089','Jacilandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2090','Jandaia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2091','Jaragua','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2092','Jatai','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2093','Jaupaci','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2094','Jeroaquara','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2095','Jesupolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2096','Joanapolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2097','Joviania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2098','Juscelandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2099','Jussara','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2100','Lagoa do Bauzinho','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2101','Lagolandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2102','Leopoldo de Bulhoes','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2103','Lucilandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2104','Luziania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2105','Mairipotaba','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2106','Mambai','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2107','Mara Rosa','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2108','Marcianopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2109','Marzagao','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2110','Matinha','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2111','Matrincha','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2112','Maurilandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2113','Meia Ponte','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2114','Messianopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2115','Mimoso de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2116','Minacu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2117','Mineiros','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2118','Moipora','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2119','Monte Alegre de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2120','Montes Claros de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2121','Montividiu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2122','Montividiu do Norte','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2123','Morrinhos','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2124','Morro Agudo de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2125','Mossamedes','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2126','Mozarlandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2127','Mundo Novo','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2128','Mutunopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2129','Natinopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2130','Nazario','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2131','Neropolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2132','Niquelandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2133','Nova America','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2134','Nova Aurora','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2135','Nova Crixas','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2136','Nova Gloria','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2137','Nova Iguacu de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2138','Nova Roma','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2139','Nova Veneza','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2140','Novo Brasil','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2141','Novo Gama','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2142','Novo Planalto','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2143','Olhos D\'Agua','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2144','Orizona','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2145','Ouro Verde de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2146','Ouroana','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2147','Ouvidor','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2148','Padre Bernardo','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2149','Palestina de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2150','Palmeiras de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2151','Palmelo','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2152','Palminopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2153','Panama','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2154','Paranaiguara','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2155','Parauna','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2156','Pau-Terra','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2157','Pedra Branca','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2158','Perolandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2159','Petrolina de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2160','Pilar de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2161','Piloandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2162','Piracanjuba','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2163','Piranhas','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2164','Pirenopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2165','Pires Belo','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2166','Pires do Rio','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2167','Planaltina','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2168','Pontalina','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2169','Porangatu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2170','Porteirao','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2171','Portelandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2172','Posse','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2173','Posse D\'Abadia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2174','Professor Jamil','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2175','Quirinopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2176','Registro do Araguaia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2177','Rialma','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2178','Rianapolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2179','Rio Quente','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2180','Rio Verde','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2181','Riverlandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2182','Rodrigues Nascimento','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2183','Rosalandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2184','Rubiataba','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2185','Sanclerlandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2186','Santa Barbara de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2187','Santa Cruz das Lajes','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2188','Santa Cruz de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2189','Santa Fe de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2190','Santa Helena de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2191','Santa Isabel','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2192','Santa Rita do Araguaia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2193','Santa Rosa','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2194','Santa Rosa de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2195','Santa Tereza de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2196','Santa Terezinha de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2197','Santo Antonio da Barra','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2198','Santo Antonio de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2199','Santo Antonio do Descoberto','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2200','Santo Antonio do Rio Verde','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2201','Sao Domingos','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2202','Sao Francisco de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2203','Sao Gabriel de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2204','Sao Joao','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2205','Sao Joao D\'Alianca','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2206','Sao Joao da Parauna','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2207','Sao Luis de Montes Belos','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2208','Sao Luis do Norte','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2209','Sao Luiz do Tocantins','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2210','Sao Miguel do Araguaia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2211','Sao Miguel do Passa Quatro','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2212','Sao Sebastiao do Rio Claro','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2213','Sao Simao','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2214','Sao Vicente','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2215','Sarandi','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2216','Senador Canedo','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2217','Serra Dourada','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2218','Serranopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2219','Silvania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2220','Simolandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2221','Sitio D\'Abadia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2222','Sousania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2223','Taquaral de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2224','Taveira','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2225','Teresina de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2226','Terezopolis de Goias','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2227','Termas do Itaja','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2228','Tres Ranchos','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2229','Trindade','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2230','Trombas','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2231','Tupiracaba','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2232','Turvania','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2233','Tuverlandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2234','Uirapuru','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2235','Uruacu','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2236','Uruana','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2237','Uruita','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2238','Urutai','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2239','Uva','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2240','Valdelandia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2241','Valparaizo','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2242','Varjao','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2243','Vianopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2244','Vicentinopolis','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2245','Vila Boa','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2246','Vila Brasilia','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2247','Vila Propicio','9');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2248','Acailandia','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2249','Afonso Cunha','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2250','Alcantara','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2251','Aldeias Altas','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2252','Altamira do Maranhao','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2253','Alto Parnaiba','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2254','Amarante do Maranhao','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2255','Anajatuba','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2256','Anapurus','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2257','Anil','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2258','Araioses','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2259','Arame','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2260','Arari','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2261','Aurizona','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2262','Axixa','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2263','Bacabal','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2264','Bacatuba','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2265','Bacuri','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2266','Bacurituba','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2267','Balsas','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2268','Barao de Grajau','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2269','Barao de Tromai','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2270','Barra do Corda','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2271','Barreirinhas','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2272','Barro Duro','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2273','Benedito Leite','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2274','Bequimao','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2275','Boa Vista do Pindare','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2276','Bom Jardim','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2277','Bonfim do Arari','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2278','Brejo','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2279','Brejo de Sao Felix','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2280','Buriti','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2281','Buriti Bravo','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2282','Buriti Cortado','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2283','Cajapio','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2284','Cajari','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2285','Candido Mendes','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2286','Cantanhede','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2287','Caraiba do Norte','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2288','Carolina','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2289','Carutapera','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2290','Caxias','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2291','Cedral','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2292','Chapadinha','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2293','Codo','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2294','Codozinho','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2295','Coelho Neto','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2296','Colinas','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2297','Coroata','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2298','Curupa','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2299','Cururupu','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2300','Curva Grande','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2301','Custodio Lima','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2302','Dom Pedro','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2303','Duque Bacelar','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2304','Esperantinopolis','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2305','Estandarte','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2306','Estreito','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2307','Fortaleza dos Nogueiras','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2308','Fortuna','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2309','Frecheiras','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2310','Godofredo Viana','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2311','Goncalves Dias','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2312','Governador Archer','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2313','Governador Eugenio Barros','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2314','Graca Aranha','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2315','Grajau','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2316','Guimaraes','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2317','Humberto de Campos','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2318','Ibipira','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2319','Icatu','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2320','Igarape Grande','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2321','Imperatriz','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2322','Itamatare','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2323','Itapecuru Mirim','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2324','Itapera','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2325','Joao Lisboa','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2326','Joselandia','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2327','Lago da Pedra','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2328','Lago do Junco','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2329','Lago Verde','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2330','Lapela','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2331','Leandro','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2332','Lima Campos','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2333','Loreto','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2334','Luis Domingues','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2335','Magalhaes de Almeida','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2336','Maioba','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2337','Marianopolis','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2338','Mata','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2339','Mata Roma','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2340','Matinha','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2341','Matoes','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2342','Mirador','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2343','Miranda do Norte','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2344','Mirinzal','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2345','Moncao','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2346','Montes Altos','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2347','Morros','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2348','Nina Rodrigues','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2349','Nova Iorque','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2350','Olho D\'Agua das Cunhas','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2351','Paco do Lumiar','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2352','Palmeirandia','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2353','Papagaio','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2354','Paraibano','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2355','Parnarama','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2356','Passagem Franca','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2357','Pastos Bons','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2358','Paulino Neves','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2359','Paulo Ramos','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2360','Pedreiras','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2361','Penalva','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2362','Peri Mirim','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2363','Peritoro','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2364','Pimentel','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2365','Pindare Mirim','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2366','Pinheiro','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2367','Pio Xii','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2368','Pirapemas','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2369','Pocao de Pedras','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2370','Porto das Gabarras','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2371','Porto Franco','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2372','Presidente Dutra','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2373','Presidente Juscelino','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2374','Presidente Vargas','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2375','Primeira Cruz','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2376','Resplandes','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2377','Riachao','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2378','Ribeirao Azul','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2379','Rocado','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2380','Roque','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2381','Rosario','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2382','Sambaiba','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2383','Santa Helena','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2384','Santa Ines','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2385','Santa Luzia','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2386','Santa Luzia do Parua','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2387','Santa Quiteria do Maranhao','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2388','Santa Rita','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2389','Santo Amaro','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2390','Santo Antonio dos Lopes','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2391','Sao Benedito do Rio Preto','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2392','Sao Bento','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2393','Sao Bernardo','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2394','Sao Domingos do Maranhao','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2395','Sao Felix de Balsas','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2396','Sao Francisco do Maranhao','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2397','Sao Joao Batista','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2398','Sao Joao de Cortes','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2399','Sao Joao dos Patos','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2400','Sao Joaquim dos Melos','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2401','Sao Jose de Ribamar','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2402','Sao Luis','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2403','Sao Luis Gonzaga do Maranhao','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2404','Sao Mateus do Maranhao','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2405','Sao Pedro da Agua Branca','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2406','Sao Raimundo das Mangabeiras','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2407','Sao Raimundo de Codo','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2408','Sao Vicente Ferrer','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2409','Sitio Novo','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2410','Sucupira do Norte','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2411','Tasso Fragoso','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2412','Timbiras','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2413','Timon','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2414','Tuntum','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2415','Turiacu','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2416','Tutoia','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2417','Urbano Santos','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2418','Vargem Grande','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2419','Viana','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2420','Vitoria do Mearim','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2421','Vitorino Freire','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2422','Zedoca','10');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2423','Abadia dos Dourados','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2424','Abaete','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2425','Abaete dos Mendes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2426','Abaiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2427','Abre Campo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2428','Abreus','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2429','Acaiaca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2430','Acucena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2431','Acurui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2432','Adao Colares','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2433','Agua Boa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2434','Agua Branca de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2435','Agua Comprida','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2436','Agua Viva','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2437','Aguanil','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2438','Aguas de Araxa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2439','Aguas de Contendas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2440','Aguas Ferreas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2441','Aguas Formosas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2442','Aguas Vermelhas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2443','Aimores','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2444','Aiuruoca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2445','Alagoa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2446','Albertina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2447','Alberto Isaacson','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2448','Albertos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2449','Aldeia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2450','Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2451','Alegria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2452','Alem Paraiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2453','Alexandrita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2454','Alfenas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2455','Alfredo Vasconcelos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2456','Almeida','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2457','Almenara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2458','Alpercata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2459','Alpinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2460','Alterosa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2461','Alto Caparao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2462','Alto Capim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2463','Alto de Santa Helena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2464','Alto Jequitiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2465','Alto Maranhao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2466','Alto Rio Doce','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2467','Altolandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2468','Alvacao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2469','Alvarenga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2470','Alvinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2471','Alvorada','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2472','Alvorada de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2473','Amanda','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2474','Amanhece','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2475','Amarantina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2476','Amparo da Serra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2477','Andiroba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2478','Andradas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2479','Andrelandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2480','Andrequice','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2481','Angaturama','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2482','Angicos de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2483','Anguereta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2484','Angustura','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2485','Antonio Carlos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2486','Antonio Dias','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2487','Antonio dos Santos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2488','Antonio Ferreira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2489','Antonio Pereira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2490','Antonio Prado de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2491','Antunes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2492','Aparecida de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2493','Aracai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2494','Aracati de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2495','Aracitaba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2496','Aracuai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2497','Araguari','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2498','Aramirim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2499','Aranha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2500','Arantina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2501','Araponga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2502','Arapora','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2503','Arapua','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2504','Araujos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2505','Arauna','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2506','Araxa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2507','Arcangelo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2508','Arceburgo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2509','Arcos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2510','Areado','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2511','Argenita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2512','Argirita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2513','Aricanduva','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2514','Arinos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2515','Aristides Batista','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2516','Ascencao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2517','Assarai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2518','Astolfo Dutra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2519','Ataleia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2520','Augusto de Lima','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2521','Avai do Jacinto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2522','Azurita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2523','Babilonia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2524','Bacao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2525','Baependi','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2526','Baguari','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2527','Baioes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2528','Balbinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2529','Baldim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2530','Bambui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2531','Bandeira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2532','Bandeira do Sul','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2533','Bandeirantes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2534','Barao de Cocais','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2535','Barao de Monte Alto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2536','Barbacena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2537','Barra Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2538','Barra da Figueira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2539','Barra do Ariranha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2540','Barra do Cuiete','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2541','Barra Feliz','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2542','Barra Longa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2543','Barranco Alto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2544','Barreiro da Raiz','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2545','Barreiro do Rio Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2546','Barretos de Alvinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2547','Barrocao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2548','Barroso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2549','Bau','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2550','Bela Vista de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2551','Belisario','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2552','Belmiro Braga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2553','Belo Horizonte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2554','Belo Oriente','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2555','Belo Vale','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2556','Bentopolis de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2557','Berilo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2558','Berizal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2559','Bertopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2560','Betim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2561','Bias Fortes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2562','Bicas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2563','Bicuiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2564','Biquinhas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2565','Bituri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2566','Boa Esperanca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2567','Boa Familia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2568','Boa Uniao de Itabirinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2569','Boa Vista de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2570','Bocaina de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2571','Bocaiuva','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2572','Bom Despacho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2573','Bom Jardim de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2574','Bom Jesus da Cachoeira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2575','Bom Jesus da Penha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2576','Bom Jesus do Amparo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2577','Bom Jesus do Divino','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2578','Bom Jesus do Galho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2579','Bom Jesus do Madeira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2580','Bom Pastor','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2581','Bom Repouso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2582','Bom Retiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2583','Bom Sucesso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2584','Bom Sucesso de Patos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2585','Bonanca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2586','Bonfim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2587','Bonfinopolis de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2588','Bonito','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2589','Borba Gato','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2590','Borda da Mata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2591','Botelhos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2592','Botumirim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2593','Bras Pires','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2594','Brasilandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2595','Brasilia de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2596','Brasopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2597','Braunas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2598','Brejauba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2599','Brejaubinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2600','Brejo Bonito','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2601','Brejo do Amparo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2602','Brumadinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2603','Brumal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2604','Buarque de Macedo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2605','Bueno','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2606','Bueno Brandao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2607','Buenopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2608','Bugre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2609','Buritis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2610','Buritizeiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2611','Caatinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2612','Cabeceira Grande','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2613','Cabo Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2614','Caburu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2615','Cacaratiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2616','Cacarema','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2617','Cachoeira Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2618','Cachoeira da Prata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2619','Cachoeira de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2620','Cachoeira de Pajeu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2621','Cachoeira de Santa Cruz','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2622','Cachoeira do Brumado','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2623','Cachoeira do Campo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2624','Cachoeira do Manteiga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2625','Cachoeira do Vale','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2626','Cachoeira dos Antunes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2627','Cachoeira Dourada','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2628','Cachoeirinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2629','Caetano Lopes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2630','Caetanopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2631','Caete','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2632','Caiana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2633','Caiapo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2634','Cajuri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2635','Caldas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2636','Calixto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2637','Camacho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2638','Camanducaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2639','Camargos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2640','Cambui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2641','Cambuquira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2642','Campanario','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2643','Campanha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2644','Campestre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2645','Campestrinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2646','Campina Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2647','Campo Alegre de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2648','Campo Azul','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2649','Campo Belo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2650','Campo do Meio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2651','Campo Florido','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2652','Campo Redondo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2653','Campolide','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2654','Campos Altos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2655','Campos Gerais','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2656','Cana Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2657','Canaa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2658','Canabrava','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2659','Canapolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2660','Canastrao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2661','Candeias','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2662','Canoeiros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2663','Cantagalo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2664','Caparao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2665','Capela Nova','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2666','Capelinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2667','Capetinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2668','Capim Branco','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2669','Capinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2670','Capitania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2671','Capitao Andrade','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2672','Capitao Eneas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2673','Capitolio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2674','Caputira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2675','Carai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2676','Caranaiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2677','Carandai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2678','Carangola','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2679','Caratinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2680','Carbonita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2681','Cardeal Mota','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2682','Careacu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2683','Carioca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2684','Carlos Alves','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2685','Carlos Chagas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2686','Carmesia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2687','Carmo da Cachoeira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2688','Carmo da Mata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2689','Carmo de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2690','Carmo do Cajuru','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2691','Carmo do Paranaiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2692','Carmo do Rio Claro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2693','Carmopolis de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2694','Carneirinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2695','Carrancas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2696','Carvalho de Brito','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2697','Carvalhopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2698','Carvalhos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2699','Casa Grande','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2700','Cascalho Rico','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2701','Cassia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2702','Cataguarino','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2703','Cataguases','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2704','Catajas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2705','Catas Altas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2706','Catas Altas da Noruega','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2707','Catiara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2708','Catuji','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2709','Catune','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2710','Catuni','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2711','Caxambu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2712','Cedro do Abaete','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2713','Centenario','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2714','Central de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2715','Central de Santa Helena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2716','Centralina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2717','Cervo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2718','Chacara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2719','Chale','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2720','Chapada de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2721','Chapada do Norte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2722','Chaveslandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2723','Chiador','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2724','Chonim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2725','Chumbo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2726','Cipotanea','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2727','Cisneiros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2728','Citrolandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2729','Claraval','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2730','Claro de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2731','Claro dos Pocoes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2732','Claudio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2733','Claudio Manuel','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2734','Cocais','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2735','Coco','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2736','Coimbra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2737','Coluna','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2738','Comendador Gomes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2739','Comercinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2740','Conceicao da Aparecida','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2741','Conceicao da Barra de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2742','Conceicao da Boa Vista','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2743','Conceicao da Brejauba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2744','Conceicao da Ibitipoca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2745','Conceicao das Alagoas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2746','Conceicao das Pedras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2747','Conceicao de Ipanema','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2748','Conceicao de Itagua','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2749','Conceicao de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2750','Conceicao de Piracicaba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2751','Conceicao de Tronqueiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2752','Conceicao do Capim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2753','Conceicao do Formoso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2754','Conceicao do Mato Dentro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2755','Conceicao do Para','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2756','Conceicao do Rio Acima','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2757','Conceicao do Rio Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2758','Conceicao dos Ouros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2759','Concordia de Mucuri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2760','Condado do Norte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2761','Conego Joao Pio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2762','Conego Marinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2763','Confins','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2764','Congonhal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2765','Congonhas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2766','Congonhas do Norte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2767','Conquista','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2768','Conselheiro Lafaiete','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2769','Conselheiro Mata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2770','Conselheiro Pena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2771','Consolacao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2772','Contagem','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2773','Contrato','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2774','Contria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2775','Coqueiral','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2776','Coracao de Jesus','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2777','Cordisburgo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2778','Cordislandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2779','Corinto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2780','Coroaci','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2781','Coromandel','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2782','Coronel Fabriciano','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2783','Coronel Murta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2784','Coronel Pacheco','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2785','Coronel Xavier Chaves','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2786','Corrego Danta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2787','Corrego do Barro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2788','Corrego do Bom Jesus','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2789','Corrego do Ouro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2790','Corrego Fundo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2791','Corrego Novo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2792','Corregos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2793','Correia de Almeida','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2794','Correntinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2795','Costa Sena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2796','Costas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2797','Couto de Magalhaes de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2798','Crisolia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2799','Crisolita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2800','Crispim Jaques','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2801','Cristais','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2802','Cristalia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2803','Cristiano Otoni','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2804','Cristina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2805','Crucilandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2806','Cruzeiro da Fortaleza','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2807','Cruzeiro dos Peixotos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2808','Cruzilia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2809','Cubas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2810','Cuite Velho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2811','Cuparaque','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2812','Curimatai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2813','Curral de Dentro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2814','Curvelo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2815','Datas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2816','Delfim Moreira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2817','Delfinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2818','Delta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2819','Deputado Augusto Clementino','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2820','Derribadinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2821','Descoberto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2822','Desembargador Otoni','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2823','Desemboque','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2824','Desterro de Entre Rios','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2825','Desterro do Melo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2826','Diamante de Uba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2827','Diamantina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2828','Dias','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2829','Dias Tavares','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2830','Diogo de Vasconcelos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2831','Dionisio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2832','Divinesia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2833','Divino','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2834','Divino das Laranjeiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2835','Divino de Virgolandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2836','Divino Espirito Santo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2837','Divinolandia de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2838','Divinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2839','Divisa Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2840','Divisa Nova','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2841','Divisopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2842','Dois de Abril','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2843','Dom Cavati','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2844','Dom Joaquim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2845','Dom Lara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2846','Dom Modesto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2847','Dom Silverio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2848','Dom Vicoso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2849','Dona Euzebia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2850','Dores da Vitoria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2851','Dores de Campos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2852','Dores de Guanhaes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2853','Dores do Indaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2854','Dores do Paraibuna','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2855','Dores do Turvo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2856','Doresopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2857','Douradinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2858','Douradoquara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2859','Doutor Campolina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2860','Doutor Lund','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2861','Durande','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2862','Edgard Melo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2863','Eloi Mendes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2864','Emboabas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2865','Engenheiro Caldas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2866','Engenheiro Correia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2867','Engenheiro Navarro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2868','Engenheiro Schnoor','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2869','Engenho do Ribeiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2870','Engenho Novo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2871','Entre Folhas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2872','Entre Rios de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2873','Epaminondas Otoni','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2874','Ermidinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2875','Ervalia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2876','Esmeraldas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2877','Esmeraldas de Ferros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2878','Espera Feliz','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2879','Espinosa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2880','Espirito Santo do Dourado','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2881','Esteios','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2882','Estevao de Araujo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2883','Estiva','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2884','Estrela da Barra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2885','Estrela Dalva','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2886','Estrela de Jordania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2887','Estrela do Indaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2888','Estrela do Sul','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2889','Eugenopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2890','Euxenita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2891','Ewbank da Camara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2892','Expedicionario Alicio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2893','Extracao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2894','Extrema','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2895','Fama','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2896','Faria Lemos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2897','Farias','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2898','Fechados','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2899','Felicina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2900','Felicio dos Santos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2901','Felisburgo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2902','Felixlandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2903','Fernandes Tourinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2904','Fernao Dias','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2905','Ferreiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2906','Ferreiropolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2907','Ferros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2908','Ferruginha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2909','Fervedouro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2910','Fidalgo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2911','Fidelandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2912','Flor de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2913','Floralia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2914','Floresta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2915','Florestal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2916','Florestina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2917','Fonseca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2918','Formiga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2919','Formoso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2920','Fortaleza de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2921','Fortuna de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2922','Francisco Badaro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2923','Francisco Dumont','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2924','Francisco Sa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2925','Franciscopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2926','Frei Eustaquio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2927','Frei Gaspar','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2928','Frei Gonzaga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2929','Frei Inocencio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2930','Frei Jorge','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2931','Frei Lagonegro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2932','Frei Orlando','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2933','Frei Serafim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2934','Freire Cardoso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2935','Fronteira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2936','Fronteira dos Vales','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2937','Frutal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2938','Funchal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2939','Funilandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2940','Furnas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2941','Furquim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2942','Galena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2943','Galileia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2944','Gama','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2945','Gameleiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2946','Garapuava','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2947','Gaviao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2948','Genipapo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2949','Glaucilandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2950','Glaura','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2951','Glucinio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2952','Goiabeira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2953','Goiana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2954','Goianases','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2955','Goncalves','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2956','Gonzaga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2957','Gororos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2958','Gorutuba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2959','Gouvea','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2960','Governador Valadares','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2961','Graminea','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2962','Granada','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2963','Grao Mogol','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2964','Grota','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2965','Grupiara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2966','Guacui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2967','Guaipava','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2968','Guanhaes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2969','Guape','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2970','Guaraciaba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2971','Guaraciama','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2972','Guaranesia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2973','Guarani','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2974','Guaranilandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2975','Guarara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2976','Guarataia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2977','Guarda dos Ferreiros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2978','Guarda-Mor','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2979','Guardinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2980','Guaxima','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2981','Guaxupe','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2982','Guidoval','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2983','Guimarania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2984','Guinda','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2985','Guiricema','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2986','Gurinhata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2987','Heliodora','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2988','Hematita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2989','Hermilo Alves','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2990','Honoropolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2991','Iapu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2992','Ibertioga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2993','Ibia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2994','Ibiai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2995','Ibiracatu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2996','Ibiraci','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2997','Ibirite','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2998','Ibitira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('2999','Ibitiura de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3000','Ibituruna','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3001','Icarai de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3002','Igarape','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3003','Igaratinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3004','Iguatama','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3005','Ijaci','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3006','Ilheus do Prata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3007','Ilicinea','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3008','Imbe','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3009','Inconfidentes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3010','Indaiabira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3011','Independencia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3012','Indianopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3013','Ingai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3014','Inhai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3015','Inhapim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3016','Inhauma','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3017','Inimutaba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3018','Ipaba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3019','Ipanema','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3020','Ipatinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3021','Ipiacu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3022','Ipoema','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3023','Ipuiuna','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3024','Irai de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3025','Itabira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3026','Itabirinha de Mantena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3027','Itabirito','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3028','Itaboca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3029','Itacambira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3030','Itacarambi','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3031','Itaci','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3032','Itacolomi','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3033','Itaguara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3034','Itaim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3035','Itaipe','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3036','Itajuba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3037','Itajutiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3038','Itamarandiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3039','Itamarati','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3040','Itamarati de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3041','Itambacuri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3042','Itambe do Mato Dentro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3043','Itamirim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3044','Itamogi','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3045','Itamonte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3046','Itamuri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3047','Itanhandu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3048','Itanhomi','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3049','Itaobim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3050','Itapagipe','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3051','Itapanhoacanga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3052','Itapecerica','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3053','Itapeva','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3054','Itapiru','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3055','Itapirucu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3056','Itatiaiucu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3057','Itau de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3058','Itauna','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3059','Itauninha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3060','Itaverava','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3061','Iterere','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3062','Itinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3063','Itira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3064','Itueta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3065','Itui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3066','Ituiutaba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3067','Itumirim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3068','Iturama','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3069','Itutinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3070','Jaboticatubas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3071','Jacarandira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3072','Jacare','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3073','Jacinto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3074','Jacui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3075','Jacutinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3076','Jaguaracu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3077','Jaguarao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3078','Jaguaritira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3079','Jaiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3080','Jampruca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3081','Janauba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3082','Januaria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3083','Japaraiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3084','Japonvar','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3085','Jardinesia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3086','Jeceaba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3087','Jequeri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3088','Jequitai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3089','Jequitiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3090','Jequitinhonha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3091','Jesuania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3092','Joaima','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3093','Joanesia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3094','Joao Monlevade','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3095','Joao Pinheiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3096','Joaquim Felicio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3097','Jordania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3098','Jose Goncalves de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3099','Jose Raydam','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3100','Joselandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3101','Josenopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3102','Juatuba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3103','Jubai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3104','Juiracu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3105','Juiz de Fora','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3106','Junco de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3107','Juramento','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3108','Jureia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3109','Juruaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3110','Jurumirim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3111','Justinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3112','Juvenilia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3113','Lacerdinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3114','Ladainha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3115','Lagamar','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3116','Lagoa Bonita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3117','Lagoa da Prata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3118','Lagoa dos Patos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3119','Lagoa Dourada','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3120','Lagoa Formosa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3121','Lagoa Grande','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3122','Lagoa Santa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3123','Lajinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3124','Lambari','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3125','Lamim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3126','Lamounier','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3127','Lapinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3128','Laranjal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3129','Laranjeiras de Caldas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3130','Lassance','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3131','Lavras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3132','Leandro Ferreira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3133','Leme do Prado','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3134','Leopoldina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3135','Levinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3136','Liberdade','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3137','Lima Duarte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3138','Limeira D\'Oeste','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3139','Limeira de Mantena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3140','Lobo Leite','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3141','Lontra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3142','Lourenco Velho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3143','Lufa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3144','Luisburgo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3145','Luislandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3146','Luiz Pires de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3147','Luizlandia do Oeste','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3148','Luminarias','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3149','Luminosa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3150','Luz','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3151','Macaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3152','Machacalis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3153','Machado','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3154','Macuco de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3155','Madre de Deus de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3156','Mae dos Homens','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3157','Major Ezequiel','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3158','Major Porto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3159','Malacacheta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3160','Mamonas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3161','Manga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3162','Manhuacu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3163','Manhumirim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3164','Mantena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3165','Mantiqueira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3166','Mar de Espanha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3167','Marambainha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3168','Maravilhas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3169','Maria da Fe','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3170','Mariana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3171','Marilac','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3172','Marilandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3173','Mario Campos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3174','Maripa de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3175','Marlieria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3176','Marmelopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3177','Martinesia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3178','Martinho Campos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3179','Martins Guimaraes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3180','Martins Soares','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3181','Mata Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3182','Materlandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3183','Mateus Leme','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3184','Mathias Lobato','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3185','Matias Barbosa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3186','Matias Cardoso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3187','Matipo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3188','Mato Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3189','Matozinhos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3190','Matutina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3191','Medeiros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3192','Medina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3193','Melo Viana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3194','Mendanha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3195','Mendes Pimentel','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3196','Merces','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3197','Merces de Agua Limpa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3198','Mesquita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3199','Mestre Caetano','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3200','Miguel Burnier','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3201','Milagre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3202','Milho Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3203','Minas Novas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3204','Minduri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3205','Mirabela','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3206','Miradouro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3207','Miragaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3208','Mirai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3209','Miralta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3210','Mirantao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3211','Miraporanga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3212','Miravania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3213','Missionario','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3214','Missoes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3215','Mocambeiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3216','Mocambinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3217','Moeda','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3218','Moema','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3219','Monjolinho de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3220','Monjolos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3221','Monsenhor Horta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3222','Monsenhor Isidro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3223','Monsenhor Joao Alexandre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3224','Monsenhor Paulo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3225','Montalvania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3226','Monte Alegre de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3227','Monte Azul','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3228','Monte Belo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3229','Monte Carmelo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3230','Monte Celeste','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3231','Monte Rei','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3232','Monte Santo de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3233','Monte Siao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3234','Monte Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3235','Montes Claros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3236','Montezuma','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3237','Morada Nova de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3238','Morro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3239','Morro da Garca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3240','Morro do Ferro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3241','Morro do Pilar','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3242','Morro Vermelho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3243','Mucuri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3244','Mundo Novo de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3245','Munhoz','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3246','Muquem','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3247','Muriae','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3248','Mutum','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3249','Muzambinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3250','Nacip Raydan','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3251','Nanuque','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3252','Naque','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3253','Naque-Nanuque','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3254','Natercia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3255','Nazare de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3256','Nazareno','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3257','Nelson de Sena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3258','Neolandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3259','Nepomuceno','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3260','Nhandutiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3261','Nicolandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3262','Nova Belem','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3263','Nova Era','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3264','Nova Esperanca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3265','Nova Lima','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3266','Nova Minda','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3267','Nova Modica','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3268','Nova Ponte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3269','Nova Porteirinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3270','Nova Resende','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3271','Nova Serrana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3272','Nova Uniao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3273','Novilhona','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3274','Novo Cruzeiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3275','Novo Horizonte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3276','Ocidente','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3277','Olaria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3278','Olegario Maciel','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3279','Olhos D\'Agua','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3280','Olhos D\'Agua do Oeste','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3281','Olimpio Campos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3282','Olimpio Noronha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3283','Oliveira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3284','Oliveira Fortes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3285','Onca de Pitangui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3286','Oratorios','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3287','Orizania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3288','Ouro Branco','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3289','Ouro Fino','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3290','Ouro Preto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3291','Ouro Verde de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3292','Paciencia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3293','Padre Brito','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3294','Padre Carvalho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3295','Padre Felisberto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3296','Padre Fialho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3297','Padre Joao Afonso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3298','Padre Paraiso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3299','Padre Pinto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3300','Padre Viegas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3301','Pai Pedro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3302','Paineiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3303','Pains','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3304','Paiolinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3305','Paiva','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3306','Palma','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3307','Palmeiral','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3308','Palmeirinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3309','Palmital dos Carvalhos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3310','Palmopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3311','Pantano','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3312','Papagaios','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3313','Para de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3314','Paracatu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3315','Paraguacu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3316','Paraguai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3317','Paraiso Garcia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3318','Paraisopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3319','Paraopeba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3320','Paredao de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3321','Parque Durval de Barros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3322','Parque Industrial','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3323','Passa Dez','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3324','Passa Quatro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3325','Passa Tempo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3326','Passa Vinte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3327','Passabem','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3328','Passagem de Mariana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3329','Passos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3330','Patis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3331','Patos de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3332','Patrimonio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3333','Patrocinio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3334','Patrocinio do Muriae','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3335','Paula Candido','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3336','Paula Lima','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3337','Paulistas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3338','Pavao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3339','Pe do Morro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3340','Pecanha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3341','Pedra Azul','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3342','Pedra Bonita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3343','Pedra Corrida','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3344','Pedra do Anta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3345','Pedra do Indaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3346','Pedra do Sino','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3347','Pedra Dourada','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3348','Pedra Grande','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3349','Pedra Menina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3350','Pedralva','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3351','Pedras de Maria da Cruz','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3352','Pedrinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3353','Pedro Leopoldo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3354','Pedro Lessa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3355','Pedro Teixeira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3356','Pedro Versiani','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3357','Penedia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3358','Penha de Franca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3359','Penha do Capim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3360','Penha do Cassiano','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3361','Penha do Norte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3362','Penha Longa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3363','Pequeri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3364','Pequi','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3365','Perdigao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3366','Perdilandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3367','Perdizes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3368','Perdoes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3369','Pereirinhas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3370','Periquito','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3371','Perpetuo Socorro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3372','Pescador','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3373','Petunia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3374','Piacatuba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3375','Piao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3376','Piau','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3377','Pic Sagarana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3378','Piedade de Ponte Nova','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3379','Piedade do Paraopeba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3380','Piedade do Rio Grande','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3381','Piedade dos Gerais','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3382','Pilar','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3383','Pimenta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3384','Pindaibas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3385','Pinheirinhos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3386','Pinheiros Altos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3387','Pinhotiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3388','Pintos Negreiros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3389','Piracaiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3390','Piracema','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3391','Pirajuba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3392','Piranga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3393','Pirangucu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3394','Piranguinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3395','Piranguita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3396','Pirapanema','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3397','Pirapetinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3398','Pirapora','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3399','Pirauba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3400','Pires e Albuquerque','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3401','Piscamba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3402','Pitangui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3403','Pitarana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3404','Piui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3405','Planalto de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3406','Planura','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3407','Plautino Soares','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3408','Poaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3409','Poco Fundo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3410','Pocoes de Paineiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3411','Pocos de Caldas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3412','Pocrane','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3413','Pompeu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3414','Poncianos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3415','Pontalete','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3416','Ponte Alta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3417','Ponte Alta de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3418','Ponte dos Ciganos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3419','Ponte Firme','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3420','Ponte Nova','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3421','Ponte Segura','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3422','Pontevila','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3423','Ponto Chique','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3424','Ponto do Marambaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3425','Ponto dos Volantes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3426','Porteirinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3427','Porto Agrario','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3428','Porto das Flores','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3429','Porto dos Mendes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3430','Porto Firme','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3431','Pote','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3432','Pouso Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3433','Pouso Alto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3434','Prados','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3435','Prata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3436','Pratapolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3437','Pratinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3438','Presidente Bernardes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3439','Presidente Juscelino','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3440','Presidente Kubitschek','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3441','Presidente Olegario','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3442','Presidente Pena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3443','Professor Sperber','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3444','Providencia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3445','Prudente de Morais','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3446','Quartel de Sao Joao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3447','Quartel do Sacramento','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3448','Quartel Geral','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3449','Quatituba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3450','Queixada','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3451','Queluzita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3452','Quem-Quem','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3453','Quilombo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3454','Quintinos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3455','Raposos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3456','Raul Soares','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3457','Ravena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3458','Realeza','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3459','Recreio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3460','Reduto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3461','Resende Costa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3462','Resplendor','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3463','Ressaquinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3464','Riachinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3465','Riacho da Cruz','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3466','Riacho dos Machados','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3467','Ribeirao das Neves','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3468','Ribeirao de Sao Domingos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3469','Ribeirao Vermelho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3470','Ribeiro Junqueira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3471','Ribeiros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3472','Rio Acima','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3473','Rio Casca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3474','Rio das Mortes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3475','Rio do Prado','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3476','Rio Doce','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3477','Rio Espera','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3478','Rio Manso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3479','Rio Melo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3480','Rio Novo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3481','Rio Paranaiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3482','Rio Pardo de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3483','Rio Piracicaba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3484','Rio Pomba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3485','Rio Pretinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3486','Rio Preto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3487','Rio Vermelho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3488','Ritapolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3489','Roca Grande','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3490','Rocas Novas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3491','Rochedo de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3492','Rodeador','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3493','Rodeiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3494','Rodrigo Silva','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3495','Romaria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3496','Rosario da Limeira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3497','Rosario de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3498','Rosario do Pontal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3499','Roseiral','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3500','Rubelita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3501','Rubim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3502','Sabara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3503','Sabinopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3504','Sacramento','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3505','Salinas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3506','Salitre de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3507','Salto da Divisa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3508','Sanatorio Santa Fe','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3509','Santa Barbara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3510','Santa Barbara do Leste','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3511','Santa Barbara do Monte Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3512','Santa Barbara do Tugurio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3513','Santa Cruz da Aparecida','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3514','Santa Cruz de Botumirim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3515','Santa Cruz de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3516','Santa Cruz de Salinas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3517','Santa Cruz do Escalvado','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3518','Santa Cruz do Prata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3519','Santa Efigenia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3520','Santa Efigenia de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3521','Santa Fe de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3522','Santa Filomena','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3523','Santa Isabel','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3524','Santa Juliana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3525','Santa Luzia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3526','Santa Luzia da Serra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3527','Santa Margarida','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3528','Santa Maria de Itabira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3529','Santa Maria do Salto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3530','Santa Maria do Suacui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3531','Santa Rita da Estrela','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3532','Santa Rita de Caldas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3533','Santa Rita de Jacutinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3534','Santa Rita de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3535','Santa Rita de Ouro Preto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3536','Santa Rita do Cedro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3537','Santa Rita do Ibitipoca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3538','Santa Rita do Itueto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3539','Santa Rita do Rio do Peixe','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3540','Santa Rita do Sapucai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3541','Santa Rita Durao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3542','Santa Rosa da Serra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3543','Santa Rosa de Lima','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3544','Santa Rosa dos Dourados','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3545','Santa Teresa do Bonito','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3546','Santa Terezinha de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3547','Santa Vitoria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3548','Santana da Vargem','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3549','Santana de Caldas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3550','Santana de Cataguases','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3551','Santana de Patos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3552','Santana de Pirapama','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3553','Santana do Alfie','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3554','Santana do Aracuai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3555','Santana do Campestre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3556','Santana do Capivari','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3557','Santana do Deserto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3558','Santana do Garambeu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3559','Santana do Jacare','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3560','Santana do Manhuacu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3561','Santana do Paraiso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3562','Santana do Paraopeba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3563','Santana do Riacho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3564','Santana do Tabuleiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3565','Santana dos Montes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3566','Santo Antonio da Boa Vista','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3567','Santo Antonio da Fortaleza','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3568','Santo Antonio da Vargem Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3569','Santo Antonio do Amparo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3570','Santo Antonio do Aventureiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3571','Santo Antonio do Boqueirao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3572','Santo Antonio do Cruzeiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3573','Santo Antonio do Gloria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3574','Santo Antonio do Grama','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3575','Santo Antonio do Itambe','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3576','Santo Antonio do Jacinto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3577','Santo Antonio do Leite','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3578','Santo Antonio do Manhuacu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3579','Santo Antonio do Monte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3580','Santo Antonio do Mucuri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3581','Santo Antonio do Norte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3582','Santo Antonio do Pirapetinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3583','Santo Antonio do Retiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3584','Santo Antonio do Rio Abaixo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3585','Santo Antonio dos Araujos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3586','Santo Antonio dos Campos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3587','Santo Hilario','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3588','Santo Hipolito','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3589','Santos Dumont','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3590','Sao Bartolomeu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3591','Sao Benedito','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3592','Sao Bento Abade','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3593','Sao Bento de Caldas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3594','Sao Bras do Suacui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3595','Sao Braz','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3596','Sao Candido','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3597','Sao Domingos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3598','Sao Domingos da Bocaina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3599','Sao Domingos das Dores','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3600','Sao Domingos do Prata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3601','Sao Francisco','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3602','Sao Francisco de Paula','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3603','Sao Francisco de Sales','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3604','Sao Francisco do Gloria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3605','Sao Francisco do Humaita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3606','Sao Geraldo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3607','Sao Geraldo da Piedade','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3608','Sao Geraldo de Tumiritinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3609','Sao Geraldo do Baguari','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3610','Sao Geraldo do Baixio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3611','Sao Goncalo de Botelhos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3612','Sao Goncalo do Abaete','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3613','Sao Goncalo do Monte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3614','Sao Goncalo do Para','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3615','Sao Goncalo do Rio Abaixo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3616','Sao Goncalo do Rio das Pedras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3617','Sao Goncalo do Rio Preto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3618','Sao Goncalo do Sapucai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3619','Sao Gotardo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3620','Sao Jeronimo dos Pocoes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3621','Sao Joao Batista do Gloria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3622','Sao Joao da Chapada','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3623','Sao Joao da Lagoa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3624','Sao Joao da Mata','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3625','Sao Joao da Ponte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3626','Sao Joao da Sapucaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3627','Sao Joao da Serra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3628','Sao Joao da Serra Negra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3629','Sao Joao da Vereda','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3630','Sao Joao del Rei','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3631','Sao Joao do Bonito','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3632','Sao Joao do Jacutinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3633','Sao Joao do Manhuacu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3634','Sao Joao do Manteninha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3635','Sao Joao do Oriente','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3636','Sao Joao do Pacui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3637','Sao Joao do Paraiso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3638','Sao Joao Evangelista','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3639','Sao Joao Nepomuceno','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3640','Sao Joaquim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3641','Sao Joaquim de Bicas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3642','Sao Jose da Barra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3643','Sao Jose da Bela Vista','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3644','Sao Jose da Lapa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3645','Sao Jose da Pedra Menina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3646','Sao Jose da Safira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3647','Sao Jose da Varginha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3648','Sao Jose das Tronqueiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3649','Sao Jose do Acacio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3650','Sao Jose do Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3651','Sao Jose do Barreiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3652','Sao Jose do Batatal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3653','Sao Jose do Buriti','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3654','Sao Jose do Divino','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3655','Sao Jose do Goiabal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3656','Sao Jose do Itueto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3657','Sao Jose do Jacuri','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3658','Sao Jose do Mantimento','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3659','Sao Jose do Mato Dentro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3660','Sao Jose do Pantano','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3661','Sao Jose do Paraopeba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3662','Sao Jose dos Lopes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3663','Sao Jose dos Salgados','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3664','Sao Lourenco','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3665','Sao Manoel do Guaiacu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3666','Sao Mateus de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3667','Sao Miguel do Anta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3668','Sao Pedro da Garca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3669','Sao Pedro da Uniao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3670','Sao Pedro das Tabocas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3671','Sao Pedro de Caldas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3672','Sao Pedro do Avai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3673','Sao Pedro do Gloria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3674','Sao Pedro do Jequitinhonha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3675','Sao Pedro do Suacui','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3676','Sao Pedro dos Ferros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3677','Sao Roberto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3678','Sao Romao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3679','Sao Roque de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3680','Sao Sebastiao da Anta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3681','Sao Sebastiao da Barra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3682','Sao Sebastiao da Bela Vista','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3683','Sao Sebastiao da Vala','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3684','Sao Sebastiao da Vargem Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3685','Sao Sebastiao da Vitoria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3686','Sao Sebastiao do Baixio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3687','Sao Sebastiao do Barreado','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3688','Sao Sebastiao do Barreiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3689','Sao Sebastiao do Bonsucesso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3690','Sao Sebastiao do Bugre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3691','Sao Sebastiao do Gil','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3692','Sao Sebastiao do Maranhao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3693','Sao Sebastiao do Oculo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3694','Sao Sebastiao do Oeste','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3695','Sao Sebastiao do Paraiso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3696','Sao Sebastiao do Pontal','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3697','Sao Sebastiao do Rio Preto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3698','Sao Sebastiao do Rio Verde','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3699','Sao Sebastiao do Sacramento','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3700','Sao Sebastiao do Soberbo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3701','Sao Sebastiao dos Pocoes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3702','Sao Sebastiao dos Robertos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3703','Sao Tiago','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3704','Sao Tomas de Aquino','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3705','Sao Tome das Letras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3706','Sao Vicente','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3707','Sao Vicente da Estrela','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3708','Sao Vicente de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3709','Sao Vicente do Grama','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3710','Sao Vicente do Rio Doce','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3711','Sao Vitor','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3712','Sapucai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3713','Sapucai-Mirim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3714','Sapucaia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3715','Sapucaia de Guanhaes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3716','Sapucaia do Norte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3717','Sarandira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3718','Sardoa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3719','Sarzedo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3720','Saudade','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3721','Sem Peixe','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3722','Senador Amaral','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3723','Senador Cortes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3724','Senador Firmino','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3725','Senador Jose Bento','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3726','Senador Melo Viana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3727','Senador Modestino Goncalves','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3728','Senador Mourao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3729','Senhora da Gloria','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3730','Senhora da Penha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3731','Senhora das Dores','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3732','Senhora de Oliveira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3733','Senhora do Carmo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3734','Senhora do Porto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3735','Senhora dos Remedios','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3736','Sereno','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3737','Sericita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3738','Seritinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3739','Serra Azul','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3740','Serra Azul de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3741','Serra Bonita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3742','Serra da Canastra','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3743','Serra da Saudade','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3744','Serra das Araras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3745','Serra do Camapua','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3746','Serra do Salitre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3747','Serra dos Aimores','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3748','Serra dos Lemes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3749','Serra Nova','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3750','Serrania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3751','Serranopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3752','Serranos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3753','Serro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3754','Sertaozinho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3755','Sete Cachoeiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3756','Sete Lagoas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3757','Setubinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3758','Silva Campos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3759','Silva Xavier','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3760','Silvano','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3761','Silveira Carvalho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3762','Silveirania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3763','Silvestre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3764','Silvianopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3765','Simao Campos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3766','Simao Pereira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3767','Simonesia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3768','Sobral Pinto','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3769','Sobralia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3770','Soledade de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3771','Sopa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3772','Tabajara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3773','Tabauna','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3774','Tabuao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3775','Tabuleiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3776','Taiobeiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3777','Taparuba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3778','Tapira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3779','Tapirai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3780','Tapuirama','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3781','Taquaracu de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3782','Taruacu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3783','Tarumirim','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3784','Tebas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3785','Teixeiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3786','Tejuco','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3787','Teofilo Otoni','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3788','Terra Branca','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3789','Timoteo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3790','Tiradentes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3791','Tiros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3792','Tobati','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3793','Tocandira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3794','Tocantins','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3795','Tocos do Mogi','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3796','Toledo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3797','Tomas Gonzaga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3798','Tombos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3799','Topazio','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3800','Torneiros','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3801','Torreoes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3802','Tres Coracoes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3803','Tres Ilhas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3804','Tres Marias','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3805','Tres Pontas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3806','Trimonte','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3807','Tuiutinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3808','Tumiritinga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3809','Tupaciguara','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3810','Tuparece','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3811','Turmalina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3812','Turvolandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3813','Uba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3814','Ubai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3815','Ubaporanga','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3816','Ubari','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3817','Uberaba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3818','Uberlandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3819','Umburatiba','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3820','Umbuzeiro','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3821','Unai','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3822','Uniao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3823','Uruana','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3824','Urucania','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3825','Urucuia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3826','Usina Monte Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3827','Vai-Volta','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3828','Valadares','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3829','Valao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3830','Valo Fundo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3831','Vargem Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3832','Vargem Bonita','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3833','Vargem Grande do Rio Pardo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3834','Vargem Linda','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3835','Varginha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3836','Varjao','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3837','Varzea da Palma','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3838','Varzelandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3839','Vau-Acu','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3840','Vazante','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3841','Venda Nova','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3842','Vera Cruz de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3843','Verdelandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3844','Vereda do Paraiso','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3845','Veredas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3846','Veredinha','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3847','Verissimo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3848','Vermelho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3849','Vermelho Novo','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3850','Vermelho Velho','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3851','Vespasiano','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3852','Vicosa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3853','Vieiras','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3854','Vila Bom Jesus','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3855','Vila Costina','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3856','Vila Dom Bosco','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3857','Vila dos Anjos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3858','Vila Natalandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3859','Vila Nova de Minas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3860','Vila Nova dos Pocoes','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3861','Vila Pereira','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3862','Vilas Boas','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3863','Virgem da Lapa','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3864','Virginia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3865','Virginopolis','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3866','Virgolandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3867','Visconde do Rio Branco','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3868','Vista Alegre','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3869','Vitorinos','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3870','Volta Grande','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3871','Wenceslau Braz','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3872','Zelandia','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3873','Zito Soares','11');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3874','Agua Boa','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3875','Agua Clara','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3876','Albuquerque','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3877','Alcinopolis','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3878','Alto Sucuriu','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3879','Amambai','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3880','Amandina','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3881','Amolar','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3882','Anastacio','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3883','Anaurilandia','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3884','Angelica','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3885','Anhandui','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3886','Antonio Joao','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3887','Aparecida do Taboado','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3888','Aquidauana','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3889','Aral Moreira','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3890','Arapua','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3891','Areado','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3892','Arvore Grande','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3893','Baianopolis','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3894','Balsamo','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3895','Bandeirantes','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3896','Bataguassu','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3897','Bataipora','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3898','Baus','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3899','Bela Vista','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3900','Bocaja','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3901','Bodoquena','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3902','Bom Fim','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3903','Bonito','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3904','Boqueirao','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3905','Brasilandia','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3906','Caarapo','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3907','Cabeceira do Apa','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3908','Cachoeira','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3909','Camapua','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3910','Camisao','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3911','Campestre','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3912','Campo Grande','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3913','Capao Seco','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3914','Caracol','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3915','Carumbe','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3916','Cassilandia','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3917','Chapadao do Sul','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3918','Cipolandia','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3919','Coimbra','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3920','Congonha','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3921','Corguinho','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3922','Coronel Sapucaia','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3923','Corumba','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3924','Costa Rica','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3925','Coxim','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3926','Cristalina','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3927','Cruzaltina','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3928','Culturama','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3929','Cupins','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3930','Debrasa','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3931','Deodapolis','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3932','Dois Irmaos do Buriti','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3933','Douradina','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3934','Dourados','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3935','Eldorado','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3936','Fatima do Sul','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3937','Figueirao','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3938','Garcias','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3939','Gloria de Dourados','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3940','Guacu','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3941','Guaculandia','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3942','Guadalupe do Alto Parana','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3943','Guia Lopes da Laguna','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3944','Iguatemi','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3945','Ilha Comprida','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3946','Ilha Grande','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3947','Indaia do Sul','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3948','Indaia Grande','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3949','Indapolis','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3950','Inocencia','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3951','Ipezal','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3952','Itahum','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3953','Itapora','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3954','Itaquirai','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3955','Ivinhema','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3956','Jabuti','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3957','Jacarei','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3958','Japora','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3959','Jaraguari','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3960','Jardim','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3961','Jatei','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3962','Jauru','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3963','Juscelandia','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3964','Juti','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3965','Ladario','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3966','Lagoa Bonita','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3967','Laguna Carapa','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3968','Maracaju','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3969','Miranda','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3970','Montese','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3971','Morangas','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3972','Morraria do Sul','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3973','Morumbi','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3974','Mundo Novo','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3975','Navirai','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3976','Nhecolandia','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3977','Nioaque','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3978','Nossa Senhora de Fatima','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3979','Nova Alvorada do Sul','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3980','Nova America','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3981','Nova Andradina','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3982','Nova Esperanca','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3983','Nova Jales','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3984','Novo Horizonte do Sul','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3985','Oriente','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3986','Paiaguas','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3987','Palmeiras','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3988','Panambi','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3989','Paraiso','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3990','Paranaiba','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3991','Paranhos','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3992','Pedro Gomes','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3993','Picadinha','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3994','Pirapora','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3995','Piraputanga','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3996','Ponta Pora','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3997','Ponte Vermelha','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3998','Pontinha do Cocho','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('3999','Porto Esperanca','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4000','Porto Murtinho','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4001','Porto Vilma','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4002','Porto Xv de Novembro','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4003','Presidente Castelo','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4004','Prudencio Thomaz','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4005','Quebra Coco','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4006','Quebracho','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4007','Ribas do Rio Pardo','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4008','Rio Brilhante','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4009','Rio Negro','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4010','Rio Verde de Mato Grosso','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4011','Rochedinho','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4012','Rochedo','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4013','Sanga Puita','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4014','Santa Rita do Pardo','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4015','Santa Terezinha','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4016','Sao Gabriel do Oeste','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4017','Sao Joao do Apore','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4018','Sao Jose','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4019','Sao Jose do Sucuriu','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4020','Sao Pedro','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4022','Selviria','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4023','Sete Quedas','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4024','Sidrolandia','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4025','Sonora','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4026','Tacuru','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4027','Tamandare','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4028','Taquari','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4029','Taquarussu','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4030','Taunay','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4031','Terenos','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4032','Tres Lagoas','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4033','Velhacaria','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4034','Vicentina','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4035','Vila Formosa','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4036','Vila Marques','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4037','Vila Rica','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4038','Vila Uniao','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4039','Vila Vargas','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4040','Vista Alegre','12');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4041','Acorizal','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4042','Agua Boa','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4043','Agua Fria','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4044','Aguacu','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4045','Aguapei','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4046','Aguas Claras','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4047','Ainhumas','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4048','Alcantilado','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4049','Alta Floresta','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4050','Alto Araguaia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4051','Alto Boa Vista','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4052','Alto Coite','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4053','Alto da Boa Vista','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4054','Alto Garcas','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4055','Alto Juruena','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4056','Alto Paraguai','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4057','Alto Paraiso','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4058','Alto Taquari','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4059','Analandia do Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4060','Apiacas','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4061','Araguaiana','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4062','Araguainha','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4063','Araputanga','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4064','Arenapolis','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4065','Aripuana','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4066','Arruda','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4067','Assari','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4068','Barao de Melgaco','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4069','Barra do Bugres','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4070','Barra do Garcas','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4071','Batovi','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4072','Baus','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4073','Bauxi','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4074','Bel Rios','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4075','Bezerro Branco','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4076','Boa Esperanca','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4077','Boa Uniao','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4078','Boa Vista','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4079','Bom Sucesso','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4080','Brasnorte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4081','Buriti','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4082','Caceres','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4083','Caite','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4084','Campinapolis','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4085','Campo Novo do Parecis','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4086','Campo Verde','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4087','Campos de Julio','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4088','Campos Novos','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4089','Canabrava do Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4090','Canarana','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4091','Cangas','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4092','Capao Grande','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4093','Capao Verde','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4094','Caramujo','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4095','Caravagio','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4096','Carlinda','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4097','Cassununga','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4098','Castanheira','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4099','Catuai','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4100','Chapada dos Guimaraes','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4101','Cidade Morena','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4102','Claudia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4103','Cocalinho','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4104','Colider','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4105','Colorado do Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4106','Comodoro','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4107','Confresa','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4108','Coronel Ponce','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4109','Cotrel','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4110','Cotriguacu','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4111','Coxipo Acu','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4112','Coxipo da Ponte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4113','Coxipo do Ouro','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4114','Cristinopolis','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4115','Cristo Rei','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4116','Cuiaba','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4117','Curvelandia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4118','Del Rios','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4119','Denise','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4120','Diamantino','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4121','Dom Aquino','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4122','Engenho','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4123','Engenho Velho','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4124','Entre Rios','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4125','Estrela do Leste','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4126','Faval','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4127','Fazenda de Cima','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4128','Figueiropolis D Oeste','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4129','Filadelfia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4130','Flor da Serra','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4131','Fontanilhas','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4132','Gaucha do Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4133','General Carneiro','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4134','Gloria D\'Oeste','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4135','Guaranta do Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4136','Guarita','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4137','Guiratinga','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4138','Horizonte do Oeste','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4139','Indianapolis','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4140','Indiavai','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4141','Irenopolis','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4142','Itamarati Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4143','Itauba','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4144','Itiquira','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4145','Jaciara','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4146','Jangada','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4147','Jarudore','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4148','Jatoba','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4149','Jauru','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4150','Joselandia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4151','Juara','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4152','Juina','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4153','Juruena','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4154','Juscimeira','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4155','Lambari D\'Oeste','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4156','Lavouras','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4157','Lucas do Rio Verde','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4158','Lucialva','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4159','Luciara','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4160','Machado','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4161','Marcelandia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4162','Marzagao','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4163','Mata Dentro','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4164','Matupa','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4165','Mimoso','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4166','Mirassol D\'Oeste','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4167','Nobres','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4168','Nonoai do Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4169','Nortelandia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4170','Nossa Senhora da Guia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4171','Nossa Senhora do Livramento','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4172','Nova Alvorada','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4173','Nova Bandeirantes','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4174','Nova Brasilandia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4175','Nova Brasilia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4176','Nova Canaa do Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4177','Nova Catanduva','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4178','Nova Galileia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4179','Nova Guarita','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4180','Nova Marilandia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4181','Nova Maringa','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4182','Nova Monte Verde','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4183','Nova Mutum','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4184','Nova Olimpia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4185','Nova Ubirata','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4186','Nova Xavantina','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4187','Novo Diamantino','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4188','Novo Eldorado','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4189','Novo Horizonte do Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4190','Novo Mundo','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4191','Novo Parana','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4192','Novo Sao Joaquim','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4193','Padronal','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4194','Pai Andre','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4195','Paraiso do Leste','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4196','Paranaita','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4197','Paranatinga','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4198','Passagem da Conceicao','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4199','Pedra Preta','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4200','Peixoto de Azevedo','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4201','Pirizal','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4202','Placa de Santo Antonio','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4203','Planalto da Serra','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4204','Pocone','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4205','Pombas','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4206','Pontal do Araguaia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4207','Ponte Branca','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4208','Ponte de Pedra','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4209','Pontes e Lacerda','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4210','Pontinopolis','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4211','Porto Alegre do Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4212','Porto dos Gauchos','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4213','Porto Esperidiao','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4214','Porto Estrela','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4215','Poxoreo','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4216','Praia Rica','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4217','Primavera','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4218','Primavera do Leste','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4219','Progresso','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4220','Querencia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4221','Rancharia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4222','Reserva do Cabacal','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4223','Ribeirao Cascalheira','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4224','Ribeirao dos Cocais','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4225','Ribeiraozinho','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4226','Rio Branco','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4227','Rio Manso','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4228','Riolandia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4229','Rondonopolis','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4230','Rosario Oeste','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4231','Salto do Ceu','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4232','Sangradouro','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4233','Santa Carmem','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4234','Santa Elvira','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4235','Santa Fe','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4236','Santa Rita','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4237','Santa Terezinha','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4238','Santaninha','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4239','Santo Afonso','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4240','Santo Antonio do Leverger','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4241','Santo Antonio do Rio Bonito','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4242','Sao Cristovao','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4243','Sao Domingos','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4244','Sao Felix do Araguaia','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4245','Sao Joaquim','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4246','Sao Jorge','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4247','Sao Jose','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4248','Sao Jose do Apui','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4249','Sao Jose do Planalto','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4250','Sao Jose do Povo','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4251','Sao Jose do Rio Claro','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4252','Sao Jose do Xingu','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4253','Sao Jose dos Quatro Marcos','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4254','Sao Lourenco de Fatima','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4255','Sao Pedro da Cipa','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4256','Sao Vicente','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4257','Selma','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4258','Serra Nova','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4259','Sinop','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4260','Sonho Azul','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4261','Sorriso','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4262','Sumidouro','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4263','Tabapora','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4264','Tangara da Serra','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4265','Tapirapua','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4266','Tapurah','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4267','Terra Nova do Norte','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4268','Terra Roxa','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4269','Tesouro','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4270','Toricueyje','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4271','Torixoreu','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4272','Tres Pontes','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4273','Vale dos Sonhos','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4274','Vale Rico','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4275','Varginha','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4276','Varzea Grande','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4277','Vera','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4278','Vila Atlantica','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4279','Vila Bela da Santissima Trinda','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4280','Vila Bueno','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4281','Vila Mutum','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4282','Vila Operaria','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4283','Vila Paulista','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4284','Vila Progresso','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4285','Vila Rica','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4286','Vila Santo Antonio','13');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4287','Abaetetuba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4288','Abel Figueiredo','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4289','Acara','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4290','Afua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4291','Agropolis Bela Vista','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4292','Agua Azul do Norte','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4293','Agua Fria','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4294','Alenquer','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4295','Algodoal','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4296','Almeirim','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4297','Almoco','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4298','Alta Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4299','Altamira','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4300','Alter do Chao','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4301','Alvorada','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4302','Americano','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4303','Anajas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4304','Ananindeua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4305','Antonio Lemos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4306','Apeu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4307','Apinages','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4308','Arapixuna','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4309','Araquaim','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4310','Arco-Iris','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4311','Areias','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4312','Arumanduba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4313','Aruri','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4314','Aturiai','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4315','Augusto Correa','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4316','Aurora do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4317','Aveiro','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4318','Bagre','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4319','Baiao','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4320','Barcarena','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4321','Barreira Branca','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4322','Barreira dos Campos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4323','Barreiras','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4324','Baturite','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4325','Beja','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4326','Bela Vista do Caracol','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4327','Belem','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4328','Belterra','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4329','Benevides','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4330','Benfica','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4331','Boa Esperanca','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4332','Boa Fe','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4333','Boa Sorte','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4334','Boa Vista do Iririteua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4335','Boim','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4336','Bom Jardim','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4337','Bom Jesus do Tocantins','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4338','Bonito','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4339','Braganca','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4340','Brasil Novo','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4341','Brasilia Legal','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4342','Brejo do Meio','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4343','Brejo Grande do Araguaia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4344','Breu Branco','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4345','Breves','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4346','Bujaru','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4347','Cachoeira do Arari','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4348','Cafezal','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4349','Cairari','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4350','Caju','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4351','Camara do Marajo','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4352','Cambuquira','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4353','Cameta','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4354','Camiranga','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4355','Capanema','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4356','Capitao Poco','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4357','Caracara do Arari','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4358','Carajas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4359','Carapajo','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4360','Caraparu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4361','Caratateua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4362','Caripi','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4363','Carrazedo','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4364','Castanhal','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4365','Castelo dos Sonhos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4366','Chaves','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4367','Colares','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4368','Conceicao','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4369','Conceicao do Araguaia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4370','Concordia do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4371','Condeixa','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4372','Coqueiro','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4373','Cripurizao','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4374','Cripuriznho','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4375','Cuiu-Cuiu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4376','Cumaru do Norte','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4377','Curionopolis','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4378','Curralinho','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4379','Curua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4380','Curuai','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4381','Curuca','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4382','Curucambaba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4383','Curumu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4384','Dom Elizeu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4385','Eldorado dos Carajas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4386','Emborai','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4387','Espirito Santo do Taua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4388','Faro','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4389','Fernandes Belo','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4390','Flexal','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4391','Floresta','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4392','Garrafao do Norte','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4393','Goianesia do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4394','Gradaus','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4395','Guajara-Acu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4396','Guajara-Miri','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4397','Gurupa','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4398','Gurupizinho','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4399','Hidreletrica Tucurui','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4400','Iatai','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4401','Icoraci','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4402','Igarape da Lama','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4403','Igarape-Acu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4404','Igarape-Miri','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4405','Inanu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4406','Inhangapi','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4407','Ipixuna do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4408','Irituia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4409','Itaituba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4410','Itapixuna','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4411','Itatupa','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4412','Itupiranga','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4413','Jacareacanga','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4414','Jacunda','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4415','Jaguarari','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4416','Jamanxinzinho','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4417','Jambuacu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4418','Jandiai','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4419','Japerica','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4420','Joana Coeli','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4421','Joana Peres','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4422','Joanes','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4423','Juaba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4424','Jubim','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4425','Juruti','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4426','Km 19','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4427','Km 26','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4428','Lauro Sodre','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4429','Ligacao do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4430','Limoeiro do Ajuru','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4431','Mae do Rio','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4432','Magalhaes Barata','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4433','Maiauata','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4434','Manjeiro','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4435','Maraba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4436','Maracana','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4437','Marajoara','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4438','Marapanim','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4439','Marituba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4440','Maruda','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4441','Mata Geral','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4442','Matapiquara','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4443','Medicilandia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4444','Melgaco','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4445','Menino Deus do Anapu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4446','Meruu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4447','Mirasselvas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4448','Miritituba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4449','Mocajuba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4450','Moiraba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4451','Moju','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4452','Monsaras','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4453','Monte Alegre','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4454','Monte Alegre do Mau','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4455','Monte Dourado','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4456','Morada Nova','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4457','Mosqueiro','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4458','Muana','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4459','Mujui dos Campos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4460','Muraja','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4461','Murucupi','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4462','Murumuru','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4463','Muta','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4464','Mutucal','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4465','Nazare de Mocajuba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4466','Nazare dos Patos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4467','Nova Esperanca do Piria','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4468','Nova Mocajuba','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4469','Nova Timboteua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4470','Novo Planalto','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4471','Novo Progresso','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4472','Novo Repartimento','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4473','Nucleo Urbano Quilometro 30','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4474','Obidos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4475','Oeiras do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4476','Oriximina','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4477','Osvaldilandia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4478','Otelo','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4479','Ourem','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4480','Ourilandia do Norte','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4481','Outeiro','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4482','Pacaja','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4483','Pacoval','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4484','Palestina do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4485','Paragominas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4486','Paratins','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4487','Parauapebas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4488','Pau D\'Arco','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4489','Pedreira','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4490','Peixe-Boi','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4491','Penhalonga','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4492','Perseveranca','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4493','Pesqueiro','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4494','Piabas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4495','Picarra','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4496','Pinhal','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4497','Piraquara','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4498','Piria','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4499','Ponta de Pedras','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4500','Ponta de Ramos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4501','Portel','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4502','Porto de Moz','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4503','Porto Salvo','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4504','Porto Trombetas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4505','Prainha','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4506','Primavera','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4507','Quatipuru','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4508','Quatro Bocas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4509','Redencao','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4510','Remansao','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4511','Repartimento','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4512','Rio Maria','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4513','Rio Vermelho','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4514','Riozinho','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4515','Rondon do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4516','Ruropolis','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4517','Salinopolis','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4518','Salvaterra','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4519','Santa Barbara do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4520','Santa Cruz do Arari','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4521','Santa Isabel do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4522','Santa Luzia do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4523','Santa Maria','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4524','Santa Maria das Barreiras','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4525','Santa Maria do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4526','Santa Rosa da Vigia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4527','Santa Terezinha','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4528','Santana do Araguaia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4529','Santarem','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4530','Santarem Novo','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4531','Santo Antonio','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4532','Santo Antonio do Taua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4533','Sao Caetano de Odivelas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4534','Sao Domingos do Araguaia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4535','Sao Domingos do Capim','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4536','Sao Felix do Xingu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4537','Sao Francisco','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4538','Sao Francisco da Jararaca','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4539','Sao Francisco do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4540','Sao Geraldo do Araguaia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4541','Sao Joao da Ponta','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4542','Sao Joao de Pirabas','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4543','Sao Joao do Acangata','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4544','Sao Joao do Araguaia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4545','Sao Joao do Piria','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4546','Sao Joao dos Ramos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4547','Sao Joaquim do Tapara','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4548','Sao Jorge','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4549','Sao Jose do Gurupi','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4550','Sao Jose do Piria','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4551','Sao Luiz do Tapajos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4552','Sao Miguel do Guama','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4553','Sao Miguel dos Macacos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4554','Sao Pedro de Viseu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4555','Sao Pedro do Capim','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4556','Sao Raimundo de Borralhos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4557','Sao Raimundo do Araguaia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4558','Sao Raimundo dos Furtados','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4559','Sao Roberto','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4560','Sao Sebastiao da Boa Vista','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4561','Sao Sebastiao de Vicosa','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4562','Sapucaia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4563','Senador Jose Porfirio','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4564','Serra Pelada','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4565','Soure','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4566','Tailandia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4567','Tatuteua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4568','Tauari','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4569','Tauarizinho','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4570','Tentugal','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4571','Terra Alta','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4572','Terra Santa','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4573','Tijoca','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4574','Timboteua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4575','Tome-Acu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4576','Tracuateua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4577','Trairao','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4578','Tucuma','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4579','Tucurui','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4580','Ulianopolis','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4581','Uruara','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4582','Urucuri','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4583','Urucuriteua','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4584','Val-De-Caes','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4585','Veiros','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4586','Vigia','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4587','Vila do Carmo do Tocantins','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4588','Vila dos Cabanos','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4589','Vila Franca','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4590','Vila Goreth','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4591','Vila Isol','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4592','Vila Nova','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4593','Vila Planalto','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4594','Vila Santa Fe','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4595','Vila Socorro','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4596','Vilarinho do Monte','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4597','Viseu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4598','Vista Alegre','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4599','Vista Alegre do Para','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4600','Vitoria do Xingu','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4601','Xinguara','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4602','Xinguarinha','14');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4603','Agua Branca','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4604','Aguiar','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4605','Alagoa Grande','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4606','Alagoa Nova','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4607','Alagoinha','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4608','Alcantil','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4609','Algodao','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4610','Alhandra','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4611','Amparo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4612','Aparecida','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4613','Aracagi','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4614','Arara','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4615','Araruna','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4616','Areia','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4617','Areia de Barauna','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4618','Areial','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4619','Areias','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4620','Aroeiras','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4621','Assuncao','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4622','Baia da Traicao','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4623','Balancos','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4624','Bananeiras','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4625','Baraunas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4626','Barra de Santa Rosa','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4627','Barra de Sao Miguel','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4628','Barra do Camaratuba','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4629','Bayeux','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4630','Belem','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4631','Belem do Brejo do Cruz','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4632','Bernardino Batista','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4633','Boa Ventura','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4634','Boa Vista','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4635','Bodocongo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4636','Bom Jesus','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4637','Bom Sucesso','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4638','Bonito de Santa Fe','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4639','Boqueirao','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4640','Borborema','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4641','Brejo do Cruz','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4642','Brejo dos Santos','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4643','Caapora','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4644','Cabaceiras','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4645','Cabedelo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4646','Cachoeira','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4647','Cachoeira dos Indios','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4648','Cachoeirinha','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4649','Cacimba de Areia','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4650','Cacimba de Dentro','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4651','Caicara','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4652','Cajazeiras','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4653','Cajazeirinha','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4654','Caldas Brandao','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4655','Camalau','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4656','Campina Grande','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4657','Campo Alegre','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4658','Campo Grande','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4659','Camurupim','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4660','Caraubas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4661','Cardoso','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4662','Carrapateira','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4663','Casinha do Homem','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4664','Catingueira','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4665','Catole','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4666','Catole do Rocha','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4667','Caturite','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4668','Cepilho','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4669','Conceicao','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4670','Condado','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4671','Conde','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4672','Congo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4673','Coremas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4674','Coronel Maia','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4675','Coxixola','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4676','Cruz do Espirito Santo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4677','Cubati','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4678','Cuite','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4679','Cuite de Mamanguape','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4680','Cuitegi','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4681','Cupissura','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4682','Curral de Cima','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4683','Curral Velho','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4684','Desterro','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4685','Diamante','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4686','Dona Ines','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4687','Duas Estradas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4688','Emas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4689','Engenheiro Avidos','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4690','Esperanca','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4691','Fagundes','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4692','Fatima','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4693','Fazenda Nova','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4694','Forte Velho','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4695','Frei Martinho','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4696','Gado Bravo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4697','Galante','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4698','Guarabira','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4699','Guarita','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4700','Gurinhem','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4701','Gurjao','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4702','Ibiara','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4703','Igaracy','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4704','Imaculada','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4705','Inga','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4706','Itabaiana','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4707','Itajubatiba','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4708','Itaporanga','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4709','Itapororoca','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4710','Itatuba','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4711','Jacarau','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4712','Jerico','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4713','Joao Pessoa','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4714','Juarez Tavora','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4715','Juazeirinho','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4716','Junco do Serido','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4717','Juripiranga','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4718','Juru','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4719','Lagoa','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4720','Lagoa de Dentro','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4721','Lagoa Seca','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4722','Lastro','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4723','Lerolandia','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4724','Livramento','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4725','Logradouro','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4726','Lucena','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4727','Mae D\'Agua','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4728','Maia','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4729','Malta','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4730','Mamanguape','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4731','Manaira','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4732','Marcacao','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4733','Mari','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4734','Marizopolis','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4735','Massaranduba','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4736','Mata Limpa','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4737','Mata Virgem','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4738','Mataraca','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4739','Matinhas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4740','Matureia','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4741','Melo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4742','Mogeiro','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4743','Montadas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4744','Monte Horebe','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4745','Monteiro','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4746','Montevideo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4747','Mulungu','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4748','Muquem','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4749','Natuba','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4750','Nazare','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4751','Nazarezinho','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4752','Nossa Senhora do Livramento','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4753','Nova Floresta','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4754','Nova Olinda','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4755','Nova Palmeira','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4756','Nucleo N 2','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4757','Nucleo N 3','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4758','Odilandia','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4759','Olho D\'Agua','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4760','Olho D\'Agua de Capim','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4761','Olivedos','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4762','Ouro Velho','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4763','Parari','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4764','Passagem','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4765','Patos','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4766','Paulista','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4767','Pedra Branca','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4768','Pedra Lavrada','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4769','Pedras de Fogo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4770','Pelo Sinal','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4771','Pereiros','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4772','Pianco','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4773','Picui','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4774','Pilar','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4775','Piloes','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4776','Piloezinhos','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4777','Pindurao','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4778','Pio X','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4779','Piraua','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4780','Pirpirituba','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4781','Pitanga de Estrada','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4782','Pitimbu','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4783','Pocinhos','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4784','Poco','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4785','Poco Dantas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4786','Pombal','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4787','Porteirinha de Pedra','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4788','Prata','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4789','Princesa Isabel','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4790','Puxinana','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4791','Queimadas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4792','Quixaba','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4793','Remigio','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4794','Riachao','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4795','Riachao do Bacamarte','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4796','Riacho de Santo Antonio','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4797','Riacho dos Cavalos','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4798','Ribeira','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4799','Rio Tinto','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4800','Rua Nova','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4801','Salema','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4802','Salgadinho','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4803','Salgado de Sao Felix','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4804','Santa Cecilia','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4805','Santa Cruz','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4806','Santa Gertrudes','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4807','Santa Helena','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4808','Santa Luzia','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4809','Santa Luzia do Cariri','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4810','Santa Maria','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4811','Santa Rita','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4812','Santa Teresinha','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4813','Santa Terezinha','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4814','Santana de Mangueira','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4815','Santana dos Garrotes','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4816','Santo Andre','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4817','Sao Bento','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4818','Sao Domingos','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4819','Sao Francisco','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4820','Sao Goncalo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4821','Sao Joao Bosco','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4822','Sao Joao do Cariri','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4823','Sao Joao do Rio do Peixe','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4824','Sao Joao do Tigre','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4825','Sao Jose','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4826','Sao Jose da Lagoa Tapada','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4827','Sao Jose da Mata','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4828','Sao Jose de Caiana','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4829','Sao Jose de Espinharas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4830','Sao Jose de Marimbas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4831','Sao Jose de Piranhas','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4832','Sao Jose do Bonfim','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4833','Sao Jose do Pilar','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4834','Sao Jose do Sabugi','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4835','Sao Jose dos Cordeiros','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4836','Sao Mamede','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4837','Sao Miguel de Taipu','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4838','Sao Pedro','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4839','Sao Sebastiao de Lagoa de Roca','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4840','Sao Sebastiao do Umbuzeiro','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4841','Sao Vicente do Serido Ou Serid','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4842','Sape','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4843','Serido','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4844','Serra Branca','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4845','Serra da Raiz','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4846','Serra Grande','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4847','Serra Redonda','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4848','Serraria','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4849','Sertaozinho','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4850','Sobrado','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4851','Solanea','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4852','Soledade','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4853','Sossego','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4854','Sousa','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4855','Sucuru','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4856','Sume','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4857','Tacima','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4858','Tambau','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4859','Tambauzinho','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4860','Taperoa','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4861','Tavares','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4862','Teixeira','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4863','Tenorio','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4864','Triunfo','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4865','Uirauna','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4866','Umari','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4867','Umbuzeiro','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4868','Varzea','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4869','Varzea Comprida','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4870','Varzea Nova','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4871','Vazante','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4872','Vieiropolis','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4873','Vista Serrana','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4874','Zabele','15');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4875','Abreu e Lima','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4876','Afogados da Ingazeira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4877','Afranio','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4878','Agrestina','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4879','Agua Fria','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4880','Agua Preta','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4881','Aguas Belas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4882','Airi','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4883','Alagoinha','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4884','Albuquerque Ne','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4885','Algodoes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4886','Alianca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4887','Altinho','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4888','Amaraji','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4889','Ameixas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4890','Angelim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4891','Apoti','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4892','Aracoiaba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4893','Araripina','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4894','Arcoverde','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4895','Aripibu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4896','Arizona','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4897','Barra de Farias','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4898','Barra de Guabiraba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4899','Barra de Sao Pedro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4900','Barra do Brejo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4901','Barra do Chata','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4902','Barra do Jardim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4903','Barra do Riachao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4904','Barra do Sirinhaem','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4905','Barreiros','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4906','Batateira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4907','Belem de Maria','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4908','Belem de Sao Francisco','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4909','Belo Jardim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4910','Bengalas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4911','Bentivi','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4912','Bernardo Vieira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4913','Betania','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4914','Bezerros','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4915','Bizarra','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4916','Boas Novas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4917','Bodoco','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4918','Bom Conselho','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4919','Bom Jardim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4920','Bom Nome','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4921','Bonfim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4922','Bonito','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4923','Brejao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4924','Brejinho','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4925','Brejo da Madre de Deus','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4926','Buenos Aires','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4927','Buique','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4928','Cabanas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4929','Cabo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4930','Cabrobo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4931','Cachoeira do Roberto','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4932','Cachoeirinha','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4933','Caetes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4934','Caicarinha da Penha','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4935','Calcado','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4936','Caldeiroes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4937','Calumbi','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4938','Camaragibe','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4939','Camela','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4940','Camocim de Sao Felix','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4941','Camutanga','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4942','Canaa','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4943','Canhotinho','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4944','Capoeiras','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4945','Caraiba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4946','Caraibeiras','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4947','Carapotos','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4948','Carice','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4949','Carima','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4950','Caririmirim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4951','Carnaiba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4952','Carnaubeira da Penha','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4953','Carneiro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4954','Carpina','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4955','Carqueja','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4956','Caruaru','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4957','Casinhas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4958','Catende','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4959','Catimbau','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4960','Cavaleiro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4961','Cedro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4962','Cha de Alegria','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4963','Cha do Rocha','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4964','Cha Grande','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4965','Cimbres','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4966','Clarana','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4967','Cocau','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4968','Conceicao das Crioulas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4969','Condado','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4970','Correntes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4971','Cortes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4972','Couro D\'Antas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4973','Cristalia','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4974','Cruanji','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4975','Cruzes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4976','Cuiambuca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4977','Cumaru','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4978','Cupira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4979','Curral Queimado','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4980','Custodia','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4981','Dois Leoes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4982','Dormentes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4983','Entroncamento','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4984','Escada','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4985','Espirito Santo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4986','Exu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4987','Fazenda Nova','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4988','Feira Nova','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4989','Feitoria','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4990','Fernando de Noronha','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4991','Ferreiros','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4992','Flores','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4993','Floresta','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4994','Frei Miguelinho','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4995','Frexeiras','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4996','Gameleira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4997','Garanhuns','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4998','Gloria do Goita','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('4999','Goiana','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5000','Goncalves Ferreira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5001','Granito','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5002','Gravata','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5003','Gravata do Ibiapina','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5004','Grotao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5005','Guanumbi','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5006','Henrique Dias','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5007','Iateca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5008','Iati','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5009','Ibimirim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5010','Ibirajuba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5011','Ibiranga','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5012','Ibiratinga','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5013','Ibitiranga','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5014','Ibo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5015','Icaicara','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5016','Igapo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5017','Igarapeassu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5018','Igarapeba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5019','Igarassu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5020','Iguaraci','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5021','Inaja','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5022','Ingazeira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5023','Ipojuca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5024','Ipubi','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5025','Ipuera','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5026','Iraguacu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5027','Irajai','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5028','Iratama','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5029','Itacuruba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5030','Itaiba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5031','Itamaraca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5032','Itambe','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5033','Itapetim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5034','Itapissuma','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5035','Itaquitinga','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5036','Ituguacu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5037','Iuitepora','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5038','Jabitaca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5039','Jaboatao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5040','Jaboatao dos Guararapes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5041','Japecanga','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5042','Jaqueira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5043','Jatauba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5044','Jatiuca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5045','Jenipapo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5046','Joao Alfredo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5047','Joaquim Nabuco','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5048','Jose da Costa','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5049','Jose Mariano','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5050','Jucaral','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5051','Jucati','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5052','Jupi','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5053','Jurema','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5054','Jutai','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5055','Lagoa','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5056','Lagoa de Sao Jose','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5057','Lagoa do Barro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5058','Lagoa do Carro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5059','Lagoa do Itaenga','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5060','Lagoa do Ouro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5061','Lagoa do Souza','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5062','Lagoa dos Gatos','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5063','Lagoa Grande','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5064','Laje de Sao Jose','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5065','Laje Grande','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5066','Lajedo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5067','Lajedo do Cedro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5068','Limoeiro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5069','Livramento do Tiuma','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5070','Luanda','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5071','Macaparana','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5072','Machados','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5073','Macuje','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5074','Manari','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5075','Mandacaia','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5076','Mandacaru','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5077','Manicoba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5078','Maraial','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5079','Maravilha','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5080','Mimoso','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5081','Miracica','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5082','Mirandiba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5083','Morais','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5084','Moreilandia','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5085','Moreno','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5086','Moxoto','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5087','Mulungu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5088','Murupe','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5089','Mutuca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5090','Nascente','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5091','Navarro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5092','Nazare da Mata','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5093','Nossa Senhora da Luz','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5094','Nossa Senhora do Carmo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5095','Nossa Senhora do O','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5096','Nova Cruz','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5097','Olho D\'Agua de Dentro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5098','Olinda','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5099','Ori','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5100','Orobo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5101','Oroco','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5102','Ouricuri','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5103','Pajeu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5104','Palmares','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5105','Palmeirina','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5106','Panelas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5107','Pao de Acucar','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5108','Pao de Acucar do Pocao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5109','Papagaio','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5110','Paquevira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5111','Para','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5112','Paranatama','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5113','Paratibe','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5114','Parnamirim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5115','Passagem do To','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5116','Passira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5117','Pau Ferro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5118','Paudalho','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5119','Paulista','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5120','Pedra','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5121','Perpetuo Socorro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5122','Pesqueira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5123','Petrolandia','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5124','Petrolina','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5125','Pirituba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5126','Pocao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5127','Pocao de Afranio','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5128','Poco Comprido','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5129','Poco Fundo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5130','Pombos','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5131','Pontas de Pedra','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5132','Ponte dos Carvalhos','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5133','Praia da Conceicao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5134','Primavera','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5135','Quipapa','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5136','Quitimbu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5137','Quixaba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5138','Rainha Isabel','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5139','Rajada','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5140','Rancharia','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5141','Recife','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5142','Riacho das Almas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5143','Riacho do Meio','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5144','Riacho Fechado','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5145','Riacho Pequeno','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5146','Ribeirao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5147','Rio da Barra','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5148','Rio Formoso','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5149','Saire','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5150','Salgadinho','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5151','Salgueiro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5152','Saloa','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5153','Salobro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5154','Sanharo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5155','Santa Cruz','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5156','Santa Cruz da Baixa Verde','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5157','Santa Cruz do Capibaribe','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5158','Santa Filomena','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5159','Santa Maria da Boa Vista','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5160','Santa Maria do Cambuca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5161','Santa Rita','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5162','Santa Terezinha','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5163','Santana de Sao Joaquim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5164','Santo Agostinho','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5165','Santo Antonio das Queimadas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5166','Santo Antonio dos Palmares','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5167','Sao Benedito do Sul','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5168','Sao Bento do Una','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5169','Sao Caetano do Navio','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5170','Sao Caitano','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5171','Sao Domingos','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5172','Sao Joao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5173','Sao Joaquim do Monte','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5174','Sao Jose','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5175','Sao Jose da Coroa Grande','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5176','Sao Jose do Belmonte','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5177','Sao Jose do Egito','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5178','Sao Lazaro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5179','Sao Lourenco da Mata','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5180','Sao Pedro','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5181','Sao Vicente','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5182','Sao Vicente Ferrer','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5183','Sapucarana','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5184','Saue','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5185','Serra Branca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5186','Serra do Vento','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5187','Serra Talhada','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5188','Serrita','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5189','Serrolandia','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5190','Sertania','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5191','Sertaozinho de Baixo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5192','Siriji','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5193','Sirinhaem','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5194','Sitio dos Nunes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5195','Solidao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5196','Surubim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5197','Tabira','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5198','Tabocas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5199','Tacaimbo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5200','Tacaratu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5201','Tamandare','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5202','Tamboata','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5203','Tapiraim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5204','Taquaritinga do Norte','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5205','Tara','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5206','Tauapiranga','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5207','Tejucupapo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5208','Terezinha','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5209','Terra Nova','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5210','Timbauba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5211','Timorante','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5212','Toritama','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5213','Tracunhaem','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5214','Trapia','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5215','Tres Ladeiras','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5216','Trindade','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5217','Triunfo','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5218','Tupanaci','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5219','Tupanatinga','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5220','Tupaoca','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5221','Tuparetama','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5222','Umas','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5223','Umburetama','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5224','Upatininga','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5225','Urimama','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5226','Urucu-Mirim','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5227','Urucuba','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5228','Vasques','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5229','Veneza','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5230','Venturosa','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5231','Verdejante','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5232','Vertente do Lerio','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5233','Vertentes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5234','Vicencia','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5235','Viracao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5236','Vitoria de Santo Antao','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5237','Volta','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5238','Xexeu','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5239','Xucuru','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5240','Ze Gomes','16');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5241','Agricolandia','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5242','Agua Branca','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5243','Alagoinha do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5244','Alegrete do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5245','Alto Longa','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5246','Altos','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5247','Amarante','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5248','Angical do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5249','Anisio de Abreu','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5250','Antonio Almeida','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5251','Aroazes','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5252','Arraial','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5253','Avelino Lopes','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5254','Baixa Grande do Ribeiro','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5255','Barras','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5256','Barreiras do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5257','Barro Duro','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5258','Batalha','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5259','Beneditinos','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5260','Bertolinia','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5261','Bocaina','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5262','Bom Jesus','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5263','Bom Principio do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5264','Bonfim do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5265','Brasileira','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5266','Buriti dos Lopes','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5267','Buriti dos Montes','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5268','Cabeceiras do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5269','Caldeirao Grande do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5270','Campinas do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5271','Campo Maior','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5272','Canavieira','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5273','Canto do Buriti','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5274','Capitao de Campos','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5275','Caracol','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5276','Castelo do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5277','Cocal','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5278','Coivaras','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5279','Colonia do Gurgueia','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5280','Colonia do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5281','Conceicao do Caninde','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5282','Coronel Jose Dias','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5283','Corrente','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5284','Cristalandia do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5285','Cristino Castro','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5286','Curimata','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5287','Demerval Lobao','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5288','Dirceu Arcoverde','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5289','Dom Expedito Lopes','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5290','Dom Inocencio','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5291','Domingos Mourao','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5292','Elesbao Veloso','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5293','Eliseu Martins','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5294','Esperantina','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5295','Fartura do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5296','Flores do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5297','Floriano','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5298','Francinopolis','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5299','Francisco Ayres','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5300','Francisco Santos','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5301','Fronteiras','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5302','Gilbues','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5303','Guadalupe','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5304','Hugo Napoleao','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5305','Inhuma','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5306','Ipiranga do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5307','Isaias Coelho','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5308','Itainopolis','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5309','Itaueira','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5310','Jacobina do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5311','Jaicos','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5312','Jardim do Mulato','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5313','Jerumenha','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5314','Joaquim Pires','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5315','Jose de Freitas','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5316','Lagoa Alegre','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5317','Lagoa do Barro do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5318','Landri Sales','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5319','Luis Correia','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5320','Luzilandia','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5321','Manoel Emidio','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5322','Marcolandia','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5323','Marcos Parente','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5324','Matias Olimpio','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5325','Miguel Alves','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5326','Miguel Leao','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5327','Monsenhor Gil','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5328','Monsenhor Hipolito','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5329','Monte Alegre do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5330','Nazare do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5331','Nossa Senhora dos Remedios','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5332','Novo Nilo','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5333','Novo Oriente do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5334','Oeiras','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5335','Padre Marcos','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5336','Paes Landim','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5337','Palmeira do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5338','Palmeirais','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5339','Parnagua','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5340','Parnaiba','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5341','Passagem Franca do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5342','Patos do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5343','Paulistana','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5344','Pedro Ii','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5345','Picos','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5346','Pimenteiras','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5347','Pio Ix','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5348','Piracuruca','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5349','Piripiri','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5350','Porto','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5351','Prata do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5352','Queimada Nova','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5353','Redencao do Gurgueia','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5354','Regeneracao','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5355','Ribeiro Goncalves','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5356','Rio Grande do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5357','Santa Cruz do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5358','Santa Cruz dos Milagres','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5359','Santa Filomena','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5360','Santa Luz','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5361','Santa Rosa do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5362','Santana do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5363','Santo Antonio de Lisboa','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5364','Santo Inacio do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5365','Sao Braz do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5366','Sao Felix do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5367','Sao Francisco do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5368','Sao Goncalo do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5369','Sao Joao da Canabrava','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5370','Sao Joao da Serra','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5371','Sao Joao do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5372','Sao Jose do Divino','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5373','Sao Jose do Peixe','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5374','Sao Jose do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5375','Sao Juliao','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5376','Sao Lourenco do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5377','Sao Miguel do Tapuio','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5378','Sao Pedro do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5379','Sao Raimundo Nonato','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5380','Sigefredo Pacheco','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5381','Simoes','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5382','Simplicio Mendes','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5383','Socorro do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5384','Teresina','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5385','Uniao','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5386','Urucui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5387','Valenca do Piaui','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5388','Varzea Branca','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5389','Varzea Grande','17');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5390','Abapa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5391','Abatia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5392','Acampamento das Minas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5393','Acungui','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5394','Adhemar de Barros','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5395','Adrianopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5396','Agostinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5397','Agua Azul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5398','Agua Boa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5399','Agua Branca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5400','Agua do Boi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5401','Agua Mineral','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5402','Agua Vermelha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5403','Agudos do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5404','Alecrim','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5405','Alexandra','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5406','Almirante Tamandare','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5407','Altamira do Parana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5408','Altaneira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5409','Alto Alegre','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5410','Alto Alegre do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5411','Alto Amparo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5412','Alto do Amparo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5413','Alto Para','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5414','Alto Parana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5415','Alto Piquiri','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5416','Alto Pora','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5417','Alto Sabia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5418','Alto Santa Fe','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5419','Alto Sao Joao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5420','Altonia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5421','Alvorada do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5422','Alvorada do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5423','Amapora','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5424','Amorinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5425','Ampere','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5426','Anahy','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5427','Andira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5428','Andorinhas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5429','Angai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5430','Angulo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5431','Antas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5432','Antonina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5433','Antonio Brandao de Oliveira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5434','Antonio Olinto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5435','Anunciacao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5436','Aparecida do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5437','Apiaba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5438','Apucarana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5439','Apucaraninha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5440','Aquidaban','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5441','Aranha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5442','Arapongas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5443','Arapoti','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5444','Arapuan','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5445','Ararapira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5446','Araruna','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5447','Araucaria','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5448','Areia Branca dos Assis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5449','Areias','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5450','Aricanduva','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5451','Ariranha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5452','Aroeira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5453','Arquimedes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5454','Assai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5455','Assis Chateaubriand','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5456','Assunguizinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5457','Astorga','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5458','Atalaia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5459','Aurora do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5460','Bairro Cachoeira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5461','Bairro do Felisberto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5462','Bairro Limoeiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5463','Balsa Nova','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5464','Bandeirantes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5465','Bandeirantes D\'Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5466','Banhado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5467','Barao de Lucena','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5468','Barbosa Ferraz','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5469','Barra Bonita','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5470','Barra do Jacare','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5471','Barra do Pitangui','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5472','Barra Grande','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5473','Barra Mansa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5474','Barra Santa Salete','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5475','Barracao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5476','Barrancos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5477','Barras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5478','Barreirinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5479','Barreiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5480','Barreiro das Frutas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5481','Barreiros','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5482','Barrinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5483','Barro Preto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5484','Bateias','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5485','Baulandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5486','Bela Vista','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5487','Bela Vista do Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5488','Bela Vista do Paraiso','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5489','Bela Vista do Piquiri','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5490','Bela Vista do Tapiracui','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5491','Bentopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5492','Bernardelli','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5493','Betaras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5494','Bituruna','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5495','Boa Esperanca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5496','Boa Esperanca do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5497','Boa Ventura','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5498','Boa Vista','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5499','Boa Vista da Aparecida','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5500','Bocaina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5501','Bocaiuva do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5502','Bom Jardim do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5503','Bom Jesus do Barracao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5504','Bom Progresso','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5505','Bom Retiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5506','Bom Sucesso','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5507','Bom Sucesso do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5508','Boqueirao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5509','Borda do Campo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5510','Borman','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5511','Borrazopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5512','Botuquara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5513','Bourbonia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5514','Braganey','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5515','Bragantina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5516','Brasilandia do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5517','Bugre','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5518','Bulcao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5519','Cabrito','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5520','Cacatu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5521','Cachoeira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5522','Cachoeira de Cima','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5523','Cachoeira de Sao Jose','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5524','Cachoeira do Espirito Santo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5525','Cachoeirinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5526','Cadeadinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5527','Caetano Mendes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5528','Cafeara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5529','Cafeeiros','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5530','Cafelandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5531','Cafezal do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5532','Caita','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5533','Caixa Prego','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5534','California','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5535','Calogeras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5536','Cambara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5537','Cambe','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5538','Cambiju','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5539','Cambira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5540','Campestrinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5541','Campina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5542','Campina da Lagoa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5543','Campina do Miranguava','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5544','Campina do Simao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5545','Campina dos Furtados','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5546','Campina Grande do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5547','Campinas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5548','Campo Bonito','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5549','Campo do Meio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5550','Campo do Tenente','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5551','Campo Largo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5552','Campo Largo da Roseira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5553','Campo Magro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5554','Campo Mourao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5555','Campo Novo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5556','Candido de Abreu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5557','Candoi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5558','Canela','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5559','Canoas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5560','Cantagalo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5561','Canzianopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5562','Capanema','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5563','Capao Alto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5564','Capao Bonito','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5565','Capao da Lagoa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5566','Capao Grande','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5567','Capao Rico','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5568','Capitao Leonidas Marques','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5569','Capivara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5570','Capoeirinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5571','Cara Pintado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5572','Cara-Cara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5573','Caraja','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5574','Carambei','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5575','Caramuru','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5576','Caratuva','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5577','Carazinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5578','Carbonera','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5579','Carlopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5580','Casa Nova','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5581','Cascatinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5582','Cascavel','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5583','Castro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5584','Catanduva de Fora','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5585','Catanduvas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5586','Catanduvas do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5587','Catarinenses','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5588','Caxambu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5589','Cedro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5590','Centenario','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5591','Centenario do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5592','Central Lupion','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5593','Centralito','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5594','Centro Novo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5595','Cerne','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5596','Cerrado Grande','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5597','Cerro Azul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5598','Cerro Velho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5599','Cerro Verde','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5600','Ceu Azul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5601','Chopinzinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5602','Cianorte','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5603','Cidade Gaucha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5604','Cintra Pimentel','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5605','Clevelandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5606','Coitinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5607','Colombo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5608','Colonia Acioli','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5609','Colonia Castelhanos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5610','Colonia Castrolandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5611','Colonia Centenario','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5612','Colonia Cristina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5613','Colonia Dom Carlos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5614','Colonia Esperanca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5615','Colonia General Carneiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5616','Colonia Iapo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5617','Colonia Melissa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5618','Colonia Murici','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5619','Colonia Padre Paulo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5620','Colonia Pereira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5621','Colonia Santos Andrade','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5622','Colonia Sao Jose','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5623','Colonia Sapucai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5624','Colonia Saude','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5625','Colonia Tapera','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5626','Colorado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5627','Comur','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5628','Conceicao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5629','Conceicao da Meia Lua','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5630','Conchas Velhas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5631','Conciolandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5632','Congonhas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5633','Congonhinhas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5634','Conselheiro Mairinck','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5635','Conselheiro Zacarias','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5636','Contenda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5637','Copacabana do Norte','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5638','Corbelia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5639','Cornelio Procopio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5640','Coronel Domingos Soares','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5641','Coronel Firmino Martins','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5642','Coronel Vivida','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5643','Correia de Freitas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5644','Corumbatai do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5645','Corvo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5646','Costeira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5647','Covo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5648','Coxilha Rica','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5649','Cristo Rei','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5650','Crusmaltina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5651','Cruz Machado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5652','Cruzeiro do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5653','Cruzeiro do Norte','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5654','Cruzeiro do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5655','Cruzeiro do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5656','Cunhaporanga','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5657','Curitiba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5658','Curiuva','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5659','Curucaca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5660','Deputado Jose Afonso','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5661','Despique','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5662','Despraiado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5663','Dez de Maio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5664','Diamante','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5665','Diamante do Norte','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5666','Diamante do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5667','Diamante do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5668','Doce Grande','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5669','Dois Irmaos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5670','Dois Marcos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5671','Dois Vizinhos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5672','Dom Rodrigo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5673','Dorizon','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5674','Douradina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5675','Doutor Antonio Paranhos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5676','Doutor Camargo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5677','Doutor Ernesto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5678','Doutor Oliveira Castro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5679','Doutor Ulysses','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5680','Eduardo Xavier da Silva','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5681','Emboguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5682','Emboque','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5683','Encantado D Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5684','Encruzilhada','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5685','Eneas Marques','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5686','Engenheiro Beltrao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5687','Entre Rios','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5688','Entre Rios do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5689','Esperanca do Norte','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5690','Espigao Alto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5691','Espirito Santo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5692','Estacao General Lucio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5693','Estacao Roca Nova','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5694','Europa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5695','Euzebio de Oliveira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5696','Faisqueira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5697','Farol','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5698','Faxina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5699','Faxinal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5700','Faxinal do Ceu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5701','Faxinal dos Elias','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5702','Faxinal Santa Cruz','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5703','Fazenda Brigadeiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5704','Fazenda dos Barbosas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5705','Fazenda Jangada','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5706','Fazenda Rio Grande','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5707','Fazenda Salmo 23','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5708','Fazendinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5709','Felpudo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5710','Fenix','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5711','Fernandes Pinheiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5712','Fernao Dias','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5713','Ferraria','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5714','Ferreiras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5715','Figueira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5716','Figueira do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5717','Fiusas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5718','Flor da Serra','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5719','Flor da Serra do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5720','Florai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5721','Floresta','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5722','Florestopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5723','Floriano','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5724','Florida','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5725','Floropolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5726','Fluviopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5727','Formigone','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5728','Formosa do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5729','Foz do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5730','Francisco Alves','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5731','Francisco Beltrao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5732','Francisco Frederico Teixeira G','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5733','Freguezia dos Laras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5734','Frei Timoteo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5735','Fueros','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5736','Fundao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5737','Gamadinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5738','Gamela','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5739','Gaucha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5740','Gaviao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5741','General Carneiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5742','General Osorio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5743','Geremia Lunardelli','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5744','Godoy Moreira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5745','Goio-Ere','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5746','Goioxim','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5747','Gois','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5748','Goncalves Junior','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5749','Graciosa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5750','Grandes Rios','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5751','Guaipora','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5752','Guaira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5753','Guairaca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5754','Guajuvira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5755','Guamiranga','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5756','Guamirim','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5757','Guapirama','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5758','Guapore','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5759','Guaporema','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5760','Guara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5761','Guaraci','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5762','Guaragi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5763','Guaraguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5764','Guaraituba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5765','Guarani','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5766','Guaraniacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5767','Guarapuava','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5768','Guarapuavinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5769','Guaraquecaba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5770','Guararema','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5771','Guaratuba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5772','Guarauna','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5773','Guaravera','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5774','Guardamoria','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5775','Harmonia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5776','Herculandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5777','Herval Grande','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5778','Herveira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5779','Hidreletrica Itaipu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5780','Honorio Serpa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5781','Iarama','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5782','Ibaiti','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5783','Ibema','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5784','Ibiaci','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5785','Ibipora','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5786','Icara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5787','Icaraima','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5788','Icatu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5789','Igrejinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5790','Iguaracu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5791','Iguatemi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5792','Iguatu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5793','Iguipora','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5794','Ilha do Mel','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5795','Ilha dos Valadares','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5796','Imbau','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5797','Imbauzinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5798','Imbituva','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5799','Inacio Martins','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5800','Inaja','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5801','Independencia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5802','Indianopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5803','Inspetor Carvalho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5804','Invernada','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5805','Invernadinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5806','Iolopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5807','Ipanema','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5808','Ipiranga','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5809','Ipora','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5810','Iracema do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5811','Irapuan','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5812','Irati','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5813','Irere','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5814','Iretama','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5815','Itaguaje','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5816','Itaiacoca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5817','Itaipulandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5818','Itambaraca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5819','Itambe','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5820','Itapanhacanga','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5821','Itapara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5822','Itapejara D\'Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5823','Itaperucu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5824','Itapua','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5825','Itaqui','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5826','Itauna do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5827','Itinga','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5828','Iv Centenario','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5829','Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5830','Ivailandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5831','Ivaipora','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5832','Ivaitinga','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5833','Ivate','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5834','Ivatuba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5835','Jaborandi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5836','Jaboti','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5837','Jaboticabal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5838','Jaburu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5839','Jacare','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5840','Jacarezinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5841','Jaciaba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5842','Jacusal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5843','Jacutinga','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5844','Jaguapita','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5845','Jaguariaiva','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5846','Jandaia do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5847','Jangada','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5848','Jangada do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5849','Janiopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5850','Japira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5851','Japura','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5852','Jaracatia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5853','Jardim','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5854','Jardim Alegre','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5855','Jardim Olinda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5856','Jardim Paredao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5857','Jardim Paulista','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5858','Jardinopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5859','Jataizinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5860','Jatuba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5861','Javacae','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5862','Jesuitas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5863','Joa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5864','Joaquim Tavora','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5865','Jordaozinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5866','Jose Lacerda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5867','Juciara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5868','Jundiai do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5869','Juranda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5870','Jussara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5871','Juvinopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5872','Kalore','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5873','Km 30','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5874','Lagoa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5875','Lagoa Bonita','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5876','Lagoa dos Ribas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5877','Lagoa Dourada','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5878','Lagoa Seca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5879','Lagoa Verde','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5880','Lagoinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5881','Lajeado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5882','Lajeado Bonito','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5883','Lajeado Grande','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5884','Lambari','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5885','Lapa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5886','Laranja Azeda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5887','Laranjal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5888','Laranjeiras do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5889','Lavra','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5890','Lavrinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5891','Leopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5892','Lerroville','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5893','Lidianopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5894','Lindoeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5895','Linha Giacomini','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5896','Loanda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5897','Lobato','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5898','Londrina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5899','Lopei','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5900','Lovat','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5901','Luar','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5902','Luiziana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5903','Lunardelli','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5904','Lupionopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5905','Macaco','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5906','Macucos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5907','Maira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5908','Maita','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5909','Mallet','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5910','Malu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5911','Mambore','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5912','Mandacaia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5913','Mandaguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5914','Mandaguari','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5915','Mandiocaba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5916','Mandirituba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5917','Mangueirinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5918','Manoel Ribas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5919','Maraba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5920','Maracana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5921','Marajo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5922','Maravilha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5923','Marcionopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5924','Marechal Candido Rondon','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5925','Margarida','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5926','Maria Helena','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5927','Maria Luiza','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5928','Marialva','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5929','Mariental','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5930','Marilandia do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5931','Marilena','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5932','Marilu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5933','Mariluz','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5934','Marimbondo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5935','Maringa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5936','Mariopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5937','Maripa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5938','Maristela','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5939','Mariza','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5940','Marmelandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5941','Marmeleiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5942','Marques de Abrantes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5943','Marquinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5944','Marrecas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5945','Martins','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5946','Marumbi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5947','Matelandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5948','Matinhos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5949','Mato Queimado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5950','Mato Rico','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5951','Maua da Serra','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5952','Medianeira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5953','Meia-Lua','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5954','Memoria','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5955','Mendeslandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5956','Mercedes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5957','Mirador','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5958','Miranda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5959','Mirante do Piquiri','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5960','Miraselva','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5961','Missal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5962','Monjolinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5963','Monsoes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5964','Monte Real','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5965','Moreira Sales','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5966','Morretes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5967','Morro Alto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5968','Morro Ingles','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5969','Munhoz de Mello','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5970','Natingui','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5971','Nordestina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5972','Nossa Senhora Aparecida','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5973','Nossa Senhora da Aparecida','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5974','Nossa Senhora da Candelaria','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5975','Nossa Senhora das Gracas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5976','Nossa Senhora de Lourdes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5977','Nossa Senhora do Carmo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5978','Nova Alianca do Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5979','Nova Altamira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5980','Nova America da Colina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5981','Nova Amoreira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5982','Nova Aurora','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5983','Nova Bilac','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5984','Nova Brasilia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5985','Nova Brasilia do Itarare','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5986','Nova Cantu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5987','Nova Concordia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5988','Nova Esperanca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5989','Nova Esperanca do Sudoeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5990','Nova Fatima','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5991','Nova Laranjeiras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5992','Nova Londrina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5993','Nova Lourdes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5994','Nova Olimpia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5995','Nova Prata do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5996','Nova Riqueza','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5997','Nova Santa Barbara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5998','Nova Santa Rosa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('5999','Nova Tebas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6000','Nova Tirol','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6001','Nova Videira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6002','Novo Horizonte','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6003','Novo Itacolomi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6004','Novo Jardim','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6005','Novo Sarandi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6006','Novo Sobradinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6007','Novo Tres Passos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6008','Olaria','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6009','Olho Agudo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6010','Olho D\'Agua','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6011','Oroite','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6012','Ortigueira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6013','Ourilandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6014','Ourizona','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6015','Ouro Fino','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6016','Ouro Verde do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6017','Ouro Verde do Piquiri','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6018','Padre Ponciano','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6019','Paicandu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6020','Paiol de Baixo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6021','Paiol Queimado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6022','Paiquere','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6023','Palmas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6024','Palmeira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6025','Palmeirinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6026','Palmira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6027','Palmital','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6028','Palmital de Sao Silvestre','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6029','Palmitopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6030','Palotina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6031','Panema','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6032','Pangare','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6033','Papagaios Novos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6034','Paraiso do Norte','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6035','Parana D\'Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6036','Paranacity','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6037','Paranagi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6038','Paranagua','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6039','Paranapoema','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6040','Paranavai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6041','Passa Una','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6042','Passo da Ilha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6043','Passo dos Pupos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6044','Passo Fundo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6045','Passo Liso','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6046','Pato Bragado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6047','Pato Branco','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6048','Patos Velhos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6049','Paula Freitas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6050','Paulistania','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6051','Paulo Frontin','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6052','Paz','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6053','Peabiru','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6054','Pedra Branca do Araraquara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6055','Pedras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6056','Pedro Lustosa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6057','Pelado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6058','Perobal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6059','Perola','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6060','Perola do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6061','Perola Independente','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6062','Piassuguera','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6063','Pien','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6064','Pinare','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6065','Pinhais','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6066','Pinhal do Sao Bento','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6067','Pinhal Preto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6068','Pinhalao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6069','Pinhalzinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6070','Pinhao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6071','Pinheiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6072','Piquirivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6073','Piracema','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6074','Pirai do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6075','Pirapo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6076','Piraquara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6077','Piriquitos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6078','Pitanga','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6079','Pitangueiras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6080','Pitangui','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6081','Planaltina do Parana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6082','Planalto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6083','Pocinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6084','Poema','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6085','Ponta do Pasto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6086','Ponta Grossa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6087','Pontal do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6088','Porecatu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6089','Portao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6090','Porteira Preta','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6091','Porto Amazonas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6092','Porto Belo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6093','Porto Brasilio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6094','Porto Camargo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6095','Porto de Cima','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6096','Porto Meira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6097','Porto Mendes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6098','Porto Rico','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6099','Porto San Juan','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6100','Porto Santana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6101','Porto Sao Carlos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6102','Porto Sao Jose','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6103','Porto Vitoria','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6104','Prado Ferreira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6105','Praia de Leste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6106','Pranchita','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6107','Prata','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6108','Prata Um','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6109','Presidente Castelo Branco','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6110','Presidente Kennedy','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6111','Primeiro de Maio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6112','Progresso','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6113','Prudentopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6114','Pulinopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6115','Quatigua','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6116','Quatro Barras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6117','Quatro Pontes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6118','Quebra Freio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6119','Quebrada Funda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6120','Quedas do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6121','Queimados','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6122','Querencia do Norte','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6123','Quinta do Sol','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6124','Quinzopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6125','Quitandinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6126','Ramilandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6127','Rancho Alegre','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6128','Rancho Alegre D\'Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6129','Realeza','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6130','Reboucas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6131','Regiao dos Valos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6132','Reianopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6133','Renascenca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6134','Reserva','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6135','Retiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6136','Retiro Grande','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6137','Ribeirao Bonito','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6138','Ribeirao Claro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6139','Ribeirao do Pinhal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6140','Ribeirao do Pinheiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6141','Rio Abaixo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6142','Rio Azul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6143','Rio Bom','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6144','Rio Bonito','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6145','Rio Bonito do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6146','Rio Branco','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6147','Rio Branco do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6148','Rio Claro do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6149','Rio da Prata','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6150','Rio das Antas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6151','Rio das Mortes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6152','Rio das Pedras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6153','Rio das Pombas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6154','Rio do Mato','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6155','Rio do Salto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6156','Rio Negro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6157','Rio Novo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6158','Rio Pinheiro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6159','Rio Quatorze','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6160','Rio Saltinhoio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6161','Rio Saudade','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6162','Rio Verde','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6163','Roberto Silveira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6164','Roca Velha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6165','Rolandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6166','Romeopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6167','Ronca Porco','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6168','Roncador','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6169','Rondina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6170','Rondon','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6171','Rosario do Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6172','Sabaudia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6173','Sagrada Familia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6174','Salgado Filho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6175','Salles de Oliveira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6176','Saltinho do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6177','Salto do Itarare','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6178','Salto do Lontra','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6179','Salto Portao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6180','Samambaia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6181','Santa Amelia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6182','Santa Cecilia do Pavao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6183','Santa Clara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6184','Santa Cruz de Monte Castelo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6185','Santa Eliza','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6186','Santa Esmeralda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6187','Santa Fe','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6188','Santa Fe do Pirapo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6189','Santa Helena','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6190','Santa Ines','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6191','Santa Isabel do Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6192','Santa Izabel do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6193','Santa Lucia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6194','Santa Lurdes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6195','Santa Luzia da Alvorada','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6196','Santa Margarida','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6197','Santa Maria','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6198','Santa Maria do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6199','Santa Maria do Rio do Peixe','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6200','Santa Mariana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6201','Santa Monica','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6202','Santa Quiteria','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6203','Santa Rita','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6204','Santa Rita do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6205','Santa Rosa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6206','Santa Tereza do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6207','Santa Terezinha de Itaipu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6208','Santa Zelia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6209','Santana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6210','Santana do Itarare','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6211','Santo Antonio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6212','Santo Antonio da Platina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6213','Santo Antonio do Caiua','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6214','Santo Antonio do Iratim','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6215','Santo Antonio do Palmital','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6216','Santo Antonio do Paraiso','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6217','Santo Antonio do Sudoeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6218','Santo Inacio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6219','Santo Rei','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6220','Sao Bento','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6221','Sao Braz','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6222','Sao Camilo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6223','Sao Carlos do Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6224','Sao Cirilo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6225','Sao Clemente','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6226','Sao Cristovao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6227','Sao Domingos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6228','Sao Francisco','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6229','Sao Francisco de Imbau','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6230','Sao Francisco de Sales','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6231','Sao Gabriel','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6232','Sao Gotardo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6233','Sao Jeronimo da Serra','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6234','Sao Joao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6235','Sao Joao D\'Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6236','Sao Joao da Boa Vista','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6237','Sao Joao do Caiua','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6238','Sao Joao do Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6239','Sao Joao do Pinhal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6240','Sao Joao do Triunfo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6241','Sao Joaquim','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6242','Sao Joaquim do Pontal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6243','Sao Jorge do Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6244','Sao Jorge do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6245','Sao Jorge do Patrocinio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6246','Sao Jose','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6247','Sao Jose da Boa Vista','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6248','Sao Jose das Palmeiras','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6249','Sao Jose do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6250','Sao Jose do Itavo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6251','Sao Jose do Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6252','Sao Jose dos Pinhais','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6253','Sao Judas Tadeu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6254','Sao Leonardo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6255','Sao Lourenco','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6256','Sao Luiz','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6257','Sao Luiz do Puruna','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6258','Sao Manoel','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6259','Sao Marcos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6260','Sao Martinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6261','Sao Mateus do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6262','Sao Miguel','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6263','Sao Miguel do Cambui','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6264','Sao Miguel do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6265','Sao Paulo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6266','Sao Pedro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6267','Sao Pedro do Florido','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6268','Sao Pedro do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6269','Sao Pedro do Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6270','Sao Pedro do Parana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6271','Sao Pedro Lopei','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6272','Sao Pio X','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6273','Sao Roque','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6274','Sao Roque do Pinhal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6275','Sao Salvador','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6276','Sao Sebastiao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6277','Sao Sebastiao da Amoreira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6278','Sao Sebastiao da Bela Vista','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6279','Sao Silvestre','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6280','Sao Tome','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6281','Sao Valentim','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6282','Sao Vicente','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6283','Sape','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6284','Sapopema','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6285','Sarandi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6286','Saudade do Iguacu','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6287','Sede Alvorada','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6288','Sede Chaparral','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6289','Sede Nova Sant\'Ana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6290','Sede Progresso','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6291','Selva','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6292','Senges','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6293','Senhor Bom Jesus dos Gramados','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6294','Serra dos Dourados','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6295','Serra Negra','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6296','Serraria Klas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6297','Serrinha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6298','Sertaneja','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6299','Sertanopolis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6300','Sertaozinho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6301','Sete Saltos de Cima','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6302','Shangir-La','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6303','Silvolandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6304','Siqueira Belo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6305','Siqueira Campos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6306','Socavao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6307','Socorro','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6308','Sulina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6309','Sumare','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6310','Sussui','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6311','Sutis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6312','Taipa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6313','Tamarana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6314','Tambarutaca','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6315','Tamboara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6316','Tanque Grande','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6317','Tapejara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6318','Tapira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6319','Tapui','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6320','Taquara','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6321','Taquari dos Polacos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6322','Taquari dos Russos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6323','Taquaruna','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6324','Teixeira Soares','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6325','Telemaco Borba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6326','Teolandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6327','Tereza Breda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6328','Tereza Cristina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6329','Terra Boa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6330','Terra Nova','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6331','Terra Rica','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6332','Terra Roxa','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6333','Tibagi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6334','Tijucas do Sul','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6335','Tijuco Preto','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6336','Timbu Velho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6337','Tindiquera','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6338','Tiradentes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6339','Toledo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6340','Tomaz Coelho','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6341','Tomazina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6342','Tranqueira','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6343','Tres Barras do Parana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6344','Tres Bicos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6345','Tres Bocas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6346','Tres Capoes','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6347','Tres Corregos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6348','Tres Lagoas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6349','Tres Pinheiros','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6350','Tres Placas','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6351','Triangulo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6352','Trindade','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6353','Triolandia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6354','Tronco','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6355','Tunas do Parana','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6356','Tuneiras do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6357','Tupassi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6358','Tupinamba','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6359','Turvo','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6360','Ubaldino Taques','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6361','Ubauna','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6362','Ubirata','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6363','Umuarama','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6364','Uniao','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6365','Uniao da Vitoria','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6366','Uniao do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6367','Uniflor','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6368','Urai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6369','Usina','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6370','Uvaia','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6371','Valentins','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6372','Valerio','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6373','Vargeado','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6374','Vassoural','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6375','Ventania','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6376','Vera Cruz do Oeste','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6377','Vera Guarani','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6378','Vere','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6379','Vida Nova','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6380','Vidigal','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6381','Vila Alta','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6382','Vila Diniz','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6383','Vila Doos Roldos','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6384','Vila Florida','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6385','Vila Gandhi','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6386','Vila Guay','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6387','Vila Nilza','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6388','Vila Nova','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6389','Vila Paraiso','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6390','Vila Reis','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6391','Vila Rica do Ivai','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6392','Vila Roberto Brzezinski','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6393','Vila Silva Jardim','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6394','Vila Velha','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6395','Virmond','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6396','Vista Alegre','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6397','Vista Bonita','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6398','Vitorino','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6399','Volta Grande','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6400','Warta','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6401','Wenceslau Braz','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6402','Xambre','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6403','Xarqueada','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6404','Xaxim','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6405','Yolanda','18');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6406','Abarracamento','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6407','Abraao','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6408','Afonso Arinos','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6409','Agulhas Negras','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6410','Amparo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6411','Andrade Pinto','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6412','Angra dos Reis','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6413','Anta','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6414','Aperibe','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6415','Araruama','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6416','Areal','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6417','Armacao dos Buzios','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6418','Arraial do Cabo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6419','Arrozal','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6420','Avelar','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6421','Bacaxa','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6422','Baltazar','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6423','Banquete','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6424','Barao de Juparana','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6425','Barcelos','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6426','Barra Alegre','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6427','Barra de Macae','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6428','Barra de Sao Joao','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6429','Barra do Pirai','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6430','Barra Mansa','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6431','Barra Seca','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6432','Belford Roxo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6433','Bemposta','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6434','Boa Esperanca','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6435','Boa Sorte','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6436','Boa Ventura','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6437','Bom Jardim','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6438','Bom Jesus do Itabapoana','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6439','Bom Jesus do Querendo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6440','Cabo Frio','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6441','Cabucu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6442','Cachoeiras de Macacu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6443','Cachoeiros','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6444','Calheiros','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6445','Cambiasca','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6446','Cambuci','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6447','Campo do Coelho','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6448','Campos dos Goitacazes','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6449','Campos Elyseos','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6450','Cantagalo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6451','Carabucu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6452','Carapebus','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6453','Cardoso Moreira','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6454','Carmo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6455','Cascatinha','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6456','Casimiro de Abreu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6457','Cava','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6458','Coelho da Rocha','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6459','Colonia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6460','Comendador Levy Gasparian','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6461','Comendador Venancio','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6462','Conceicao de Jacarei','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6463','Conceicao de Macabu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6464','Conrado','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6465','Conselheiro Paulino','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6466','Conservatoria','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6467','Cordeiro','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6468','Coroa Grande','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6469','Correas','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6470','Corrego da Prata','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6471','Corrego do Ouro','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6472','Correntezas','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6473','Cunhambebe','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6474','Dorandia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6475','Dores de Macabu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6476','Doutor Elias','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6477','Doutor Loreti','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6478','Duas Barras','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6479','Duque de Caxias','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6480','Engenheiro Passos','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6481','Engenheiro Paulo de Frontin','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6482','Engenheiro Pedreira','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6483','Estrada Nova','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6484','Euclidelandia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6485','Falcao','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6486','Floriano','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6487','Fumaca','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6488','Funil','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6489','Gavioes','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6490','Getulandia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6491','Glicerio','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6492','Goitacazes','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6493','Governador Portela','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6494','Guapimirim','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6495','Guia de Pacobaiba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6496','Ibitiguacu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6497','Ibitioca','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6498','Ibituporanga','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6499','Iguaba Grande','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6500','Imbarie','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6501','Inconfidencia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6502','Inhomirim','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6503','Inoa','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6504','Ipiabas','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6505','Ipiiba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6506','Ipuca','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6507','Itabapoana','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6508','Itaborai','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6509','Itacurussa','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6510','Itaguai','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6511','Itaipava','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6512','Itaipu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6513','Itajara','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6514','Italva','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6515','Itambi','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6516','Itaocara','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6517','Itaperuna','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6518','Itatiaia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6519','Jacuecanga','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6520','Jaguarembe','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6521','Jamapara','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6522','Japeri','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6523','Japuiba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6524','Laje do Muriae','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6525','Laranjais','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6526','Lidice','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6527','Lumiar','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6528','Macabuzinho','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6529','Macae','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6530','Macuco','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6531','Mage','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6532','Mambucaba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6533','Mangaratiba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6534','Maniva','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6535','Manoel Ribeiro','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6536','Manuel Duarte','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6537','Marangatu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6538','Marica','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6539','Mendes','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6540','Mesquita','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6541','Miguel Pereira','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6542','Miracema','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6543','Monera','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6544','Monjolo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6545','Monte Alegre','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6546','Monte Verde','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6547','Monumento','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6548','Morangaba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6549','Morro do Coco','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6550','Morro Grande','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6551','Mussurepe','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6552','Natividade','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6553','Neves','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6554','Nhunguacu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6555','Nilopolis','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6556','Niteroi','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6557','Nossa Senhora da Aparecida','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6558','Nossa Senhora da Penha','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6559','Nossa Senhora do Amparo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6560','Nova Friburgo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6561','Nova Iguacu','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6562','Olinda','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6563','Ourania','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6564','Papucaia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6565','Paquequer Pequeno','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6566','Paracambi','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6567','Paraiba do Sul','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6568','Paraiso do Tobias','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6569','Paraoquena','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6570','Parapeuna','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6571','Parati','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6572','Parati Mirim','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6573','Passa Tres','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6574','Paty do Alferes','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6575','Pedra Selada','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6576','Pedro do Rio','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6577','Penedo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6578','Pentagna','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6579','Petropolis','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6580','Piabeta','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6581','Piao','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6582','Pinheiral','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6583','Pipeiras','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6584','Pirai','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6585','Pirangai','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6586','Pirapetinga de Bom Jesus','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6587','Porciuncula','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6588','Portela','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6589','Porto das Caixas','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6590','Porto Real','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6591','Porto Velho do Cunha','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6592','Posse','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6593','Praia de Aracatiba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6594','Pureza','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6595','Purilandia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6596','Quarteis','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6597','Quatis','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6598','Queimados','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6599','Quissama','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6600','Renascenca','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6601','Resende','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6602','Retiro do Muriae','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6603','Rialto','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6604','Ribeirao de Sao Joaquim','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6605','Rio Bonito','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6606','Rio Claro','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6607','Rio das Flores','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6608','Rio das Ostras','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6609','Rio de Janeiro','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6610','Riograndina','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6611','Rosal','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6612','Sacra Familia do Tingua','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6613','Salutaris','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6614','Sambaetiba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6615','Sampaio Correia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6616','Sana','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6617','Santa Clara','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6618','Santa Cruz','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6619','Santa Cruz da Serra','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6620','Santa Isabel','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6621','Santa Isabel do Rio Preto','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6622','Santa Maria','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6623','Santa Maria Madalena','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6624','Santa Rita da Floresta','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6625','Santanesia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6626','Santo Aleixo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6627','Santo Amaro de Campos','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6628','Santo Antonio de Padua','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6629','Santo Antonio do Imbe','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6630','Santo Eduardo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6631','Sao Fidelis','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6632','Sao Francisco de Paula','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6633','Sao Goncalo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6634','Sao Joao da Barra','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6635','Sao Joao de Meriti','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6636','Sao Joao do Paraiso','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6637','Sao Joao Marcos','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6638','Sao Joaquim','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6639','Sao Jose de Uba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6640','Sao Jose do Ribeirao','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6641','Sao Jose do Turvo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6642','Sao Jose do Vale do Rio Preto','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6643','Sao Mateus','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6644','Sao Pedro da Aldeia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6645','Sao Sebastiao de Campos','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6646','Sao Sebastiao do Alto','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6647','Sao Sebastiao do Paraiba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6648','Sao Sebastiao dos Ferreiros','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6649','Sao Vicente de Paula','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6650','Sapucaia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6651','Saquarema','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6652','Saracuruna','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6653','Sebastiao de Lacerda','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6654','Seropedica','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6655','Serrinha','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6656','Sete Pontes','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6657','Silva Jardim','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6658','Sodrelandia','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6659','Sossego','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6660','Subaio','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6661','Sumidouro','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6662','Surui','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6663','Taboas','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6664','Tamoios','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6665','Tangua','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6666','Tapera','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6667','Tarituba','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6668','Teresopolis','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6669','Tocos','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6670','Trajano de Morais','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6671','Travessao','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6672','Tres Irmaos','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6673','Tres Rios','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6674','Triunfo','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6675','Valao do Barro','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6676','Valenca','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6677','Vargem Alegre','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6678','Varre-Sai','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6679','Vassouras','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6680','Venda das Flores','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6681','Venda das Pedras','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6682','Vila da Grama','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6683','Vila do Frade','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6684','Vila Muriqui','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6685','Vila Nova de Campos','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6686','Visconde de Imbe','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6687','Volta Redonda','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6688','Werneck','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6689','Xerem','19');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6690','Acari','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6691','Acu','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6692','Afonso Bezerra','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6693','Agua Nova','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6694','Alexandria','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6695','Almino Afonso','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6696','Alto do Rodrigues','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6697','Angicos','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6698','Antonio Martins','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6699','Apodi','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6700','Areia Branca','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6701','Ares','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6702','Baia Formosa','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6703','Barao de Serra Branca','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6704','Barauna','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6705','Barcelona','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6706','Belo Horizonte','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6707','Bento Fernandes','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6708','Boa Saude','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6709','Bodo','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6710','Bom Jesus','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6711','Brejinho','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6712','Caicara','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6713','Caicara do Rio do Vento','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6714','Caico','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6715','Campo Grande','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6716','Campo Redondo','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6717','Canguaretama','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6718','Caraubas','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6719','Carnauba dos Dantas','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6720','Carnaubais','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6721','Ceara-Mirim','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6722','Cerro Cora','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6723','Coronel Ezequiel','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6724','Coronel Joao Pessoa','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6725','Corrego de Sao Mateus','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6726','Cruzeta','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6727','Currais Novos','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6728','Doutor Severiano','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6729','Encanto','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6730','Equador','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6731','Espirito Santo','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6732','Extremoz','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6733','Felipe Guerra','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6734','Fernando Pedrosa','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6735','Firmamento','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6736','Florania','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6737','Francisco Dantas','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6738','Frutuoso Gomes','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6739','Galinhos','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6740','Gameleira','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6741','Goianinha','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6742','Governador Dix-Sept Rosado','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6743','Grossos','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6744','Guamare','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6745','Ielmo Marinho','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6746','Igreja Nova','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6747','Ipanguacu','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6748','Ipiranga','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6749','Ipueira','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6750','Itaja','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6751','Itau','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6752','Jacana','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6753','Jandaira','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6754','Janduis','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6755','Japi','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6756','Jardim de Angicos','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6757','Jardim de Piranhas','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6758','Jardim do Serido','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6759','Joao Camara','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6760','Joao Dias','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6761','Jose da Penha','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6762','Jucurutu','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6763','Jundia de Cima','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6764','Lagoa D\'Anta','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6765','Lagoa de Pedras','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6766','Lagoa de Velhos','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6767','Lagoa Nova','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6768','Lagoa Salgada','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6769','Lajes','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6770','Lajes Pintadas','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6771','Lucrecia','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6772','Luis Gomes','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6773','Macaiba','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6774','Macau','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6775','Major Felipe','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6776','Major Sales','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6777','Marcelino Vieira','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6778','Martins','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6779','Mata de Sao Braz','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6780','Maxaranguape','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6781','Messias Targino','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6782','Montanhas','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6783','Monte Alegre','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6784','Monte das Gameleiras','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6785','Mossoro','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6786','Natal','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6787','Nisia Floresta','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6788','Nova Cruz','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6789','Olho-D\'Agua do Borges','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6790','Ouro Branco','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6791','Padre Cosme','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6792','Parana','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6793','Parau','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6794','Parazinho','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6795','Parelhas','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6796','Parnamirim','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6797','Passa e Fica','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6798','Passagem','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6799','Patu','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6800','Pau dos Ferros','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6801','Pedra Grande','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6802','Pedra Preta','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6803','Pedro Avelino','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6804','Pedro Velho','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6805','Pendencias','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6806','Piloes','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6807','Poco Branco','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6808','Portalegre','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6809','Porto do Mangue','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6810','Pureza','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6811','Rafael Fernandes','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6812','Rafael Godeiro','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6813','Redinha','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6814','Riacho da Cruz','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6815','Riacho de Santana','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6816','Riachuelo','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6817','Rodolfo Fernandes','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6818','Rosario','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6819','Ruy Barbosa','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6820','Salva Vida','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6821','Santa Cruz','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6822','Santa Fe','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6823','Santa Maria','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6824','Santa Teresa','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6825','Santana do Matos','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6826','Santana do Serido','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6827','Santo Antonio','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6828','Santo Antonio do Potengi','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6829','Sao Bento do Norte','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6830','Sao Bento do Trairi','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6831','Sao Bernardo','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6832','Sao Fernando','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6833','Sao Francisco do Oeste','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6834','Sao Geraldo','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6835','Sao Goncalo do Amarante','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6836','Sao Joao do Sabugi','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6837','Sao Jose da Passagem','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6838','Sao Jose de Mipibu','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6839','Sao Jose do Campestre','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6840','Sao Jose do Serido','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6841','Sao Miguel','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6842','Sao Paulo do Potengi','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6843','Sao Pedro','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6844','Sao Rafael','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6845','Sao Tome','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6846','Sao Vicente','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6847','Senador Eloi de Souza','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6848','Senador Georgino Avelino','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6849','Serra Caiada','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6850','Serra da Tapuia','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6851','Serra de Sao Bento','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6852','Serra do Mel','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6853','Serra Negra do Norte','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6854','Serrinha','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6855','Severiano Melo','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6856','Sitio Novo','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6857','Taboleiro Grande','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6858','Taipu','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6859','Tangara','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6860','Tenente Ananias','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6861','Tibau','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6862','Tibau do Sul','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6863','Timbauba dos Batistas','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6864','Touros','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6865','Trairi','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6866','Triunfo','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6867','Umarizal','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6868','Upanema','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6869','Varzea','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6870','Vera Cruz','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6871','Vicosa','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6872','Vila Flor','20');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6873','Abuna','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6874','Alta Floresta do Oeste','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6875','Alto Paraiso','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6876','Alvorada do Oeste','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6877','Ariquemes','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6878','Cabixi','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6879','Cacaieiros','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6880','Cacaulandia','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6881','Cacoal','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6882','Calama','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6883','Campo Novo de Rondonia','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6884','Candeias do Jamari','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6885','Castanheiras','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6886','Cerejeira','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6887','Colorado do Oeste','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6888','Corumbiara','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6889','Costa Marques','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6890','Espigao D\'Oeste','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6891','Governador Jorge Teixeira','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6892','Guajara-Mirim','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6893','Jaci Parana','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6894','Jamari','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6895','Jaru','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6896','Ji-Parana','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6897','Machadinho D\'Oeste','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6898','Marco Rondon','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6899','Ministro Andreazza','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6900','Mirante da Serra','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6901','Monte Negro','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6902','Nova Brasilandia D\'Oeste','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6903','Nova Mamore','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6904','Nova Vida','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6905','Ouro Preto do Oeste','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6906','Pedras Negras','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6907','Pimenta Bueno','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6908','Pimenteiras','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6909','Porto Velho','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6910','Presidente Medici','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6911','Principe da Beira','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6912','Rio Crespo','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6913','Riozinho','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6914','Rolim de Moura','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6915','Santa Luzia do Oeste','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6916','Sao Felipe','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6917','Sao Miguel do Guapore','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6918','Seringueiras','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6919','Tabajara','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6920','Theobroma','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6921','Urupa','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6922','Vale do Paraiso','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6923','Vila Extrema','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6924','Vilhena','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6925','Vista Alegre do Abuna','21');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6926','Alto Alegre','22');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6927','Boa Vista','22');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6928','Bonfim','22');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6929','Caracarai','22');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6930','Mucajai','22');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6931','Normandia','22');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6932','Sao Joao da Baliza','22');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6933','Sao Luiz','22');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6934','Acegua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6935','Afonso Rodrigues','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6936','Agua Santa','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6937','Aguas Claras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6938','Agudo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6939','Ajuricaba','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6940','Albardao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6941','Alecrim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6942','Alegrete','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6943','Alegria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6944','Alfredo Brenner','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6945','Almirante Tamandare','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6946','Alpestre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6947','Alto Alegre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6948','Alto da Uniao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6949','Alto Feliz','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6950','Alto Paredao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6951','Alto Recreio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6952','Alto Uruguai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6953','Alvorada','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6954','Amaral Ferrador','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6955','Ametista do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6956','Andre da Rocha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6957','Anta Gorda','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6958','Antonio Kerpel','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6959','Antonio Prado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6960','Arambare','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6961','Ararica','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6962','Aratiba','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6963','Arco Verde','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6964','Arco-Iris','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6965','Arroio Canoas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6966','Arroio do Meio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6967','Arroio do Padre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6968','Arroio do Sal','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6969','Arroio do So','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6970','Arroio do Tigre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6971','Arroio dos Ratos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6972','Arroio Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6973','Arvore So','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6974','Arvorezinha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6975','Atafona','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6976','Atiacu','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6977','Augusto Pestana','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6978','Aurea','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6979','Avelino Paranhos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6980','Azevedo Sodre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6981','Bacupari','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6982','Bage','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6983','Baliza','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6984','Banhado do Colegio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6985','Barao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6986','Barao de Cotegipe','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6987','Barao do Triunfo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6988','Barra do Guarita','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6989','Barra do Ouro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6990','Barra do Quarai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6991','Barra do Ribeiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6992','Barra do Rio Azul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6993','Barra Funda','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6994','Barracao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6995','Barreirinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6996','Barreiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6997','Barro Preto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6998','Barro Vermelho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('6999','Barros Cassal','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7000','Basilio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7001','Bela Vista','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7002','Beluno','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7003','Benjamin Constant','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7004','Bento Goncalves','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7005','Bexiga','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7006','Boa Esperanca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7007','Boa Vista','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7008','Boa Vista das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7009','Boa Vista do Burica','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7010','Boa Vista do Incra','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7011','Boca do Monte','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7012','Boi Preto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7013','Bojuru','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7014','Bom Jardim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7015','Bom Jesus','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7016','Bom Principio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7017','Bom Progresso','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7018','Bom Retiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7019','Bom Retiro do Guaiba','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7020','Bom Retiro do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7021','Bonito','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7022','Boqueirao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7023','Boqueirao do Leao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7024','Borore','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7025','Bossoroca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7026','Botucarai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7027','Braga','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7028','Brochier','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7029','Buriti','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7030','Butia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7031','Butias','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7032','Cacapava do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7033','Cacequi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7034','Cachoeira do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7035','Cachoeirinha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7036','Cacique Doble','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7037','Cadeado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7038','Cadorna','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7039','Caibate','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7040','Caicara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7041','Camaqua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7042','Camargo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7043','Cambara do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7044','Camobi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7045','Campestre Baixo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7046','Campestre da Serra','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7047','Campina das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7048','Campina Redonda','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7049','Campinas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7050','Campinas do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7051','Campo Bom','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7052','Campo Branco','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7053','Campo do Meio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7054','Campo Novo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7055','Campo Santo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7056','Campo Seco','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7057','Campo Vicente','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7058','Campos Borges','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7059','Candelaria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7060','Candido Freire','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7061','Candido Godoi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7062','Candiota','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7063','Canela','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7064','Cangucu','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7065','Canhembora','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7066','Canoas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7067','Canudos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7068','Capane','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7069','Capao Bonito','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7070','Capao Comprido','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7071','Capao da Canoa','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7072','Capao da Porteira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7073','Capao do Cedro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7074','Capao do Cipo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7075','Capao do Leao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7076','Capela de Santana','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7077','Capela Velha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7078','Capinzal','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7079','Capitao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7080','Capivari','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7081','Capivarita','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7082','Capo-Ere','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7083','Capoeira Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7084','Caraa','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7085','Caraja Seival','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7086','Carazinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7087','Carlos Barbosa','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7088','Carlos Gomes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7089','Carovi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7090','Casca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7091','Cascata','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7092','Caseiros','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7093','Castelinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7094','Catuipe','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7095','Cavajureta','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7096','Cavera','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7097','Caxias do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7098','Cazuza Ferreira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7099','Cedro Marcado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7100','Centenario','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7101','Centro Linha Brasil','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7102','Cerrito Alegre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7103','Cerrito do Ouro Ou Vila do Cer','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7104','Cerro Alto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7105','Cerro Branco','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7106','Cerro Claro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7107','Cerro do Martins','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7108','Cerro do Roque','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7109','Cerro Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7110','Cerro Grande do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7111','Cerro Largo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7112','Chapada','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7113','Charqueadas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7114','Charrua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7115','Chiapetta','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7116','Chicoloma','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7117','Chimarrao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7118','Chorao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7119','Chui','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7120','Cidreira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7121','Cinquentenario','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7122','Ciriaco','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7123','Clara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7124','Clemente Argolo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7125','Coimbra','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7126','Colinas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7127','Colonia das Almas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7128','Colonia Langaro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7129','Colonia Medeiros','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7130','Colonia Municipal','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7131','Colonia Nova','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7132','Colonia Sao Joao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7133','Colonia Z-3','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7134','Coloninha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7135','Colorado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7136','Comandai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7137','Condor','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7138','Consolata','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7139','Constantina','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7140','Coqueiro Baixo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7141','Coqueiros do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7142','Cordilheira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7143','Coroados','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7144','Coronel Barros','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7145','Coronel Bicaco','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7146','Coronel Finzito','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7147','Coronel Pilar','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7148','Coronel Teixeira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7149','Cortado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7150','Costa da Cadeia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7151','Costao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7152','Cotipora','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7153','Coxilha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7154','Coxilha Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7155','Cr-1','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7156','Crissiumal','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7157','Cristal','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7158','Criuva','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7159','Cruz Alta','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7160','Cruz Altense','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7161','Cruzeiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7162','Cruzeiro do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7163','Curral Alto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7164','Curumim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7165','Daltro Filho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7166','Dario Lassance','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7167','David Canabarro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7168','Delfina','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7169','Deodoro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7170','Deposito','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7171','Derrubadas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7172','Dezesseis de Novembro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7173','Dilermando de Aguiar','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7174','Divino','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7175','Dois Irmaos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7176','Dois Irmaos das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7177','Dois Lajeados','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7178','Dom Diogo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7179','Dom Feliciano','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7180','Dom Pedrito','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7181','Dona Francisca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7182','Dona Otilia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7183','Dourado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7184','Doutor Bozano','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7185','Doutor Edgardo Pereira Velho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7186','Doutor Mauricio Cardoso','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7187','Eldorado do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7188','Eletra','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7189','Encantado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7190','Encruzilhada','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7191','Encruzilhada do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7192','Engenho Velho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7193','Entre Ijuis','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7194','Entre Rios do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7195','Entrepelado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7196','Erebango','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7197','Erechim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7198','Ernestina','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7199','Ernesto Alves','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7200','Erval Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7201','Erval Seco','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7202','Erveiras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7203','Esmeralda','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7204','Esperanca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7205','Espigao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7206','Espigao Alto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7207','Espinilho Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7208','Espirito Santo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7209','Espumoso','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7210','Esquina Araujo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7211','Esquina Bom Sucesso','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7212','Esquina Gaucha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7213','Esquina Ipiranga','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7214','Esquina Piratini','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7215','Estacao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7216','Estancia Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7217','Estancia Velha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7218','Esteio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7219','Esteira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7220','Estreito','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7221','Estrela','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7222','Estrela Velha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7223','Eugenio de Castro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7224','Evangelista','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7225','Fagundes Varela','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7226','Fao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7227','Faria Lemos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7228','Farinhas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7229','Farrapos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7230','Farroupilha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7231','Faxinal','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7232','Faxinal do Soturno','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7233','Faxinalzinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7234','Fazenda Fialho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7235','Fazenda Souza','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7236','Fazenda Vilanova','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7237','Feliz','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7238','Ferreira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7239','Flores da Cunha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7240','Floresta','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7241','Floriano Peixoto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7242','Florida','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7243','Fontoura Xavier','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7244','Formigueiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7245','Formosa','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7246','Forninho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7247','Forquetinha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7248','Fortaleza dos Valos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7249','Frederico Westphalen','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7250','Frei Sebastiao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7251','Freire','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7252','Garibaldi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7253','Garibaldina','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7254','Garruchos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7255','Gaurama','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7256','General Camara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7257','Gentil','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7258','Getulio Vargas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7259','Girua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7260','Gloria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7261','Glorinha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7262','Goio-En','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7263','Gramado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7264','Gramado dos Loureiros','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7265','Gramado Sao Pedro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7266','Gramado Xavier','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7267','Gravatai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7268','Guabiju','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7269','Guaiba','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7270','Guajuviras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7271','Guapore','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7272','Guarani das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7273','Guassupi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7274','Harmonia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7275','Herval','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7276','Hidraulica','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7277','Horizontina','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7278','Hulha Negra','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7279','Humaita','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7280','Ibarama','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7281','Ibare','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7282','Ibiaca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7283','Ibiraiaras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7284','Ibirapuita','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7285','Ibiruba','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7286','Igrejinha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7287','Ijucapirama','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7288','Ijui','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7289','Ilha dos Marinheiros','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7290','Ilopolis','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7291','Imbe','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7292','Imigrante','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7293','Independencia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7294','Inhacora','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7295','Ipe','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7296','Ipiranga','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7297','Ipiranga do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7298','Ipuacu','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7299','Irai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7300','Irui','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7301','Itaara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7302','Itacolomi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7303','Itacurubi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7304','Itai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7305','Itaimbezinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7306','Itao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7307','Itapua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7308','Itapuca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7309','Itaqui','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7310','Itati','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7311','Itatiba do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7312','Itauba','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7313','Ituim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7314','Ivai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7315','Ivora','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7316','Ivoti','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7317','Jaboticaba','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7318','Jacuizinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7319','Jacutinga','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7320','Jaguarao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7321','Jaguarete','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7322','Jaguari','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7323','Jansen','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7324','Jaquirana','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7325','Jari','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7326','Jazidas Ou Capela Sao Vicente','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7327','Joao Arregui','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7328','Joao Rodrigues','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7329','Joca Tavares','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7330','Joia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7331','Jose Otavio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7332','Jua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7333','Julio de Castilhos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7334','Lagoa Bonita','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7335','Lagoa dos Tres Cantos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7336','Lagoa Vermelha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7337','Lagoao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7338','Lajeado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7339','Lajeado Bonito','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7340','Lajeado Cerne','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7341','Lajeado do Bugre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7342','Lajeado Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7343','Lara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7344','Laranjeira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7345','Lava-Pes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7346','Lavras do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7347','Leonel Rocha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7348','Liberato Salzano','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7349','Lindolfo Collor','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7350','Linha Comprida','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7351','Linha Nova','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7352','Linha Vitoria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7353','Loreto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7354','Machadinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7355','Magisterio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7356','Manchinha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7357','Mangueiras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7358','Manoel Viana','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7359','Maquine','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7360','Marata','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7361','Marau','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7362','Marcelino Ramos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7363','Marcorama','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7364','Mariana Pimentel','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7365','Mariano Moro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7366','Mariante','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7367','Mariapolis','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7368','Marques de Souza','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7369','Massambara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7370','Mata','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7371','Matarazzo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7372','Mato Castelhano','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7373','Mato Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7374','Mato Leitao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7375','Mato Queimado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7376','Maua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7377','Maximiliano de Almeida','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7378','Medianeira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7379','Melos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7380','Minas do Leao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7381','Miraguai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7382','Miraguaia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7383','Mirim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7384','Montauri','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7385','Monte Alegre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7386','Monte Alverne','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7387','Monte Belo do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7388','Monte Bonito','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7389','Montenegro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7390','Mormaco','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7391','Morrinhos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7392','Morrinhos do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7393','Morro Alto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7394','Morro Azul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7395','Morro Redondo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7396','Morro Reuter','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7397','Morungava','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7398','Mostardas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7399','Mucum','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7400','Muitos Capoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7401','Muliterno','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7402','Nao-Me-Toque','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7403','Nazare','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7404','Nicolau Vergueiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7405','Nonoai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7406','Nossa Senhora Aparecida','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7407','Nossa Senhora da Conceicao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7408','Nova Alvorada','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7409','Nova Araca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7410','Nova Bassano','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7411','Nova Boa Vista','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7412','Nova Brescia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7413','Nova Esperanca do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7414','Nova Hartz','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7415','Nova Milano','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7416','Nova Padua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7417','Nova Palma','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7418','Nova Petropolis','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7419','Nova Prata','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7420','Nova Roma do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7421','Nova Santa Rita','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7422','Nova Sardenha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7423','Novo Barreiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7424','Novo Hamburgo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7425','Novo Horizonte','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7426','Novo Machado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7427','Novo Planalto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7428','Novo Tiradentes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7429','Oliva','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7430','Oralina','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7431','Osorio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7432','Osvaldo Cruz','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7433','Osvaldo Kroeff','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7434','Otavio Rocha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7435','Pacheca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7436','Padilha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7437','Padre Gonzales','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7438','Paim Filho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7439','Palmares do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7440','Palmas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7441','Palmeira das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7442','Palmitinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7443','Pampeiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7444','Panambi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7445','Pantano Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7446','Parai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7447','Paraiso do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7448','Pareci Novo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7449','Parobe','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7450','Passa Sete','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7451','Passinhos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7452','Passo Burmann','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7453','Passo da Areia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7454','Passo da Caveira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7455','Passo das Pedras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7456','Passo do Adao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7457','Passo do Sabao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7458','Passo do Sobrado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7459','Passo Fundo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7460','Passo Novo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7461','Passo Raso','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7462','Paulo Bento','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7463','Pavao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7464','Paverama','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7465','Pedras Altas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7466','Pedreiras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7467','Pedro Garcia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7468','Pedro Osorio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7469','Pedro Paiva','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7470','Pejucara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7471','Pelotas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7472','Picada Cafe','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7473','Pinhal','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7474','Pinhal Alto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7475','Pinhal da Serra','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7476','Pinhal Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7477','Pinhalzinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7478','Pinheirinho do Vale','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7479','Pinheiro Machado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7480','Pinheiro Marcado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7481','Pinto Bandeira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7482','Pirai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7483','Pirapo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7484','Piratini','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7485','Pitanga','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7486','Planalto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7487','Plano Alto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7488','Poco das Antas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7489','Poligono do Erval','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7490','Polo Petroquimico de Triunfo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7491','Pontao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7492','Ponte Preta','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7493','Portao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7494','Porto Alegre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7495','Porto Batista','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7496','Porto Lucena','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7497','Porto Maua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7498','Porto Vera Cruz','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7499','Porto Xavier','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7500','Pouso Novo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7501','Povo Novo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7502','Povoado Tozzo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7503','Pranchada','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7504','Pratos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7505','Presidente Lucena','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7506','Progresso','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7507','Protasio Alves','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7508','Pulador','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7509','Putinga','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7510','Quarai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7511','Quaraim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7512','Quatro Irmaos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7513','Quevedos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7514','Quilombo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7515','Quinta','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7516','Quintao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7517','Quinze de Novembro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7518','Quiteria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7519','Ramada','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7520','Rancho Velho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7521','Redentora','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7522','Refugiado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7523','Relvado','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7524','Restinga Seca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7525','Ricardo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7526','Rincao de Sao Pedro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7527','Rincao del Rei','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7528','Rincao do Cristovao Pereira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7529','Rincao do Meio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7530','Rincao do Segredo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7531','Rincao Doce','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7532','Rincao dos Kroeff','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7533','Rincao dos Mendes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7534','Rincao Vermelho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7535','Rio Azul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7536','Rio Branco','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7537','Rio da Ilha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7538','Rio dos Indios','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7539','Rio Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7540','Rio Pardinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7541','Rio Pardo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7542','Rio Telha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7543','Rio Tigre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7544','Rio Toldo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7545','Riozinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7546','Roca Sales','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7547','Rodeio Bonito','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7548','Rolador','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7549','Rolante','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7550','Rolantinho da Figueira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7551','Ronda Alta','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7552','Rondinha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7553','Roque Gonzales','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7554','Rosario','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7555','Rosario do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7556','Rua Nova','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7557','Sagrada Familia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7558','Saica','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7559','Saldanha Marinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7560','Salgado Filho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7561','Saltinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7562','Salto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7563','Salto do Jacui','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7564','Salvador das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7565','Salvador do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7566','Sananduva','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7567','Sant Auta','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7568','Santa Barbara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7569','Santa Barbara do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7570','Santa Catarina','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7571','Santa Cecilia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7572','Santa Clara do Ingai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7573','Santa Clara do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7574','Santa Cristina','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7575','Santa Cruz','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7576','Santa Cruz da Concordia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7577','Santa Cruz do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7578','Santa Flora','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7579','Santa Ines','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7580','Santa Izabel do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7581','Santa Lucia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7582','Santa Lucia do Piai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7583','Santa Luiza','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7584','Santa Luzia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7585','Santa Maria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7586','Santa Maria do Herval','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7587','Santa Rita do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7588','Santa Rosa','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7589','Santa Silvana','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7590','Santa Teresinha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7591','Santa Tereza','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7592','Santa Vitoria do Palmar','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7593','Santana','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7594','Santana da Boa Vista','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7595','Santana do Livramento','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7596','Santiago','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7597','Santo Amaro do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7598','Santo Angelo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7599','Santo Antonio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7600','Santo Antonio da Patrulha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7601','Santo Antonio das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7602','Santo Antonio de Castro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7603','Santo Antonio do Bom Retiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7604','Santo Antonio do Palma','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7605','Santo Antonio do Planalto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7606','Santo Augusto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7607','Santo Cristo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7608','Santo Expedito do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7609','Santo Inacio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7610','Sao Bento','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7611','Sao Bom Jesus','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7612','Sao Borja','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7613','Sao Braz','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7614','Sao Carlos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7615','Sao Domingos do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7616','Sao Francisco','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7617','Sao Francisco de Assis','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7618','Sao Francisco de Paula','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7619','Sao Gabriel','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7620','Sao Jeronimo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7621','Sao Joao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7622','Sao Joao Batista','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7623','Sao Joao Bosco','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7624','Sao Joao da Urtiga','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7625','Sao Joao do Polesine','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7626','Sao Jorge','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7627','Sao Jose','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7628','Sao Jose da Gloria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7629','Sao Jose das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7630','Sao Jose de Castro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7631','Sao Jose do Centro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7632','Sao Jose do Herval','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7633','Sao Jose do Hortencio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7634','Sao Jose do Inhacora','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7635','Sao Jose do Norte','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7636','Sao Jose do Ouro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7637','Sao Jose dos Ausentes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7638','Sao Leopoldo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7639','Sao Lourenco das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7640','Sao Lourenco do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7641','Sao Luis Rei','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7642','Sao Luiz','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7643','Sao Luiz Gonzaga','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7644','Sao Manuel','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7645','Sao Marcos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7646','Sao Martinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7647','Sao Martinho da Serra','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7648','Sao Miguel','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7649','Sao Miguel das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7650','Sao Nicolau','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7651','Sao Paulo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7652','Sao Paulo das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7653','Sao Pedro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7654','Sao Pedro da Serra','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7655','Sao Pedro de Alcantara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7656','Sao Pedro do Butia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7657','Sao Pedro do Iraxim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7658','Sao Pedro do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7659','Sao Roque','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7660','Sao Sebastiao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7661','Sao Sebastiao do Cai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7662','Sao Sepe','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7663','Sao Simao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7664','Sao Valentim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7665','Sao Valentim do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7666','Sao Valerio do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7667','Sao Vendelino','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7668','Sao Vicente do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7669','Sapiranga','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7670','Sapucaia do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7671','Sarandi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7672','Scharlau','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7673','Seberi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7674','Seca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7675','Sede Aurora','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7676','Sede Nova','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7677','Segredo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7678','Seival','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7679','Selbach','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7680','Sentinela do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7681','Serafim Schmidt','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7682','Serafina Correa','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7683','Serio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7684','Serra dos Gregorios','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7685','Serrinha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7686','Sertao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7687','Sertao Santana','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7688','Sertaozinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7689','Sete de Setembro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7690','Sete Lagoas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7691','Severiano de Almeida','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7692','Silva Jardim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7693','Silveira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7694','Silveira Martins','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7695','Sinimbu','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7696','Sirio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7697','Sitio Gabriel','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7698','Sobradinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7699','Soledade','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7700','Souza Ramos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7701','Suspiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7702','Tabai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7703','Tabajara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7704','Taim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7705','Tainhas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7706','Tamandua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7707','Tanque','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7708','Tapejara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7709','Tapera','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7710','Tapes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7711','Taquara','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7712','Taquari','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7713','Taquarichim','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7714','Taquarucu do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7715','Tavares','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7716','Tenente Portela','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7717','Terra de Areia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7718','Tesouras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7719','Teutonia','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7720','Tiaraju','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7721','Timbauva','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7722','Tiradentes do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7723','Toropi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7724','Toroqua','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7725','Torquato Severo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7726','Torres','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7727','Torrinhas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7728','Touro Passo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7729','Tramandai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7730','Travesseiro','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7731','Trentin','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7732','Tres Arroios','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7733','Tres Barras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7734','Tres Cachoeiras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7735','Tres Coroas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7736','Tres de Maio','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7737','Tres Forquilhas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7738','Tres Palmeiras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7739','Tres Passos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7740','Tres Vendas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7741','Trindade do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7742','Triunfo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7743','Tronqueiras','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7744','Tucunduva','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7745','Tuiuti','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7746','Tunas','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7747','Tupanci do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7748','Tupancireta','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7749','Tupancy Ou Vila Block','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7750','Tupandi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7751','Tupantuba','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7752','Tuparendi','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7753','Tupi Silveira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7754','Tupinamba','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7755','Turvinho','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7756','Ubiretama','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7757','Umbu','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7758','Uniao da Serra','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7759','Unistalda','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7760','Uruguaiana','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7761','Vacacai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7762','Vacaria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7763','Vale do Rio Cai','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7764','Vale do Sol','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7765','Vale Real','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7766','Vale Veneto','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7767','Vanini','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7768','Venancio Aires','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7769','Vera Cruz','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7770','Veranopolis','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7771','Vertentes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7772','Vespasiano Correa','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7773','Viadutos','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7774','Viamao','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7775','Vicente Dutra','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7776','Victor Graeff','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7777','Vila Bender','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7778','Vila Cristal','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7779','Vila Cruz','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7780','Vila Flores','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7781','Vila Lange','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7782','Vila Laranjeira','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7783','Vila Maria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7784','Vila Nova do Sul','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7785','Vila Operaria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7786','Vila Rica','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7787','Vila Seca','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7788','Vila Turvo','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7789','Vinte e Sete da Boa Vista','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7790','Vista Alegre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7791','Vista Alegre do Prata','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7792','Vista Gaucha','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7793','Vitoria','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7794','Vitoria das Missoes','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7795','Volta Alegre','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7796','Volta Fechada','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7797','Volta Grande','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7798','Xadrez','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7799','Xangri-La','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7800','Xingu','23');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7801','Abdon Batista','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7802','Abelardo Luz','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7803','Agrolândia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7804','Agronômica','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7805','Água Doce','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7806','Águas Brancas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7807','Águas de Chapecó','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7808','Águas Frias','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7809','Águas Mornas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7810','Aguti','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7811','Aiure','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7812','Alfredo Wagner','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7813','Alto Alegre','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7814','Alto da Serra','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7815','Anchieta','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7816','Angelina','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7817','Anita Garibaldi','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7818','Anitápolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7819','Anta Gorda','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7820','Antônio Carlos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7821','Apiuna','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7822','Arabuta','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7823','Araquari','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7824','Araranguá','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7825','Armazém','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7826','Arnópolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7827','Arroio Trinta','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7828','Arvoredo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7829','Ascurra','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7830','Atalanta','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7831','Aterrado','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7832','Aurora','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7833','Azambuja','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7834','Balneário Barra do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7835','Balneário Camboriú','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7836','Bandeirante','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7837','Barra Bonita','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7838','Barra Clara','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7839','Barra Fria','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7840','Barra Grande','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7841','Barra Velha','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7842','Barreiros','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7843','Barro Branco','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7844','Bela Vista do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7845','Bela Vista do Toldo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7846','Belmonte','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7847','Benedito Novo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7848','Biguaçu','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7849','Blumenau','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7850','Bocaina do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7851','Boiteuxburgo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7852','Bom Jardim da Serra','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7853','Bom Jesus','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7854','Bom Jesus do Oeste','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7855','Bom Retiro','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7856','Bom Sucesso','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7857','Bombinhas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7858','Botuverá','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7859','Braço do Norte','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7860','Braço do Trombudo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7861','Brusque','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7862','Caçador','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7863','Cachoeira','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7864','Cachoeira de Fátima','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7865','Cachoeira do Bom Jesus','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7866','Caibi','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7867','Calmon','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7868','Camboriú','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7869','Cambuinzal','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7870','Campo Alegre','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7871','Campo Belo do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7872','Campo Erê','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7873','Campos Novos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7874','Canasvieiras','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7875','Canelinha','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7876','Canoas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7877','Canoinhas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7878','Capão Alto','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7879','Capinzal','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7880','Capivari de Baixo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7881','Caraiba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7882','Catanduvas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7883','Catuira','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7884','Caxambu do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7885','Cedro Alto','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7886','Celso Ramos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7887','Cerro Negro','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7888','Chapecó','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7889','Claraiba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7890','Cocal do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7891','Colônia Santa Tereza','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7892','Colônia Santana','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7893','Concórdia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7894','Cordilheira Alta','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7895','Coronel Freitas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7896','Coronel Martins','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7897','Correia Pinto','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7898','Corupá','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7899','Criciúma','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7900','Cunha Pora','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7901','Curitibanos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7902','Dal Pai','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7903','Dalbergia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7904','Descanso','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7905','Dionísio Cerqueira','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7906','Dom Carlos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7907','Dona Emma','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7908','Doutor Pedrinho','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7909','Engenho Velho','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7910','Enseada de Brito','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7911','Entre Rios','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7912','Ermo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7913','Erval Velho','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7914','Espinilho','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7915','Estação Cocal','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7916','Faxinal dos Guedes','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7917','Felipe Schmidt','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7918','Figueira','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7919','Flor do Sertão','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7920','Florianópolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7921','Formosa do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7922','Forquilhinha','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7923','Fraiburgo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7924','Frederico Wastner','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7925','Frei Rogério','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7926','Galvão','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7927','Garcia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7928','Garopaba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7929','Garuva','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7930','Gaspar','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7931','Goio-En','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7932','Governador Celso Ramos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7933','Grão Pará','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7934','Grapia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7935','Gravatal','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7936','Guabiruba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7937','Guaporanga','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7938','Guaraciaba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7939','Guaramirim','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7940','Guarujá do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7941','Guata','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7942','Guatambu','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7943','Hercílio Luz','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7944','Herciliópolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7945','Herval D\'Oeste','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7946','Ibian','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7947','Ibicare','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7948','Ibirama','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7949','Içara','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7950','Ilhota','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7951','Imaruí','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7952','Imbituba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7953','Imbuia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7954','Indaial','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7955','Índios','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7956','Ingleses do Rio Vermelho','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7957','Invernada','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7958','Iomere','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7959','Ipira','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7960','Ipomeia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7961','Ipora do Oeste','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7962','Ipuaçu','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7963','Ipumirim','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7964','Iraceminha','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7965','Irakitan','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7966','Irani','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7967','Iraputa','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7968','Irati','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7969','Irineópolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7970','Itá','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7971','Itaió','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7972','Itaiópolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7973','Itajaí','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7974','Itajuba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7975','Itapema','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7976','Itapiranga','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7977','Itapoa','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7978','Itapocu','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7979','Itoupava','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7980','Ituporanga','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7981','Jabora','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7982','Jacinto Machado','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7983','Jaguaruna','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7984','Jaraguá do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7985','Jardinópolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7986','Joaçaba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7987','Joinville','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7988','José Boiteux','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7989','Jupia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7990','Lacerdópolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7991','Lages','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7992','Lagoa','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7993','Lagoa da Estiva','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7994','Laguna','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7995','Lajeado Grande','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7996','Laurentino','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7997','Lauro Müller','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7998','Leão','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('7999','Lebon Régis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8000','Leoberto Leal','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8001','Lindóia do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8002','Linha das Palmeiras','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8003','Lontras','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8004','Lourdes','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8005','Luiz Alves','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8006','Luzerna','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8007','Macieira','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8008','Mafra','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8009','Major Gercino','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8010','Major Vieira','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8011','Maracajá','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8012','Marari','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8013','Marata','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8014','Maravilha','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8015','Marcílio Dias','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8016','Marechal Bormann','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8017','Marema','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8018','Mariflor','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8019','Marombas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8020','Massaranduba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8021','Matos Costa','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8022','Meleiro','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8023','Mirador','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8024','Mirim','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8025','Mirim Doce','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8026','Modelo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8027','Mondai','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8028','Monte Carlo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8029','Monte Castelo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8030','Morro da Fumaça','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8031','Morro do Meio','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8032','Morro Grande','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8033','Navegantes','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8034','Nossa Senhora de Caravaggio','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8035','Nova Cultura','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8036','Nova Erechim','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8037','Nova Itaberaba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8038','Nova Petrópolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8039','Nova Teutonia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8040','Nova Trento','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8041','Nova Veneza','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8042','Novo Horizonte','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8043','Orleans','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8044','Otacílio Costa','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8045','Ouro','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8046','Ouro Verde','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8047','Paial','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8048','Painel','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8049','Palhoça','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8050','Palma Sola','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8051','Palmares','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8052','Palmitos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8053','Pântano do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8054','Papanduva','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8055','Paraíso','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8056','Passo de Torres','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8057','Passo Manso','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8058','Passos Maia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8059','Paula Pereira','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8060','Paulo Lopes','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8061','Pedras Grandes','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8062','Penha','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8063','Perico','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8064','Peritiba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8065','Pescaria Brava','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8066','Petrolândia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8067','Balneario Piçarras','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8068','Pindotiba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8069','Pinhalzinho','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8070','Pinheiral','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8071','Pinheiro Preto','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8072','Pinheiros','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8073','Pirabeiraba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8074','Piratuba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8075','Planalto Alegre','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8076','Poço Preto','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8077','Pomerode','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8078','Ponte Alta','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8079','Ponte Alta do Norte','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8080','Ponte Serrada','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8081','Porto Belo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8082','Porto Uniâo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8083','Pouso Redondo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8084','Praia Grande','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8085','Presidente Castelo Branco','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8086','Presidente Getúlio','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8087','Presidente Juscelino','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8088','Presidente Kennedy','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8089','Presidente Nereu','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8090','Princesa','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8091','Quarta Linha','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8092','Quilombo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8093','Quilometro Doze','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8094','Rancho Queimado','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8095','Ratones','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8096','Residência Fuck','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8097','Ribeirão da Ilha','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8098','Ribeirão Pequeno','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8099','Rio Antinha','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8100','Rio Bonito','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8101','Rio D\'Una','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8102','Rio da Luz','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8103','Rio das Antas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8104','Rio das Furnas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8105','Rio do Campo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8106','Rio do Oeste','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8107','Rio do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8108','Rio dos Bugres','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8109','Rio dos Cedros','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8110','Rio Fortuna','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8111','Rio Maina','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8112','Rio Negrinho','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8113','Rio Preto do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8114','Rio Rufino','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8115','Riqueza','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8116','Rodeio','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8117','Romelândia','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8118','Sai','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8119','Salete','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8120','Salto Veloso','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8121','Sangão','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8122','Santa Cecília','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8123','Santa Cruz do Timbo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8124','Santa Helena','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8125','Santa Maria','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8126','Santa Rosa de Lima','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8127','Santa Rosa do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8128','Santa Terezinha','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8129','Santa Terezinha do Progresso','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8130','Santiago do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8131','Santo Amaro da Imperatriz','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8132','Santo Antônio de Lisboa','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8133','São Bento Baixo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8134','São Bento do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8135','São Bernardino','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8136','São Bonifácio','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8137','São Carlos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8138','São Cristóvão','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8139','São Cristóvão do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8140','São Defende','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8141','São Domingos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8142','São Francisco do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8143','São Gabriel','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8144','São João Batista','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8145','São João do Itaperiu','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8146','São João do Oeste','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8147','São João do Rio Vermelho','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8148','São João do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8149','São Joaquim','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8150','São José','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8151','São José do Cedro','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8152','São José do Cerrito','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8153','São Leonardo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8154','São Lourenço do Oeste','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8155','São Ludgero','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8156','São Martinho','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8157','São Miguel D\'Oeste','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8158','São Miguel da Boa Vista','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8159','São Pedro de Alcântara','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8160','São Pedro Tobias','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8161','São Sebastião do Arvoredo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8162','São Sebastião do Saltinho','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8163','São Sebastião do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8164','Sapiranga','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8165','Saudades','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8166','Schroeder','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8167','Seara','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8168','Serra Alta','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8169','Serra Chata','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8170','Sertão do Maruim','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8171','Siderópolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8172','Sombrio','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8173','Sorocaba do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8174','Sul Brasil','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8175','Taió','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8176','Tangara','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8177','Taquara Verde','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8178','Taquaras','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8179','Tigipio','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8180','Tigrinhos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8181','Tijucas','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8182','Timbé do Sul','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8183','Timbó','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8184','Timbó Grande','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8185','Três Barras','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8186','Treviso','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8187','Treze de Maio','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8188','Treze Tilias','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8189','Trombudo Central','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8190','Tubarão','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8191','Tunápolis','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8192','Tupitinga','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8193','Turvo','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8194','Ubatuba','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8195','União do Oeste','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8196','Urubici','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8197','Uruguai','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8198','Urupema','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8199','Urussanga','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8200','Vargeão','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8201','Vargem','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8202','Vargem Bonita','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8203','Vargem do Cedro','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8204','Vidal Ramos','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8205','Videira','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8206','Vila Conceição','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8207','Vila Nova','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8208','Vitor Meireles','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8209','Volta Grande','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8210','Witmarsum','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8211','Xanxerê','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8212','Xavantina','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8213','Xaxim','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8214','Zortea','24');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8215','Altos Verdes','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8216','Amparo de Sao Francisco','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8217','Aquidaba','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8218','Aracaju','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8219','Araua','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8220','Areia Branca','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8221','Barra dos Coqueiros','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8222','Barracas','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8223','Boquim','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8224','Brejo Grande','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8225','Campo do Brito','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8226','Canhoba','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8227','Caninde de Sao Francisco','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8228','Capela','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8229','Carira','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8230','Carmopolis','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8231','Cedro de Sao Joao','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8232','Cristinapolis','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8233','Cumbe','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8234','Divina Pastora','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8235','Estancia','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8236','Feira Nova','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8237','Frei Paulo','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8238','Gararu','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8239','General Maynard','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8240','Graccho Cardoso','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8241','Ilha das Flores','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8242','Indiaroba','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8243','Itabaiana','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8244','Itabaianinha','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8245','Itabi','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8246','Itaporanga D\'Ajuda','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8247','Japaratuba','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8248','Japoata','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8249','Lagarto','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8250','Lagoa Funda','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8251','Laranjeiras','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8252','Macambira','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8253','Malhada dos Bois','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8254','Malhador','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8255','Maruim','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8256','Miranda','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8257','Moita Bonita','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8258','Monte Alegre de Sergipe','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8259','Mosqueiro','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8260','Muribeca','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8261','Neopolis','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8262','Nossa Senhora Aparecida','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8263','Nossa Senhora da Gloria','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8264','Nossa Senhora das Dores','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8265','Nossa Senhora de Lourdes','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8266','Nossa Senhora do Socorro','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8267','Pacatuba','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8268','Palmares','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8269','Pedra Mole','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8270','Pedras','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8271','Pedrinhas','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8272','Pinhao','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8273','Pirambu','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8274','Poco Redondo','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8275','Poco Verde','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8276','Porto da Folha','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8277','Propria','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8278','Riachao do Dantas','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8279','Riachuelo','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8280','Ribeiropolis','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8281','Rosario do Catete','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8282','Salgado','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8283','Samambaia','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8284','Santa Luzia do Itanhy','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8285','Santa Rosa de Lima','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8286','Santana do Sao Francisco','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8287','Santo Amaro das Brotas','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8288','Sao Cristovao','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8289','Sao Domingos','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8290','Sao Francisco','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8291','Sao Jose','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8292','Sao Mateus da Palestina','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8293','Sao Miguel do Aleixo','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8294','Simao Dias','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8295','Siriri','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8296','Telha','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8297','Tobias Barreto','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8298','Tomar do Geru','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8299','Umbauba','25');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8300','Adamantina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8301','Adolfo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8302','Agisse','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8303','Agua Vermelha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8304','Aguai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8305','Aguas da Prata','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8306','Aguas de Lindoia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8307','Aguas de Santa Barbara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8308','Aguas de Sao Pedro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8309','Agudos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8310','Agulha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8311','Ajapi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8312','Alambari','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8313','Alberto Moreira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8314','Aldeia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8315','Aldeia de Carapicuiba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8316','Alfredo Guedes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8317','Alfredo Marcondes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8318','Altair','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8319','Altinopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8320','Alto Alegre','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8321','Alto Pora','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8322','Aluminio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8323','Alvares Florence','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8324','Alvares Machado','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8325','Alvaro de Carvalho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8326','Alvinlandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8327','Amadeu Amaral','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8328','Amandaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8329','Ameliopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8330','Americana','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8331','Americo Brasiliense','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8332','Americo de Campos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8333','Amparo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8334','Ana Dias','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8335','Analandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8336','Anapolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8337','Andes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8338','Andradina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8339','Angatuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8340','Anhembi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8341','Anhumas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8342','Aparecida','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8343','Aparecida D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8344','Aparecida de Monte Alto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8345','Aparecida de Sao Manuel','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8346','Aparecida do Bonito','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8347','Apiai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8348','Arabela','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8349','Aracacu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8350','Aracaiba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8351','Aracariguama','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8352','Aracatuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8353','Aracoiaba da Serra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8354','Aramina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8355','Arandu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8356','Arapei','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8357','Araraquara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8358','Araras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8359','Araxas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8360','Arcadas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8361','Arco-Iris','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8362','Arealva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8363','Areias','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8364','Areiopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8365','Ariranha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8366','Ariri','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8367','Artemis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8368','Artur Nogueira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8369','Aruja','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8370','Aspasia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8371','Assis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8372','Assistencia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8373','Atibaia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8374','Atlantida','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8375','Auriflama','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8376','Avai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8377','Avanhandava','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8378','Avare','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8379','Avencas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8380','Bacaetava','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8381','Bacuriti','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8382','Bady Bassitt','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8383','Baguacu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8384','Bairro Alto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8385','Balbinos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8386','Balsamo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8387','Bananal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8388','Barao Ataliba Nogueira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8389','Barao de Antonina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8390','Barao de Geraldo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8391','Barbosa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8392','Bariri','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8393','Barra Bonita','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8394','Barra do Chapeu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8395','Barra do Turvo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8396','Barra Dourada','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8397','Barrania','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8398','Barretos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8399','Barrinha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8400','Barueri','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8401','Bastos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8402','Batatais','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8403','Batatuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8404','Batista Botelho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8405','Bauru','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8406','Bebedouro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8407','Bela Floresta','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8408','Bela Vista Sao-Carlense','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8409','Bento de Abreu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8410','Bernardino de Campos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8411','Bertioga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8412','Bilac','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8413','Birigui','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8414','Biritiba-Mirim','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8415','Biritiba-Ussu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8416','Boa Esperanca do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8417','Boa Vista dos Andradas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8418','Boa Vista Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8419','Bocaina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8420','Bofete','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8421','Boituva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8422','Bom Fim do Bom Jesus','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8423','Bom Jesus dos Perdoes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8424','Bom Retiro da Esperanca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8425','Bom Sucesso de Itarare','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8426','Bonfim Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8427','Bora','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8428','Boraceia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8429','Borborema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8430','Borebi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8431','Botafogo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8432','Botelho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8433','Botucatu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8434','Botujuru','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8435','Braco','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8436','Braganca Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8437','Bras Cubas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8438','Brasitania','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8439','Brauna','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8440','Brejo Alegre','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8441','Brigadeiro Tobias','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8442','Brodowski','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8443','Brotas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8444','Bueno de Andrada','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8445','Buri','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8446','Buritama','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8447','Buritizal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8448','Cabralia Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8449','Cabreuva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8450','Cacapava','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8451','Cachoeira de Emas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8452','Cachoeira Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8453','Caconde','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8454','Cafelandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8455','Cafesopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8456','Caiabu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8457','Caieiras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8458','Caiua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8459','Cajamar','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8460','Cajati','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8461','Cajobi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8462','Cajuru','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8463','Cajuru do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8464','Cambaquara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8465','Cambaratiba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8466','Campestrinho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8467','Campina do Monte Alegre','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8468','Campinal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8469','Campinas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8470','Campo Limpo Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8471','Campos de Cunha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8472','Campos do Jordao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8473','Campos Novos Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8474','Cananeia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8475','Canas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8476','Candia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8477','Candido Mota','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8478','Candido Rodrigues','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8479','Canguera','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8480','Canitar','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8481','Capao Bonito','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8482','Capela do Alto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8483','Capivari','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8484','Capivari da Mata','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8485','Caporanga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8486','Capuava','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8487','Caraguatatuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8488','Carapicuiba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8489','Cardeal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8490','Cardoso','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8491','Casa Branca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8492','Cassia dos Coqueiros','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8493','Castilho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8494','Catanduva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8495','Catigua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8496','Catucaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8497','Caucaia do Alto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8498','Cedral','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8499','Cerqueira Cesar','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8500','Cerquilho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8501','Cesario Lange','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8502','Cezar de Souza','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8503','Charqueada','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8504','Chavantes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8505','Cidade Kemel','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8506','Clarinia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8507','Clementina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8508','Colina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8509','Colombia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8510','Conceicao de Monte Alegre','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8511','Conchal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8512','Conchas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8513','Cordeiropolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8514','Coroados','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8515','Coronel Goulart','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8516','Coronel Macedo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8517','Corredeira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8518','Corrego Rico','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8519','Corumbatai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8520','Cosmopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8521','Cosmorama','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8522','Costa Machado','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8523','Cotia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8524','Cravinhos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8525','Cristais Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8526','Cruz das Posses','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8527','Cruzalia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8528','Cruzeiro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8529','Cubatao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8530','Cuiaba Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8531','Cunha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8532','Curupa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8533','Dalas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8534','Descalvado','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8535','Diadema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8536','Dirce Reis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8537','Dirceu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8538','Divinolandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8539','Dobrada','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8540','Dois Corregos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8541','Dolcinopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8542','Domelia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8543','Dourado','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8544','Dracena','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8545','Duartina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8546','Dumont','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8547','Duplo Ceu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8548','Echapora','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8549','Eden','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8550','Eldorado','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8551','Eleuterio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8552','Elias Fausto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8553','Elisiario','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8554','Embauba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8555','Embu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8556','Embu-Guacu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8557','Emilianopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8558','Eneida','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8559','Engenheiro Balduino','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8560','Engenheiro Coelho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8561','Engenheiro Schmidt','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8562','Ermelino Matarazzo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8563','Esmeralda','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8564','Esperanca D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8565','Espigao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8566','Espirito Santo do Pinhal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8567','Espirito Santo do Turvo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8568','Estiva Gerbi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8569','Estrela D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8570','Estrela do Norte','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8571','Euclides da Cunha Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8572','Eugenio de Melo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8573','Fartura','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8574','Fatima','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8575','Fatima Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8576','Fernando Prestes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8577','Fernandopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8578','Fernao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8579','Ferraz de Vasconcelos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8580','Flora Rica','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8581','Floreal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8582','Floresta do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8583','Florida Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8584','Florinea','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8585','Franca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8586','Francisco Morato','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8587','Franco da Rocha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8588','Frutal do Campo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8589','Gabriel Monteiro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8590','Galia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8591','Garca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8592','Gardenia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8593','Gastao Vidigal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8594','Gaviao Peixoto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8595','General Salgado','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8596','Getulina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8597','Glicerio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8598','Gramadinho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8599','Guachos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8600','Guaianas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8601','Guaianazes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8602','Guaicara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8603','Guaimbe','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8604','Guaira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8605','Guamium','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8606','Guapiacu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8607','Guapiara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8608','Guapiranga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8609','Guara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8610','Guaracai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8611','Guaraci','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8612','Guaraciaba D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8613','Guarani D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8614','Guaranta','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8615','Guarapiranga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8616','Guarapua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8617','Guararapes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8618','Guararema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8619','Guaratingueta','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8620','Guarei','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8621','Guariba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8622','Guariroba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8623','Guarizinho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8624','Guaruja','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8625','Guarulhos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8626','Guatapara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8627','Guzolandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8628','Herculandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8629','Holambra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8630','Hortolandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8631','Iacanga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8632','Iacri','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8633','Iaras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8634','Ibate','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8635','Ibiporanga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8636','Ibira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8637','Ibirarema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8638','Ibitinga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8639','Ibitiruna','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8640','Ibitiuva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8641','Ibitu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8642','Ibiuna','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8643','Icem','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8644','Ida Iolanda','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8645','Iepe','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8646','Igacaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8647','Igaracu do Tiete','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8648','Igarai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8649','Igarapava','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8650','Igarata','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8651','Iguape','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8652','Ilha Comprida','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8653','Ilha Solteira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8654','Ilhabela','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8655','Indaia do Aguapei','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8656','Indaiatuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8657','Indiana','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8658','Indiapora','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8659','Ingas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8660','Inubia Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8661','Ipaussu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8662','Ipero','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8663','Ipeuna','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8664','Ipigua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8665','Iporanga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8666','Ipua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8667','Iracemapolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8668','Irape','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8669','Irapua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8670','Irapuru','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8671','Itabera','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8672','Itai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8673','Itaim Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8674','Itaiuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8675','Itajobi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8676','Itaju','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8677','Itanhaem','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8678','Itaoca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8679','Itapecerica da Serra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8680','Itapetininga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8681','Itapeuna','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8682','Itapeva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8683','Itapevi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8684','Itapira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8685','Itapirapua Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8686','Itapolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8687','Itaporanga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8688','Itapui','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8689','Itapura','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8690','Itaquaquecetuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8691','Itaquera','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8692','Itaqueri da Serra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8693','Itarare','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8694','Itariri','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8695','Itatiba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8696','Itatinga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8697','Itirapina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8698','Itirapua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8699','Itobi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8700','Itororo do Paranapanema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8701','Itu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8702','Itupeva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8703','Ituverava','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8704','Iubatinga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8705','Jaborandi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8706','Jaboticabal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8707','Jacare','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8708','Jacarei','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8709','Jaci','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8710','Jacipora','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8711','Jacuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8712','Jacupiranga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8713','Jafa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8714','Jaguariuna','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8715','Jales','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8716','Jamaica','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8717','Jambeiro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8718','Jandira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8719','Jaragua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8720','Jardim Belval','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8721','Jardim Presidente Dutra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8722','Jardim Santa Luzia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8723','Jardim Silveira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8724','Jardinopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8725','Jarinu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8726','Jatoba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8727','Jau','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8728','Jeriquara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8729','Joanopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8730','Joao Ramalho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8731','Joaquim Egidio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8732','Jordanesia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8733','Jose Bonifacio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8734','Juliania','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8735','Julio Mesquita','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8736','Jumirim','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8737','Jundiai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8738','Jundiapeba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8739','Junqueira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8740','Junqueiropolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8741','Juquia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8742','Juquiratiba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8743','Juquitiba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8744','Juritis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8745','Juruce','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8746','Jurupeba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8747','Jurupema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8748','Lacio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8749','Lagoa Azul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8750','Lagoa Branca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8751','Lagoinha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8752','Laranjal Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8753','Laras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8754','Lauro Penteado','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8755','Lavinia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8756','Lavrinhas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8757','Leme','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8758','Lencois Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8759','Limeira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8760','Lindoia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8761','Lins','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8762','Lobo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8763','Lorena','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8764','Lourdes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8765','Louveira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8766','Lucelia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8767','Lucianopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8768','Luis Antonio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8769','Luiziania','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8770','Lupercio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8771','Lusitania','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8772','Lutecia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8773','Macatuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8774','Macaubal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8775','Macedonia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8776','Macucos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8777','Magda','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8778','Mailasqui','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8779','Mairinque','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8780','Mairipora','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8781','Major Prado','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8782','Manduri','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8783','Mangaratu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8784','Maraba Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8785','Maracai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8786','Marapoama','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8787','Marcondesia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8788','Maresias','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8789','Mariapolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8790','Marilia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8791','Marinopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8792','Maristela','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8793','Martim Francisco','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8794','Martinho Prado Junior','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8795','Martinopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8796','Matao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8797','Maua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8798','Mendonca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8799','Meridiano','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8800','Mesopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8801','Miguelopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8802','Mineiros do Tiete','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8803','Mira Estrela','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8804','Miracatu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8805','Miraluz','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8806','Mirandopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8807','Mirante do Paranapanema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8808','Mirassol','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8809','Mirassolandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8810','Mococa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8811','Mogi das Cruzes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8812','Mogi-Guacu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8813','Mogi-Mirim','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8814','Mombuca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8815','Moncoes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8816','Mongagua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8817','Montalvao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8818','Monte Alegre do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8819','Monte Alto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8820','Monte Aprazivel','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8821','Monte Azul Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8822','Monte Castelo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8823','Monte Mor','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8824','Monte Verde Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8825','Monteiro Lobato','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8826','Moreira Cesar','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8827','Morro Agudo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8828','Morro do Alto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8829','Morungaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8830','Mostardas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8831','Motuca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8832','Mourao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8833','Murutinga do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8834','Nantes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8835','Narandiba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8836','Natividade da Serra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8837','Nazare Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8838','Neves Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8839','Nhandeara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8840','Nipoa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8841','Nogueira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8842','Nossa Senhora do Remedio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8843','Nova Alexandria','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8844','Nova Alianca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8845','Nova America','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8846','Nova Aparecida','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8847','Nova Campina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8848','Nova Canaa Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8849','Nova Castilho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8850','Nova Europa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8851','Nova Granada','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8852','Nova Guataporanga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8853','Nova Independencia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8854','Nova Itapirema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8855','Nova Luzitania','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8856','Nova Odessa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8857','Nova Patria','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8858','Nova Veneza','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8859','Novais','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8860','Novo Cravinhos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8861','Novo Horizonte','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8862','Nuporanga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8863','Oasis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8864','Ocaucu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8865','Oleo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8866','Olimpia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8867','Oliveira Barros','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8868','Onda Branca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8869','Onda Verde','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8870','Oriente','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8871','Orindiuva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8872','Orlandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8873','Osasco','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8874','Oscar Bressane','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8875','Osvaldo Cruz','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8876','Ourinhos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8877','Ouro Fino Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8878','Ouro Verde','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8879','Pacaembu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8880','Padre Nobrega','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8881','Palestina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8882','Palmares Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8883','Palmeira D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8884','Palmeiras de Sao Paulo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8885','Palmital','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8886','Panorama','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8887','Paraguacu Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8888','Paraibuna','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8889','Paraiso','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8890','Paraisolandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8891','Paranabi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8892','Paranapanema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8893','Paranapiacaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8894','Paranapua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8895','Parapua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8896','Pardinho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8897','Parelheiros','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8898','Pariquera-Acu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8899','Parisi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8900','Parnaso','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8901','Parque Meia Lua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8902','Paruru','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8903','Patrocinio Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8904','Pauliceia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8905','Paulinia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8906','Paulistania','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8907','Paulo de Faria','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8908','Paulopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8909','Pederneiras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8910','Pedra Bela','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8911','Pedra Branca de Itarare','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8912','Pedranopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8913','Pedregulho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8914','Pedreira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8915','Pedrinhas Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8916','Pedro Barros','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8917','Pedro de Toledo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8918','Penapolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8919','Pereira Barreto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8920','Pereiras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8921','Peruibe','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8922','Perus','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8923','Piacatu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8924','Picinguaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8925','Piedade','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8926','Pilar do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8927','Pindamonhangaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8928','Pindorama','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8929','Pinhalzinho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8930','Pinheiros','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8931','Pioneiros','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8932','Piquerobi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8933','Piquete','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8934','Piracaia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8935','Piracicaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8936','Piraju','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8937','Pirajui','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8938','Piramboia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8939','Pirangi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8940','Pirapitingui','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8941','Pirapora do Bom Jesus','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8942','Pirapozinho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8943','Pirassununga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8944','Piratininga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8945','Pitangueiras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8946','Planalto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8947','Planalto do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8948','Platina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8949','Poa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8950','Poloni','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8951','Polvilho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8952','Pompeia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8953','Pongai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8954','Pontal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8955','Pontalinda','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8956','Pontes Gestal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8957','Populina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8958','Porangaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8959','Porto Feliz','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8960','Porto Ferreira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8961','Porto Novo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8962','Porto Primavera','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8963','Potim','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8964','Potirendaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8965','Potunduva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8966','Pracinha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8967','Pradinia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8968','Pradopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8969','Praia Grande','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8970','Pratania','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8971','Presidente Alves','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8972','Presidente Bernardes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8973','Presidente Epitacio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8974','Presidente Prudente','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8975','Presidente Venceslau','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8976','Promissao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8977','Prudencio e Moraes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8978','Quadra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8979','Quata','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8980','Queiroz','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8981','Queluz','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8982','Quintana','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8983','Quiririm','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8984','Rafard','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8985','Rancharia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8986','Rechan','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8987','Redencao da Serra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8988','Regente Feijo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8989','Reginopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8990','Registro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8991','Restinga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8992','Riacho Grande','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8993','Ribeira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8994','Ribeirao Bonito','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8995','Ribeirao Branco','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8996','Ribeirao Corrente','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8997','Ribeirao do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8998','Ribeirao dos Indios','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('8999','Ribeirao Grande','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9000','Ribeirao Pires','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9001','Ribeirao Preto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9002','Ribeiro do Vale','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9003','Ribeiro dos Santos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9004','Rifaina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9005','Rincao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9006','Rinopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9007','Rio Claro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9008','Rio das Pedras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9009','Rio Grande da Serra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9010','Riolandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9011','Riversul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9012','Roberto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9013','Rosalia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9014','Rosana','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9015','Roseira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9016','Rubiacea','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9017','Rubiao Junior','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9018','Rubineia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9019','Ruilandia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9020','Sabauna','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9021','Sabino','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9022','Sagres','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9023','Sales','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9024','Sales Oliveira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9025','Salesopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9026','Salmourao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9027','Saltinho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9028','Salto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9029','Salto de Pirapora','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9030','Salto do Avanhandava','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9031','Salto Grande','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9032','Sandovalina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9033','Santa Adelia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9034','Santa Albertina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9035','Santa America','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9036','Santa Barbara D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9037','Santa Branca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9038','Santa Clara D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9039','Santa Cruz da Conceicao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9040','Santa Cruz da Esperanca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9041','Santa Cruz da Estrela','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9042','Santa Cruz das Palmeiras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9043','Santa Cruz do Rio Pardo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9044','Santa Cruz dos Lopes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9045','Santa Ernestina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9046','Santa Eudoxia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9047','Santa Fe do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9048','Santa Gertrudes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9049','Santa Isabel','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9050','Santa Isabel do Marinheiro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9051','Santa Lucia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9052','Santa Margarida Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9053','Santa Maria da Serra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9054','Santa Maria do Gurupa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9055','Santa Mercedes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9056','Santa Rita D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9057','Santa Rita do Passa Quatro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9058','Santa Rita do Ribeira','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9059','Santa Rosa de Viterbo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9060','Santa Salete','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9061','Santa Teresinha de Piracicaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9062','Santana da Ponte Pensa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9063','Santana de Parnaiba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9064','Santelmo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9065','Santo Anastacio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9066','Santo Andre','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9067','Santo Antonio da Alegria','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9068','Santo Antonio da Estiva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9069','Santo Antonio de Posse','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9070','Santo Antonio do Aracangua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9071','Santo Antonio do Jardim','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9072','Santo Antonio do Paranapanema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9073','Santo Antonio do Pinhal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9074','Santo Antonio Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9075','Santo Expedito','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9076','Santopolis do Aguapei','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9077','Santos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9078','Sao Benedito da Cachoeirinha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9079','Sao Benedito das Areias','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9080','Sao Bento do Sapucai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9081','Sao Bernardo do Campo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9082','Sao Berto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9083','Sao Caetano do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9084','Sao Carlos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9085','Sao Francisco','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9086','Sao Francisco da Praia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9087','Sao Francisco Xavier','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9088','Sao Joao da Boa Vista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9089','Sao Joao das Duas Pontes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9090','Sao Joao de Iracema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9091','Sao Joao de Itaguacu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9092','Sao Joao do Marinheiro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9093','Sao Joao do Pau D\'Alho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9094','Sao Joao Novo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9095','Sao Joaquim da Barra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9096','Sao Jose da Bela Vista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9097','Sao Jose das Laranjeiras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9098','Sao Jose do Barreiro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9099','Sao Jose do Rio Pardo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9100','Sao Jose do Rio Preto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9101','Sao Jose dos Campos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9102','Sao Lourenco da Serra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9103','Sao Lourenco do Turvo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9104','Sao Luis do Paraitinga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9105','Sao Luiz de Guaricanga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9106','Sao Manuel','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9107','Sao Martinho D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9108','Sao Mateus','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9109','Sao Miguel Arcanjo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9110','Sao Miguel Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9111','São Paulo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9112','Sao Pedro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9113','Sao Pedro do Turvo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9114','Sao Roque','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9115','Sao Roque da Fartura','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9116','Sao Sebastiao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9117','Sao Sebastiao da Grama','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9118','Sao Sebastiao da Serra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9119','Sao Silvestre de Jacarei','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9120','Sao Simao','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9121','Sao Vicente','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9122','Sapezal','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9123','Sapopemba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9124','Sarapui','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9125','Sarutaia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9126','Sebastianopolis do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9127','Serra Azul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9128','Serra Negra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9129','Serrana','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9130','Sertaozinho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9131','Sete Barras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9132','Severinia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9133','Silvania','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9134','Silveiras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9135','Simoes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9136','Simonsen','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9137','Socorro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9138','Sodrelia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9139','Solemar','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9140','Sorocaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9141','Sousas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9142','Sud Menucci','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9143','Sumare','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9144','Sussui','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9145','Suzano','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9146','Suzanopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9147','Tabajara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9148','Tabapua','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9149','Tabatinga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9150','Taboao da Serra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9151','Taciba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9152','Taguai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9153','Taiacu','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9154','Taiacupeba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9155','Taiuva','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9156','Talhado','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9157','Tambau','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9158','Tanabi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9159','Tapinas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9160','Tapirai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9161','Tapiratiba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9162','Taquaral','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9163','Taquaritinga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9164','Taquarituba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9165','Taquarivai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9166','Tarabai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9167','Taruma','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9168','Tatui','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9169','Taubate','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9170','Tecainda','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9171','Tejupa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9172','Teodoro Sampaio','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9173','Terra Nova D\'Oeste','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9174','Terra Roxa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9175','Tibirica','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9176','Tibirica do Paranapanema','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9177','Tiete','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9178','Timburi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9179','Toledo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9180','Torre de Pedra','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9181','Torrinha','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9182','Trabiju','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9183','Tremembe','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9184','Tres Aliancas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9185','Tres Fronteiras','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9186','Tres Pontes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9187','Tres Vendas','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9188','Tuiuti','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9189','Tujuguaba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9190','Tupa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9191','Tupi','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9192','Tupi Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9193','Turiba do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9194','Turiuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9195','Turmalina','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9196','Turvinia','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9197','Ubarana','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9198','Ubatuba','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9199','Ubirajara','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9200','Uchoa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9201','Uniao Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9202','Universo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9203','Urania','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9204','Uru','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9205','Urupes','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9206','Ururai','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9207','Vale Formoso','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9208','Valentim Gentil','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9209','Valinhos','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9210','Valparaiso','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9211','Vangloria','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9212','Vargem','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9213','Vargem Grande do Sul','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9214','Vargem Grande Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9215','Varpa','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9216','Varzea Paulista','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9217','Venda Branca','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9218','Vera Cruz','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9219','Vicente de Carvalho','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9220','Vicentinopolis','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9221','Vila Dirce','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9222','Vila Nery','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9223','Vila Xavier','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9224','Vinhedo','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9225','Viradouro','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9226','Vista Alegre do Alto','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9227','Vitoria Brasil','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9228','Vitoriana','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9229','Votorantim','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9230','Votuporanga','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9231','Zacarias','26');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9232','Abreulandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9233','Alianca do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9234','Almas','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9235','Alvorada','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9236','Anajanopolis','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9237','Ananas','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9238','Angico','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9239','Aparecida do Rio Negro','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9240','Apinaje','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9241','Aragacui','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9242','Aragominas','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9243','Araguacema','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9244','Araguacu','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9245','Araguaina','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9246','Araguana','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9247','Araguatins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9248','Arapoema','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9249','Arraias','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9250','Augustinopolis','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9251','Aurora do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9252','Axixa do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9253','Babaculandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9254','Barra do Grota','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9255','Barrolandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9256','Bernardo Sayao','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9257','Bom Jesus do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9258','Brasilandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9259','Brasilandia do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9260','Brejinho de Nazare','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9261','Buriti do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9262','Cachoeirinha','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9263','Campos Lindos','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9264','Cana Brava','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9265','Canela','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9266','Cariri do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9267','Carmolandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9268','Carrasco Bonito','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9269','Cartucho','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9270','Caseara','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9271','Centenario','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9272','Chapada','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9273','Cocalandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9274','Cocalinho','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9275','Colinas do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9276','Colmeia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9277','Combinado','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9278','Conceicao do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9279','Correinha','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9280','Couto de Magalhaes','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9281','Craolandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9282','Cristalandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9283','Crixas','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9284','Darcinopolis','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9285','Dianopolis','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9286','Divinopolis do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9287','Dois Irmaos do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9288','Duere','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9289','Escondido','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9290','Esperantina','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9291','Fatima','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9292','Figueiropolis','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9293','Filadelfia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9294','Formoso do Araguaia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9295','Fortaleza do Tabocao','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9296','Goianorte','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9297','Goiatins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9298','Guarai','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9299','Gurupi','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9300','Ilha Barreira Branca','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9301','Ipueiras','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9302','Itacaja','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9303','Itaguatins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9304','Itapiratins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9305','Itapora do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9306','Jau do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9307','Juarina','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9308','Jussara','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9309','Lagoa da Confusao','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9310','Lagoa do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9311','Lajeado','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9312','Lizarda','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9313','Marianopolis do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9314','Mateiros','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9315','Maurilandia do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9316','Miracema do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9317','Mirandopolis','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9318','Miranorte','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9319','Monte do Carmo','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9320','Monte Lindo','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9321','Monte Santo','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9322','Mosquito','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9323','Muricilandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9324','Natal','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9325','Natividade','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9326','Nazare','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9327','Nova Olinda','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9328','Nova Rosalandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9329','Novo Acordo','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9330','Novo Alegre','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9331','Novo Horizonte','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9332','Novo Jardim','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9333','Palmas','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9334','Palmeirante','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9335','Palmeiropolis','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9336','Paraiso do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9337','Parana','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9338','Pau D\'Arco','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9339','Pe da Serra','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9340','Pedro Afonso','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9341','Pedro Ludovico','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9342','Peixe','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9343','Pequizeiro','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9344','Piloes','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9345','Pindorama do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9346','Piraque','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9347','Pium','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9348','Ponte Alta do Bom Jesus','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9349','Ponte Alta do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9350','Pontes','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9351','Poraozinho','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9352','Porto Alegre do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9353','Porto Lemos','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9354','Porto Nacional','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9355','Praia Norte','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9356','Presidente Kennedy','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9357','Principe','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9358','Recursolandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9359','Riachinho','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9360','Rio da Conceicao','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9361','Rio dos Bois','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9362','Rio Sono','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9363','Sampaio','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9364','Sandolandia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9365','Santa Fe do Araguaia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9366','Santa Maria do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9367','Santa Rosa do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9368','Santa Tereza do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9369','Sao Bento do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9370','Sao Felix do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9371','Sao Miguel do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9372','Sao Salvador do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9373','Sao Sebastiao do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9374','Sao Valerio da Natividade','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9375','Silvanopolis','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9376','Sitio Novo do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9377','Sucupira','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9378','Taguatinga','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9379','Taipas do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9380','Tamboril','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9381','Taquaralto','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9382','Taquarussu do Tocantins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9383','Tocantinia','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9384','Tocantinopolis','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9385','Tupirama','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9386','Tupirata','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9387','Tupiratins','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9388','Venus','27');
INSERT INTO `cidades` (`id`,`nome`,`estados_id`) VALUES
('9389','Wanderlandia','27');



-- -------------------------------------------
-- TABLE DATA estados
-- -------------------------------------------
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('1','Acre','AC');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('2','Alagoas','AL');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('3','Amazonas','AM');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('4','Amapá','AP');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('5','Bahia','BA');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('6','Ceará','CE');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('7','Distrito Federal','DF');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('8','Espírito Santo','ES');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('9','Goiás','GO');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('10','Maranhão','MA');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('11','Minas Gerais','MG');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('12','Mato Grosso do Sul','MS');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('13','Mato Grosso','MT');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('14','Pará','PA');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('15','Paraíba','PB');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('16','Pernambuco','PE');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('17','Piauí','PI');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('18','Paraná','PR');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('19','Rio de Janeiro','RJ');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('20','Rio Grande do Norte','RN');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('21','Rondônia','RO');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('22','Roraima','RR');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('23','Rio Grande do Sul','RS');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('24','Santa Catarina','SC');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('25','Sergipe','SE');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('26','São Paulo','SP');
INSERT INTO `estados` (`id`,`nome`,`sigla`) VALUES
('27','Tocantins','TO');



-- -------------------------------------------
-- TABLE DATA j_atividades
-- -------------------------------------------
INSERT INTO `j_atividades` (`id`,`titulo`,`nome`,`localExecucao`,`pesAtendidas`,`classificacaoAtivi`,`dataInicio`,`datafim`,`cargHoraria`,`turno`,`areaConhecimento`,`descricao`,`publicoAlvo`,`isAtivo`) VALUES
('1','ghghgh','João','januaria','30','Seminário','2018-04-18','2018-04-18','30','Matutino','saude','','estagiario','0');
INSERT INTO `j_atividades` (`id`,`titulo`,`nome`,`localExecucao`,`pesAtendidas`,`classificacaoAtivi`,`dataInicio`,`datafim`,`cargHoraria`,`turno`,`areaConhecimento`,`descricao`,`publicoAlvo`,`isAtivo`) VALUES
('2','meu primeiro cadastro','Isabela','','','Feira','2018-04-30','2018-05-01','','','','','','0');



-- -------------------------------------------
-- TABLE DATA j_declaracoes
-- -------------------------------------------
INSERT INTO `j_declaracoes` (`id`,`nome`,`cpf`,`titulo`,`anoletivo`) VALUES
('1','Lopes','344.343.432-43','sdhksdkjd','2º Semestre 2016');



-- -------------------------------------------
-- TABLE DATA j_particeventos
-- -------------------------------------------
INSERT INTO `j_particeventos` (`id`,`titulo`,`nome`,`email`) VALUES
('1','ghghgh','Maria','discente@gmail.com');



-- -------------------------------------------
-- TABLE DATA j_particprojetos
-- -------------------------------------------
INSERT INTO `j_particprojetos` (`id`,`titulo`,`nome`,`tipoUsuario`,`justificativa`) VALUES
('1','Educar','Jany','Discente Voluntário','');
INSERT INTO `j_particprojetos` (`id`,`titulo`,`nome`,`tipoUsuario`,`justificativa`) VALUES
('2','Educar','Bianca Dias Guedes','Discente Bolsista','');



-- -------------------------------------------
-- TABLE DATA j_usuarios
-- -------------------------------------------
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('1','admin','111.111.111-11','111111111111','admin@gmail.com','11','11','7','11','11','Minas Gerais','(11)11111-1111','1','','','','$2y$13$7VxOj6vM5A4sdWsliy6WWuQq0vFSC9zg0XotFL2p.E5Ia1mMS0HAS','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('2','Maria','222.222.222-22','222222222222','mary@gmail.com','22','22','22','22','22','Minas Gerais','(22)22222-2222','2','','','','$2y$13$DAnY3sclihz6P8TFOanPGu.CvKAHABA8ax77Jljiu9o.Bmnr5RLyy','2','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('4','Jany dis','444.444.444-44','444444444444','jany@gmail.com','44','44','44','44','44','Minas Gerais','(44)44444-4444','4','','','','$2y$13$wC7n.F6n9wRGyxWyXv8pMOHQ1ccDQEvk7PK5Ua3pxpn2.VECo4A3a','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('10','Janielly Araujo Lopes','234.324.234-23','234324234234','janielly300@gmail.com','São Mateus','567','A','Centro','Januária','Minas Gerais','(34)34234-2342','2','','','','$2y$13$aWksulRy4Wf4WSJi264zleLR3uybEmxEGfmunZz.22THpbZHTJ1OS','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('28','Marcos Dias','100.289.388-73','237878273872','marcos@gmail.com','','','','','','','','3','','','','$2y$13$BxztmML8oTPhodcAA4E9m.gcoNIqGzMhmwQOudM/69zaAiX20/msK','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('32','Jany ser','984.434.354-35','','KHD@GMAIL.COM','','','','','','','','3','','','','$2y$13$R6VICgx1qjjccyk6GUatCuLoYIsA52b5Rl88a943ggl7MjvHnulKC','0','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('33','admin2','121.212.121-21','','admin2@gmail.com','','','','','','','','1','','','','$2y$13$Ci/5Sna8ojNqNlVxfxD0VeIh5Av1u0ha4ZmdDnst0iGzwChWrHX6.','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('34','jany araujo','121.212.232-33','','ja@gmail.com','','','','','januaria','Mato Grosso do Sul','','4','','','','$2y$13$LXdCO6RVL6iRJ9rdiZTDCe2uHRZ2P0z8aRVU.3Z/esxJqpcuSjxDi','2','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('35','Teste','938.998.298-49','','city.janu@gmail.com','','','','','','','','4','','','','$2y$13$2m6j3lyJ4e8nCCdon4F9R.Hj4DEDQvCO2Njq/DFubNgxG2N9Hy.I2','1','0','fx1gUqdhOEGQqknqL5mET0fpaF82XTbW_1535403595','');



-- -------------------------------------------
-- TABLE DATA modalidade
-- -------------------------------------------
INSERT INTO `modalidade` (`id`,`nome`) VALUES
('1','Fomento Interno');
INSERT INTO `modalidade` (`id`,`nome`) VALUES
('2','Voluntário');
INSERT INTO `modalidade` (`id`,`nome`) VALUES
('4','Fomento Externo');



-- -------------------------------------------
-- TABLE DATA parceiros
-- -------------------------------------------
INSERT INTO `parceiros` (`id`,`nome`) VALUES
('1','maria');
INSERT INTO `parceiros` (`id`,`nome`) VALUES
('4','João');
INSERT INTO `parceiros` (`id`,`nome`) VALUES
('6','Cecília');
INSERT INTO `parceiros` (`id`,`nome`) VALUES
('7','Bruna');



-- -------------------------------------------
-- TABLE DATA projeto_usuario
-- -------------------------------------------
INSERT INTO `projeto_usuario` (`id`,`projeto_id`,`usuario_id`,`tipo`) VALUES
('1','50','28','Docente - Coordenador');
INSERT INTO `projeto_usuario` (`id`,`projeto_id`,`usuario_id`,`tipo`) VALUES
('2','50','32','Docente - Colaborador');
INSERT INTO `projeto_usuario` (`id`,`projeto_id`,`usuario_id`,`tipo`) VALUES
('3','50','34','Discente Bolsista');
INSERT INTO `projeto_usuario` (`id`,`projeto_id`,`usuario_id`,`tipo`) VALUES
('4','50','4','Discente Voluntário');



-- -------------------------------------------
-- TABLE DATA projetos
-- -------------------------------------------
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('3','Educar','Isabela','ArtÃ­stico','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','JanuÃ¡ria','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','CrianÃ§as e adolescentes','33','Servir','2018-04-16','2018-04-28','40','80','--','NÃ£o','---','NÃ£o','--','NÃ£o','--','NÃ£o','Sim','','IFNMG','232','Tecnologia','JanuÃ¡ria','','3','VoluntÃ¡rio','0','8','PerÃ­odo de tempo curto','Maio','kkjkjkj hkjhjhjkj jhjkhhkhk jhkhjkjhkjh','regular','jhghjghjgjhgjjjjjjjjjjjjjjjjjjjjjjj','','','','','','','','','0','','','','','','0','1');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('25','Inclusão digital','Jany ser','Cultural','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','JanuÃ¡ria','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','CrianÃ§as e adolescentes','35','Servir','2018-04-24','2018-04-24','30','80','','','---','','--','','--','','','','--','0','Tecnologia','','','2','Fomento Externo','4','7','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('26','Semana da Informática','Marcos','Tecnológico','I would like to meet you to discuss the latest news about the arrival of the new theme. They say it is going to be one the best themes on the market','I would like to meet you to discuss the latest news about the arrival of the new theme. They say it is going to be one the best themes on the market','Januária','I would like to meet you to discuss the latest news about the arrival of the new theme. They say it is going to be one the best themes on the market','Acadêmicos ','350','IFNMG','2018-04-30','2018-05-11','30','60','','Sim','TADS','','--','','--','','','','--','0','Tecnologia','','','1','Fomento Interno','1','3','teste teste teste teste teste','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('27','Pro Educ ','Marcos','Cultural','','','Januária','','Crianças e adolescentes','33','','2018-04-30','2018-05-05','30','60','maria','Não','','Não','','Não','--','Sim','Sim','','IFNMG','300','Tecnologia','IFNMG - Januária','','1','Fomento Interno','1','2','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('32','+Up','Jany ser','Empreendedor','','','','','','','','2018-06-25','2018-06-30','30','80','','','','','','','','','Sim','','IFNMG','232','','','','1','Fomento Interno','1','5','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('36','Tecno Show','Marcos','Tecnológico','','','Januária','','Crianças e adolescentes','33','','2018-07-26','2018-08-04','30','60','','','','','','','','Não','','','','','Tecnologia','IFNMG - Januária','','1','Fomento Interno','1','2','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('37','teste','Marcos Dias','Tecnológico','','','','','','','','2018-07-18','2018-07-28','30','60','','','','','','','','','','','','','','','','1','Fomento Interno','1','4','teste teste teste teste teste teste teste teste teste teste teste teste ','','','','','','','','','','','','','','','','','','','Jany dis','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('44','oi6','Jany ser','Social','','','Januária','','Crianças e adolescentes','33','','2018-07-31','2018-08-04','30','60','','','','','','','','Não','','','','','Tecnologia','IFNMG - Januária','','3','Voluntário','3','3','teste','','','','','','','','','','','','','','','','','','28','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('45','hjsdhj','Jany ser','Tecnológico','','','','','','','','2018-08-22','2018-08-31','23','443','','','','','','','','','','','','','','','','3','Voluntário','1','7','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('46','reitoriae','Jany ser','Tecnológico','','','','','','','','2018-08-07','2018-08-20','30','60','','','','','','','','','','','','','','','','1','Fomento Interno','1','7','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('47','novo teste','Marcos Dias','Social','','','','','','','','2018-08-01','2018-08-29','30','60','','','','','','','','','','','','','','','','2','Fomento Externo','3','7','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('48','voluntario','Marcos Dias','Tecnológico','','','','','','','','2018-08-02','2018-08-02','30','80','','','','','','','','','','','','','','','','3','Voluntário','1','5','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('49','projeto marcos','Marcos Dias','Social','','','','','','','','2018-08-01','2018-08-30','30','80','João','','','','','','','','','','','','','','','0','Voluntário','0','0','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO `projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`,`idUser`,`participante`,`tipoUsuario`) VALUES
('50','projeto marcos 1','Marcos Dias','Empreendedor','','','','','','','','2018-08-01','2018-08-28','30','60','João','','','','','','','','','','','','','','','0','Fomento Interno','2','0','','','','','','','','','','','','','','','','','','','','','');



-- -------------------------------------------
-- TABLE DATA relatorios
-- -------------------------------------------
INSERT INTO `relatorios` (`id`,`versao`,`descricao`,`status`) VALUES
('1','1/2018','Relatório Mensal','2');
INSERT INTO `relatorios` (`id`,`versao`,`descricao`,`status`) VALUES
('3','2/2018','Relatório Parcial','');
INSERT INTO `relatorios` (`id`,`versao`,`descricao`,`status`) VALUES
('6','2/2018','Relatório Parcial','0');
INSERT INTO `relatorios` (`id`,`versao`,`descricao`,`status`) VALUES
('7','6/2018','Relatório Parcial','0');
INSERT INTO `relatorios` (`id`,`versao`,`descricao`,`status`) VALUES
('8','1/2018','Relatório Parcial','1');
INSERT INTO `relatorios` (`id`,`versao`,`descricao`,`status`) VALUES
('9','1/2018','Relatório Parcial','1');
INSERT INTO `relatorios` (`id`,`versao`,`descricao`,`status`) VALUES
('10','1/2018','Relatório Parcial','1');
INSERT INTO `relatorios` (`id`,`versao`,`descricao`,`status`) VALUES
('11','1/2018','Relatório Mensal','1');



-- -------------------------------------------
-- TABLE DATA status
-- -------------------------------------------
INSERT INTO `status` (`id`,`nome`) VALUES
('1','teste');



-- -------------------------------------------
-- TABLE DATA tipoprojeto
-- -------------------------------------------
INSERT INTO `tipoprojeto` (`id`,`nome`) VALUES
('7','Tecnológico');
INSERT INTO `tipoprojeto` (`id`,`nome`) VALUES
('2','Empreendedor');
INSERT INTO `tipoprojeto` (`id`,`nome`) VALUES
('3','Social');
INSERT INTO `tipoprojeto` (`id`,`nome`) VALUES
('4','Cultural');
INSERT INTO `tipoprojeto` (`id`,`nome`) VALUES
('5','Artístico');
INSERT INTO `tipoprojeto` (`id`,`nome`) VALUES
('6','Esportivo');



-- -------------------------------------------
-- TABLE DATA tipousuario
-- -------------------------------------------
INSERT INTO `tipousuario` (`id`,`nome`) VALUES
('1','Discente Voluntário');
INSERT INTO `tipousuario` (`id`,`nome`) VALUES
('15','Técnico Administrativo - Coordenador');
INSERT INTO `tipousuario` (`id`,`nome`) VALUES
('13','Técnico Administrativo - Colaborador');
INSERT INTO `tipousuario` (`id`,`nome`) VALUES
('6','Discente Bolsista');
INSERT INTO `tipousuario` (`id`,`nome`) VALUES
('14','Docente - Colaborador');
INSERT INTO `tipousuario` (`id`,`nome`) VALUES
('16','Docente - Coordenador');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
