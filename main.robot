*** Settings ***
Documentation       Arquivo simples para requisições HTTP em APIs REST

Library             RequestsLibrary
Resource            Endpoint_Login/login_keywords.robot
Resource            Endpoint_Usuarios/usuarios_keywords.robot
Resource            Endpoint_Carrinho/carrinho_keywords.robot
Resource            Endpoint_Produtos/produtos_keywords.robot


*** Test Cases ***
########################### /Login ###########################

Cenário: POST Fazer login com Sucesso 200
    [Tags]    postlogin
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

# A documentação ServeRest não informa a diferença de statuscode 400 e 401

Cenário: POST Fazer login com usuário inexistente 401
    [Tags]    loginex
    Criar Sessao
    POST Endpoint /Login com usuário inexistente
    Validar Status Code "401"

Cenário: POST Fazer login com dados Inválidos 400
    [Tags]    loginv
    Criar Sessao
    POST Endpoint /Login com dados Inválidos
    Validar Status Code "400"

########################### /Usuarios ###########################

Cenário: GET Listar usuários cadastrados com Sucesso 200
    [Tags]    users
    Criar Sessao
    GET On Session /Usuarios
    Validar Status Code "200"

Cenário: POST Cadastrar Usuario com sucesso 201
    [Tags]    adduser
    Criar Sessao
    Criar Usuario Estatico Valido
    POST On Session /Usuarios
    Validar Status Code "201"

Cenário: POST Tentar Cadastrar Usuario existente 400
    [Tags]    userexist
    Criar Sessao
    Criar Usuario Estatico Invalido
    POST On Session /Usuarios
    Validar Status Code "400"

Cenário: GET Buscar Usuario por ID com sucesso 200
    [Tags]    userid
    Criar Sessao
    GETid On Session /Usuarios
    Validar Status Code "200"

#Alterar ${id} para rodar

Cenário: GET Buscar Usuario por ID sem sucesso 400
    [Tags]    usersemid
    Criar Sessao
    GETid On Session /Usuarios
    Validar Status Code "400"

#Alterar ${possui_carrinho} para false se quiser deletar

Cenário: DELETE Usuario por ID
    [Tags]    deluser
    Criar Sessao
    DELETE On Session /Usuarios

#Setar ${id_alterar} existente e nome, email e password ${xxx_novo}

Cenário: PUT Alterar Usuario com Sucesso 200
    [Tags]    putuser
    Criar Sessao
    PUT On Session /Usuarios
    Validar Status Code "200"

#Alterar ${id_alterar} e ${email_novo} para inexistentes

Cenário: PUT Cadastrar Usuario com Sucesso 201
    [Tags]    putusernovo
    Criar Sessao
    PUT On Session /Usuarios
    Validar Status Code "201"

# seguir o anterior

Cenário: PUT Cadastrar Usuario sem Sucesso 400
    [Tags]    putemailexist
    Criar Sessao
    PUT On Session /Usuarios
    Validar Status Code "400"

########################### /Produtos ##############################

Cenário: GET Listar Produtos 200
    [Tags]    listarprodutos
    Criar Sessao
    GET On Session /Produtos
    Validar Status Code "200"

#Alterar ${id_produto}

Cenário: GET Buscar produto por ID com sucesso 200
    [Tags]    buscarproduto
    Criar Sessao
    GET On Session /Produtos por ID
    Validar Status Code "200"

Cenário: GET Buscar produto por ID sem sucesso 400
    [Tags]    produtosemid
    Criar Sessao
    GET On Session /Produtos sem ID
    Validar Status Code "400"

Cenário: POST Cadastrar Produto com sucesso 201
    [Tags]    addproduto
    Criar Sessao
    Fazer Login e Armazenar Token
    POST On Session /Produtos
    Validar Status Code "201"

Cenário: POST Cadastrar Produto com mesmo nome 400
    [Tags]    produtoigual
    Criar Sessao
    Fazer Login e Armazenar Token
    POST On Session /Produtos
    Validar Status Code "400"

