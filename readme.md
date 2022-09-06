# RoboTron Compass UOL - Programa de Bolsas
![Compasso](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/blob/main/Imagens/compasso.png)
![Robotron](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/blob/main/Imagens/robotron.png)

## PROJETO FINAL
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL_v3-blue.svg)](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/blob/main/LICENCE) 
![Commit](https://img.shields.io/github/last-commit/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final)
[![Badge ServeRest](https://img.shields.io/badge/API-ServeRest-green)](https://github.com/ServeRest/ServeRest/)


# Sobre o projeto
Este projeto é para automatação de testes da API [ServeRest](https://github.com/ServeRest/ServeRest/) utilizando o Robot Framework durante as Sprints 05 e 06 do Programa de Bolsas da [Compass UOL](https://compass.uol).


# Sumário
- [Infra]()
    - [Keywords](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/tree/main/keywords)
    - [Libraries](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/tree/main/libraries)
    - [Suporte](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/tree/main/suppport)
    - [Tests Case](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/tree/main/tests)
- [Mapa Mental das Rotas]()
    - [Mapa PNG](Imagens/ServeRest-Map.png)
    - [Mapa .xmind](Imagens/ServeRest.xmind)
- [Pré-requisitos](#pré-requisitos)
- [Execução do Projeto](#Execução-do-Projeto)
    - [Online](#Online)
    - [Localmente com NPM](#Localmente-com-NPM)
    - [Executando os testes](#Executando-os-testes) 
    - [Executando Libraries personalizadas](#Executando-Libraries-personalizadas)
- [Autor](#Autor)
- [Agradecimentos](#Agradecimentos)
- [Referências](#Referências)


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
pandas \
```

# Execução do Projeto

Os testes podem ser realizados usando diretamente a versão [online](https://serverest.dev) da ServeRest, via npm ou ainda via docker.

No ambiente online os dados cadastrados são removidos diariamente, enquanto que no local basta reiniciar o ServeRest.

> Prefira a opção de ambiente local caso precise que os dados não sejam alterados por outro usuário.

### Online

Acesse **<https://serverest.dev>** para visualizar a documentação e as rotas disponíveis.

> Essa é a melhor opção para quem não possui NPM e Docker na máquina ou não quer preocupar em gerenciar ambiente.

O ServeRest online possui monitoramento constante do status e tempo de atividade para garantir que esteja sempre disponível.

Nesta opção a variável [${BASE_URI}](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/blob/main/support/variables/serverest_variables.robot) deverá ser:

```sh
${BASE_URI}     https://serverest.dev/
```

### Localmente com NPM

Nesta opção a variável [${BASE_URI}](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/blob/main/support/variables/serverest_variables.robot) deverá ser:

```sh
${BASE_URI}     http://localhost:3000
```

Execute o seguinte comando no terminal:

```sh
npx serverest@latest
```

## Executando os testes

É importante alterar o email do usuario ["user_valido"](https://github.com/phconte/RoboTron_Paulo_Conte_Compass_Projeto_Final/blob/main/support/fixtures/static/usuarios.json) para um email novo antes de executar os testes de usuario ou o Cenário 04 irá falhar.

Para executar teste abrangendo todas as suites utilize o comando:

```sh
robot -d ./reports ./tests
```

Para executar teste somente de uma suite utilize o comando, escolhendo o nome do arquivo da suite desejada:

```sh
robot -d ./reports ./tests/SUITE_DESEJADA.robot
```

Para executar teste somente de uma tag utilize o comando, escolhendo o nome do arquivo da tag desejada:

```sh
robot -d ./reports -i TAG_DESEJADA ./tests/SUITE_DESEJADA.robot
```

## Executando Libraries personalizadas

Para criptograr uma string com sha256, adicione a keyword no Test Case desejado, observando a ${variavel} desejada e rode os testes:
```sh
Converter string "${response.content}" para sha256
```

Para criptograr um dicionario com sha256, adicione a keyword no Test Case desejado, observando a ${variavel} desejada e rode os testes:
```sh
Converter dict "${response.content}" para sha256
```

Para gerar um JSON de uma response, adicione a keyword no Test Case desejado, observando a ${variavel} desejada e rode os testes:
```sh
Gerar Json "${response.content}"
```

Para gerar um CSV de uma response, adicione a keyword no Test Case desejado, observando a ${variavel} desejada e rode os testes:
```sh
Gerar CSV "${response.content}"
```

## Autor

[Paulo Henrique Conte](https://www.linkedin.com/in/paulohconte)

## Agradecimentos

Agradeço a Compass UOL pela trilha, ensinamentos durante todo o programa e aos evangelistas [Larissa Campos](https://www.linkedin.com/in/larissa-campos-68443731/), Gabriela A. dos Santos, [Matheus Locatelli](https://www.linkedin.com/in/matheuslocatelli/) e [Demétrio Webber](https://www.linkedin.com/in/demetriowebberqa/).

Agradecimento especial aos colegas de squad [Laura Gehrke](https://github.com/lauraghrk), [Manoella Souza](https://github.com/manoellasouza), [Mari de Oliveira](https://github.com/OliveiraMariC) e [Pedro Favoreto Gaya](https://github.com/PFrek).


## Referências

- Trilha RoboTron da Compass UOL
- Cursos Robot básico e avançado da [Mayara Fernandes](https://www.udemy.com/user/mayara-ribeiro-fernandes/) 

