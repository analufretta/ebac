#Estudo 1: coleta_dados_basic.py

## Explaination 'print (response.text[:600])': slicing: [:600] prints from 0 to 600 characteres

texto = 'Extrair msg de texto'

subtexto = texto[:11]
print (subtexto)

subtexto = texto[8:]
print (subtexto)

subtexto = texto[-5:]
print (subtexto)

##Scraping html data: esse metodo nao funcionau para mim, estava dando erro 'Edge: Too Many Requests'
import requests
from bs4 import BeautifulSoup
import pandas

response = requests.get('https://finance.yahoo.com/quote/%5EBVSP/history/?guccounter=1&frequency=1d')
print (response.text[:600])

soup = BeautifulSoup(response.text, 'html.parser')
print(soup.prettify()[:1000])

print('Pandas:')
url_data = pandas.read_html('https://finance.yahoo.com/quote/%5EBVSP/history/?guccounter=1&frequency=1d')
print(url_data[0].head(10))

#Teste para saber qual o erro
print(response.status_code)
    #anwser: 429
    #Yahoo Finance is blocking bcs it detects it is not a browser