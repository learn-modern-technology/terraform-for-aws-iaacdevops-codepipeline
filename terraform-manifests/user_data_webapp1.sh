#! /bin/bash
## Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start
sudo echo "<h1> Welcome to WebServer-01 Happy Learning </h1>" | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/webapp1
sudo echo  '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Terraform course - Happy Learning</h1> <p>Learn ALB Context Based routing using Terraform - Web Server -01</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/webapp1/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/webapp1/metadata.html