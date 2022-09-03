*** Settings ***
Documentation       Keywords e Variaveis para ações Gerais
Library             OperatingSystem
Library             RequestsLibrary
Resource            ../variables/serverest_variables.robot


*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

# Sempre deverá executar no terminal 'npx serverest' e manter o terminal isolado
# Isto é: não fechar nem executar comandos no terminal rodando o server


Importar JSON Estatico
    [Arguments]    ${nome_arquivo}
    ${arquivo}    Get File    ${EXECDIR}/support/fixtures/static/${nome_arquivo}
    ${data}    Evaluate    json.loads('''${arquivo}''')    json
    RETURN    ${data}

Validar se Mensagem Contem "${palavra}"
    Should Contain        ${response.json()["message"]}    ${palavra}
    