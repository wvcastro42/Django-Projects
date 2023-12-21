# Tutorial do Django

![CI
Status](https://github.com/wvcastro42/Django-Projects/actions/workflows/ci.yml/badge.svg)

## Ambiente de desenvolvimento

Para conseguir rodar o projeto no seu computador é necessário ter instalado:

- [Docker](https://docs.docker.com/get-docker/)
- [docker-compose](https://docs.docker.com/compose/)
- [make](https://www.gnu.org/software/make/manual/make.html)

### EditorConfig

Para configurar o seu editor de texto ou IDE para seguir alguns padrões de
formatação de código, é recomendado instalar o plugin do
[EditorConfig](https://editorconfig.org/), caso seu editor não tenha suporta
nativo.

### Rodando o projeto

Com as dependências, citadas acima, devidamente instaladas, basta executar o
seguinte comando:

```shell
make start
```

> A primeira vez que se roda as tarefas do make, é comum que ele demore. Pois
> ele vai baixar imagens Docker, e construir as imagens do projeto. Essa demora
> não constuma ocorrer nas execuções posteriores.

### Makefile

O arquivo Makefile ainda contém as seguintes tarefas:

```shell
make connect  # conecta ao contêiner do projeto Django
make lint  # executa algumas verificações estáticas no código
make lint-fix  # corrige algumas infrações vista na tarefa `lint`
make start  # inicia os contêineres do projeto
make stop  # para os contêineres em execução
```
