
alter table proprietarios modify nome varchar(60);
alter table tiposinfracoes add pontos int(1);
drop table telefones;

insert into agentes values (12, 'gabriel', 2020-02-02);
insert into agentes (idagente, nome, datacontratacao) values 
(14, 'joana', 2018-05-03);

insert into categorias values 
(5, 'categoriaA'),
(6, 'categoriaB'),
(7, 'categoriaC');
select * from cidades;
select * from estados;

insert into cidades (idcidade, nome, idestado) values
(8, 'Aracaju', 4),
(9, 'Alagoinhas', 1),
(10, 'Madre de Deus', 1);

insert into combustiveis (idcombustivel, nome) values
(5, 'CombustivelA'),
(6, 'CombustivelB'),
(7, 'CombustivelC');

insert into cores (idcor, nome) values 
(10, 'roxo'),
(11, 'Ambar'),
(12, 'cinza');

insert into estados values
(7, 'Santa Catarina', 'SC'),
(8, 'Acre', 'AC'),
(9, 'Alagoas', 'AL');

insert into infracoes values
(38,1,'2010-04-01 00:00:00','Av. Manoel Dias da Silva',5,NULL,6,NULL),
 (39,3,'2010-04-01 00:00:00','Av. Manoel Dias da Silva',4,NULL,1,NULL),
 (40,4,'2010-04-01 00:00:00','Av. Manoel Dias da Silva',1,NULL,5,NULL);
 
 insert into marcas(idmarca, nome) values 
 (21, 'MarcaA'),
 (19, 'MarcaB'),
 (20, 'MarcaC');
 
 insert into modelos(idmodelo, nome, idmarca) values 
 (22, 'ModeloA', 21),
 (23, 'ModeloB', 19),
 (24, 'ModeloC', 20);
 
 insert into proprietarios values
  ('12121212121','Fernanda Santos','n',1,'41800100','f','1974-10-09 00:00:00'),
 ('15151515151','Gabriel Silva','m',1,'41840000','m','1980-01-01 00:00:00'),
 ('51515151515','Henrique Lisboa','m',1,'42200000','m','1961-05-07 00:00:00'),
 ('02020202020','Joao Ribeiro','f',1,'41850000','f','1966-08-12 00:00:00');
 
 insert into tiposinfracoes values 
 (6,'Inflacao A','574.00'),
 (7,'Inflacao B','957.00'),
 (8,'Inflacao C', '327.00');
 
 insert into veiculos values
(21,'222','PLM2548',6,12,2010,2010,2,'77777777777'),
 (22,'500','SJJ4448',4,21,2010,2010,2,'88888888888'),
 (23,'240','JJJ9499',1,19,2008,2008,2,'33333333333');

INSERT INTO veiculos_has_combustiveis VALUES 
 (1,5),
 (1,6),
 (2,7);
 

 update combustiveis set nome = "álcool" where nome = "alcool"; 
 select nome from modelos where idmarca = 3;
 select renavam, datahora, idtipoinfracao from infracoes where datahora>= "2009-04-01";
 select renavam, datahora, idtipoinfracao from infracoes where datahora>= "2009-04-01" and idtipoinfracao=5;
 select renavam, datahora, idtipoinfracao from infracoes where datahora between "2009-03-01" and "2009-03-31" and idtipoinfracao=5;
 select placa, idmodelo, idcor from veiculos where placa like "JRO%";
 select placa, idmodelo, idcor from veiculos where placa like "__Z___9";
 