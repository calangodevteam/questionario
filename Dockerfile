#ETAPA DE GERAÇÃO DOS ARQUIVOS ESTÁTICOS DO FRONT-END (ANGULAR) E DOWNLOAD E EXTRAÇÃO DO JDK
FROM openjdk:17-alpine as frontjava

#PORTA PADRÃO DO TOMCAT
EXPOSE 8080

#PORTA PADRÃO DO POSTGRESQL
EXPOSE 5432

#RUN mkdir -p /app/jdk
#WORKDIR /app/jdk

RUN mkdir -p /app/frontend
WORKDIR /app/frontend

RUN apk add nodejs npm 
RUN npm install -g @angular/cli
COPY frontend .
RUN npm install
RUN ng build

RUN mkdir -p /app/backend
COPY backend /app/backend

#JOGA OS ARQUIVOS ESTÁTICOS DO FRONT-END GERADOS NA ETAPA frontjava NA PASTA STATIC DO SPRING
RUN cp /app/frontend/dist/calango-dev/* /app/backend/src/main/resources/static

WORKDIR /app/backend

#CRIAÇÃO DO .JAR DA APLICAÇÃO
RUN ./mvnw package

RUN mkdir -p /app/jdk && cp -r $JAVA_HOME/* /app/jdk

#Verifica se a JDK que estamos usando tem $JAVA_HOME/lib/security/cacerts sendo um
#link simbólico apontando para um outro diretório do sistema.
#Se tiver, substitui esse link simbólico pelo arquivo original.   
RUN if test -L /app/jdk/lib/security/cacerts ; then \
caminho_original=$(realpath $JAVA_HOME/lib/security/cacerts) && \
rm /app/jdk/lib/security/cacerts && \
cp $caminho_original /app/jdk/lib/security && \
ls -l /app/jdk/lib/security/cacerts ; \
fi

#ETAPA DE INICIALIZAÇÃO DO POSTGRESQL
FROM postgres:alpine

#VARIÁVEIS DE AMBIENTE QUE SÃO USADAS PELA IMAGEM DO POSTGRES PARA CRIAR O BANCO E O USUÁRIO NA INICIALIZAÇÃO
#ESTE BANCO É APENAS DE TESTES, NÃO TENDO PROBLEMA EM EXPOR OS DADOS DE ACESSO DESSA FORMA
ENV POSTGRES_DB postgres
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres123

#GERANDO PASTA E COPIANDO OS ARQUVIOS DE CRIAÇÃO E INSERÇÃO DO BANCO DE DADOS PARA O CONTAINER
RUN mkdir -p /docker-entrypoint-initdb.d
WORKDIR /docker-entrypoint-initdb.d
COPY scripts .

RUN mkdir -p /app
RUN mkdir -p /app/jdk
WORKDIR /app

#JOGA O .JAR GERADO NA ETAPA ANTERIOR PARA O DIRETÓRIO ATUAL 
COPY --from=frontjava /app/backend/target/*.jar .

COPY --from=frontjava /app/jdk /app/jdk
RUN chmod +x /app/jdk/bin/*

COPY DockerNovoEntryPoint.sh .

#A IMAGEM DO POSTGRES POSSUI UM ENTRYPOINT PADRÃO QUE JÁ INICIALIZA O POSTGRES
#O ENTRYPOINT ABAIXO SOBRESCREVE ESSE ENTRYPOINT PADRÃO, MAS AGE COMO UM WRAPPER, CHAMANDO DEPOIS O SCRIPT DO ORIGINAL 
ENTRYPOINT ["./DockerNovoEntryPoint.sh"]
