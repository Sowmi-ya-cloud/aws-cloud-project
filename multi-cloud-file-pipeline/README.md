# 🌩 Serverless Notification System with AWS

## 📌 Project Title & Objective

**Title:** Auto-Notify: Event-Driven Notification System  

**Objective:** Build a serverless system that sends notifications when a new item is added to DynamoDB using AWS Lambda and SNS, while staying free-tier safe.

## 🏗️ Architecture Diagram

## ⚙️ Steps (Implementation Guide)

#### 1️⃣ Create a DynamoDB Table

- Table Name: UserRegistrations  
- Primary Key: user_id (String)
- Add at least 2 sample users manually.

#### 2️⃣ Create an SNS Topic

- Topic Name: UserNotifyTopic 
- Add your personal email as a subscriber.  
- Confirm subscription via email.

#### 3️⃣ Create a Lambda Function
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

####4️⃣ Test the System

- Add a new item in DynamoDB (e.g., user_id: 12345).

- Check your email inbox for notification.
