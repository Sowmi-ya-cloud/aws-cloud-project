## 📌 Project Title & Objective

**Title:** Multi-Cloud Serverless File Processing Pipeline  
**Objective:** Learn how to create an event-driven file processing pipeline in AWS and Azure using only free-tier services, without billing risks.

## 🏗️ Architecture Diagram

<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/4e45b0bc-08a3-46ee-bc78-6b658c6de81f" />  <img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/5ef92907-0055-4609-acac-e45a4048e91c" />

## ⚙️ Steps (Implementation Guide)

### 🟧 Part 1: AWS File Processing

#### Step 1: Create an S3 Bucket

 - Name: student-file-bucket-yourname.
 - Region: US East (N. Virginia) (to maximize free tier).
 - Leave defaults → Create bucket.
     
#### Step 2: Create a Lambda Function

- Create function → Choose Author from scratch.
- Function name: FileLoggerLambda.
- Runtime: Python 3.9 (or latest free option).
- Permissions: Use default role with basic Lambda execution.
- Click Create function.

#### Step 3: Add Code to Lambda

   ```python
   import json

   def lambda_handler(event, context):
       for record in event['Records']:
           file_name = record['s3']['object']['key']
           print(f"File uploaded: {file_name}")
       return {
           'statusCode': 200,
           'body': json.dumps('File processed successfully!')
       }
      
```
click deploy

#### Step 4: Connect S3 trigger

-  Go to Configuration → Triggers → Add trigger.
-  Select S3, choose your bucket.
-  Event type: PUT (upload event).
-  Save.

#### Step 4: Test

- Upload test.txt → check CloudWatch Logs.
- You should see: File uploaded: test.txt.

## 📊 Results

✅ S3 Bucket created.

✅ Lambda function triggered on file upload.

✅ Log generated in CloudWatch.

## 🧹 Cleanup Instructions

- Delete S3 Bucket.

- Delete Lambda Function.

- Verify billing dashboard → ensure $0 usage.

## ✍️ Reflection

- What I Learned: How S3 events can trigger Lambda in a serverless workflow.
  
- Challenges I Faced: Setting correct S3 → Lambda trigger permissions.

- Possible Improvements: Could extend Lambda to process file content (e.g., parse CSV).

### 🟧 Part 2: Azure File Processing

#### Step 1: Create a Storage Account

 - Go to Azure Portal → Storage Accounts → Create.
 - Resource Group: create a new one (e.g., FilePipelineRG).
 - Name: studentstorageyourname.
 - Region: East US (free tier recommended).
 - Performance: Standard → Locally-redundant storage (LRS).
 - Click Review + Create
     
#### Step 2: Create a blob Container

- Open your storage account → Containers → + Container.
- Name: files.
- Public access: Private.
- Create.

#### Step 3: Create an Azure Function 

- Name: studentfunctionyourname.
- Runtime stack: Python (or Node.js).
- Hosting: Consumption Plan (always free for low usage).
- Link it to the same Resource Group.
- Create.

#### Step 4: Add a Blob trigger function

- Inside your Function App → Functions → + Add → Blob trigger.
- Name: BlobLogger.
- Path: files/{name}.
- Storage account: select your account
  
#### Step 5: Add Code 

Example Python code:

   ```python

 import logging

def main(myblob: func.InputStream):

 logging.info(f"File uploaded: {myblob.name}, Size: {myblob.length}

bytes")

```
click deploy

#### Step 6: Test

- Upload azuretest.txt → check Monitor Logs.

- Expected: File uploaded: files/azuretest.txt, Size: X bytes

## 📊 Results

✅ Storage account + Blob created.

✅ Function App triggered correctly.

✅ Logs generated in Azure Monitor.

## 🧹 Cleanup Instructions

- Delete Function App.

- Delete Storage Account.

- Delete Resource Group.

- Confirm $0 usage in billing dashboard.

## ✍️ Reflection

- What I Learned: Blob triggers automatically invoke Azure Functions.
  
- Challenges I Faced: Linking storage account to function correctly.

- Possible Improvements: Could extend Function to send email alerts using Logic Apps.
