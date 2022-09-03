*** Settings ***
Documentation       Arquivo de testes para o Endpoint /usuarios

Library             RequestsLibrary
Resource            ../support/base.robot

Test Setup          Criar Sessao


*** Test Cases ***
Cenário 04: GET Listar usuários cadastrados com Sucesso 200
    [Tags]    users
    GET On Session /Usuarios
    Validar Status Code "200"

Cenário 05: POST Cadastrar Usuario com sucesso 201
    [Tags]    adduser
    Pegar Dados Usuario Estatico Valido "user_valido"
    POST On Session /Usuarios
    Validar Status Code "201"

Cenário 06: POST Tentar Cadastrar Usuario existente 400
    [Tags]    userexist
    Criar Usuario Estatico Invalido
    POST On Session /Usuarios
    Validar Status Code "400"

Cenário 07: GET Buscar Usuario por ID com sucesso 200
    [Tags]    userid
    ${id}    Criar Usuario Dinamico Valido
    GETid On Session /Usuarios
    Validar Status Code "200"

Cenário 08: GET Buscar Usuario por ID sem sucesso 400
    [Tags]    usersemid
    Set Test Variable    ${id}    0uxuPY0cbmQhpEzA
    GETid On Session /Usuarios
    Validar Status Code "400"

Cenário 09: DELETE Usuario por ID
    [Tags]    deluser
    Criar Usuario Dinamico Valido
    POST On Session /Usuarios
    DELETE On Session /Usuarios

Cenário 10: PUT Alterar Usuario com Sucesso 200
    [Tags]    putuser
    Criar Usuario Dinamico Valido
    POST On Session /Usuarios
    PUT On Session /Usuarios "${id}"
    Validar Status Code "200"

Cenário 11: PUT Cadastrar Usuario com Sucesso 201
    [Tags]    putusernovo
    Criar Usuario Dinamico Valido
    PUT On Session /Usuarios "123456"
    Validar Status Code "201"

Cenário 12: PUT Cadastrar Usuario sem Sucesso 400
    [Tags]    putemailexist
    Pegar Dados Usuario Estatico Valido "user_valido"
    PUT On Session /Usuarios "${id}"
    Validar Status Code "400"

Cenário 39: POST Criar Usuario de Massa Dinamica 201
    [Tags]    postuserdinamico
    Criar Usuario Dinamico Valido
    POST On Session /Usuarios
    Validar Status Code "201"
