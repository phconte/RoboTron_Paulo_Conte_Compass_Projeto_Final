*** Settings ***
Documentation       Keywords e variáveis para Geração de dados dinamicos

Library             FakerLibrary
Library             OperatingSystem
Resource            ../variables/serverest_variables.robot


*** Keywords ***
Criar Usuario Dinamico Valido
    ${nome}    FakerLibrary.Name
    ${email}    FakerLibrary.Email
    ${payload}    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=Teste123
    ...    administrador=true
    Log To Console    ${payload}
    [return]          ${payload}
