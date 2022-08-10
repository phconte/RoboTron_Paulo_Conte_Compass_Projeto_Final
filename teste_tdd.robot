# Arquivo para exercicitar escrita TDD baseado em ações no Robot

*** Test Cases ***
Cenário: GET Todos os Usuarios 200
    GET Endpoint /produtos
    Validar todos os Produtos na response
    Validar status code "200"

Cenário: GET Usuario Especifico 200
    GET Endpoint /produtos com id "BeeJh5lz3k6kSIzA"
    Validar o Produto com id "BeeJh5lz3k6kSIzA"
    Validar o status code "200"
    Validar Mensagem "Nome = Logitech MX Vertical"




