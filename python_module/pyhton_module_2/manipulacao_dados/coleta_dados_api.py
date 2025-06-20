import requests

def send_arquive():
    #Caminho do arquivo para upload
    file_path = '/Users/analufretta/Documents/git/ebac/linux_module/bla.csv'

    #Send arquive
    send_request = requests.post('https://upload.gofile.io/uploadfile', files={'file': open(file_path, 'rb')})
    return_send = send_request.json()

    print(return_send)
    url = return_send['data']['downloadPage']
    print('File sent. Access link: ', url)

send_arquive()

def send_arquive_key():
    #Caminho do arquivo para upload
    file_path = '/Users/analufretta/Documents/git/ebac/linux_module/bla.csv'
    api_key = 'YOUR_API_TOKEN'

     #Send arquive
    send_request = requests.post(
        'https://upload.gofile.io/uploadfile',
        files={'file': open(file_path, 'rb')},
        headers={'Authorization': api_key}
        )
    return_send = send_request.json()

    print(return_send)
    url = return_send['data']['downloadPage']
    print('File sent. Access link: ', url)

send_arquive_key()

def receive_arquive(file_url):
    #Receber o arquivo
    receive_request = requests.get(file_url)

    if receive_request.ok:
        with open('file_downloaded.csv', 'wb') as file:
            file.write(receive_request.content)
        print('File downloaded successfuly')
    else:
        print('Error downloading the file: ', receive_request.json())

receive_arquive('https://gofile.io/d/JTip0d')