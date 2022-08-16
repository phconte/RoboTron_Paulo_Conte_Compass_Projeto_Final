*** Settings ***
Documentation       Arquivo simples para requisições HTTP em APIs REST
Library             RequestsLibrary 
Resource            Endpoint_Login/login_keywords.robot                 

*** Variables ***

*** Test Cases ***

Cenário: POST Fazer login com Sucesso 200
    [Tags]        POSTLOGIN
    Criar Sessao
    POST Endpoint /login 
    Validar Status Code "200"

Cenário: POST Fazer login com usuário inexistente
    [Tags]       LOGININEX
    Criar Sessao
    POST Endpoint /Login com usuário inexistente
    Validar Status Code "401"

*** Keywords ***

Criar Sessao
    Create Session    serverest    https://serverest.dev/
    
