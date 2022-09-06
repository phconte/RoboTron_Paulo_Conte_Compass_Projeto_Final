*** Settings ***
Documentation       Arquivo de testes para o Endpoint /login

Library             RequestsLibrary
Resource            ../support/base.robot

Test Setup          Criar Sessao


*** Test Cases ***
Cenário 01: POST Fazer login com Sucesso 200
    [Tags]    postlogin
    Pegar usuario para Login "user_default"
    POST Endpoint /login
    Validar Status Code "200"
    Validar se Mensagem Contem "Login realizado com sucesso"

# A documentação ServeRest não informa a diferença de statuscode 400 e 401

Cenário 02: POST Fazer login com usuário inexistente 401
    [Tags]    loginex
    Pegar usuario para Login "user_invalido"
    POST Endpoint /Login
    Validar Status Code "401"
    Validar se Mensagem Contem "Email e/ou senha inválidos"

Cenário 03: POST Fazer login com dados Inválidos 400
    [Tags]    loginv
    Pegar usuario para Login "user_sem_email"
    POST Endpoint /Login
    Validar Status Code "400"

Cenário 43: POST Fazer login com dados em branco 400
    [Tags]    logembranco
    Pegar usuario para Login "user_em_branco"
    POST Endpoint /Login
    Validar Status Code "400"

Cenário 44: POST Fazer login com email invalido 400
    [Tags]    logemailinv
    Pegar usuario para Login "user_email_invalido"
    POST Endpoint /Login
    Validar Status Code "400"
