## 📌 Project Title & Objective

**Title:** Multi-Cloud Serverless File Processing Pipeline  
**Objective:** Learn how to create an event-driven file processing pipeline in AWS and Azure using only free-tier services, without billing risks.

## 🏗️ Architecture Diagram

<img width="736" height="624" alt="image" src="https://github.com/user-attachments/assets/4e45b0bc-08a3-46ee-bc78-6b658c6de81f" />


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

## 📊 Results

✅ DynamoDB table created with users.


<img width="740" height="470" alt="image" src="https://github.com/user-attachments/assets/c6554398-b051-4638-88f5-d50168d40dd8" />



✅ SNS subscription confirmed.


<img width="831" height="219" alt="image" src="https://github.com/user-attachments/assets/49815ec1-0eaa-4333-8fbc-c6a354ee1c00" />



✅ Lambda triggered successfully → Email notification received.


<img width="778" height="456" alt="image" src="https://github.com/user-attachments/assets/4c758c8b-5a0a-4344-b041-f2cff3f250db" />


## 🧹 Cleanup Instructions

- Delete Lambda function

- Delete SNS topic & subscriptions

- Delete DynamoDB table

- Verify billing dashboard → ensure $0 usage

## ✍️ Reflection

- What I Learned: How DynamoDB, Lambda, and SNS integrate in a serverless workflow.

- Challenges Faced: IAM permission errors for Lambda → fixed by updating role.

- Possible Improvements: Extend notifications to SMS/Slack or add validation logic.
