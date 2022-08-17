*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Usuarios
Library              RequestsLibrary
Resource             ../general_keywords.robot


*** Keywords ***
GET On Session /Usuarios        
    ${response}            GET On Session    serverest    /Usuarios
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}