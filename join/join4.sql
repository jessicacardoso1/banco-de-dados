select veiculos.placa, veiculos.cpf, proprietarios.cpf, proprietarios.nome, infracoes.datahora, infracoes.idtipoinfracao
from (veiculos join proprietarios on veiculos.cpf=proprietarios.cpf) 
join infracoes on veiculos.renavam=infracoes.renavam