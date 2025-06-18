import requests
from bs4 import BeautifulSoup

url = 'https://python.org.br/web/'
requirement = requests.get(url)
soup = BeautifulSoup(requirement.text, 'html.parser')

#exibir o texto
print(soup.text.strip())  #strip = remove (value). Nesse caso, remove os espacos em branco

#Filtrar a exibicao pela tag
for text_line in soup.find_all('h2'):
    title = text_line.text.strip()
    print('Title:', title)

#Contar quantidade de titulos e paragrafos
count_h1 = 0
count_h2 = 0
count_h3 = 0

for text_line in soup.find_all(['h1','h2','h3']):
    if text_line.name == 'h1':
        count_h1 += 1
    elif text_line.name == 'h2':
        count_h2 += 1
    elif text_line.name == 'h3':
        count_h3 += 1

print('Total Heading 1:', count_h1)
print('Total Heading 2:', count_h2)
print('Total Heading 2:', count_h3)


#Cound Titles another option
h1s = soup.find_all('h1')
h2s = soup.find_all('h2')
h3s = soup.find_all ('h3')

count_h1 = len(h1s)
count_h2 = len(h2s)
count_h3 = len(h3s)

print('Total Heading 1:', count_h1)
print('Total Heading 2:', count_h2)
print('Total Heading 2:', count_h3)

# Monstrar textos

for text_line in soup.find_all(['h1','h2','h3']):
    if text_line.name == 'h1':
        title = text_line.text.strip()
        print('Title: ', title)
    elif text_line.name == 'h2':
        subtitle = text_line.text.strip()
        print('Subtitle: ', title)
    elif text_line.name == 'h3':
        heading = text_line.text.strip()
        print('Heading: ', heading)

#Exibir tags Ainhada
for title in soup.find_all('h1'):
    print('\n', title.text.strip())

    for subtitle in title.find_next_siblings('h2'):
        print('\n', subtitle.text.strip())

        for sibling in subtitle.find_next_siblings():
            if sibling.name == 'h2':
                break
            if sibling.name == 'p':
                for a in sibling.find_all('a', href = True):
                    print('URL: ', a['href'])
            if sibling.name == 'h3':
                print('*', sibling.text.strip(),)
            if sibling.name == 'ul':
                    for a in sibling.find_all('a', href = True):
                        print('-', a.text.strip(), ' | URL: ', a['href'])