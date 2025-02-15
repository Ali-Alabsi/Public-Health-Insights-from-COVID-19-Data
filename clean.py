# import pandas as pd

# file_path = 'CovidDeaths.xlsx'
# df = pd.read_excel(file_path)
# df_cleaned = df.dropna()
# cleaned_file_path = 'cleaned_CovidDeaths.xlsx'
# df_cleaned.to_excel(cleaned_file_path, index=False)

# print('finsh Clean')

import pandas as pd

file_path = 'CovidDeaths.xlsx'
df = pd.read_excel(file_path)
df_cleaned = df.fillna(0)
cleaned_file_path = 'cleaned_CovidDeaths2.xlsx'
df_cleaned.to_excel(cleaned_file_path, index=False)

print('Finish Clean')
