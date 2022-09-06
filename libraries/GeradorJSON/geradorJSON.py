import json


def gerar_json(conteudo):

    dicionario = json.loads(conteudo.decode('utf-8'))
    with open('arquivo.json', 'w') as jf:
        json.dump(dicionario, jf, indent=4)

    return dicionario

# Referência: gerar um json a partir de uma responde de API
# https://www.geeksforgeeks.org/reading-and-writing-json-to-a-file-in-python/
