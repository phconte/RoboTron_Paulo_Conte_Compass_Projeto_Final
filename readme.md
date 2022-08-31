# RoboTron Compass UOL - Programa de Bolsas
![Compasso](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/blob/main/Imagens/compasso.png)
![Robotron](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/blob/main/Imagens/robotron.png)

## PROJETO FINAL
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL_v3-blue.svg)](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/blob/main/LICENCE) 
![Python](https://img.shields.io/pypi/pyversions/p)
![Commit](https://img.shields.io/github/last-commit/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final)
[![Badge ServeRest](https://img.shields.io/badge/API-ServeRest-green)](https://github.com/ServeRest/ServeRest/)


# Sobre o projeto
Este repositório é utilizado para commits do Projeto Final (Sprints 05 e 06) utilizando o Robot Framework


# Sumário
- [Infra]
    - [Keywords]
    - [Tests Case]()
- [Mapa Mental das Rotas]
    -[Mapa PNG](Imagens/ServeRest-Map.png)
    -[Mapa .xmind](Imagens/ServeRest.xmind)
- [Pré-requisitos](#pré-requisitos)
- [Execução do Projeto](#Execução%20do%20Projeto)
- [Autor](#Autor)
- [Agradecimentos](#Agradecimentos)


# Pré-requisitos

É preciso ter as seguintes tecnologias instaladas:

- [Python 3.9.2 🐍](https://www.python.org/)
- [Robot 5.0.1 🤖](https://robotframework.org/)

## Instalação via pip

É preciso ter o seguinte framework e libraries:

```sh
pip install -U robotframework \
robotframework-faker \
robotframework-browser \
robotframework-requests \
```

# Execução do Projeto

Os testes podem ser realizados usando diretamente a versão [online](https://serverest.dev) da ServeRest, via npm ou ainda via docker.

No ambiente online os dados cadastrados são removidos diariamente, enquanto que no local basta reiniciar o ServeRest.

> Prefira a opção de ambiente local caso precise que os dados não sejam alterados por outro usuário.

### Online

Acesse **<https://serverest.dev>** para visualizar a documentação e as rotas disponíveis.

> Essa é a melhor opção para quem não possui NPM e Docker na máquina ou não quer preocupar em gerenciar ambiente.

O ServeRest online possui monitoramento constante do status e tempo de atividade para garantir que esteja sempre disponível.

### Localmente com NPM

Execute o seguinte comando no terminal:

```sh
npx serverest@latest
```

### Localmente com docker

Execute o seguinte comando no terminal:

```sh

```

Para visualizar as configurações que são possíveis de serem feitas execute o comando:

```sh

```

## Executando os testes

Para executar teste abrangendo todas as suites utilize o comando:

```sh
robot -d ./reports ./tests
```

Para executar teste somente de uma suite utilize o comando:

```sh
robot -d ./reports ./tests/SUITE_DESEJADA.robot
```

Para executar teste somente de uma tag utilize o comando:

```sh
robot -d ./reports -i TAG_DESEJADA ./tests/SUITE_DESEJADA.robot
```


## Autor

[Paulo Henrique Conte](https://www.linkedin.com/in/paulohconte)

## Agradecimentos