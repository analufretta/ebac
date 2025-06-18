import requests
from bs4 import BeautifulSoup

url = 'https://books.toscrape.com/'
requisicao.encoding = 'utf-8' #conserta erros de formatacao com caracteres especiais

# Escreve seu código abaixo
extracao = BeautifulSoup(requests.get(url).text, 'html.parser')

print(extracao.prettify()[:2000])

#Catalogo e contagem de livros verion 1

def version_1():

    contar_livros = 0
    catalogo = []

    for artigo in extracao.find_all('article', class_='product_pod'):
        livro = {}
        for tl in artigo.find_all('h3'):
            titulo = tl.text.strip()
            livro['Título'] = titulo
        for pr in artigo.find_all('p', class_='price_color'):
            preco = (pr.text.strip()[2:])
            livro['Preço'] = preco
        catalogo.append(livro)
    print (catalogo)
    total_livros = contar_livros + len(catalogo)
    print('Total livros:', total_livros)

#Catalogo e contagem de livros verion 2

def version_2():

    catalogo = []

    for artigo in extracao.find_all('article', class_='product_pod'):
        livro = {}
        for tl in artigo.find_all('h3'):
            livro['Título'] = tl.a['title']
        for pr in artigo.find_all('p', class_='price_color'):
            livro['Preço'] = pr.text.strip()
        catalogo.append(livro)
    print (catalogo)
    print('Total livros:', len(catalogo))

def version_3():
    contar_livros = 0
    catalogo = []

    for artigo in extracao.find_all('article', class_='product_pod'):
        livro = {}
        for h3 in artigo.find_all('h3'):
            livro['Título'] = h3.a['title']
        for p in h3.find_all('p', class_='price_color'):
            livro['Preço'] = p.text.strip()
        catalogo.append(livro)
        contar_livros += 1
    print (catalogo)
    print('Total livros:', contar_livros)

def version_4():
    contar_livros = 0
    catalogo = []

    for artigo in extracao.find_all('article', class_='product_pod'):
        livro = {}
        h3 = artigo.find('h3') 
        if h3 and h3.a:
            livro['Título'] = h3.a['title']
        
        p = artigo.find('p', class_='price_color')
        if p:
            livro['Preço'] = p.text.strip()

        catalogo.append(livro)
        contar_livros += 1
    print(catalogo)
    print('Total livros:', contar_livros)