Cenário: POST Cadastrar Produto sem token 401
    [Tags]    produtosemtoken
    Criar Sessao
    Fazer Login e Armazenar Token
    POST On Session /Produtos sem token
    Validar Status Code "401"

Cenário: POST Cadastrar Produto sem adm 403
    [Tags]    produtosemadm
    Criar Sessao
    Criar e logar sem ADM
    POST On Session /Produtos
    Validar Status Code "403"

# Alterar nome do produto em POST On Session /Produtos

Cenário: DELETE Produto com sucesso 200
    [Tags]    deletarproduto
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenário: DELETE Produto em um carrinho 400
    [Tags]    produtocomcarrinho
    Criar Sessao
    Fazer Login e Armazenar Token
    Produto ID Em carrinho
    DELETE Endpoint /produtos
    Validar Status Code "400"

Cenário: DELETE Produto sem token 401
    [Tags]    deletarsemtoken
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar um Produto e Armazenar ID
    DELETE Endpoint /produtos sem token
    Validar Status Code "401"

Cenário: DELETE Produto sem adm 403
    [Tags]    deletarsemadm
    Criar Sessao
    Criar e logar sem ADM
    DELETE Endpoint /produtos
    Validar Status Code "403"

Cenário: PUT Editar Produto com sucesso 200
    [Tags]    editarproduto
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT On Session /Produtos
    Validar Status Code "200"

# Alterar ${id_produto} para inexistente e nome do produto
# Em PUT On Session /Produtos sem cadastro

Cenário: PUT Editar Produto sem cadastro 201
    [Tags]    produtosemcadastro
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT On Session /Produtos sem cadastro
    Validar Status Code "201"

Cenário: PUT Editar Produto com nome existente 400
    [Tags]    produtorepetido
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT On Session /Produtos
    Validar Status Code "400"

Cenário: PUT Editar Produto sem token 401
    [Tags]    produtosemtoken
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT On Session /Produtos sem token
    Validar Status Code "401"

Cenário: PUT Editar Produto sem adm 403
    [Tags]    produtosemadm
    Criar Sessao
    Criar e logar sem ADM
    PUT On Session /Produtos
    Validar Status Code "403"

########################### /Carrinhos ###########################

Cenário: GET Lista Carrinho com sucesso 200
    [Tags]    getcarrinho
    Criar Sessao
    GET On Session /Carrinhos
    Validar Status Code "200"

Cenário: GET Carrinho por ID com sucesso 200
    [Tags]    carrinhoid
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Criar Um Carrinho e Armazenar ID
    GET On Session /Carrinhos por ID
    Validar Status Code "200"

Cenário: GET Carrinho por ID sem sucesso 400
    [Tags]    carrinhoerror
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Criar Um Carrinho e Armazenar ID errado
    GET On Session /Carrinhos por ID
    Validar Status Code "400"

Cenário: POST Cadastrar Carrinho de Massa Estatica com sucesso 201
    [Tags]    addcarrinho
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Criar Carrinho Estatico Valido
    Validar Status Code "201"

Cenário: POST Cadastrar Carrinho sem sucesso 400
    [Tags]    addcarrinhoerro
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Criar Carrinho Estatico Valido
    Validar Status Code "400"

Cenário: POST Cadastrar Carrinho sem sucesso 401
    [Tags]    carrinhosemtoken
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido sem token
    Validar Status Code "401"

Cenário: DELETE Carrinho por compra concluída 200
    [Tags]    delconcluida
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"

Cenário: DELETE Carrinho por compra concluída 401
    [Tags]    delsemtoken
    Criar Sessao
    Criar Carrinho Estatico Valido sem token
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "401"

Cenário: DELETE Carrinho por compra cancelada 200
    [Tags]    delcancelada
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"

Cenário: DELETE Carrinho por compra cancelada 401
    [Tags]    delsemtoken
    Criar Sessao
    Criar Carrinho Estatico Valido
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "401"
