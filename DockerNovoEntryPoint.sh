#!/bin/bash

#CHAMADA DO ENTRY POINT ORIGINAL DA IMAGEM DO POSTGRES EM SEGUNDO PLANO
#EFETUA O PROCESSO DE INICIALIZAÇÃO DO POSTGRES
/usr/local/bin/docker-entrypoint.sh postgres &

#USANDO A FERRAMENTA pg_isready DO PostgreSQL, VERIFICA DE 1 EM 1 SEGUNDO SE JÁ É POSSÍVEL EFETUAR NOVAS CONEXÕES AO BANCO DE DADOS
while !pg_isready > /dev/null 2>&1; do
    sleep 1
done

#CASO O pg_isready ACIMA CONFIRME QUE ESTÁ TUDO OK COM O BANCO DE DADOS, O SPRING ENTRA EM AÇÃO
/app/jdk/bin/java -jar *.jar -Dserver.address=0.0.0.0
