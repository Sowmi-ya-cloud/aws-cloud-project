# Data Analytics on Cloud

## 📌 Project Title & Objective

**Title:** Data Analytics on Cloud: Building an End-to-End Pipeline within AWS Free Tier

**Objective:** The goal of this project is to help you understand how data analytics workflows run on the cloud, from storing raw data to cleaning, analyzing, and visualizing it — all while staying within the AWS Free Tier.

## 🏗️ Architecture Diagram

## ⚙ Implementation steps

### Step 1: Dataset Collection & Upload

 •	Selected COVID-19 global dataset from Kaggle.

 •	Purpose:
   To analyze COVID-19 spread trends and observe patterns between countries over time.
 
 •	Uploaded dataset to an AWS S3 bucket under /raw_data/.
 
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/5d3f0b8b-2057-4734-a004-4448dcb32b6c" />

```bash
Python code: 

from google.colab import files                           # Upload dataset 
uploaded = files.upload()

import pandas as pd                                      # Import libraries 
import numpy as np

df = pd.read_csv("covid_19_clean_complete.csv")          # Load dataset 

df.head()                                                # Inspect data
df.info()
df.shape`
df.describe()
```

### Step 2: Data Cleaning

✅ Removed Duplicate values

    Used the drop_duplicates() function to ensure that all rows in the dataset were unique and   no repeated entries were present.
 
✅ Handled Missing Values

Checked for missing values using isnull().sum().
Used dropna() to remove province/state column. (to remove unnecessary null rows).

✅ Renamed Columns

The “Lat” and “Long” column was renamed to “Latitude” and “Longitude” using rename() function to make column names clear and consistent.

```bash
Python code:
df.drop(columns=['Province/State'], inplace=True)                            # drop column
df.duplicated().sum()                                                        # checking for dupicates
df.isnull().sum()                                                            # checking missing values
df.rename(columns = {"Lat" : "Latitude","Long" : "Longitude"}, inplace=True) # rename column names
```

### Step 3: Exploratory Data Analysis (EDA)

✅ Calculated Statistical Measures

   Used the following functions to understand the data distribution:
   
     •	Mean: df.mean()
     •	Median: df.median()
     •	Mode: df.mode()
     •	Standard Deviation: df.std()
     
   These helped identify the central values and how widely the data is spread.

 ✅ Trend / Pattern Analysis
 
 Formatted date column
    •	Converted the Date column using pd.to_datetime(). Then used groupby ('Date') to observe how confirmed cases changed over time.

 ✅ Correlation Analysis

   •	Used df.corr() to study the relationship between numerical columns such as Confirmed, Recovered, and Deaths.
   •	Result showed a strong positive correlation between Confirmed Cases and Deaths, meaning countries with higher confirmed cases   generally reported higher deaths.

```bash
Python code:
print("Mean:\n", df.mean(numeric_only=True), "\n")                        # Mean
print("Median:\n", df.median(numeric_only=True), "\n")                 # Median
print("Mode:\n", df.mode().iloc[0], "\n")                                           # Mode 
print("Standard Deviation:\n", df.std(numeric_only=True), "\n")     # Standard Deviation

df['Date'] = pd.to_datetime(df['Date'])                                             # convert to datetime
df_sorted = df.sort_values('Date')                                                     # Sort by date
trend = df_sorted.groupby('Date')['Confirmed'].sum()                     # Check trend 

corr = df.corr(numeric_only=True)                     # Correlation between numeric columns
print(corr)
```
### Step 4: Visualization Using Power BI

The dashboard contains:
  •	Bar chart: Shows Confirmed cases by Country
  •	Line graph: Shows Spread trend by month
  •	Pie chart: Shows Death share by regions
  •	KPI Cards: Shows Total Confirmed, Total Recovered, Total Deaths.

 <img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/f7cb054f-04f1-4461-8de7-21d0f6b751a2" />

### 6 Results(screenshots) & Insights



