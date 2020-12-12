select veiculos.placa, infracoes.datahora, infracoes.local
from (veiculos full outer join infracoes on veiculos.renavam=infracoes.renavam)