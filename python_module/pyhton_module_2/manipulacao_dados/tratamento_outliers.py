from pathlib import Path  # Instead of import os
import pandas as pd
from scipy import stats

df_file = Path(__file__).parent / 'clientes_limpeza.csv'
df = pd.read_csv(df_file)

# print(df.head())

# # Filtro

df_outlier_idade = df[(df['idade'] > 100) | (df['idade'] <= 0)]

# print('Filtro idade outliers:\n', df_filtro_idade[['nome', 'idade']])

# # Identificar outliers com z-score - desvio padrao
def learn_zscore():

    z_scores = stats.zscore(df['idade'].dropna()) # dropna  = drop NA
    outliers_z = df[z_scores >= 0.05]

    print('Outliers pelo Z-score:\n', outliers_z)

        ## ou
    df_zscore = df[(stats.zscore(df['idade']) < 0.05)]
    print(df_zscore)

# Identificar Outliers com IQR

def iqr_learn():
    ## Dividir a idade em 4
    Q1 = df['idade'].quantile(0.25)
    Q3 = df['idade'].quantile(0.75)
    IQR = Q3 - Q1

    limite_baixo = Q1 - 1.5 * IQR
    limite_alto = Q3 + 1.5 * IQR

    print('Limites IQR: ', limite_baixo, limite_alto)

    outliers_iqr = df[(df['idade'] < limite_baixo) | (df['idade'] > limite_alto)]
    print('Outliers pelo IQR:\n', outliers_iqr)

    df_iqr = df[(df['idade'] >= limite_baixo) | (df['idade'] <= limite_alto)]

# Filtrar enderecos invalidos
df['endereco'] = df['endereco'].apply(
    lambda x: 'Endereco Invalido'
    if len(x.split('\n')) < 3
    else x
)
    # x=endereco. Se divisao de campos for menor que 3, invalido, else: endereco
print('Qtd enderecos invalidos: ', (df['endereco'] == 'Endereco Invalido').sum())

# Tratar campos de text
df['nome'] = df['nome'].apply(
    lambda x: 'Nome Invalido'
    if isinstance(x, str) and len(x) > 50
    else x
)
    # isintance(x, str) se instancia x for uma string

print('Qtd nomes invalidos: ', (df['nome'] == 'Nome Invalido').sum())

df = df[(df['idade'] <= 100) & (df['idade'] > 0)]

print(df)

#Salvar dataframe
df.to_csv('clientes_remove_outliers.csv', index=False)