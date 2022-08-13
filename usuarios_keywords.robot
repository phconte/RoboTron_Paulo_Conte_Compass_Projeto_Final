*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Usuarios
Library              RequestsLibrary

*** Variables ***
${nome_do_usuario}    paulo conte
${senha_do_usuario}   testee123 
${email_do_usuario}   teste21212@gmail.com


*** Keywords ***
Criar Sessao
    Create Session    serverest    https://serverest.dev/

GET Endpoint /Usuarios
    ${response}    GET On Session    serverest    /Usuarios
    Set Global Variable    ${response}
    Log to Console         Response: ${response.content}

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
    ${response}            DELETE On Session    serverest    /usuarios/AMk7GkPH5s04r5WV
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response}