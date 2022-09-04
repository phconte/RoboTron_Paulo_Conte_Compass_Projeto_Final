*** Settings ***
Documentation       Arquivo para chamar as libraries personalizadas

Resource            ../support/base.robot

Library    GeradorHash/geradorHash.py

*** Keywords ***
Converter string "${conteudo}" para sha256
    ${Conteudo_Log}    Gerar Hash Str    ${conteudo}
    Log    ${Conteudo_Log}

Converter dict "${conteudo}" para sha256
    ${Conteudo_Log}    Gerar Hash Dict   ${conteudo}
    Log    ${Conteudo_Log}
