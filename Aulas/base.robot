*** Comments ***


# Sessão para configuração, documentação, imports de arquivos e libraries
*** Settings ***
Documentation       Arquivo simples para requisições HTTP em APIs REST
Library             RequestsLibrary
Resource            ./usuarios_keywords.robot
Resource            ./login_keywords.robot
Resource            ./produtos_keywords.robot     
#Resource            ./carrinhos_keywords.robot                          

# Sessão para setagem de variáveis
*** Variables ***
${nome_do_usuario}    paulo conte
${senha_do_usuario}   testee123 
${email_do_usuario}   teste21212@gmail.com
${response}

# Sessão para criação dos cenários de testes
*** Test Cases ***
Cenário: GET Todos os Usuários 200
    [tags]    GET
    Criar sessao
    GET Endpoint /Usuarios
    Validar Status Code "200"
    Validar Quantidade "${1}"
    Printar Conteudo Response

Cenário: POST Cadastrar Usuario 201
    [tags]    POST
    Criar sessao
    POST Endpoint /Usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenário: PUT Editar Usuario 200
    [tags]    PUT
    Criar sessao
    PUT Endpoint /Usuarios
    Validar Status Code "200"   

Cenário: DELETE Deletar Usuario 200
    [tags]    DELETE
    Criar sessao
    DELETE Endpoint /Usuarios
    Validar Status Code "200"     

Cenário: POST Realizar Login 200
    [tags]    POSTLOGIN
    Criar Sessao
    POST Endpoint /login 
    Validar Status Code "200"

Cenário: POST Criar Produto 200
    [tags]    POSTPRODUTO
    Criar Sessao
    POST Endpoint /produtos
    Validar Status Code "201"
    

# Sessão para criação de Keywords personalizadas
*** Keywords ***
Criar Sessao
    Create Session    serverest    https://serverest.dev/

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Validar Quantidade "${quantidade}"
    Should Be Equal    ${response.json()["quantidade"]}     ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain    ${response.json()["message"]}    ${palavra}

Printar Conteudo Response
    Log to Console    Nome: ${response.json()["usuarios"][0]["nome"]}