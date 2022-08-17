*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Usuarios
Library              RequestsLibrary
Resource             ../general_keywords.robot


*** Keywords ***

GET On Session /Usuarios        
    ${response}            GET On Session    serverest    /usuarios
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

POST On Session /Usuarios
    &{cadastro}            Create Dictionary  nome=${nome_novo}      email=${email_novo}     password=${senha_nova}     administrador=${administrador}
    ${response}            POST On Session    serverest              /usuarios               data=&{cadastro}           expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

GETid On Session /Usuarios
    ${response}            GET On Session    serverest    /usuarios/${id}        expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

DELETE On Session /Usuarios
    Run Keyword If         ${possui_carrinho} == False    DELETAR
    ...    ELSE            Skip                 'Não é possível deletar usuario que possui carrinho'
    
DELETAR   
    ${response}            DELETE On Session    serverest    /usuarios/${id_del}        expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}
