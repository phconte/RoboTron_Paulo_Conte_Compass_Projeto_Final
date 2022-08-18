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
    ${response}            GET On Session    serverest    /carrinhos/${id}        expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

POST On Session /Carrinhos
    &{header}              Create Dictionary    Authorization=${token_auth}
    &{payload}             Create Dictionary    produtos=    
    ${response}            POST On Session      serverest    /Carrinhos    data=&{payload}    headers=${header}
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response}
