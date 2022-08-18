*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Usuarios
Library              RequestsLibrary
Resource             ../general_keywords.robot

*** Variables ***

*** Keywords ***

GET On Session /Produtos
    ${response}            GET On Session    serverest    /produtos
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

GET On Session /Produtos por ID
    ${response}            GET On Session    serverest    /produtos/${id_produto}        expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

GET On Session /Produtos sem ID
    ${response}            GET On Session    serverest    /produtos/${id_produto}        expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

POST On Session /Produtos
    &{header}              Create Dictionary    Authorization=${token_auth}
    &{payload}             Create Dictionary    nome='Mouse razer'    preco=400    descricao='Mouse sem fio'    quantidade=100
    ${response}            POST On Session      serverest    /produtos    data=&{payload}    headers=&{header}    expected_status=any
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response}

POST On Session /Produtos sem token
    &{header}              Create Dictionary    Authorization=
    &{payload}             Create Dictionary    nome='Mouse razer'    preco=400    descricao='Mouse sem fio'    quantidade=100
    ${response}            POST On Session      serverest    /produtos    data=&{payload}    headers=&{header}    expected_status=any
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response}

