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

DELETE On Session /Usuarios "${id}"
    ${response}    DELETE On Session
    ...    serverest
    ...    /usuarios/${id}
    ...    json=&{payload}
    ...    expected_status=any
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

# DELETAR Escolhido "${id}"
#     &{header}    Create Dictionary    Authorization=${token_auth}
#     ${response}    DELETE On Session
#     ...    serverest
#     ...    /usuarios/${id}
#     ...    headers=${header}
#     ...    expected_status=any
