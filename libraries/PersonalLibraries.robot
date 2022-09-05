*** Settings ***
Documentation       Arquivo para chamar as libraries personalizadas

Resource            ../support/base.robot
Library             ../libraries/GeradorHash/geradorHash.py
Library             ../libraries/GeradorCSV/geradorCSV.py
Library             ../libraries/GeradorJSON/geradorJSON.py


*** Keywords ***
Converter string "${conteudo}" para sha256
    ${Conteudo_Log}    Gerar Hash Str    ${conteudo}
    Log    ${Conteudo_Log}

Converter dict "${conteudo}" para sha256
    ${Conteudo_Log}    Gerar Hash Dict    ${conteudo}
    Log    ${Conteudo_Log}

Gerar Json "${conteudo}"
    ${Conteudo_Log}    Gerar Json    ${conteudo}

Gerar CSV "${conteudo}"
    ${Conteudo_Log}    Gerar CSV    ${conteudo}
