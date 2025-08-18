# cloud-mini-projects

## 📌 Project Title & Objective

**Title:** Hosting a Static Website on Amazon EC2

**Objective:** Deploy a simple static website (HTML, CSS, Image) on an Apache server running in an AWS EC2 instance.


## 🏗️ Architecture Diagram






## ⚙️ Implementation Steps

### Step 1: Launch EC2 Instance

1.Login to AWS Management Console → Go to EC2 → Launch instance.

2.Select AMI, choose free-tier instance type (t2.micro), create a new Key Pair.

3.Configure Security Group:  
   - Allow SSH (22) → Connect instance from terminal.  
   - Allow HTTP (80) → Public website access.
     
4.Click Launch Instance.  


### Step 2: Connect to EC2 Instance

1.Go to EC2 → Instances and select your instance.
2.Click Connect → Now you are inside your EC2 server (terminal).

### Step 3: Install Apache Web Server 
Run these commands inside your EC2 instance:  

```bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
```
✅ Test by opening http://<Public-IP> → you should see Apache Test Page.

### Step 4: Create Project Folder & Structure

Run these commands inside your EC2 instance:  

- Go to apache's default folder
```bash
cd /var/www/html
```
sudo mkdir project
cd project
sudo mkdir css images
ls -R
```
### Step 5: 
