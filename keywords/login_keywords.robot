*** Settings ***
Documentation       Keywords e Variaveis para ações do Endpoint de Login

Library             RequestsLibrary
Resource            ../support/base.robot
Resource            ../support/base.robot


*** Keywords ***
POST Endpoint /login
    &{payload}    Create Dictionary    email=${email_para_login}    password=${password_para_login}
    ${response}    POST On Session    serverest    /login    json=&{payload}
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

POST Endpoint /Login com usuário inexistente
    &{payload}    Create Dictionary    email=${email_errado}    password="teste"
    ${response}    POST On Session    serverest    /login    data=&{payload}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

POST Endpoint /Login com dados Inválidos
    &{payload}    Create Dictionary    email=${email_para_login}    password=
    ${response}    POST On Session    serverest    /login    data=&{payload}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

Validar ter Logado
    Should be Equal    ${response.json()["message"]}    Login realizado com sucesso
    Should Not Be Empty    ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar ter Logado
    ${token_auth}    Set Variable    ${response.json()["authorization"]}
    Log to Console    Token Salvo:    ${token_auth}
    Set Global Variable    ${token_auth}

Fazer Login sem adm
    POST Endpoint /login
    ${token_auth}    Set Variable    ${response.json()["authorization"]}
    Log to Console    Token Salvo:    ${token_auth}
    Set Global Variable    ${token_auth}
