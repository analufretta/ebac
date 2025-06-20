#Estudo 1: coleta_dados_basic.py

# Libraries:
import requests
from bs4 import BeautifulSoup
import pandas as pd

## Explaination 'print (response.text[:600])': slicing: [:600] prints from 0 to 600 characteres
def extract_text():

    texto = 'Extrair msg de texto'

    subtexto = texto[:11]
    print (subtexto)

    subtexto = texto[8:]
    print (subtexto)

    subtexto = texto[-5:]
    print (subtexto)

## Web scraping: esse metodo nao funcionau para mim, estava dando erro 'Edge: Too Many Requests'
def web_scraping():

    response = requests.get('https://finance.yahoo.com/quote/%5EBVSP/history/?guccounter=1&frequency=1d')
    print (response.text[:600])

    soup = BeautifulSoup(response.text, 'html.parser')
    print(soup.prettify()[:1000])

    print('Pandas:')
    url_data = pd.read_html('https://finance.yahoo.com/quote/%5EBVSP/history/?guccounter=1&frequency=1d')
    print(url_data[0].head(10))

    # Teste para saber qual o erro
    print(response.status_code)
    #anwser: 429
    #Yahoo Finance is blocking bcs it detects it is not a browser

# Entendendo Lambda: operacoes simples ao inves de funcoes
def eleva_cubo(x):
    return x ** 3

eleva_cubo_lambda = lambda x: x ** 3

print(eleva_cubo(2))
print(eleva_cubo_lambda(2))

df = pd.DataFrame({'numeros': [1, 2, 3, 4, 5, 10]})

df['cubo funcao'] = df['numeros'].apply(eleva_cubo)
df['cubo_lambda'] = df['numeros'].apply(lambda x: x ** 3)

print(df)