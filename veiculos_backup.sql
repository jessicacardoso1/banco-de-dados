-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51a-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema veiculos
--

CREATE DATABASE IF NOT EXISTS veiculos;
USE veiculos;

--
-- Definition of table `agentes`
--

DROP TABLE IF EXISTS `agentes`;
CREATE TABLE `agentes` (
  `idagente` int(11) NOT NULL auto_increment,
  `nome` varchar(50) NOT NULL,
  `datacontratacao` date NOT NULL,
  PRIMARY KEY  (`idagente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agentes`
--

/*!40000 ALTER TABLE `agentes` DISABLE KEYS */;
INSERT INTO `agentes` (`idagente`,`nome`,`datacontratacao`) VALUES 
 (1,'Pedro','2000-04-01'),
 (2,'Francisco','2001-10-01'),
 (3,'Raimundo','2010-04-01'),
 (4,'Bruno','2004-04-01'),
 (5,'Carlos','2002-11-01'),
 (6,'Gabriel','2000-03-01'),
 (7,'Victor','2000-04-01'),
 (8,'Thiago','2000-04-01'),
 (9,'Lucas','2000-04-01'),
 (10,'Paulo','2000-04-01');
/*!40000 ALTER TABLE `agentes` ENABLE KEYS */;


--
-- Definition of table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL auto_increment,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY  (`idcategoria`),
  UNIQUE KEY `ix_descricao` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorias`
--

/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`idcategoria`,`nome`) VALUES 
 (2,'automóvel'),
 (3,'caminhão'),
 (1,'motocicleta'),
 (4,'ônibus');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;


--
-- Definition of table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
CREATE TABLE `cidades` (
  `idcidade` int(11) NOT NULL auto_increment,
  `nome` varchar(50) NOT NULL,
  `idestado` int(11) NOT NULL,
  PRIMARY KEY  (`idcidade`),
  KEY `IX_cidade` (`nome`),
  KEY `FK_cidade` (`idestado`),
  CONSTRAINT `FK_cidade` FOREIGN KEY (`idestado`) REFERENCES `estados` (`idestado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cidades`
--

/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` (`idcidade`,`nome`,`idestado`) VALUES 
 (1,'Salvador',1),
 (2,'Feira de Santana',1),
 (3,'Lauro de Freitas',1),
 (4,'São Paulo',2),
 (5,'Campinas',2),
 (6,'Rio de Janeiro',3),
 (7,'Buzios',3);
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;


--
-- Definition of table `combustiveis`
--

DROP TABLE IF EXISTS `combustiveis`;
CREATE TABLE `combustiveis` (
  `idcombustivel` int(11) NOT NULL auto_increment,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY  (`idcombustivel`),
  UNIQUE KEY `ix_descricao` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `combustiveis`
--

/*!40000 ALTER TABLE `combustiveis` DISABLE KEYS */;
INSERT INTO `combustiveis` (`idcombustivel`,`nome`) VALUES 
 (2,'Álcool'),
 (4,'Diesel'),
 (1,'Gasolina'),
 (3,'GNV');
/*!40000 ALTER TABLE `combustiveis` ENABLE KEYS */;


--
-- Definition of table `cores`
--

DROP TABLE IF EXISTS `cores`;
CREATE TABLE `cores` (
  `idcor` int(11) NOT NULL auto_increment,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY  (`idcor`),
  UNIQUE KEY `ix_descricao` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cores`
--

/*!40000 ALTER TABLE `cores` DISABLE KEYS */;
INSERT INTO `cores` (`idcor`,`nome`) VALUES 
 (5,'Amarelo'),
 (4,'Azul'),
 (3,'Branco'),
 (8,'Laranja'),
 (2,'Prata'),
 (1,'Preto'),
 (9,'Rosa'),
 (7,'Verde'),
 (6,'Vermelho');
/*!40000 ALTER TABLE `cores` ENABLE KEYS */;


--
-- Definition of table `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `idestado` int(11) NOT NULL auto_increment,
  `nome` varchar(40) NOT NULL,
  `sigla` varchar(2) NOT NULL,
  PRIMARY KEY  (`idestado`),
  UNIQUE KEY `IX_estado` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estados`
--

/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` (`idestado`,`nome`,`sigla`) VALUES 
 (1,'Bahia','BA'),
 (2,'São Paulo','SP'),
 (3,'Rio de Janeiro','RJ'),
 (4,'Sergipe','SE'),
 (5,'Minas Gerais','MG'),
 (6,'Rio Grande do Sul','RS');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;


--
-- Definition of table `infracoes`
--

DROP TABLE IF EXISTS `infracoes`;
CREATE TABLE `infracoes` (
  `idinfracao` int(11) NOT NULL auto_increment,
  `renavam` int(11) NOT NULL,
  `datahora` datetime NOT NULL,
  `local` varchar(50) NOT NULL,
  `idtipoinfracao` int(11) NOT NULL,
  `velocidade` int(11) default NULL,
  `idagente` int(11) default NULL,
  `observacao` varchar(255) default NULL,
  PRIMARY KEY  (`idinfracao`),
  KEY `fk_veiculo` (`renavam`),
  KEY `fk_tipoinfracao` (`idtipoinfracao`),
  KEY `fk_agentetransito` (`idagente`),
  CONSTRAINT `fk_veiculo` FOREIGN KEY (`renavam`) REFERENCES `veiculos` (`renavam`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tipoinfracao` FOREIGN KEY (`idtipoinfracao`) REFERENCES `tiposinfracoes` (`idtipoinfracao`) ON UPDATE CASCADE,
  CONSTRAINT `fk_agentetransito` FOREIGN KEY (`idagente`) REFERENCES `agentes` (`idagente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `infracoes`
--

/*!40000 ALTER TABLE `infracoes` DISABLE KEYS */;
INSERT INTO `infracoes` (`idinfracao`,`renavam`,`datahora`,`local`,`idtipoinfracao`,`velocidade`,`idagente`,`observacao`) VALUES 
 (1,1,'2009-01-01 00:00:00','Av. ACM',1,NULL,3,NULL),
 (2,3,'2009-02-01 00:00:00','Av. Manoel Dias da Silva',3,NULL,2,NULL),
 (3,2,'2009-03-01 00:00:00','R. das Rosas',4,NULL,3,NULL),
 (4,2,'2009-04-01 00:00:00','Al. das Espatódias',4,NULL,3,NULL),
 (5,4,'2009-04-01 00:00:00','Av. Manoel Dias da Silva',4,NULL,1,NULL),
 (6,6,'2009-04-01 00:00:00','Al. das Espatódias',3,NULL,4,NULL),
 (7,8,'2009-05-01 00:00:00','Av. Magalhães Neto',4,NULL,9,NULL),
 (8,9,'2009-05-01 00:00:00','Av. ACM',4,NULL,2,NULL),
 (9,10,'2009-06-01 00:00:00','Av. Jorge Amado',4,NULL,9,NULL),
 (10,12,'2009-06-01 00:00:00','Av. Jorge Amado',1,NULL,6,NULL),
 (11,15,'2009-07-01 00:00:00','Av. Jorge Amado',5,NULL,9,NULL),
 (12,17,'2009-07-01 00:00:00','Av. Manoel Dias da Silva',4,NULL,5,NULL),
 (13,19,'2009-07-01 00:00:00','Av. Jorge Amado',2,NULL,9,NULL),
 (14,20,'2009-08-01 00:00:00','Av. Jorge Amado',5,NULL,6,NULL),
 (15,3,'2009-09-01 00:00:00','Av. Manoel Dias da Silva',5,NULL,9,NULL),
 (16,4,'2009-10-01 00:00:00','Av. Jorge Amado',4,NULL,1,NULL),
 (17,15,'2010-01-01 00:00:00','Av. Magalhães Neto',4,NULL,9,NULL),
 (18,17,'2010-01-01 00:00:00','Av. ACM',5,NULL,5,NULL),
 (19,20,'2010-01-01 00:00:00','Av. Jorge Amado',4,NULL,2,NULL),
 (20,1,'2010-02-01 00:00:00','Av. Jorge Amado',5,NULL,9,NULL),
 (21,20,'2010-02-01 00:00:00','R. das Rosas',4,NULL,6,NULL),
 (22,15,'2010-02-01 00:00:00','Av. Jorge Amado',5,NULL,5,NULL),
 (23,3,'2010-02-01 00:00:00','Av. ACM',1,NULL,9,NULL),
 (24,12,'2010-02-01 00:00:00','Av. Jorge Amado',5,NULL,1,NULL),
 (25,20,'2010-02-01 00:00:00','Av. Jorge Amado',4,NULL,6,NULL),
 (26,15,'2010-02-01 00:00:00','Av. ACM',5,NULL,2,NULL),
 (27,15,'2010-02-01 00:00:00','Av. Manoel Dias da Silva',4,NULL,6,NULL),
 (28,1,'2010-02-01 00:00:00','Av. Manoel Dias da Silva',2,NULL,1,NULL),
 (29,2,'2010-02-01 00:00:00','Av. Manoel Dias da Silva',5,NULL,2,NULL),
 (30,1,'2010-02-01 00:00:00','Av. Manoel Dias da Silva',4,NULL,1,NULL),
 (31,3,'2010-03-01 00:00:00','Av. Manoel Dias da Silva',3,NULL,6,NULL),
 (32,4,'2010-03-01 00:00:00','Av. Manoel Dias da Silva',1,NULL,2,NULL),
 (33,1,'2010-04-01 00:00:00','Av. Manoel Dias da Silva',5,NULL,6,NULL),
 (34,3,'2010-04-01 00:00:00','Av. Manoel Dias da Silva',2,NULL,1,NULL),
 (35,4,'2010-04-01 00:00:00','Av. Manoel Dias da Silva',1,NULL,5,NULL),
 (36,2,'2010-04-01 00:00:00','Av. Manoel Dias da Silva',5,NULL,2,NULL),
 (37,1,'2010-04-01 00:00:00','Av. Manoel Dias da Silva',2,NULL,5,NULL);
/*!40000 ALTER TABLE `infracoes` ENABLE KEYS */;


--
-- Definition of table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas` (
  `idmarca` int(11) NOT NULL auto_increment,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY  (`idmarca`),
  UNIQUE KEY `ix_descricao` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marcas`
--

/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` (`idmarca`,`nome`) VALUES 
 (4,'audi'),
 (6,'bmw'),
 (5,'chrysler'),
 (12,'citroen'),
 (3,'fiat'),
 (1,'ford'),
 (2,'gm'),
 (11,'honda'),
 (16,'hyundai'),
 (15,'kia'),
 (8,'mazda'),
 (9,'peugeot'),
 (14,'renault'),
 (17,'subaru'),
 (10,'suzuki'),
 (7,'toyota'),
 (13,'volvo');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;


--
-- Definition of table `modelos`
--

DROP TABLE IF EXISTS `modelos`;
CREATE TABLE `modelos` (
  `idmodelo` int(11) NOT NULL auto_increment,
  `nome` varchar(45) NOT NULL,
  `idmarca` int(11) NOT NULL,
  PRIMARY KEY  (`idmodelo`),
  UNIQUE KEY `ix_descricao` (`nome`),
  KEY `fk_marca` (`idmarca`),
  CONSTRAINT `fk_marca` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`idmarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modelos`
--

/*!40000 ALTER TABLE `modelos` DISABLE KEYS */;
INSERT INTO `modelos` (`idmodelo`,`nome`,`idmarca`) VALUES 
 (1,'ecosport',1),
 (2,'fiesta sedan',1),
 (3,'fiesta hatch',1),
 (4,'focus sedan',1),
 (5,'focus hatch',1),
 (6,'fusion',1),
 (7,'corsa',2),
 (8,'celta',2),
 (9,'astra',2),
 (10,'meriva',2),
 (11,'zafira',2),
 (12,'linea',3),
 (13,'doblo',3),
 (14,'palio',3),
 (15,'mille',3),
 (16,'strada',3),
 (17,'punto',3),
 (18,'siena',3),
 (19,'a3',4),
 (20,'a4',4),
 (21,'tt',4);
/*!40000 ALTER TABLE `modelos` ENABLE KEYS */;


--
-- Definition of table `proprietarios`
--

DROP TABLE IF EXISTS `proprietarios`;
CREATE TABLE `proprietarios` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `idcidade` int(11) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `sexo` char(1) NOT NULL,
  `datanascimento` datetime NOT NULL,
  PRIMARY KEY  (`cpf`),
  KEY `FK_Proprietario` (`idcidade`),
  CONSTRAINT `FK_Proprietario` FOREIGN KEY (`idcidade`) REFERENCES `cidades` (`idcidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proprietarios`
--

/*!40000 ALTER TABLE `proprietarios` DISABLE KEYS */;
INSERT INTO `proprietarios` (`cpf`,`nome`,`endereco`,`idcidade`,`cep`,`sexo`,`datanascimento`) VALUES 
 ('11111111111','Maria dos Santos','x',1,'41000000','f','1980-05-25 00:00:00'),
 ('22222222222','José Almeida','z',1,'41800000','m','1965-04-27 00:00:00'),
 ('33333333333','Pedro Rebouças','b',1,'41900000','m','1960-08-10 00:00:00'),
 ('44444444444','Fernanda Machado','n',1,'41800100','f','1974-10-09 00:00:00'),
 ('55555555555','Gabriel Teles','m',1,'41840000','m','1980-01-01 00:00:00'),
 ('66666666666','Henrique Santos','m',1,'42200000','m','1961-05-07 00:00:00'),
 ('77777777777','Marcela Ribeiro','f',1,'41850000','f','1966-08-12 00:00:00'),
 ('88888888888','Lucas Dourado','m',1,'41870000','m','1977-09-15 00:00:00'),
 ('99999999999','Luciana Baqueiro','h',1,'41890000','f','1980-11-22 00:00:00');
/*!40000 ALTER TABLE `proprietarios` ENABLE KEYS */;


--
-- Definition of table `telefones`
--

DROP TABLE IF EXISTS `telefones`;
CREATE TABLE `telefones` (
  `idtelefone` int(11) NOT NULL auto_increment,
  `ddd` varchar(2) NOT NULL,
  `numero` varchar(8) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  PRIMARY KEY  (`idtelefone`),
  KEY `fk_telefone_proprietario1` (`cpf`),
  CONSTRAINT `fk_telefone_proprietario1` FOREIGN KEY (`cpf`) REFERENCES `proprietarios` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `telefones`
--

/*!40000 ALTER TABLE `telefones` DISABLE KEYS */;
INSERT INTO `telefones` (`idtelefone`,`ddd`,`numero`,`cpf`) VALUES 
 (1,'71','33550123','11111111111'),
 (2,'71','33550111','11111111111'),
 (3,'71','99632587','22222222222'),
 (4,'71','33658745','33333333333'),
 (5,'71','32301258','44444444444'),
 (6,'71','33452525','66666666666');
/*!40000 ALTER TABLE `telefones` ENABLE KEYS */;


--
-- Definition of table `tiposinfracoes`
--

DROP TABLE IF EXISTS `tiposinfracoes`;
CREATE TABLE `tiposinfracoes` (
  `idtipoinfracao` int(11) NOT NULL auto_increment,
  `descricao` varchar(45) NOT NULL,
  `valor` decimal(5,2) NOT NULL default '0.00',
  PRIMARY KEY  (`idtipoinfracao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tiposinfracoes`
--

/*!40000 ALTER TABLE `tiposinfracoes` DISABLE KEYS */;
INSERT INTO `tiposinfracoes` (`idtipoinfracao`,`descricao`,`valor`) VALUES 
 (1,'DIRIGIR VEICULO S/ POSSUIR CNH','574.00'),
 (2,'NAO DAR PASSAGEM A AMBULANCIAS','191.00'),
 (3,'TRANSITAR EM CALCADAS, PASSEIOS E PASSARELAS','574.00'),
 (4,'DIRIGIR SOB INFLUENCIA ALCOOL  OU ENTORP.','957.00'),
 (5,'DEIXAR DE USAR O CINTO DE SEGURANCA','127.00');
/*!40000 ALTER TABLE `tiposinfracoes` ENABLE KEYS */;


--
-- Definition of table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
CREATE TABLE `veiculos` (
  `renavam` int(11) NOT NULL,
  `chassi` varchar(20) NOT NULL,
  `placa` varchar(20) NOT NULL,
  `idcor` int(11) NOT NULL,
  `idmodelo` int(11) NOT NULL,
  `anofabricacao` int(4) NOT NULL,
  `anomodelo` int(4) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  PRIMARY KEY  (`renavam`),
  UNIQUE KEY `ix_chassi` (`chassi`),
  UNIQUE KEY `ix_placa` (`placa`),
  KEY `fk_modelo_veiculo` (`idmodelo`),
  KEY `fk_categoria_veiculo` (`idcategoria`),
  KEY `fk_cor_veiculo` (`idcor`),
  KEY `fk_proprietario_veiculo` (`cpf`),
  CONSTRAINT `fk_modelo_veiculo` FOREIGN KEY (`idmodelo`) REFERENCES `modelos` (`idmodelo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_categoria_veiculo` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cor_veiculo` FOREIGN KEY (`idcor`) REFERENCES `cores` (`idcor`) ON UPDATE CASCADE,
  CONSTRAINT `fk_proprietario_veiculo` FOREIGN KEY (`cpf`) REFERENCES `proprietarios` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veiculos`
--

/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` (`renavam`,`chassi`,`placa`,`idcor`,`idmodelo`,`anofabricacao`,`anomodelo`,`idcategoria`,`cpf`) VALUES 
 (1,'10','JRO0001',1,1,1999,1999,2,'11111111111'),
 (2,'20','JRO0002',2,2,2001,2001,2,'33333333333'),
 (3,'30','JRO0009',3,3,2005,2005,2,'11111111111'),
 (4,'40','JRO0019',1,3,2007,2007,2,'55555555555'),
 (5,'50','JRZ0005',2,2,2008,2008,2,'33333333333'),
 (6,'60','JPZ0009',4,2,2006,2006,2,'55555555555'),
 (7,'70','JLZ0149',5,5,2005,2005,2,'11111111111'),
 (8,'80','JMZ0459',6,4,2006,2006,1,'55555555555'),
 (9,'90','JMN0014',4,2,2007,2007,2,'99999999999'),
 (10,'100','JVZ0009',7,6,2009,2009,2,'22222222222'),
 (11,'110','JNN0001',8,8,2008,2008,2,'22222222222'),
 (12,'120','NBZ0214',9,9,2007,2007,2,'22222222222'),
 (13,'130','BLZ0202',3,10,2010,2010,2,'33333333333'),
 (14,'140','QWE0547',1,11,2010,2010,2,'44444444444'),
 (15,'150','ASD1478',4,11,2009,2009,2,'22222222222'),
 (16,'160','ZXC1236',2,10,2008,2008,2,'55555555555'),
 (17,'170','RTY1489',1,7,2007,2007,2,'66666666666'),
 (18,'180','PLM2547',1,12,2010,2010,2,'77777777777'),
 (19,'190','SJJ4444',4,21,2010,2010,2,'88888888888'),
 (20,'200','JJJ9999',5,19,2008,2008,2,'33333333333');
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;


--
-- Definition of table `veiculos_has_combustiveis`
--

DROP TABLE IF EXISTS `veiculos_has_combustiveis`;
CREATE TABLE `veiculos_has_combustiveis` (
  `renavam` int(11) NOT NULL,
  `idcombustivel` int(11) NOT NULL,
  PRIMARY KEY  (`renavam`,`idcombustivel`),
  KEY `fk_veiculos_has_combustiveis_veiculos1` (`renavam`),
  KEY `fk_veiculos_has_combustiveis_combustiveis1` (`idcombustivel`),
  CONSTRAINT `fk_veiculos_has_combustiveis_veiculos1` FOREIGN KEY (`renavam`) REFERENCES `veiculos` (`renavam`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculos_has_combustiveis_combustiveis1` FOREIGN KEY (`idcombustivel`) REFERENCES `combustiveis` (`idcombustivel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veiculos_has_combustiveis`
--

/*!40000 ALTER TABLE `veiculos_has_combustiveis` DISABLE KEYS */;
INSERT INTO `veiculos_has_combustiveis` (`renavam`,`idcombustivel`) VALUES 
 (1,1),
 (1,2),
 (2,1),
 (2,2),
 (3,1),
 (3,2),
 (4,1),
 (4,2),
 (5,1),
 (5,2),
 (6,1),
 (6,2),
 (6,3),
 (7,4),
 (8,1),
 (8,2),
 (9,4),
 (10,4),
 (11,4),
 (12,1),
 (12,2),
 (12,3),
 (13,4),
 (14,1),
 (14,2),
 (15,4),
 (16,4),
 (17,1),
 (17,2),
 (18,4),
 (19,1),
 (19,2),
 (20,4);
/*!40000 ALTER TABLE `veiculos_has_combustiveis` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
