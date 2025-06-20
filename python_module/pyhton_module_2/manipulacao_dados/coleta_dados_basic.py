import yfinance as yf
import pandas as pd

print('YFinance:')
bvsp_2024 = yf.download ('^BVSP', start = "2024-01-01", end = "2024-12-31")
print(bvsp_2024.head(5))