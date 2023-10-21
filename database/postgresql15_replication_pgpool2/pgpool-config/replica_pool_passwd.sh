#!/bin/bash
echo "Iniciando o contêiner..."

# Iniciando o PostgreSQL:
su - posgtgres etc/init.d/postgresql start

# Configuração para replicação de dados:
postgres -c max_wal_senders=3 -c wal_level=replica &

# Configuração capturar o hash da senha e salvar no formato do pgpool:
#postgres -c SELECT CONCAT('\"', usename, '\" \"', passwd, '\"') FROM pg_shadow; | sed 's/"//g' | awk '$1 != "postgres" {print $1":"$2}' > /opt/pgpool/pool_passwd.conf
( postgres -c "SELECT CONCAT('\"', usename, '\" \"', passwd, '\"') FROM pg_shadow;" | sed 's/"//g' | awk '$1 != "postgres" {print $1":"$2}' ) > /opt/pgpool/pool_passwd.conf


# Mantenha o script em execução para manter o contêiner ativo:
tail -f /dev/null
