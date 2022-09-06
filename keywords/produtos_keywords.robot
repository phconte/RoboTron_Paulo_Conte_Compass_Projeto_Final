*** Settings ***
Documentation       Keywords e Variaveis para ações do Endpoint de Usuarios

Library             RequestsLibrary
Resource            ../support/base.robot


*** Keywords ***
GET On Session /Produtos
    ${response}    GET On Session    serverest    /produtos
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

GET On Session /Produtos "${id_produto}"
    ${response}    GET On Session    serverest    /produtos/${id_produto}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

GET On Session /Produtos sem ID
    ${response}    GET On Session    serverest    /produtos/${id}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

POST On Session /Produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    ${response}    POST On Session
    ...    serverest
    ...    /produtos
    ...    json=&{payload}
    ...    headers=${header}
    ...    expected_status=any
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}
    IF    "${response.status_code}" == "201"
        ${id_produto}    Set Variable    ${response.json()["_id"]}
        Set Global Variable    ${id_produto}
    END

DELETE Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    ${response}    DELETE On Session
    ...    serverest
    ...    /produtos/${id_produto}
    ...    headers=${header}
    ...    expected_status=any
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

Validar Ter Criado Produto
    Should be Equal    ${response.json()["message"]}    Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()["_id"]}

Criar um Produto e Armazenar ID
    POST On Session /Produtos
    #Validar Ter Criado Produto
    ${id_produto}    Set Variable    ${response.json()["_id"]}
    Log To Console    ID Produto: ${id_produto}
    Set Global Variable    ${id_produto}

PUT On Session /Produtos "${id_produto}"
    &{header}    Create Dictionary    Authorization=${token_auth}
    ${response}    PUT On Session
    ...    serverest
    ...    /produtos/${id_produto}
    ...    json=&{payload}
    ...    headers=${header}
    ...    expected_status=any
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}
    IF    "${response.status_code}" == "201"
        ${id_produto}    Set Variable    ${response.json()["_id"]}
        Set Global Variable    ${id_produto}
    END

Produto ID Em carrinho
    ${id_produto}    Set Variable    BeeJh5lz3k6kSIzA
    Set Global Variable    ${id_produto}

Cadastrar Produto Dinamico Valido
    ${payload}    Criar Produto Dinamico Valido    
    POST On Session /Produtos

Pegar Dados Produto Estatico Valido "${produto}"
    ${json}    Importar JSON Estatico    produtos.json
    ${payload}    Set variable    ${json["${produto}"]}
    Set Global Variable    ${payload}
    Log To Console    Response: ${payload}
    