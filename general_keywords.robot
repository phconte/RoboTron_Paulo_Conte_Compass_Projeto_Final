*** Settings ***
Documentation        Keywords e Variaveis para ações Gerais
Library              OperatingSystem
Library              RequestsLibrary

*** Variables ***
${response}
${url}                     http://localhost:3000
${email_para_login}        beltrano@qa.com.br
${password_para_login}     teste
${email_errado}            nada@nada.com
${email_novo}              tonys@novo.com
${nome_novo}               Tony Soprano
${senha_nova}              senha1234
${administrador}           true
${id}                      0uxuPY0cbmQhpEz1
${possui_carrinho}         False
${id_del}                  jgjvjpnZ5ftqivEo
${id_alterar}              TEOSL2d33FqnBI6i
${token_auth}
${id_produto}              T2blJHD4h6sFxDA0
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