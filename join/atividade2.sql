select veiculos.renavam, veiculos.placa, infracoes.datahora, infracoes.idtipoinfracao, tiposinfracoes.descricao
from(veiculos join infracoes on veiculos.renavam = infracoes.renavam) 
join tiposinfracoes on infracoes.idtipoinfracao=tiposinfracoes.idtipoinfracao where datahora > "2009-01-04"; 

select veiculos.renavam, veiculos.placa, infracoes.datahora, infracoes.idtipoinfracao from 
(veiculos join infracoes on veiculos.renavam = infracoes.renavam) where datahora > "2009-01-04" and infracoes.idtipoinfracao = 5;

select veiculos.renavam, proprietarios.nome, infracoes.datahora, tiposinfracoes.descricao from
((veiculos join proprietarios on proprietarios.cpf = veiculos.cpf)
join infracoes on infracoes.renavam = veiculos.renavam) join tiposinfracoes on infracoes.idtipoinfracao = tiposinfracoes.idtipoinfracao where datahora between "2009-03-01" and "2009-03-31" and tiposinfracoes.idtipoinfracao>5;

select veiculos.placa, modelos.nome, cores.nome from(veiculos join modelos on veiculos.idmodelo = modelos.idmodelo)
 join cores on cores.idcor=veiculos.idcor where placa like "JRO%";
 
 select veiculos.placa, modelos.nome, cores.nome from(veiculos join modelos on veiculos.idmodelo = modelos.idmodelo)
 join cores on cores.idcor = veiculos.idcor where placa like "__Z___9";

 select marcas.idmarca, marcas.nome, modelos.nome from (marcas join modelos on marcas.idmarca = modelos.idmarca) where modelos.idmarca in(01,05,12,25,33,42)
 order by modelos.idmarca, modelos.nome;
 select * from veiculos;
 select * from combustiveis;
 select * from veiculos_has_combustiveis;
 
 select veiculos_has_combustiveis.renavam, combustiveis.nome, categorias.nome, count(*) from 
 ((veiculos join categorias on veiculos.idcategoria = categorias.idcategoria) join 
 veiculos_has_combustiveis on veiculos.renavam = veiculos_has_combustiveis.renavam) join 
 combustiveis on veiculos_has_combustiveis.idcombustivel = combustiveis.idcombustivel where categorias.nome = "automóvel" group by combustiveis.nome;
 
 select veiculos_has_combustiveis.renavam, combustiveis.nome, count(*) from (veiculos_has_combustiveis join combustiveis on veiculos_has_combustiveis.idcombustivel = combustiveis.idcombustivel) group by combustiveis.nome having count(*)>10;
 select * from tiposinfracoes;
 select * from infracoes;
 
 select tiposinfracoes.descricao, count(*) from 
 (infracoes join tiposinfracoes on infracoes.idtipoinfracao = tiposinfracoes.idtipoinfracao) 
 group by tiposinfracoes.descricao having count(*)>5;
 
 select tiposinfracoes.descricao, count(*) from 
 (infracoes join tiposinfracoes on infracoes.idtipoinfracao = tiposinfracoes.idtipoinfracao) 
 where infracoes.datahora like "2009%" group by tiposinfracoes.descricao;
 
  select infracoes.datahora, tiposinfracoes.descricao, count(*) from 
 (infracoes join tiposinfracoes on infracoes.idtipoinfracao = tiposinfracoes.idtipoinfracao) 
 where infracoes.datahora like "2009%" group by tiposinfracoes.descricao having count(*)>5;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 