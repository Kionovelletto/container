# Haproxy diversas configurações
Diretório com diversos itens para Haproxy.

##
Nos volumes do manifesto, no service do Haproxy utilize apenas um volume por vez.

Por exemplo: 

- Caso queira testar o load balance, descomente o último volume e comente o primeiro;
- Caso gostaria de testar o proxy reverso, comente a linha do load balance e descomente a do reverse proxy.
```yaml
 volumes:
     #- ./conf/haproxy_reverse_proxy.cfg:/usr/local/etc/haproxy/haproxy.cfg #(Escolher entre o load balance ou proxy reverso para testar)
     - ./conf/haproxy_load_balance.cfg:/usr/local/etc/haproxy/haproxy.cfg #(Escolher entre o load balance ou proxy reverso para testar)
```

Tendo problemas para executar o compose, acrescente na última linha de cada .cfg uma linha em branco.
Caso persistir, executar o docker-compose como sudo:
```yaml
sudo docker-compose up
```
