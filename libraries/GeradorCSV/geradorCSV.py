import pandas as pd
import json


def gerar_csv(conteudo):

    data = json.loads(conteudo.decode('utf-8'))
    df = pd.read_json(r'arquivo.json')
    df.to_csv(r'arquivo.csv', index=None)

    return data

# Referência: gerar um csv a partir de uma responde de JSON
# https://stackovercoder.com/code/python/json+para+csv+python