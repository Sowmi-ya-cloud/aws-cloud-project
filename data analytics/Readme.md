# Data Analytics on Cloud

## 📌 Project Title & Objective

**Title:** Data Analytics on Cloud: Building an End-to-End Pipeline within AWS Free Tier

**Objective:** The goal of this project is to help you understand how data analytics workflows run on the cloud, from storing raw data to cleaning, analyzing, and visualizing it — all while staying within the AWS Free Tier.

## 🏗️ Architecture Diagram

## Implementation steps

### Step 1: Dataset Collection & Upload

 •	Selected COVID-19 global dataset from Kaggle.

 •	Purpose:
   To analyze COVID-19 spread trends and observe patterns between countries over time.
 
 •	Uploaded dataset to an AWS S3 bucket under /raw_data/.
 
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/5d3f0b8b-2057-4734-a004-4448dcb32b6c" />

`Python code: 

from google.colab import files                           # Upload dataset 
uploaded = files.upload()

import pandas as pd                                      # Import libraries 
import numpy as np

df = pd.read_csv("covid_19_clean_complete.csv")          # Load dataset 

df.head()                                                # Inspect data
df.info()
df.shape`
df.describe()

### Step 2: Data Cleaning


✅ Test by opening http://<Public-IP> → you should see Apache Test Page.
