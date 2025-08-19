# cloud-mini-projects

## 📌 Project Title & Objective

**Title:** Hosting a Static Website on Amazon EC2

**Objective:** Deploy a simple static website (HTML, CSS, Image) on an Apache server running in an AWS EC2 instance.


## 🏗️ Architecture Diagram

<img width="900" height="900" alt="image" src="https://github.com/user-attachments/assets/7283f4e4-b406-4392-9be6-a8d363caffc0" />

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

### Step 4: Setup Project (Folders, HTML, CSS, Images)

Run these commands inside your EC2 instance:  

  - Go to apache's default folder
```bash
cd /var/www/html
```
  - Make a New Project Folder & two sub-folders
```
sudo mkdir project
cd project
sudo mkdir css images
```
  - Create Homepage & Aboutpage
```
sudo nano index.html

<html>
 <head>
 <title>My First Cloud Website</title>
 <link rel="stylesheet" href="css/style.css">
 </head>
 <body>
 <h1>Hello from EC2 </h1>
 <p>This is hosted by a Cloud Intern!</p>
 <a href="about.html">About Us</a>
 <br>
 <img src="images/logo.png" width="100">
 </body>
</html>

sudo nano about.html

<html>
 <body>
 <h2>About Us</h2>
 <p>This project was deployed by cloud interns!</p>
 </body>
</html>
```

- Add the CSS (style file)
```
cd css
sudo nano style.css

body {
 background-color: lightblue;
}
```
  - Add a Dummy image file
```
cd ../images
sudo touch logo.png
```
  - Go back to project folder and check structure
```
cd ..
ls -R
```
 ✅ This will show all folders and files inside your project folder.

 ## 📊 Results 

  - Open in Browser
```
http://<your-public-ip>/project/index.html
```
  👉 Public IP is shown below the terminal in your EC2 instance page.

  - Your homepage should load with:
  
        • Blue background

        • Heading

        • About Us link

        • Fake image (broken logo is fine)
  ## 🧹 Cleanup Instructions

   1.After testing, stop or terminate the EC2 instance to avoid charges
   
   2.Go to EC2 → Instances → Select instance → Instance state → Stop/Terminate.

  ## 📝 Reflection

    - I Learned how to host a static website on AWS EC2 using Apache.

    - Faced small issues with file permissions (fixed using sudo).

    - Improved understanding of folder structure (HTML, CSS, Images).

