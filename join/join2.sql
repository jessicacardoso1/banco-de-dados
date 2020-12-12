select veiculos.placa, veiculos.cpf, proprietarios.cpf, proprietarios.nome
from veiculos, proprietarios
where veiculos.cpf=proprietarios.cpf