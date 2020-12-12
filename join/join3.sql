select veiculos.placa, veiculos.cpf, proprietarios.cpf, proprietarios.nome
from (veiculos join proprietarios on veiculos.cpf=proprietarios.cpf)