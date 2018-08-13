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
  `justificativa` varchar(45) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

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
-- TABLE DATA auth_assignment
-- -------------------------------------------
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('admin','1','1523756062');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('admin','6','1523756044');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('coordenador','2','1523755883');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('discente','4','1523755896');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('discente','5','1523755901');
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('servidor','3','1523755892');
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
-- TABLE DATA j_projetos
-- -------------------------------------------
INSERT INTO `j_projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`) VALUES
('3','Educar','Isabela','Artístico','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Januária','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Crianças e adolescentes','33','Servir','2018-04-16','2018-04-28','40','80','--','Não','---','Não','--','Não','--','Não','Sim','','IFNMG','232','Tecnologia','Januária','','5','Voluntário','0','1','Período de tempo curto','Maio','kkjkjkj hkjhjhjkj jhjkhhkhk jhkhjkjhkjh','regular','jhghjghjgjhgjjjjjjjjjjjjjjjjjjjjjjj','','','','','','','','','0','0','1','','');
INSERT INTO `j_projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`) VALUES
('23','Melhor idade','João','Cultural','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Januária','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Idosos','33','IFNMG','2018-04-24','2018-04-25','30','50','--','Não','---','Não','--','Não','--','Não','Não','','--','0','Tecnologia','','','1','Fomento Interno','4','0','','','','','','','','','','','','','','','','','','');
INSERT INTO `j_projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`) VALUES
('24','Empreender','Maria Luisa','Social','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Januária','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Acadêmicos ','33','Praça Tiradentes','2018-04-12','2018-04-26','40','60','--','Sim','BADM','Não','--','Não','--','Não','Sim','','IFNMG','200','Administraçao','Januária','','1','Fomento Interno','3','2','Take me to your leader! Switzerland is small and neutral! We are more like Germany, ambitious and misunderstood!','','','','','','','','','','','','','','','','','');
INSERT INTO `j_projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`) VALUES
('25','Inclusão digital','Maria Luisa','Cultural','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Januária','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Crianças e adolescentes','35','Servir','2018-04-24','2018-04-24','30','80','--','Não','---','Não','--','Não','--','Não','Não','','--','0','Tecnologia','Januária','','2','Voluntário','4','1','','','','','','','','','','','','','','','','','','');
INSERT INTO `j_projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`) VALUES
('21','Melhor idade III','João','Tecnológico','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Januária','Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...','Idosos','35','IFNMG','2018-04-16','2018-04-20','34','56','--','Não','---','Não','--','Não','--','Não','Não','','--','0','Tecnologia','Januária','','1','Fomento Interno','1','2','falta informação','','','','','','','','','','','','','','','','','');
INSERT INTO `j_projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`) VALUES
('26','Semana da Informática','João','Tecnológico','I would like to meet you to discuss the latest news about the arrival of the new theme. They say it is going to be one the best themes on the market','I would like to meet you to discuss the latest news about the arrival of the new theme. They say it is going to be one the best themes on the market','Januária','I would like to meet you to discuss the latest news about the arrival of the new theme. They say it is going to be one the best themes on the market','Acadêmicos ','350','IFNMG','2018-04-30','2018-05-11','30','60','--','Sim','TADS','Não','--','Não','--','Não','Não','','--','0','Tecnologia','Januária','','2','Voluntário','1','0','','','','','','','','','','','','','','','','','','');
INSERT INTO `j_projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`) VALUES
('27','Melhor idade 2','João','Tecnológico','','','','','','','','2018-04-30','2018-05-05','30','60','','','','','','','','','','','','','','','','1','Fomento Interno','1','0','','','','','','','','','','','','','','','','','','');
INSERT INTO `j_projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`) VALUES
('28','Melhor idade 4','João','Tecnológico','','','','','','','','2018-04-18','2018-04-28','30','60','','','','','','','','','','','','','','','','1','Fomento Interno','1','2','hjddssjsfsdjfsdf','','','','','','','','','','','','','','','','','');
INSERT INTO `j_projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`) VALUES
('29','teste','Isabela','Empreendedor','','','','','','','','2018-05-02','2018-05-26','30','50','','','','','','','','','','','','','','','','1','Fomento Interno','2','1','','','','','','','','','','','','','','','','','','');
INSERT INTO `j_projetos` (`id`,`titulo`,`coordenador`,`tipoProjeto`,`objetivo`,`resumo`,`municipio`,`descricaoPopulacao`,`publicoAlvo`,`pesAtendidas`,`localExecucao`,`dataInicio`,`datafim`,`cargHorariaSemanal`,`cargHorariaTotal`,`parceiros`,`vinculo`,`citarVinculo`,`convenio`,`citarConvenio`,`gerFundacao`,`citarFundacao`,`multicampi`,`financiamento`,`tipoFinanciamento`,`citarFinanciamento`,`valorFinanciamento`,`areaConhecimento`,`campusDesenvolvido`,`isStatus`,`isControle`,`modalidade`,`isTipo`,`isAtivo`,`justificativa`,`mes`,`atividesenvolvidas`,`avaliacao`,`observacoes`,`objetalcancados`,`etapas`,`materiasutiliz`,`metodosutiliz`,`caracfacilitadora`,`caractdificultadora`,`contribuicao`,`avaliacao2`,`isAndamento`,`editaAluno`,`editaCoordenador`,`dataSolicitacao`,`dataAnalise`) VALUES
('30','Educar 3','João','Empreendedor','','','','','','','','2018-05-03','2018-05-31','30','60','','','','','','','','','','','','','','','','1','Fomento Interno','2','1','','','','','','','','','','','','','','','','','','');



