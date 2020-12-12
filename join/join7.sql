select veiculos.placa, infracoes.datahora, infracoes.local
from (veiculos left outer join infracoes on veiculos.renavam=infracoes.renavam)