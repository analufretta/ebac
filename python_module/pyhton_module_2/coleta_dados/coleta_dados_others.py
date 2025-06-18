import pymysql
import pandas
from sqlalchemy import create_engine

def conexao_mysql(host, user, password, db, table):
    #Criar conexao
    connection = pymysql.connect(host = host, user = user, password = password, db = db)
    cursor = connection.cursor()

    #Executar consultar
    query = 'SELECT * FROM' + table + 'limit 10'
    cursor.execute(query)

    #Buscar Resultados
    resultados = cursor.fetchall()

    #Exibir resultados
    print('Tablea MySQL:')
    for linha in resultados:
        print(linha)

    #Fehcar a conexao
    cursor.close()
    connection.close()

# conexao_mysql('localhost', 'root', '#marmota1996', 'loja_informatica', 'cliente')

def df_conexao_mysql(host, user, password, db, table):
    conn = create_engine('mysql+pymysql://' + user + ':' + password + '@' + host + '/' + db)

    query = 'SELECT * FROM ' + table
    df = pandas.read_sql(query, conn) #data frame

    print('Table MySQL com Data Franme: \n', df.head())

    conn.dispose()
    return df

# df_cliente = df_conexao_mysql('localhost', 'root', '#marmota1996', 'loja_informatica', 'cliente')
# df_cliente.to_csv('cliente_dados.csv', index = False) #idex False ignora a coluna de index

def conexao_csv(path):
    #ler arquivo csv
    df = pandas.read_csv(path)
    print('Dados cliente: \n', df.head())
    df.to_json('cliente_dados.json', orient='records', index=False)

conexao_csv('cliente_dados.csv')