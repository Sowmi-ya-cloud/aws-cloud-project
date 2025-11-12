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
print("Mean:\n", df.mean(numeric_only=True), "\n")                  # Mean
print("Median:\n", df.median(numeric_only=True), "\n")              # Median
print("Mode:\n", df.mode().iloc[0], "\n")                           # Mode 
print("Standard Deviation:\n", df.std(numeric_only=True), "\n")     # Standard Deviation

df['Date'] = pd.to_datetime(df['Date'])                             # convert to datetime
df_sorted = df.sort_values('Date')                                  # Sort by date
trend = df_sorted.groupby('Date')['Confirmed'].sum()                # Check trend 

corr = df.corr(numeric_only=True)                                   # Correlation between numeric columns
print(corr)
```
### Step 4: Visualization Using Power BI

The dashboard contains:

  •	Bar chart: Shows Confirmed cases by Country
  •	Line graph: Shows Spread trend by month
  •	Pie chart: Shows Death share by regions
  •	KPI Cards: Shows Total Confirmed, Total Recovered, Total Deaths.

 <img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/f7cb054f-04f1-4461-8de7-21d0f6b751a2" />

## 📊 Results(screenshots) & Insights

<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/7ae08692-52d4-4db8-bba5-337ad76ef06f" />

<img width="867" height="183" alt="image" src="https://github.com/user-attachments/assets/c703782c-dabf-4537-801f-e9787a3c2b37" />

<img width="892" height="261" alt="image" src="https://github.com/user-attachments/assets/2cf2203a-222b-4ead-8e77-d1e8da9dfd00" />

<img width="886" height="63" alt="image" src="https://github.com/user-attachments/assets/074e2d0c-52ee-4be1-b915-bd3ea2217abe" />

<img width="890" height="258" alt="image" src="https://github.com/user-attachments/assets/6b44b088-d5f9-4f67-a2ee-d1edabfe7bf7" />

<img width="898" height="81" alt="image" src="https://github.com/user-attachments/assets/adeec178-6758-4c37-ad06-b9e0a67224dd" />

<img width="894" height="329" alt="image" src="https://github.com/user-attachments/assets/f64ef1e6-9f33-469e-954a-e43b34329f35" />

<img width="869" height="46" alt="image" src="https://github.com/user-attachments/assets/9896a0c5-8efd-49de-8c6c-f5eb5c94d4b6" />

<img width="892" height="344" alt="image" src="https://github.com/user-attachments/assets/73622327-8d2f-4f50-ac4f-5f8c8ad6d76a" />

<img width="881" height="213" alt="image" src="https://github.com/user-attachments/assets/db514425-ea2f-4d41-bc84-40873aaa8ab0" />

<img width="894" height="351" alt="image" src="https://github.com/user-attachments/assets/c3a7996e-7263-4336-ac71-4dca2d54f5e3" />


✅ Insights

•	Median deaths are just 2, but average is around 884. So, most regions had very low deaths.
•	The dataset covers many different global regions because the latitude and longitude values spread widely.
•	The most commonly repeated region in the dataset belongs to China, which makes sense because initial COVID reporting started there.
•	Confirmed vs Deaths (0.91) - strong positive relationship. More cases resulted in more deaths.

## Challenges Faced

✅ Understanding Correlation Meaning
     •	At first, it was confusing to interpret the correlation values.
     •	I took time to learn that higher positive values mean strong relationships.
✅ Power BI dashboard creation:
     •	I faced some confusion while designing the dashboard, especially in choosing the right colours and deciding where each chart should be placed.
     •	To overcome this, I looked at a few sample dashboards. This helped me understand how to arrange the visuals in a clean and logical flow.

## Learning Outcomes

  •	Understood cloud storage and dataset versioning using AWS S3.
  •	Became confident with Pandas, NumPy, Matplotlib and Seaborn.
  •	Learned how to create a clean and meaningful analytics Power BI dashboard.

## Conclusion

This project helped me gain real-time experience in managing data analytics workflows on the cloud. I successfully built an end-to-end pipeline that included data storage, cleaning, analysis, visualization, and reporting. The project strengthened both my data analytics and cloud computing skills, preparing me for real-world industry projects.




