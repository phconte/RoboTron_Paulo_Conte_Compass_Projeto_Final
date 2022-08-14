*** Settings ***
Documentation        Keywords e Variaveis para ações do Endpoint de Login
Library              RequestsLibrary

*** Variables ***
${email_para_login}        fulano@qa.com
${password_para_login}     teste
${response}


*** Keywords ***
POST Endpoint /login
    &{payload}             Create Dictionary    email=${email_para_login}   password=${password_para_login}
    ${response}            POST On Session    serverest    /login    data=&{payload}
    Log to Console         Response: ${response.content}
    Set Global Variable    ${response}

Validar ter Logado 
     Should be Equal         ${response.json()["message"]}    Login realizado com sucesso
     Should Not Be Empty     ${response.json()["authorization"]}  

Fazer Login e Armazenar Token
      POST Endpoint /login 
      Validar ter Logado
      ${token_auth}          Set Variable      ${response.json()["authorization"]}  
      Log to Console         Token Salvo: ${token_auth}
      Set Global Variable        ${token_auth}