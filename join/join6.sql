select veiculos.placa, infracoes.datahora, infracoes.local
from (veiculos join infracoes on veiculos.renavam=infracoes.renavam)