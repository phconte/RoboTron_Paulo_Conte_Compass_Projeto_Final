*** Settings ***
Documentation       Arquivo simples para requisições HTTP em APIs REST
Library             RequestsLibrary 
Resource            Endpoint_Login/login_keywords.robot  
Resource            general_keywords.robot
Resource            Endpoint_Usuarios/usuarios_keywords.robot                   
Resource            Endpoint_Carrinho/carrinho_keywords.robot

*** Variables ***

*** Test Cases ***

########################### /Login ###########################

Cenário: POST Fazer login com Sucesso 200
    [Tags]        POSTLOGIN
    Criar Sessao
    POST Endpoint /login 
    Validar Status Code "200"

# A documentação ServeRest não informa a diferença de statuscode 400 e 401
Cenário: POST Fazer login com usuário inexistente 401
    [Tags]       LOGINEX
    Criar Sessao
    POST Endpoint /Login com usuário inexistente
    Validar Status Code "401"

Cenário: POST Fazer login com dados Inválidos 400
    [Tags]       LOGINV
    Criar Sessao
    POST Endpoint /Login com dados Inválidos
    Validar Status Code "400"

########################### /Usuarios ###########################

Cenário: GET Listar usuários cadastrados com Sucesso 200
    [Tags]        USERS
    Criar Sessao
    GET On Session /Usuarios
    Validar Status Code "200"        

Cenário: POST Cadastrar Usuario com sucesso 201
    [Tags]        ADDUSER
    Criar Sessao
    POST On Session /Usuarios
    Validar Status Code "201"  

Cenário: POST Tentar Cadastrar Usuario existente 400
    [Tags]        USEREXIST
    Criar Sessao
    POST On Session /Usuarios
    Validar Status Code "400" 

Cenário: GET Buscar Usuario por ID com sucesso 200
    [Tags]        USERID
    Criar Sessao
    GETid On Session /Usuarios
    Validar Status Code "200"  

Cenário: GET Buscar Usuario por ID sem sucesso 400
    [Tags]        USERSEMID
    Criar Sessao
    GETid On Session /Usuarios
    Validar Status Code "400"  

Cenário: DELETE Usuario por ID
    [Tags]        DELUSER
    Criar Sessao
    DELETE On Session /Usuarios

Cenário: PUT Alterar Usuario com Sucesso 200
    [Tags]        PUTUSER
    Criar Sessao
    PUT On Session /Usuarios
    Validar Status Code "200"  

Cenário: PUT Cadastrar Usuario com Sucesso 201
    [Tags]        PUTUSERNOVO
    Criar Sessao
    PUT On Session /Usuarios
    Validar Status Code "201"  

Cenário: PUT Cadastrar Usuario sem Sucesso 400
    [Tags]        PUTEMAILEXIST
    Criar Sessao
    PUT On Session /Usuarios
    Validar Status Code "400" 


########################### /Produtos ##############################

Cenário: GET Listar Produtos 200

Cenário: GET Buscar produto por ID com sucesso 200

Cenário: GET Buscar produto por ID sem sucesso 400

Cenário: POST Cadastrar Produto com sucesso 201

Cenário: POST Cadastrar Produto com mesmo nome 400

Cenário: POST Cadastrar Produto sem token 401

Cenário: POST Cadastrar Produto sem adm 403

Cenário: DELETE Produto com sucesso 200

Cenário: DELETE Produto em carrinho 400

Cenário: DELETE Produto sem token 401

Cenário: DELETE Produto sem adm 403

Cenário: PUT Editar Produto com sucesso 200

Cenário: PUT Editar Produto sem cadastro com sucesso 201

Cenário: PUT Editar Produto com nome existente 400

Cenário: PUT Editar Produto sem token 401

Cenário: PUT Editar Produto sem adm 403

########################### /Carrinhos ###########################

Cenário: GET Lista Carrinho com sucesso 200
    [Tags]        GETCARRINHO
    Criar Sessao
    GET On Session /Carrinhos
    Validar Status Code "200"  

Cenário: GET Carrinho por ID com sucesso 200
    [Tags]        CARRINHOID
    Criar Sessao
    GET On Session /Carrinhos por ID
    Validar Status Code "200"  

Cenário: GET Carrinho por ID sem sucesso 400
    [Tags]        CARRINHOERROR
    Criar Sessao
    GET On Session /Carrinhos por ID
    Validar Status Code "400"  

Cenário: POST Cadastrar Carrinho com sucesso 201
    [Tags]        ADDCARRINHO
    Criar Sessao
    Fazer Login e Armazenar Token
    POST On Session /Carrinhos
    Validar Status Code "201"

Cenário: POST Cadastrar Carrinho sem sucesso 400  

Cenário: POST Cadastrar Carrinho sem sucesso 401

Cenário: DELETE Carrinho por compra concluída 200

Cenário: DELETE Carrinho por compra concluída 401

Cenário: DELETE Carrinho por compra cancelada 200

Cenário: DELETE Carrinho por compra cancelada 401