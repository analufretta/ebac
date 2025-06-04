import yfinance as yf
import pandas as pd

print('YFinance:')
bvsp_2024 = yf.download ('^BVSP', start = "2024-01-01", end = "2024-12-31")
print(bvsp_2024.head(5))

bvsp_2024.to_csv('bvsp_2024.csv')  #save data do csv file to demonstration purposes

print('Pandas:')
bvsp_2024_data = pd.read_csv('bvsp_2024.csv')
print(bvsp_2024_data.head(5))