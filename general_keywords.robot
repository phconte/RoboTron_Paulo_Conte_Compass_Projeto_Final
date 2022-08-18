*** Settings ***
Documentation        Keywords e Variaveis para ações Gerais
Library              OperatingSystem
Library              RequestsLibrary

*** Variables ***
${response}
${url}                     http://localhost:3000
${email_para_login}        fulano@qa.com
${password_para_login}     teste
${email_errado}            nada@nada.com
${email_novo}              novoemail2@novo.com
${nome_novo}               Novo alterado
${senha_nova}              senha123
${administrador}           true
${id}                      qbMqntef4iTOwWf1
${possui_carrinho}         True
${id_del}                  XbtXG857aAG5z6EH
${id_alterar}              XbtXG857aAG5z6E2
${token_auth}


*** Keywords ***

Validar Status Code "${statuscode}"
git
# Sempre deverá executar no terminal 'npx serverest' e manter o terminal isolado
# Isto é: não fechar nem executar comandos no terminal rodando o server
Criar Sessao
    Create Session    serverest    ${url}