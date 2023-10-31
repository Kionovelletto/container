# 

### Crie o arquivo de configuração para o postgresql:

vim netdataconfig/go.d/postgres.conf

jobs:
  - name: local
    dsn: 'postgresql://postgres@10.90.1.239:5432/postgres


### Reinicie o container e faça o debuug:
docker exec -it netdata /usr/libexec/netdata/plugins.d/go.d.plugin -d -m postgres
