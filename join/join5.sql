select veiculos.placa, veiculos.cpf, proprietarios.cpf, proprietarios.nome, infracoes.datahora, tiposinfracoes.descricao
from ((veiculos join proprietarios on veiculos.cpf=proprietarios.cpf) 
join infracoes on veiculos.renavam=infracoes.renavam)
join tiposinfracoes on infracoes.idtipoinfracao=tiposinfracoes.idtipoinfracao