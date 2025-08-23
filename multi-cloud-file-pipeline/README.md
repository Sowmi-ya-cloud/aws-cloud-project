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

<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/43d2daa3-718d-488c-955a-42be7d53350b" />

#### Step 2: Create a Lambda Function

- Create function → Choose Author from scratch.
- Function name: FileLoggerLambda.
- Runtime: Python 3.9 (or latest free option).
- Permissions: Use default role with basic Lambda execution.
- Click Create function.

<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/a90a0acd-c398-46d0-b772-5092f8b6f807" />

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

<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/0f70181a-6505-4d14-a9c4-8162248318c8" />

#### Step 4: Connect S3 trigger

-  Go to Configuration → Triggers → Add trigger.
-  Select S3, choose your bucket.
-  Event type: PUT (upload event).
-  Save.

<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/abc0c19b-5a29-47b5-9d36-884f057c6545" />

#### Step 5: Test

- Upload test.txt → check CloudWatch Logs.
- You should see: File uploaded: test.txt.

<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/cde2ab21-ecbc-4a9f-b3cd-c701348f3ae7" />

## 📊 Results

✅ S3 Bucket created.

✅ Lambda function triggered on file upload.

✅ Log generated in CloudWatch.

<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/23e197aa-27fb-42e1-b990-80cb8bc07f1e" />


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

<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/15ec552e-61f4-427f-a80b-c9dbcb8607c8" />

#### Step 2: Create a blob Container

- Open your storage account → Containers → + Container.
- Name: files.
- Public access: Private.
- Create.

<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/f0d8b1d8-1ffc-4b6b-8ca6-93531974e046" />

#### Step 3: Create an Azure Function 

- Name: studentfunctionyourname.
- Runtime stack: Python (or Node.js).
- Hosting: Consumption Plan (always free for low usage).
- Link it to the same Resource Group.
- Create.
<img width="436" height="424" alt="image" src="https://github.com/user-attachments/assets/b339a87c-9df1-4343-a168-69ed2437881c" />

#### Step 4: Add a Blob trigger function (VS Code)

- Install: .NET 6 SDK
- Azure Functions Core Tools MSI
- VS Code Azure Functions Extension
- In VS Code → Ctrl+Shift+P → Azure Functions: Create New Project
- Language: C# (.NET 6, In-process)
- Template: Blob Trigger
- Function name: BlobLogger
- Path: files/{name}
- Storage: AzureWebJobsStorage
- Update local.settings.json with your Azure Storage connection string.

                       or
  
- Inside your Function App → Functions → + Add → Blob trigger.
- Name: BlobLogger.
- Path: files/{name}.
- Storage account: select your account
  
#### Step 5: Add Code 

```
using System;
using System.IO;
using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Logging;

namespace Company.Function
{
    public static class BlobLogger
    {
        [FunctionName("BlobLogger")]
        public static void Run(
            [BlobTrigger("files/{name}", Connection = "AzureWebJobsStorage")] Stream myBlob,
            string name,
            ILogger log)
        {
            log.LogInformation($"File uploaded: {name}, Size: {myBlob.Length} bytes");
        }
    }
}

```
<img width="500" height="500" alt="image" src="https://github.com/user-attachments/assets/37389953-c837-4106-963b-951fe6b7cc52" />

#### Step 6: Test

- Upload a file to the files container in your storage account.

Expected log:

File uploaded: azuretest.txt, Size: 200 bytes

<img width="500 " height="500" alt="image" src="https://github.com/user-attachments/assets/b0245dfd-e0c5-435e-afc3-948c0239e4dd" />

#### Step 7: Deploy to Azure

- In VS Code, open Azure tab (left panel)

- Right-click your project → Deploy to Function App

- Select your existing Function App (studentfunction<yourname>)

Now the Blob Trigger function is live in Azure. 🚀

## 📊 Results

✅ Storage account + blob container created in Azure.

✅ Function App created in Azure.

✅ Blob Trigger function created in VS Code with C# code.

✅ Deployment successful → File uploads trigger logs in Function App.

## 🧹 Cleanup Instructions

- Delete Function App.

- Delete Storage Account.

- Delete Resource Group.

- Confirm $0 usage in billing dashboard.

## ✍️ Reflection

- What I Learned: Blob triggers automatically invoke Azure Functions.
  
- Challenges I Faced: Linking storage account to function correctly.

- Possible Improvements: Could extend Function to send email alerts using Logic Apps.
