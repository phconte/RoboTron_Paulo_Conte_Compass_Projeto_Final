*** Settings ***
Documentation       Arquivo de testes para o Endpoint /login

Library             RequestsLibrary
Resource            ../keywords/login_keywords.robot
Test Setup          Criar Sessao

*** Test Cases ***
Cenário 01: POST Fazer login com Sucesso 200
    [Tags]    postlogin
    POST Endpoint /login
    Validar Status Code "200"

# A documentação ServeRest não informa a diferença de statuscode 400 e 401

Cenário 02: POST Fazer login com usuário inexistente 401
    [Tags]    loginex
    POST Endpoint /Login com usuário inexistente
    Validar Status Code "401"

Cenário 03: POST Fazer login com dados Inválidos 400
    [Tags]    loginv
    POST Endpoint /Login com dados Inválidos
    Validar Status Code "400"
