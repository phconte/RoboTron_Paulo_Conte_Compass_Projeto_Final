*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Usuarios
Library              RequestsLibrary
Resource             ../general_keywords.robot
Resource             ../Endpoint_Login/login_keywords.robot


*** Keywords ***

GET On Session /Usuarios        
    ${response}            GET On Session    serverest    /usuarios
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

POST On Session /Usuarios
    ${response}               POST On Session        serverest        /usuarios/    json=&{payload}    expected_status=any
    Log To Console            Response: ${response.content}
    Set Global Variable       ${response}

GETid On Session /Usuarios
    ${response}            GET On Session    serverest    /usuarios/${id}        expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

DELETE On Session /Usuarios
    Run Keyword If         ${possui_carrinho} == False    DELETARUSER
    ...    ELSE            Skip                 'Não é possível deletar usuario que possui carrinho'
    
DELETARUSER
    ${response}            DELETE On Session    serverest    /usuarios/${id_del}        expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}
    Validar Status Code "200" 

PUT On Session /Usuarios
    &{cadastro_alterado}    Create Dictionary  nome=${nome_novo}      email=${email_novo}     password=${senha_nova}     administrador=${administrador}
    ${response}             PUT On Session     serverest              /usuarios/${id_alterar}               data=&{cadastro_alterado}           expected_status=any
    Log To Console          Resposta: ${response.content}
    Set Global Variable     ${response}   

Criar e logar sem ADM
    &{cadastro}            Create Dictionary    nome=Paulo               email=Paulo@gmail.com     password=123               administrador=false
    ${response}            POST On Session      serverest                /usuarios                 data=&{cadastro}           expected_status=any
    Log To Console         Resposta: ${response.content}
    &{payload}             Create Dictionary    email=Paulo@gmail.com    password=123
    ${response}            POST On Session      serverest                /login                    data=&{payload}
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}
    Validar ter Logado
    ${token_auth}          Set Variable      ${response.json()["authorization"]}  
    Log to Console         Token Salvo:      ${token_auth}
    Set Global Variable    ${token_auth}

Criar Usuario Estatico Valido
    ${json}                Importar JSON Estatico        usuarios.json  
    ${payload}             Set variable                  ${json["user_valido"]} 
    Set Global Variable    ${payload} 
    Log To Console         Response: ${payload}

Criar Usuario Estatico Invalido
    ${json}                Importar JSON Estatico        usuarios.json  
    ${payload}             Set variable                  ${json["user_invalido"]} 
    Set Global Variable    ${payload} 
    Log To Console         Response: ${payload}