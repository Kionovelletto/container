# Haproxy diversas configurações
Diretório com diversos itens para Haproxy.

##
Nos volumes do manifesto, no service do Haproxy utilize apenas um volume por vez.

Por exemplo: 

- Caso queira testar o load balance, descomente o último volume e comente o primeiro;
- Caso gostaria de testar o proxy reverso, comente a linha do load balance e descomente a do reverse proxy.
```yaml
volumes:
 - ./conf/haproxy_reverse_proxy.cfg:/usr/local/etc/haproxy/haproxy.cfg #(Escolher apenas um dos volumes para testar)
 #- ./conf/haproxy_load_balance.cfg:/usr/local/etc/haproxy/haproxy.cfg #(Escolher apenas um dos volumes para testar)
 #- ./conf/haproxy_redirect.cfg:/usr/local/etc/haproxy/haproxy.cfg #(Escolher apenas um dos volumes para testar)
 #- ./conf/haproxy_deny.cfg:/usr/local/etc/haproxy/haproxy.cfg #(Escolher apenas um dos volumes para testar)
```

Tendo problemas para executar o compose, acrescente na última linha de cada .cfg uma linha em branco.
Caso persistir, executar o docker-compose como sudo:
```yaml
sudo docker-compose up
```
Após os containers iniciarem, você pode:
- Acessar a página de status dos frontends e backends = http://localhost:8404/stats
- Acessar a página que faz o load balance(atualize a página varias vezes para testar) = http://localhost
- Acessar o proxy reverso = http://localhost/web03
- Acessar o redirect = http://localhost
- Acessar o deny por palavras como = http://localhost/web03/teste=username | http://localhost/web03/teste=password
