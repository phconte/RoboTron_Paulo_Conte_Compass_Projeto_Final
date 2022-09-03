*** Settings ***
Documentation       Arquivo de testes para o Endpoint /login

Library             RequestsLibrary
Resource            ../keywords/login_keywords.robot

Test Setup          Criar Sessao


*** Test Cases ***
Cenário 01: POST Fazer login com Sucesso 200
    [Tags]    postlogin
    Pegar usuario para Login "user_default"
    POST Endpoint /login
    Validar Status Code "200"

# A documentação ServeRest não informa a diferença de statuscode 400 e 401

Cenário 02: POST Fazer login com usuário inexistente 401
    [Tags]    loginex
    Pegar usuario para Login "user_invalido"
    POST Endpoint /Login
    Validar Status Code "401"

Cenário 03: POST Fazer login com dados Inválidos 400
    [Tags]    loginv
    POST Endpoint /Login com dados Inválidos
    Validar Status Code "400"
