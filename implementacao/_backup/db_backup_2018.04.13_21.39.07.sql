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
-- TABLE `j_eventos`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_eventos`;
CREATE TABLE IF NOT EXISTS `j_eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(500) NOT NULL,
  `tipoEvento` varchar(20) DEFAULT NULL,
  `localExecucao` varchar(30) DEFAULT NULL,
  `pesAtendidas` int(6) DEFAULT NULL,
  `classificacaoEvent` varchar(30) DEFAULT NULL,
  `comCertificado` varchar(5) DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  `datafim` date DEFAULT NULL,
  `cargHoraria` int(10) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `areaConhecimento` varchar(30) DEFAULT NULL,
  `grupoPesquisa` varchar(100) DEFAULT NULL,
  `resumo` text,
  `publicoAlvo` varchar(30) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `setor` varchar(30) DEFAULT NULL,
  `valorEvento` float DEFAULT NULL,
  `inscricao` varchar(10) DEFAULT NULL,
  `valorIinscricao` float DEFAULT NULL,
  `financiamento` varchar(5) DEFAULT NULL,
  `financiamentoAprovado` varchar(5) DEFAULT NULL,
  `valorFinanciamento` float DEFAULT NULL,
  `possuiBolsa` varchar(5) DEFAULT NULL,
  `tipoBolsa` varchar(20) DEFAULT NULL,
  `classeBolsa` varchar(20) DEFAULT NULL,
  `numBolsa` int(6) DEFAULT NULL,
  `parceiro` varchar(100) DEFAULT NULL,
  `tipoparceiro` varchar(100) DEFAULT NULL,
  `valorParceiro` float DEFAULT NULL,
  `isAtivo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `nome` (`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_mesaredonda`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_mesaredonda`;
CREATE TABLE IF NOT EXISTS `j_mesaredonda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(500) NOT NULL,
  `mediadores` varchar(300) DEFAULT NULL,
  `cargHoraria` int(10) DEFAULT NULL,
  `evento` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_minicurso`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_minicurso`;
CREATE TABLE IF NOT EXISTS `j_minicurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(500) NOT NULL,
  `instrutor` varchar(30) DEFAULT NULL,
  `cargHoraria` int(10) DEFAULT NULL,
  `evento` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_j_minicurso_j_eventos` (`evento`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_oficina`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_oficina`;
CREATE TABLE IF NOT EXISTS `j_oficina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomeOficina` varchar(500) NOT NULL,
  `instrutores` varchar(300) DEFAULT NULL,
  `cargHoraria` int(10) DEFAULT NULL,
  `evento` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_palestra`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_palestra`;
CREATE TABLE IF NOT EXISTS `j_palestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(500) NOT NULL,
  `palestrante` varchar(30) DEFAULT NULL,
  `cargHoraria` int(10) DEFAULT NULL,
  `evento` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_j_palestra_j_eventos` (`evento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_particprojetos`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_particprojetos`;
CREATE TABLE IF NOT EXISTS `j_particprojetos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(500) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `tipoUsuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_poster`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_poster`;
CREATE TABLE IF NOT EXISTS `j_poster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(500) NOT NULL,
  `apresentadores` varchar(300) DEFAULT NULL,
  `evento` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `j_projetos`
-- -------------------------------------------
DROP TABLE IF EXISTS `j_projetos`;
CREATE TABLE IF NOT EXISTS `j_projetos` (
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
  `isAtivo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

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
-- TABLE DATA j_atividades
-- -------------------------------------------
INSERT INTO `j_atividades` (`id`,`titulo`,`nome`,`localExecucao`,`pesAtendidas`,`classificacaoAtivi`,`dataInicio`,`datafim`,`cargHoraria`,`turno`,`areaConhecimento`,`descricao`,`publicoAlvo`,`isAtivo`) VALUES
('1','atividade x','Janielly Araujo Lopes','caic','300','Seminário','2018-04-11','2018-04-11','30','Noturno','saude','wueywueuywebnbasbnaasbnbsabn','adolescente','0');
INSERT INTO `j_atividades` (`id`,`titulo`,`nome`,`localExecucao`,`pesAtendidas`,`classificacaoAtivi`,`dataInicio`,`datafim`,`cargHoraria`,`turno`,`areaConhecimento`,`descricao`,`publicoAlvo`,`isAtivo`) VALUES
('2','mnsdnmd','Jamily Souza','sdnm','11','Exposição','2018-04-11','2018-04-18','32','Vespertino','32','','323','0');



-- -------------------------------------------
-- TABLE DATA j_minicurso
-- -------------------------------------------
INSERT INTO `j_minicurso` (`id`,`titulo`,`instrutor`,`cargHoraria`,`evento`,`status`) VALUES
('1','Android','','30','Empreender','0');



-- -------------------------------------------
-- TABLE DATA j_usuarios
-- -------------------------------------------
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`) VALUES
('1','admin','111.111.111-11','111111111111','admin@gmail.com','11','11','7','11','11','Minas Gerais','(11)11111-1111','1','','','','$2y$13$7VxOj6vM5A4sdWsliy6WWuQq0vFSC9zg0XotFL2p.E5Ia1mMS0HAS','1','0','');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
