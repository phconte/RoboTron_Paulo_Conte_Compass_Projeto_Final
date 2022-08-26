*** Settings ***
Documentation       Arquivo de testes para o Endpoint /carrinho

Library             RequestsLibrary
Resource            ../keywords/login_keywords.robot
Resource            ../keywords/carrinho_keywords.robot


*** Test Cases ***
Cenário 29: GET Lista Carrinho com sucesso 200
    [Tags]    getcarrinho
    Criar Sessao
    GET On Session /Carrinhos
    Validar Status Code "200"

Cenário 30: GET Carrinho por ID com sucesso 200
    [Tags]    carrinhoid
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Criar Um Carrinho e Armazenar ID
    GET On Session /Carrinhos por ID
    Validar Status Code "200"

Cenário 31: GET Carrinho por ID sem sucesso 400
    [Tags]    carrinhoerror
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Criar Um Carrinho e Armazenar ID errado
    GET On Session /Carrinhos por ID
    Validar Status Code "400"

Cenário 32: POST Cadastrar Carrinho de Massa Estatica com sucesso 201
    [Tags]    addcarrinho
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Criar Carrinho Estatico Valido
    Validar Status Code "201"

Cenário 33: POST Cadastrar Carrinho sem sucesso 400
    [Tags]    addcarrinhoerro
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Criar Carrinho Estatico Valido
    Validar Status Code "400"

Cenário 34: POST Cadastrar Carrinho sem sucesso 401
    [Tags]    carrinhosemtoken
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido sem token
    Validar Status Code "401"

Cenário 35: DELETE Carrinho por compra concluída 200
    [Tags]    delconcluida
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"

Cenário 36: DELETE Carrinho por compra concluída 401
    [Tags]    delsemtoken
    Criar Sessao
    Criar Carrinho Estatico Valido sem token
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "401"

Cenário 37: DELETE Carrinho por compra cancelada 200
    [Tags]    delcancelada
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"

Cenário 38: DELETE Carrinho por compra cancelada 401
    [Tags]    delsemtoken
    Criar Sessao
    Criar Carrinho Estatico Valido
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "401"
