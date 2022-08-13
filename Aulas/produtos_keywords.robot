*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Produtos
Library              RequestsLibrary

*** Variables ***
${token_auth}        Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNjYwMzYxMDY1LCJleHAiOjE2NjAzNjE2NjV9.JU-gz4MQKMLEmrSmtS8VwX06yQQh75o-S5SjoFCLDjo


*** Keywords ***
POST Endpoint /produtos
    &{header}              Create Dictionary    Authorization=${token_auth}
    &{payload}             Create Dictionary    nome=MouseTech    preco=400    descricao=Mouse    quantidade=100
    ${response}            POST On Session    serverest    /produtos    data=&{payload}    headers=${header}
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response}