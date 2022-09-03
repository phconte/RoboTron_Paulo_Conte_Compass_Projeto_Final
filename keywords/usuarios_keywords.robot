*** Settings ***
Documentation       Keywords e Variaveis para ações do Endpoint de Usuarios

Library             RequestsLibrary
Resource            ../support/base.robot


*** Keywords ***
GET On Session /Usuarios
    ${response}    GET On Session    serverest    /usuarios
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

# Referência: usado ideia de lógica booleana para corrigir necessidade de cenário onde o
# teste passa porém o status code é diferente do espetado, ideia da colega Manoella:
# https://github.com/manoellasouza/RoboTron_Manoella_Souza_Projeto_Final/blob/develop/keywords/usuarios_keywords.robot

POST On Session /Usuarios
    ${response}    POST On Session
    ...    serverest
    ...    /usuarios
    ...    json=${payload}
    ...    expected_status=any
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}
    IF    "${response.status_code}" == "201"
        ${id}    Set Variable    ${response.json()["_id"]}
        Set Global Variable    ${id}
    END

GETid On Session /Usuarios
    ${response}    GET On Session    serverest    /usuarios/${id}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

DELETE On Session /Usuarios
    ${response}    DELETE On Session
    ...    serverest
    ...    /usuarios/${response.json()["_id"]}
    ...    json=&{payload}
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

# Referência: usado ideia de lógica booleana para corrigir necessidade de cenário onde o
# teste passa porém o status code é diferente do espetado, ideia da colega Manoella:
# https://github.com/manoellasouza/RoboTron_Manoella_Souza_Projeto_Final/blob/develop/keywords/usuarios_keywords.robot

PUT On Session /Usuarios "${id}"
    ${response}    PUT On Session
    ...    serverest
    ...    /usuarios/${id}
    ...    json=&{payload}
    ...    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}
    IF    "${response.status_code}" == "201"
        ${id}    Set Variable    ${response.json()["_id"]}
        Set Global Variable    ${id}
    END

Criar e logar sem ADM
    &{cadastro}    Create Dictionary
    ...    nome=Paulo
    ...    email=Paulo@gmail.com
    ...    password=123
    ...    administrador=false
    ${response}    POST On Session
    ...    serverest
    ...    /usuarios
    ...    data=&{cadastro}
    ...    expected_status=any
    Log To Console    Resposta: ${response.content}
    &{payload}    Create Dictionary    email=Paulo@gmail.com    password=123
    ${response}    POST On Session    serverest    /login    data=&{payload}
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}
    Validar ter Logado
    ${token_auth}    Set Variable    ${response.json()["authorization"]}
    Log to Console    Token Salvo:    ${token_auth}
    Set Global Variable    ${token_auth}

Pegar Dados Usuario Estatico Valido "${user}"
    ${json}    Importar JSON Estatico    usuarios.json
    ${payload}    Set variable    ${json["${user}"]}
    Set Global Variable    ${payload}
    Log To Console    Response: ${payload}

Criar Usuario Estatico Invalido
    ${json}    Importar JSON Estatico    usuarios.json
    ${payload}    Set variable    ${json["user_invalido"]}
    Set Global Variable    ${payload}
    Log To Console    Response: ${payload}
