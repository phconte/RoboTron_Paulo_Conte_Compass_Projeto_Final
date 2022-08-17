*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Login
Library              RequestsLibrary
Resource             ../general_keywords.robot
   


*** Keywords ***

POST Endpoint /login 
    &{payload}             Create Dictionary    email=${email_para_login}    password=${password_para_login}
    ${response}            POST On Session      serverest    /login          data=&{payload}
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

POST Endpoint /Login com usuário inexistente    
    &{payload}             Create Dictionary    email=${email_errado}        password="teste"
    ${response}            POST On Session      serverest    /login          data=&{payload}    expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}

POST Endpoint /Login com dados Inválidos
    &{payload}             Create Dictionary    email=${email_para_login}        password=
    ${response}            POST On Session      serverest    /login          data=&{payload}    expected_status=any
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}
