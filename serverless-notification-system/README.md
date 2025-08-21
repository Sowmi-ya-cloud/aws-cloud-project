# 🌩 Serverless Notification System with AWS

## 📌 Project Title & Objective

**Title:** Auto-Notify: Event-Driven Notification System  

**Objective:** Build a serverless system that sends notifications when a new item is added to DynamoDB using AWS Lambda and SNS, while staying free-tier safe.

## 🏗️ Architecture Diagram

<img width="536" height="524" alt="image" src="https://github.com/user-attachments/assets/fb5b13cf-4f79-4c59-bae0-f7caf1ff3a99" />


## ⚙️ Steps (Implementation Guide)

#### Step 1: Create a DynamoDB Table

- Table Name: UserRegistrations  
- Primary Key: user_id (String)
- Add at least 2 sample users manually.

<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/c6554398-b051-4638-88f5-d50168d40dd8" />

#### Step 2: Create an SNS Topic

- Topic Name: UserNotifyTopic 
- Add your personal email as a subscriber.  
- Confirm subscription via email.

<img width="500" height="499" alt="image" src="https://github.com/user-attachments/assets/ee74a05c-5f3a-4268-8a07-53f7857adfbe" />

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
<img width="500" height="499" alt="image" src="https://github.com/user-attachments/assets/414790dd-f867-45bc-9648-0875346fa2fd" />

#### Step 4: Test the System

- Add a new item in DynamoDB (e.g., user_id: 12345).

- Check your email inbox for notification.

## 📊 Results

✅ DynamoDB table created with users.

✅ SNS subscription confirmed.

<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/49815ec1-0eaa-4333-8fbc-c6a354ee1c00" />

✅ Lambda triggered successfully → Email notification received.

<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/ec36acf8-f8c8-4c88-8a3a-803e69e2a9c9" />

## 🧹 Cleanup Instructions

- Delete Lambda function

- Delete SNS topic & subscriptions

- Delete DynamoDB table

- Verify billing dashboard → ensure $0 usage

## ✍️ Reflection

- What I Learned: How DynamoDB, Lambda, and SNS integrate in a serverless workflow.

- Challenges Faced: IAM permission errors for Lambda → fixed by updating role.

- Possible Improvements: Extend notifications to SMS/Slack or add validation logic.
