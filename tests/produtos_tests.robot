*** Settings ***
Documentation       Arquivo de testes para o Endpoint /produtos

Library             RequestsLibrary
Resource            ../keywords/login_keywords.robot
Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/usuarios_keywords.robot
Test Setup          Criar Sessao


*** Test Cases ***
Cenário 13: GET Listar Produtos 200
    [Tags]    listarprodutos
    GET On Session /Produtos
    Validar Status Code "200"

#Alterar ${id_produto}

Cenário 14: GET Buscar produto por ID com sucesso 200
    [Tags]    buscarproduto
    GET On Session /Produtos por ID
    Validar Status Code "200"

Cenário 15: GET Buscar produto por ID sem sucesso 400
    [Tags]    produtosemid
    GET On Session /Produtos sem ID
    Validar Status Code "400"

Cenário 16: POST Cadastrar Produto com sucesso 201
    [Tags]    addproduto
    Fazer Login e Armazenar Token
    POST On Session /Produtos
    Validar Status Code "201"

Cenário 17: POST Cadastrar Produto com mesmo nome 400
    [Tags]    produtoigual
    Fazer Login e Armazenar Token
    POST On Session /Produtos
    Validar Status Code "400"

Cenário 18: POST Cadastrar Produto sem token 401
    [Tags]    produtosemtoken
    Fazer Login e Armazenar Token
    POST On Session /Produtos sem token
    Validar Status Code "401"

Cenário 19: POST Cadastrar Produto sem adm 403
    [Tags]    produtosemadm
    Criar e logar sem ADM
    POST On Session /Produtos
    Validar Status Code "403"

# Alterar nome do produto em POST On Session /Produtos

Cenário 20: DELETE Produto com sucesso 200
    [Tags]    deletarproduto
    Fazer Login e Armazenar Token
    Criar um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenário 21: DELETE Produto em um carrinho 400
    [Tags]    produtocomcarrinho
    Fazer Login e Armazenar Token
    Produto ID Em carrinho
    DELETE Endpoint /produtos
    Validar Status Code "400"

Cenário 22: DELETE Produto sem token 401
    [Tags]    deletarsemtoken
    Fazer Login e Armazenar Token
    Criar um Produto e Armazenar ID
    DELETE Endpoint /produtos sem token
    Validar Status Code "401"

Cenário 23: DELETE Produto sem adm 403
    [Tags]    deletarsemadm
    Criar e logar sem ADM
    DELETE Endpoint /produtos
    Validar Status Code "403"

Cenário 24: PUT Editar Produto com sucesso 200
    [Tags]    editarproduto
    Fazer Login e Armazenar Token
    PUT On Session /Produtos
    Validar Status Code "200"

# Alterar ${id_produto} para inexistente e nome do produto
# Em PUT On Session /Produtos sem cadastro

Cenário 25: PUT Editar Produto sem cadastro 201
    [Tags]    produtosemcadastro
    Fazer Login e Armazenar Token
    PUT On Session /Produtos sem cadastro
    Validar Status Code "201"

Cenário 26: PUT Editar Produto com nome existente 400
    [Tags]    produtorepetido
    Fazer Login e Armazenar Token
    PUT On Session /Produtos
    Validar Status Code "400"

Cenário 27: PUT Editar Produto sem token 401
    [Tags]    produtosemtoken
    Fazer Login e Armazenar Token
    PUT On Session /Produtos sem token
    Validar Status Code "401"

Cenário 28: PUT Editar Produto sem adm 403
    [Tags]    produtosemadm
    Criar e logar sem ADM
    PUT On Session /Produtos
    Validar Status Code "403"
