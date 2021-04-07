# HDB Price Prediction Project
  Kindly follow the steps below, if you want to deploy this web appliacation to your cloud. 

## Prerequisite Installation
  #### 1. Strongly recommend to deploy the web application in **AWS Cloud9**, using an **Amazon Linux 2**. 
  You may follow the steps [here](https://docs.aws.amazon.com/cloud9/latest/user-guide/setup-express.html)
  #### 2. Clone this repo to local
  ```
  git clone https://github.com/JXTryAgain/cs5224.git
  ```
  #### 3. Terraform Setup [ref](https://learn.hashicorp.com/tutorials/terraform/install-cli)
  ```
  sudo yum install -y yum-utils
  sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
  sudo yum -y install terraform
  terraform info
  ```
  #### 4. Docker Installation
  In order to build images locally and push them to ECR, you need to have Docker installed on your local machine.
  ```
  sudo yum update -y
  sudo amazon-linux-extras install docker
  sudo yum install docker
  sudo service docker start
  sudo usermod -a -G docker ec2-user
  docker info
  ```
  #### 5. Serverless Setup
  ```
  npm install serverless -g
  ```
 ## Deployment instructions
  #### 1. Terraform Deploy [ref](https://www.terraform.io/docs/cli/run/index.html)
  ```
  cd infra/
  terraform init
  terraform plan
  terraform apply -auto-approve
  ```
  Pleas wait for the infrastructure creation to be completed. You may expect to have VPC, subnet, internet gateway and rounter etc. to be auto setuped
  #### 2. Serverless Deploy
  ```
  cd hdb-price-prediction
  npm init (press Enter all the way)
  npm install --save serverless-python-requirements
  sls deploy
  ```
    
