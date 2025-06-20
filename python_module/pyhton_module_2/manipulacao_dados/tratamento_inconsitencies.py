from pathlib import Path  # Instead of import os
import pandas as pd
from scipy import stats
from datetime import datetime
import numpy as np
import re

df_file = Path(__file__).parent / 'clientes_remove_outliers.csv'
df = pd.read_csv(df_file)

pd.set_option('display.width', None)
pd.set_option('display.max_colwidth', None)

# print(df.head())
# print(df.isnull().sum())
# print(df.dtypes)

# Mascarar dados pessoas

df['cpf_mascara'] = df['cpf'].apply(lambda cpf: f'{cpf[:3]}.***.***-{cpf[-2:]}')  # f' = escrever texto

# Corrigir datas e idade
df['data'] = pd.to_datetime(df['data'], format='%Y-%m-%d', errors='coerce')

# ano_atual = datetime.now().year
# min_ano = ano_atual - 100
# maioridade = (ano_atual - 18)

# print(len(df.loc[df['data'].dt.year < min_ano]))
# print(len(df.loc[df['data'].dt.year >= ano_atual])) # resultado = 0. Portanto, nao ha inconsistencias aqui
# print(df.loc[df['data'].dt.year >= maioridade])  # menores de idade

data_atual = pd.to_datetime('today')

df['idade'] = (data_atual.year - df['data'].dt.year)
df['idade'] -= ((data_atual.month <= df['data'].dt.month) & (data_atual.day <= df['data'].dt.day)).astype('Int64')
df.loc[(df['idade'] > 100) | (df['idade'] < 18), 'idade'] = np.nan
# print(df[df['idade'].isna()])


# # Corrigir campo com multiplas infpormacoes
# print(df.loc[df['endereco'] == 'Endereco Invalido'])

df['bairro'] = df['endereco'].apply(lambda x: x.split('\n')[1].strip() if len(x.split('\n')) > 1 else np.nan).str.title()

df['estado'] = df['endereco'].apply(lambda x: x.split(' / ')[-1].strip() if len(x.split('\n')) > 1 else np.nan).str.upper()

df['cep'] = df['endereco'].apply(lambda x: x.split('\n')[2].strip() if len(x.split('\n')) > 1 else np.nan).astype(str)
df['cep'] = df['cep'].apply(lambda x: x.split(' ')[0].strip() if len(x.split(' ')) > 1 else np.nan)

#Formatar CEP
df['cep'] = df['cep'].apply(lambda x: re.sub(r'(\d{5})(\d{3})', r'\1-\2', re.sub(r'\D', '', x)) if isinstance(x, str) else np.nan)

df['endereco'] = df['endereco'].apply(lambda x: x.split('\n')[0].strip()).str.title()
df['endereco'] = df['endereco'].apply(lambda x: 'Endereco Invalido' if len(x) > 50 or len(x) < 5 else x)

#Corrigir dados erroneos
df['cpf'] = df['cpf'].apply(lambda x: x if len(x) == 14 else 'CPD Invalio')
# print(df.loc[df['cpf'] == 'CPF Invalido']) # No Invalid CPF
df['cpf'] = df['cpf_mascara']

estados_br = ['AC', 'AL', 'AP', 'AM', 'BA' 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO']
df['estado'] = df['estado'].apply(lambda x: x if x in estados_br else 'Desconhecido')
# print(df.loc[df['estado'] == 'Desconhecido']) # 77 estados desconhecidos

# print(df.head())

df[['nome', 'cpf', 'idade', 'endereco', 'cep', 'estado']].to_csv('clientes_tratados.csv', index=False)
