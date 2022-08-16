*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Login
Library              RequestsLibrary

*** Variables ***
${response}
${email_para_login}        fulano@qa.com
${password_para_login}     teste
${email_errado}            nada@nada.com
       


*** Keywords ***

POST Endpoint /login 
    &{payload}             Create Dictionary    email=${email_para_login}    password=${password_para_login}
    ${response}            POST On Session      serverest    /login          data=&{payload}
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}


Validar Status Code "${statuscode}"
    Should Be True         ${response.status_code} == ${statuscode}

POST Endpoint /Login com usuário inexistente    
    &{payload}             Create Dictionary    email=${email_errado}        password=${password_para_login}
    ${response}            POST On Session      serverest    /login          data=&{payload}
    Log To Console         Resposta: ${response.content}
    Set Global Variable    ${response}