-- -------------------------------------------
-- TABLE DATA j_usuarios
-- -------------------------------------------
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('1','admin','111.111.111-11','111111111111','admin@gmail.com','11','11','7','11','11','Minas Gerais','(11)11111-1111','1','','','','$2y$13$7VxOj6vM5A4sdWsliy6WWuQq0vFSC9zg0XotFL2p.E5Ia1mMS0HAS','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('2','Maria','222.222.222-22','222222222222','mary@gmail.com','22','22','22','22','22','Minas Gerais','(22)22222-2222','2','','','','$2y$13$DAnY3sclihz6P8TFOanPGu.CvKAHABA8ax77Jljiu9o.Bmnr5RLyy','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('3','João','333.333.333-33','333333333333','joao@gmail.com','33','33','33','33','33','Minas Gerais','(33)33333-3333','3','','','','$2y$13$Gp.ZaCHGfQ8VLB086gzzMevMzD9pl82QLd9tuRQWhWjddRHfz3CaC','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('4','Jany','444.444.444-44','444444444444','jany@gmail.com','44','44','44','44','44','Minas Gerais','(44)44444-4444','4','','','','$2y$13$CLh5OUYHepWuR9kpvj4XbuwR9eKm0CyLRetpXOSfr54vzYJOCM5Wy','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('5','Bianca Dias Guedes','343.432.324-23','323423432423','bdg@gmail.com','2342324','2147483647','3242323','23','34','Minas Gerais','(23)23423-4234','4','','','','$2y$13$dHOrpDlXDc3cB/oLeHn9seX14kksY3.2aFLNjz2BOKq0gjJXN7zLS','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('6','admin2','123.123.112-31','123123213131','admin2@gmail.com','123','213','23','23','23','Minas Gerais','(21)12312-3123','1','','','','$2y$13$afYiWjRzl49qwTL0.PbOpuvyYx520mMEyuaCzfBr1FY0nEHDmpoJ6','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('7','Isabela','122.121.211-21','111212112121','isa@gmail.com','12','12','12','12','12','Minas Gerais','(21)21212-1212','3','','','','$2y$13$qZjx6UxVUAQoBq7AokZWuurtb04J9gitZzxMOpzADU56ORwD.Tlsi','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('9','Maria Luisa','456.544.564-56','564645645645','malu@gmail.com','São Mateus','567','A','Centro','Januária','Minas Gerais','(45)65645-6456','3','','','','$2y$13$lK68yhu/SE7yVwzxrH40hO27Po/qhk.5cIllbOgUN/ixcO.x8.EbW','1','0','','');
INSERT INTO `j_usuarios` (`id`,`nome`,`cpf`,`rg`,`email`,`rua`,`numero`,`complemento`,`bairro`,`cidade`,`estado`,`telefone`,`role`,`siapeMatric`,`formacaoCurso`,`instituicao`,`password_hash`,`isAtivo`,`codVerificacao`,`password_reset_token`,`dtnascimento`) VALUES
('10','Janielly Araujo Lopes','234.324.234-23','234324234234','janielly300@gmail.com','São Mateus','567','A','Centro','Januária','Minas Gerais','(34)34234-2342','2','','','','$2y$13$aWksulRy4Wf4WSJi264zleLR3uybEmxEGfmunZz.22THpbZHTJ1OS','0','0','','');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
