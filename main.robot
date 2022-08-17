*** Settings ***
Documentation       Arquivo simples para requisições HTTP em APIs REST
Library             RequestsLibrary 
Resource            Endpoint_Login/login_keywords.robot  
Resource            general_keywords.robot
Resource            Endpoint_Usuarios/usuarios_keywords.robot                   

*** Variables ***

*** Test Cases ***

Cenário: POST Fazer login com Sucesso 200
    [Tags]        POSTLOGIN
    Criar Sessao
    POST Endpoint /login 
    Validar Status Code "200"

# A documentação ServeRest não informa a diferença de statuscode 400 e 401
Cenário: POST Fazer login com usuário inexistente
    [Tags]       LOGININEX
    Criar Sessao
    POST Endpoint /Login com usuário inexistente
    Validar Status Code "401"

Cenário: POST Fazer login com dados Inválidos
    [Tags]       LOGINV
    Criar Sessao
    POST Endpoint /Login com dados Inválidos
    Validar Status Code "400"

Cenário: GET Listar usuários cadastrados
    [Tags]        USERS
    Criar Sessao
    GET On Session /Usuarios
    Validar Status Code "200"           
    
