*** Settings ***
Documentation       Arquivo simples para requisições HTTP em APIs REST

Library             RequestsLibrary
Library             Collections
Library             OperatingSystem
Resource            ./common/general_keywords.robot
Resource            ./fixtures/dynamics.robot
Resource            ./variables/serverest_variables.robot


*** Keywords ***
Criar Sessao
    Create Session    serverest    ${BASE_URI}
