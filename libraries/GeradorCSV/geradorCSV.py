import pandas as pd
import json


def gerar_csv(conteudo):

    data = json.loads(conteudo.decode('utf-8'))
    df = pd.json_normalize(data['Results'])
    df.to_csv("arquivo.csv")

    return data
