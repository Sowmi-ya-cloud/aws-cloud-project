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

     •	Allow SSH 22 – for connecting to instance via terminal.
     •	Allow HTTP 80 – for public access to website.

4.Click Launch Instance.

