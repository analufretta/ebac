import pandas as pd
import random
from faker import Faker

faker = Faker('pt_BR')

dados_pessoas = []

for data_create in range(10):
    nome = faker.name()
    cpf = faker.cpf()
    idade = random.randint(18,60)
    nascimento = faker.date_of_birth(minimum_age=idade, maximum_age=idade).strftime("%d/%m/%Y")
    address = faker.address()
    estado = faker.state()
    country = 'Brasil'

    pessoa = {
        'nome': nome,
        'cpf': cpf,
        'ideade': idade,
        'nascimento': nascimento,
        'address': address,
        'estado': estado,
        'country': country
    }

    dados_pessoas.append(pessoa)

    df_pessoas = pd.DataFrame(dados_pessoas)
    # print(df_pessoas)

    # pd.set_option('display.max_columns', None)
    # pd.set_option('display.max_rows', None)
    # pd.set_option('display.max_colwidth', None)
    # pd.set_option('display.max_width', None)

    print(df_pessoas.to_string())

    df_pessoas.to_csv('clientes_fake.csv')