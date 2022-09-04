*** Settings ***
Documentation       Arquivo base para requisições HTTP em APIs REST

Library             RequestsLibrary
Library             Collections
Library             OperatingSystem
Library             ../Libraries/GeradorHash/geradorHash.py
Resource            ./common/general_keywords.robot
Resource            ./fixtures/dynamics.robot
Resource            ./variables/serverest_variables.robot
Resource            ../keywords/login_keywords.robot
Resource            ../keywords/carrinho_keywords.robot
Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/usuarios_keywords.robot
Resource            ../Libraries/PersonalLibraries.robot


*** Keywords ***
Criar Sessao
    Create Session    serverest    ${BASE_URI}
    Fazer Login e Armazenar Token
