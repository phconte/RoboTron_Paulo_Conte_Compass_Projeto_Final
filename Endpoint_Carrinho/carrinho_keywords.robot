*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Carrinhos
Library              RequestsLibrary
Resource             ../general_keywords.robot


*** Keywords ***
GET On Session /Carrinhos
    ${response}            GET On Session    serverest    /carrinhos
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

    
GET On Session /Carrinhos por ID
    ${response}            GET On Session    serverest    /carrinhos/${id_carrinho}        expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

POST On Session /Carrinhos
    &{header}              Create Dictionary    Authorization=${token_auth}    
    ${response}            POST On Session      serverest    /Carrinhos    json=&{payload}    headers=${header}
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response}

Criar Carrinho Estatico Valido
    ${json}                Importar JSON Estatico        carrinhos.json
    ${payload}             Set Variable      ${json}
    Set Global Variable    ${payload}
    Log To Console         Response: ${payload}
    POST On Session /Carrinhos

POST On Session /Carrinhos sem token
    &{header}              Create Dictionary    Authorization=   
    ${response}            POST On Session      serverest    /Carrinhos    json=&{payload}    headers=${header}    expected_status=any
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response}

Criar Carrinho Estatico Valido sem token
    ${json}                Importar JSON Estatico        carrinhos.json
    ${payload}             Set Variable      ${json}
    Set Global Variable    ${payload}
    Log To Console         Response: ${payload}
    POST On Session /Carrinhos sem token

DELETE Endpoint /carrinhos/concluir-compra
    &{header}                 Create Dictionary                  Authorization=${token_auth}  
    ${response}               DELETE On Session                        serverest        /carrinhos/concluir-compra/    headers=&{header}    expected_status=any
    Log To Console            Response: ${response.content}
    Set Global Variable       ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    &{header}                 Create Dictionary                  Authorization=${token_auth}  
    ${response}               DELETE On Session                        serverest        /carrinhos/cancelar-compra/    headers=&{header}    expected_status=any
    Log To Console            Response: ${response.content}
    Set Global Variable       ${response}
