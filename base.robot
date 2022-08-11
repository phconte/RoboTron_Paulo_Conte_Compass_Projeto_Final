*** Comments ***


# Sessão para configuração, documentação, imports de arquivos e libraries
*** Settings ***
Documentation       Arquivo simples para requisições HTTP em APIs REST
Library             RequestsLibrary

# Sessão para setagem de variáveis
*** Variables ***


# Sessão para criação dos cenários de testes
*** Test Cases ***
Cenário: GET Todos os Usuários 200
    [tags]    GET
    Criar sessao
    GET Endpoint /Usuarios
    Validar Status Code "200"
    Validar Quantidade "${20}"
    Printar Conteudo Response

Cenário: POST Cadastrar Usuario 201
    [tags]    POST
    Criar sessao
    POST Endpoint /Usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenário: PUT Editar Usuario 200
    [tags]    PUT
    Criar sessao
    PUT Endpoint /Usuarios
    Validar Status Code "200"   

Cenário: DELETE Deletar Usuario 200
    [tags]    DELETE
    Criar sessao
    DELETE Endpoint /Usuarios
    Validar Status Code "200"      

# Sessão para criação de Keywords personalizadas
*** Keywords ***
Criar Sessao
    Create Session    serverest    https://serverest.dev/

GET Endpoint /Usuarios
    ${response}    GET On Session    serverest    /Usuarios
    Set Global Variable    ${response}

POST Endpoint /Usuarios
    &{payload}             Create Dictionary    nome=jarbs priest    email=testeee789@gmail.com    password=123    administrador=true
    ${response}            POST On Session    serverest    /usuarios    data=&{payload}
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response}

PUT Endpoint /Usuarios
    &{payload}             Create Dictionary    nome=jerss priest    email=testee1011123@gmail.com    password=123    administrador=true
    ${response}            PUT On Session    serverest    /usuarios/0sQp4x72rlPmNfTB    data=&{payload}
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response} 

DELETE Endpoint /Usuarios
    ${response}            DELETE On Session    serverest    /usuarios/8DqkMVDZlv6Wo00I
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response} 

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Validar Quantidade "${quantidade}"
    Should Be Equal    ${response.json()["quantidade"]}     ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain    ${response.json()["message"]}    ${palavra}

Printar Conteudo Response
    Log to Console    Nome: ${response.json()["usuarios"][0]["nome"]}