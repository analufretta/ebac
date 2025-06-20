import os
import pandas as pd

base_path = os.path.dirname(__file__)
file_path = os.path.join(base_path, 'clientes.csv')

df = pd.read_csv(file_path)
pd.set_option('display.width', None)
# print(df.head())
print('Qtd incial de registros: ', df.shape[0])

# Remover dados
df.drop('pais', axis=1, inplace=True)  # Axis 1 = Coluna | Inplace=True faz a mudanca no seu proprio df
df.drop(2, axis=0, inplace=True)  # Axis 0 = Linha

# Normalizar campos de texto
df['nome'] = df['nome'].str.title()
df['endereco'] = df['endereco'].str.lower()  # Lower case
df['estado'] = df['estado'].str.upper()  # Upper case


# Converter tipos de dados
df['idade'] = df['idade'].astype(int)

# print(df.head())

# Tratamento de valores nulos
print(df.isnull().sum())
print(df.isnull().sum().sum())

df_fillna = df.fillna(0) # Substituir valore snulos por 0
df_dropna = df.dropna() # Remove registrso com valores nulos
df_dropna4 = df.dropna(thresh=4) # Manter registros com no minimo 4 valores noa nulos
df = df.dropna(subset=['cpf']) # Remover registros com CPF Nulo

print('Qtd valores nulos com fillna: ', df_fillna.isnull().sum().sum())
print('Qtd valores nulos com dropna: ', df_dropna.isnull().sum().sum())
print('Qtd valores nulos com dropna4: ', df_dropna4.isnull().sum().sum())
print('Qtd valores nulos com CPF: ', df.isnull().sum().sum())

df.fillna({'estado': 'Desconhecido'}, inplace=True)
df['endereco'] = df['endereco'].fillna('Endereco nao encontrado')
df['idade_corrigida'] = df['idade'].fillna(df['idade'].mean())
df['data_corrigida'] = pd.to_datetime(df['data'], format='%d/%m/%Y', errors='coerce') #error = gera valor nulo

#Tratar valores dupliacdos
print('Qtd de registros pos tratar nulos: ', df.shape[0])

df.drop_duplicates()
df.drop_duplicates(subset='cpf', inplace=True)

print('Qtd registros removidos valores duplicados: ', len(df))

print('Dados Tratados:\n', df)

# Salvar dataframe
df['data'] = df['data_corrigida']
df['idade'] = df['idade_corrigida']

df_salvar = df[['nome', 'cpf', 'idade', 'data', 'endereco', 'estado']]
df_salvar.to_csv('clientes_limpeza.csv', index=False)

print('Novo Data Frame: ', pd.read_csv('clientes_limpeza.csv'))