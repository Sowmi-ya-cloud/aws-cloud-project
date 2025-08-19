# 🌩 Serverless Notification System with AWS

## 📌 Project Title & Objective

Title: Multi-Cloud Serverless File Processing Pipeline  
Objective: Learn how to create an event-driven file processing pipeline in AWS and Azure using only free-tier services, without billing risks.

## 🏗️ Architecture Diagram



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

#### Step 3: Create a Lambda Function
- Trigger: DynamoDB stream on `INSERT`.  
- Role: Grant access to read from DynamoDB and publish to SNS.
- Logic: When new user is added, publish a message to SNS like:
  
       “A new user has registered with ID: 12345”
  
- Code Example:
```python
 import boto3

 sns = boto3.client('sns')

  def lambda_handler(event, context):
  
      for record in event['Records']:
      
          if record['eventName'] == 'INSERT':
      
              user_id = record['dynamodb']['Keys']['user_id']['S']
              
              message = f"A new user has registered with ID: {user_id}"
              
              sns.publish(
              
                  TopicArn="arn:aws:sns:REGION:ACCOUNT_ID:UserNotifyTopic",
                  
                  Message=message
                  
              )
              
      return {"status": "done"}
```

#### Step 4: Test the System

- Add a new item in DynamoDB (e.g., user_id: 12345).

- Check your email inbox for notification.

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
