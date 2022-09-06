*** Settings ***
Documentation       Arquivo de testes para o Endpoint /carrinho

Library             RequestsLibrary
Resource            ../support/base.robot

Test Setup          Criar Sessao


*** Test Cases ***
Cenário 29: GET Lista Carrinho com sucesso 200
    [Tags]    getcarrinho
    GET On Session /Carrinhos
    Validar Status Code "200"

Cenário 30: GET Carrinho por ID com sucesso 200
    [Tags]    carrinhoid
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Criar Um Carrinho e Armazenar ID
    GET On Session /Carrinhos por ID
    Validar Status Code "200"

Cenário 31: GET Carrinho por ID sem sucesso 400
    [Tags]    carrinhoerror
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Criar Um Carrinho e Armazenar ID errado
    GET On Session /Carrinhos por ID
    Validar Status Code "400"
    Validar se Mensagem Contem "Carrinho não encontrado"

Cenário 32: POST Cadastrar Carrinho de Massa Estatica com sucesso 201
    [Tags]    addcarrinho
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Criar Carrinho Estatico Valido
    Validar Status Code "201"
    Validar se Mensagem Contem "Cadastro realizado com sucesso"

Cenário 33: POST Cadastrar Carrinho sem sucesso 400
    [Tags]    addcarrinhoerro
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Criar Carrinho Estatico Valido
    Validar Status Code "400"
    Validar se Mensagem Contem "Não é permitido ter mais de 1 carrinho"

Cenário 34: POST Cadastrar Carrinho sem sucesso 401
    [Tags]    carrinhosemtoken
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido sem token
    Validar Status Code "401"
    Validar se Mensagem Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário 35: DELETE Carrinho por compra concluída 200
    [Tags]    delconcluida
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"
    Validar se Mensagem Contem "Registro excluído com sucesso"

Cenário 36: DELETE Carrinho por compra concluída 401
    [Tags]    delsemtoken
    Criar Carrinho Estatico Valido sem token
    DELETE Endpoint /carrinhos/concluir-compra sem token
    Validar Status Code "401"
    Validar se Mensagem Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário 37: DELETE Carrinho por compra cancelada 200
    [Tags]    delcancelada
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"
    Validar se Mensagem Contem "Registro excluído com sucesso. Estoque dos produtos reabastecido"

Cenário 38: DELETE Carrinho por compra cancelada 401
    [Tags]    delcarrinhosemtoken
    Criar Carrinho Estatico Valido sem token
    DELETE Endpoint /carrinhos/concluir-compra sem token
    Validar Status Code "401"
    Validar se Mensagem Contem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
