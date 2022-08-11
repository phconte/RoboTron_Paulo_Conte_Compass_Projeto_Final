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
    Criar sessao
    GET Endpoint /Usuarios
    Validar Status Code "200"

# Sessão para criação de Keywords personalizadas


*** Keywords ***
Criar Sessao
    Create Session    serverest    https://serverest.dev/

GET Endpoint /Usuarios
    ${response}    GET On Session    serverest    /Usuarios
    Set Global Variable    ${response}

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}
