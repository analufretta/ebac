import os
import pandas as pd

base_path = os.path.dirname(__file__)
file_name = input('Enter the CSV file name: ').strip()
file_path = os.path.join(base_path, file_name)

df = pd.read_csv(file_path)

# Verificar os primeiros registros
print(df.head().to_string())

print(df.tail().to_string())

# Verificar qtd linhas e colunas
print('Qtd: ', df.shape) # Mostra (linhas, colunas)

# Verificar os tipos de dados
print('Tipagem:\n', df.dtypes)

# Checar valores nulos
print('Valores nulos:\n', df.isnull().sum())