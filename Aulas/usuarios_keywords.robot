*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Usuarios
Library              RequestsLibrary
Resource             ./common.robot

*** Variables ***
${nome_do_usuario}    paulo conte
${senha_do_usuario}   testee123 
${email_do_usuario}   teste21212@gmail.com
${response}
${payload}


*** Keywords ***
Criar Sessao
    Create Session    serverest    https://serverest.dev/

GET Endpoint /Usuarios
    ${response}    GET On Session    serverest    /Usuarios
    Set Global Variable    ${response}
    Log to Console         Response: ${response.content}

POST Endpoint /Usuarios
    ${response}            POST On Session    serverest    /usuarios    json=${payload}
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

Validar Quantidade "${quantidade}"
    Should Be Equal    ${response.json()["quantidade"]}     ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain    ${response.json()["message"]}    ${palavra}

Printar Conteudo Response
    Log to Console    Nome: ${response.json()["usuarios"][0]["nome"]}

Criar Usuario Estatico Valido
    ${json}                Importar JSON Estatico        Aulas/json_usuario_ex.json
    ${payload}             Set Variable                  ${json["user_valido"]}
    Set Global Variable    ${payload}
    POST Endpoint /Usuarios