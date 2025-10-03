## 📌 Project Title & Objective

**Title:** Cloud-Based E-Commerce Application on AWS

**Objective:** Deploy a dummy e-commerce web application using AWS cloud services, integrating backend (Node.js on EC2), frontend (HTML/CSS on S3), database (DynamoDB), IAM security, serverless functions (Lambda), and CI/CD pipeline.

## 🏗️ Architecture Diagram



## ⚙️ Implementation Steps
### Step 1: VPC & Networking

1. Created custom VPC with public/private subnets.

2. Configured Internet Gateway, Route Tables, Security Groups.

3. Enabled inbound rules (22 for SSH, 80/443 for HTTP/HTTPS, 3000 for backend testing).

### Step 2: Backend on EC2

1. Launched EC2 (t2.micro free tier) instance in public subnet.

2. Installed Node.js & NPM.

3. Deployed backend (server.js) to handle /products API.

4. Tested using EC2 Public IP + Port 3000.

5. curl http://<EC2-Public-IP>:3000/products

### Step 3: Frontend on S3

1.Created S3 bucket with Static Website Hosting enabled.

2. Uploaded products.html, style.css.

3. Linked frontend to backend API (fetch() call with EC2/Lambda API URL).

### Step 4: IAM Roles & Policies

1. Created IAM Role for EC2 with limited S3 access (least privilege).

2. Attached custom policy allowing only GetObject and PutObject for project bucket.

### Step 5: Serverless with Lambda + API Gateway

1. Created Lambda function (order-confirmation) to send email notification using SNS.

2. Integrated with API Gateway (REST API) for frontend trigger.

3. Updated frontend “Place Order” button → calls API Gateway Invoke URL.

    fetch("https://<api-id>.execute-api.us-east-1.amazonaws.com/default/ecommerce-app", {
       method: "POST",
    body: JSON.stringify({ productId: id })
    });

### Step 6: CI/CD Pipeline

1. Connected GitHub → CodePipeline → S3 for frontend.

2. Skipped build/test (static files).

3. Verified pipeline → GitHub push automatically updates website.

## 📊 Results

✅ Backend: Accessible at EC2 Public IP:3000 → returns product JSON.

✅ Frontend: Loads from S3 static hosting → shows product list.

✅ Order Flow: Clicking Place Order → triggers Lambda → sends confirmation email.

✅ CI/CD: Any GitHub update → reflected on S3 site automatically.

## 🧹 Cleanup Instructions

1. Stop/Terminate EC2 instance.

2. Delete Load Balancer, Auto Scaling Group, and unused EIPs.

3. Empty & delete S3 buckets.

4. Delete Lambda/API Gateway if no longer needed.

## 📝 Reflection

1. Learned how different AWS services connect in a real project.

2. Understood IAM Least Privilege principle.

3. Gained hands-on practice with VPC, EC2, S3, IAM, Lambda, API Gateway, CodePipeline.

4. Practiced cost optimization (free tier + cleanup).
