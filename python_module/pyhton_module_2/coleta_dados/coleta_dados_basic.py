import requests

response = requests.get('https://finance.yahoo.com/quote/%5EBVSP/history/?guccounter=1')
print (response.text[:600]) #slicing: [:600] prints from 0 to 600 charac