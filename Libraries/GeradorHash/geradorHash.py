import hashlib
import json


def gerar_hash_str(conteudo):

    string_var = json.dumps(conteudo.decode('utf-8'))
    hash_conteudo = hashlib.sha256(str.encode(string_var)).hexdigest()
    print("Conteúdo: {}".format(conteudo))
    print("Hash gerado: {}".format(hash_conteudo))

    return hash_conteudo


def gerar_hash_dict(conteudo):

    string_var = json.dumps(conteudo)
    hash_conteudo = hashlib.sha256(str.encode(string_var)).hexdigest()
    print("Conteúdo: {}".format(conteudo))
    print("Hash gerado: {}".format(hash_conteudo))

    return hash_conteudo
