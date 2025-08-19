## 📌 Project Title & Objective

**Title:** Multi-Cloud Serverless File Processing Pipeline  
**Objective:** Learn how to create an event-driven file processing pipeline in AWS and Azure using only free-tier services, without billing risks.

## 🏗️ Architecture Diagram

<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/4e45b0bc-08a3-46ee-bc78-6b658c6de81f" />  <img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/5ef92907-0055-4609-acac-e45a4048e91c" />

## ⚙️ Steps (Implementation Guide)

### 🟧 Part 1: AWS File Processing

#### Step 1: Create an S3 Bucket

 - Go to AWS Console → S3 → Create bucket.
 - Name: student-file-bucket-yourname.
 - Region: US East (N. Virginia) (to maximize free tier).
 - Leave defaults → Create bucket.
     
#### Step 2: Create a Lambda Function

- Go to AWS Console → Lambda → Create function.
- Choose Author from scratch.
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

-  In Lambda function → Go to Configuration → Triggers → Add trigger.
-  Select S3, choose your bucket.
-  Event type: PUT (upload event).
-  Save.

#### Step 4: Test

- Upload a text file (test.txt) to the S3 bucket.
- Go to CloudWatch Logs → check the Lambda log.
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

#### Step 1: Create an S3 Bucket

 - Go to AWS Console → S3 → Create bucket.
 - Name: student-file-bucket-yourname.
 - Region: US East (N. Virginia) (to maximize free tier).
 - Leave defaults → Create bucket.
     
#### Step 2: Create a Lambda Function

- Go to AWS Console → Lambda → Create function.
- Choose Author from scratch.
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

-  In Lambda function → Go to Configuration → Triggers → Add trigger.
-  Select S3, choose your bucket.
-  Event type: PUT (upload event).
-  Save.

#### Step 4: Test

- Upload a text file (test.txt) to the S3 bucket.
- Go to CloudWatch Logs → check the Lambda log.
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
