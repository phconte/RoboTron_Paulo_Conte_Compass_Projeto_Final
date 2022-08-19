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
${email_novo}              novoemail3@novo.com
${nome_novo}               Novo alterado
${senha_nova}              senha123
${administrador}           true
${id}                      0uxuPY0cbmQhpEz1
${possui_carrinho}         False
${id_del}                  pso0IqqlBATbbDFf
${id_alterar}              0uxuPY0cbmQhpEz0
${token_auth}
${id_produto}              BeeJh5lz3k6kSIzA
${id_carrinho}             qbMqntef4iTOwWfg
${id_carrinho_errado}      qbMqntef4iT12345
${payload}



*** Keywords ***

Validar Status Code "${statuscode}"
    Should Be True         ${response.status_code} == ${statuscode}

# Sempre deverá executar no terminal 'npx serverest' e manter o terminal isolado
# Isto é: não fechar nem executar comandos no terminal rodando o server
Criar Sessao
    Create Session    serverest    ${url}

Importar JSON Estatico
    [Arguments]    ${nome_arquivo}
    ${arquivo}     Get File      ${EXECDIR}/${nome_arquivo}
    ${data}        Evaluate      json.loads('''${arquivo}''')    json   
    [return]       ${data}