*** Settings ***
Documentation       Keywords e variáveis para Geração de dados dinamicos

Library             FakerLibrary    locale=pt_br
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
    Set Global Variable    ${payload}

Criar Produto Dinamico Valido
    ${nome}    FakerLibrary.Word
    ${preco}    FakerLibrary.Building Number
    ${descricao}    FakerLibrary.Color Name
    ${quantidade}    FakerLibrary.Building Number
    ${payload}    Create Dictionary
    ...    nome=${nome}
    ...    preco=${preco}
    ...    descricao=${descricao}
    ...    quantidade=${quantidade}
    Log To Console    ${payload}
    Set Global Variable    ${payload}
