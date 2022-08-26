*** Settings ***
Documentation       Keywords e Variaveis para ações do Endpoint de Usuarios

Library             RequestsLibrary
Resource            ../support/base.robot


*** Keywords ***
GET On Session /Produtos
    ${response}    GET On Session    serverest    /produtos
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

GET On Session /Produtos por ID
    ${response}    GET On Session    serverest    /produtos/${id_produto}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

GET On Session /Produtos sem ID
    ${response}    GET On Session    serverest    /produtos/${id}    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

POST On Session /Produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    &{payload}    Create Dictionary
    ...    nome='Mouse lg3'
    ...    preco=400
    ...    descricao='Mouse sem fio'
    ...    quantidade=100
    ${response}    POST On Session
    ...    serverest
    ...    /produtos
    ...    data=&{payload}
    ...    headers=&{header}
    ...    expected_status=any
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

POST On Session /Produtos sem token
    &{header}    Create Dictionary    Authorization=
    &{payload}    Create Dictionary
    ...    nome='Mouse razer'
    ...    preco=400
    ...    descricao='Mouse sem fio'
    ...    quantidade=100
    ${response}    POST On Session
    ...    serverest
    ...    /produtos
    ...    data=&{payload}
    ...    headers=&{header}
    ...    expected_status=any
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    ${response}    DELETE On Session
    ...    serverest
    ...    /produtos/${id_produto}
    ...    headers=${header}
    ...    expected_status=any
    Log to Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /produtos sem token
    &{header}    Create Dictionary    Authorization=
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
    Validar Ter Criado Produto
    ${id_produto}    Set Variable    ${response.json()["_id"]}
    Log To Console    ID Produto: ${id_produto}
    Set Global Variable    ${id_produto}

PUT On Session /Produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    &{produto_alterado}    Create Dictionary
    ...    nome='Mouse razer'
    ...    preco=400
    ...    descricao='Mouse com fio'
    ...    quantidade=100
    ${response}    PUT On Session
    ...    serverest
    ...    /produtos/${id_produto}
    ...    data=&{produto_alterado}
    ...    headers=&{header}
    ...    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

PUT On Session /Produtos sem cadastro
    &{header}    Create Dictionary    Authorization=${token_auth}
    &{produto_alterado}    Create Dictionary
    ...    nome='Mouse razer4'
    ...    preco=400
    ...    descricao='Mouse com fio'
    ...    quantidade=100
    ${response}    PUT On Session
    ...    serverest
    ...    /produtos/${id_produto}
    ...    data=&{produto_alterado}
    ...    headers=&{header}
    ...    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

PUT On Session /Produtos sem token
    &{header}    Create Dictionary    Authorization=
    &{produto_alterado}    Create Dictionary
    ...    nome='Mouse razer'
    ...    preco=400
    ...    descricao='Mouse com fio'
    ...    quantidade=100
    ${response}    PUT On Session
    ...    serverest
    ...    /produtos/${id_produto}
    ...    data=&{produto_alterado}
    ...    headers=&{header}
    ...    expected_status=any
    Log To Console    Resposta: ${response.content}
    Set Global Variable    ${response}

Produto ID Em carrinho
    ${id_produto}    Set Variable    BeeJh5lz3k6kSIzA
    Set Global Variable    ${id_produto}
