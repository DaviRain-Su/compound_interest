"""
This module creates an investment growth chart based on CSV data.
It uses pandas for data manipulation and matplotlib for visualization.
"""

import pandas as pd
import matplotlib.pyplot as plt

# Read CSV file
data = pd.read_csv('./data/investment_data.csv')

# Create chart
plt.figure(figsize=(10, 6))
plt.plot(data['Year'], data['Final Amount'], label='Final Amount', marker='o')
plt.plot(data['Year'], data['Total Invested'], label='Total Invested', marker='s')
plt.plot(data['Year'], data['Initial Amount'], label='Initial Amount', marker='^')

plt.title('Investment Growth Chart')
plt.xlabel('Year')
plt.ylabel('Amount')
plt.legend()
plt.grid(True)

# Save chart
plt.savefig('./data/investment_chart.png')
plt.show()