*** Settings ***
Documentation       Keywords e Variaveis para ações do Endpoint de Login

Library             RequestsLibrary
Resource            ../support/base.robot


*** Keywords ***
POST Endpoint /login
    ${response}    POST On Session    serverest    /login    json=&{payload}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

Validar ter Logado
    Should be Equal    ${response.json()["message"]}    Login realizado com sucesso
    Should Not Be Empty    ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    Pegar usuario para Login "user_default"
    POST Endpoint /login
    Validar ter Logado
    ${token_auth}    Set Variable    ${response.json()["authorization"]}
    Log to Console    Token Salvo:    ${token_auth}
    Set Global Variable    ${token_auth}

Fazer Login sem adm
    Pegar usuario para Login "user_sem_adm"
    POST Endpoint /login
    ${token_auth}    Set Variable    ${response.json()["authorization"]}
    Log to Console    Token Salvo:    ${token_auth}
    Set Global Variable    ${token_auth}

Pegar usuario para Login "${usuario}"
    ${json}    Importar JSON Estatico    login.json
    ${payload}    Set variable    ${json["${usuario}"]}
    Set Global Variable    ${payload}

Pegar Token Invalido
    ${token_auth}    Set Variable    0000000000
    Set Global Variable    ${token_auth}
