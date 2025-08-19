# 🌩 Serverless Notification System with AWS

## 📌 Project Title & Objective

**Title:** Auto-Notify: Event-Driven Notification System  

**Objective:** Build a serverless system that sends notifications when a new item is added to DynamoDB using AWS Lambda and SNS, while staying free-tier safe.

## 🏗️ Architecture Diagram

## ⚙️ Steps (Implementation Guide)

#### Step 1: Create a DynamoDB Table

- Table Name: UserRegistrations  
- Primary Key: user_id (String)
- Add at least 2 sample users manually.

#### Step 2: Create an SNS Topic

- Topic Name: UserNotifyTopic 
- Add your personal email as a subscriber.  
- Confirm subscription via email.

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

<img width="940" height="470" alt="image" src="https://github.com/user-attachments/assets/c6554398-b051-4638-88f5-d50168d40dd8" />

✅ SNS subscription confirmed.

<img width="931" height="219" alt="image" src="https://github.com/user-attachments/assets/49815ec1-0eaa-4333-8fbc-c6a354ee1c00" />

✅ Lambda triggered successfully → Email notification received.

<img width="978" height="456" alt="image" src="https://github.com/user-attachments/assets/4c758c8b-5a0a-4344-b041-f2cff3f250db" />
