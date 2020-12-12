select veiculos.placa, infracoes.datahora, infracoes.local
from (veiculos right outer join infracoes on veiculos.renavam=infracoes.renavam)