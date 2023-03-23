import pandas as pd

# Read the CSV file into a DataFrame
df = pd.read_csv('./Data/broadcast.csv')

# Convert the date column to datetime format and then to YYYY-MM-DD format
df['date'] = pd.to_datetime(df['date']).dt.strftime('%Y-%m-%d')

# Write the updated DataFrame to a new CSV file
df.to_csv('./Data/broadcast.csv', index=False)
