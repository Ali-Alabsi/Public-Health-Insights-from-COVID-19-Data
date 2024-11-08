import pandas as pd
import mysql.connector
from mysql.connector import Error

def excel_to_mysql(file_path, table_name):
    try:
        data = pd.read_excel(file_path)
      
        if 'date' in data.columns:
            data['date'] = pd.to_datetime(data['date']).dt.strftime('%Y-%m-%d')
     
        connection = mysql.connector.connect(
            host='localhost',
            database='covid19_data',
            user='root', 
            password='' 
        )

        if connection.is_connected():
            cursor = connection.cursor()

          
            for i, row in data.iterrows():
                insert_query = f"INSERT INTO {table_name} ({', '.join(data.columns)}) VALUES ({', '.join(['%s'] * len(row))})"
                cursor.execute(insert_query, tuple(row))

            connection.commit()
            print(f"Data has been successfully loaded into the table.{table_name}")

    except Error as e:
        print("Error connecting to database", e)
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("The database connection was closed.")


excel_to_mysql('cleaned_CovidDeaths.xlsx', 'covid_deaths')
