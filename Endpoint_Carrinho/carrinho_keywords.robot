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
    ${response}            POST On Session      serverest    /Carrinhos    json=&{payload}    headers=${header}    expected_status=any
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response}

Criar Carrinho Estatico Valido
    ${json}                Importar JSON Estatico        carrinhos.json
    ${payload}             Set Variable      ${json}
    Set Global Variable    ${payload}
    Log To Console         Response: ${payload}
    POST On Session /Carrinhos

Criar Um Carrinho e Armazenar ID
    Criar Carrinho Estatico Valido
    Validar Ter Criado carrinho
    ${id_carrinho}        Set Variable        ${response.json()["_id"]}   
    Log To Console        id carrinho:        ${id_carrinho}
    Set Global Variable   ${id_carrinho}

Criar Um Carrinho e Armazenar ID errado
    Criar Carrinho Estatico Valido
    Validar Ter Criado carrinho
    ${id_carrinho}        Set Variable        ${id_carrinho_errado}   
    Log To Console        id carrinho:        ${id_carrinho}
    Set Global Variable   ${id_carrinho}

Validar Ter Criado carrinho
    Should Be Equal            ${response.json()["message"]}    Cadastro realizado com sucesso
    Should Not Be Empty        ${response.json()["_id"]} 

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
