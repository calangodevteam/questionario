
# Criação de Questionários

Front-end e back-end do projeto de Prodocência da UERJ: "Sistema de Avaliação da Qualidade Regional do Ensino"

## Stack utilizada

**Front-end:** Angular 15.2

**Back-end:** Spring Boot 3.0.5, Java 17, PostgreSQL

## Recursos

**http://devleand.ro/ ou https://calangodev.fly.dev/**: Website que representa o estado atual da branch master. Um deploy feito usando a imagem Docker atual (abaixo) e a plataforma Fly.io.<br>
**https://hub.docker.com/r/leandromusser/calangodev**: Na teoria, é a imagem Docker que foi construída usando a branch master no estado atual.


## O que é isso?

- **/Dockerfile**: Use se quiser montar e testar a aplicação na sua máquina sem a necessidade de ter que configurar cada ferramenta. Basta no diretório desse arquivo um simples "docker build -t nome_aleatorio123 ." seguido de "docker run -it --rm -p 8080:8080 -p 5432:5432 nome_aleatorio123" onde 8080 e 5432 são as portas do Tomcat e PostgreSQL, respectivamente, dentro do container. Linux ou WSL necessário. Acesso da aplicação pelo localhost:8080.

- **/Dockerfile_GHActions**: Foi feito para ser usado pelo Github Actions para montar a imagem da aplicação que será implantada depois.

- **/DockerNovoEntryPoint.sh**: Script usado por ambos Dockerfiles para permitir que a aplicação e o PostgreSQL sejam rodados no mesmo container para contornar algumas limitações do Fly.io. Primeiro ele inicializa o banco de dados e, se ele estiver operando, inicializa a aplicação.

- **/fly.toml**: Usado pelo cli do fly.io (que é chamado pelo Github Actions) para efetuar algumas configurações importantes do deploy da aplicação. O tipo de deploy é por imagem Docker, cuja identificação é definida no arquivo. O "internal port" como 8080 faz com que possamos acessar a aplicação pela porta 80 ou 443, ocorrendo um mapeamento.

- **/.github/workflows/BuildTesteDeploy.yaml**: Script que executa uma série de ações (build com caching do NPM, Angular, Maven), testes (nada ainda) e deploy, aproventando-se de mais de 1 arquivo dos já listados acima. É ativado quando ocorre um pull request ou um push e, apenas se for um push para master, executa a parte do deploy.

- **/backend**: Diretório contendo uma estrutura clássica de um projeto Spring Boot.

- **/frontend**: Diretório contendo uma estrutura clássica de um projeto Angular.

- **/scripts**: Scripts de inicialização do banco de dados. Eventualmente será movido para um lugar melhor.
## FAQ

#### Como posso ajudar?

Faça um fork do repositório e mande um pull request para a branch "dev". Lá iremos testar o que você desenvolveu antes de integrar na branch principal.

#### Posso fazer qualquer tipo de sugestão sem tocar no código? 

Você é livre para sugerir o que quiser e quando quiser. Estaremos sempre ouvindo e ficaremos felizes em ter pessoas dispostas a melhorar o projeto, independentemente da forma como isso é feito.

#### Preciso conhecer Docker para ajudar no projeto?

Não. Docker está aí apenas para automatizar algumas coisas, apenas para facilitar. É perfeitamente possível montar o ambiente na própria máquina, sendo necessário apenas conhecimentos nas ferramentas usadas de back-end e front-end.
