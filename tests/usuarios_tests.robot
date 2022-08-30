*** Settings ***
Documentation       Arquivo de testes para o Endpoint /usuarios

Library             RequestsLibrary
Resource            ../keywords/usuarios_keywords.robot
Test Setup          Criar Sessao


*** Test Cases ***
Cenário 04: GET Listar usuários cadastrados com Sucesso 200
    [Tags]    users
    GET On Session /Usuarios
    Validar Status Code "200"

Cenário 05: POST Cadastrar Usuario com sucesso 201
    [Tags]    adduser
    Criar Usuario Estatico Valido
    POST On Session /Usuarios
    Validar Status Code "201"

Cenário 06: POST Tentar Cadastrar Usuario existente 400
    [Tags]    userexist
    Criar Usuario Estatico Invalido
    POST On Session /Usuarios
    Validar Status Code "400"

Cenário 07: GET Buscar Usuario por ID com sucesso 200
    [Tags]    userid
    GETid On Session /Usuarios
    Validar Status Code "200"

#Alterar ${id} para rodar

Cenário 08: GET Buscar Usuario por ID sem sucesso 400
    [Tags]    usersemid
    GETid On Session /Usuarios
    Validar Status Code "400"

#Alterar ${possui_carrinho} para false se quiser deletar

Cenário 09: DELETE Usuario por ID
    [Tags]    deluser
    DELETE On Session /Usuarios

#Setar ${id_alterar} existente e nome, email e password ${xxx_novo}

Cenário 10: PUT Alterar Usuario com Sucesso 200
    [Tags]    putuser
    PUT On Session /Usuarios
    Validar Status Code "200"

#Alterar ${id_alterar} e ${email_novo} para inexistentes

Cenário 11: PUT Cadastrar Usuario com Sucesso 201
    [Tags]    putusernovo
    PUT On Session /Usuarios
    Validar Status Code "201"

# seguir o anterior

Cenário 12: PUT Cadastrar Usuario sem Sucesso 400
    [Tags]    putemailexist
    PUT On Session /Usuarios
    Validar Status Code "400"

Cenário 39: POST Criar Usuario de Massa Dinamica 201
    [Tags]    postuserdinamico
    Cadastrar Usuario Dinamico Valido
    Validar Status Code "201"
