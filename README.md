# HDB Price Prediction Project
  Kindly follow the steps below, if you want to deploy this web appliacation to your cloud. 
  or you can set up the web application locally
  
## Test Web Application
  Pleas access this URL: `ec2-54-224-212-7.compute-1.amazonaws.com`
  Navigate to **Prediction**
  ```
  town_name: HDB location you are interested (e.g. JURONG WEST)
  area: HDB areas (e.g. 100)
  lease_year: HDB Established year (e.g. 1999)
  storey: HDB Floor you are interested (e.g. 10)
  type: NO. of rooms you referred to (e.g. 3)
  year: Which year you intent to buy a HDB (e.g. 2021)
  ```
  Click **Submit** then you will get a prediction price
 ## Deploy Web Application in your own cloud 
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
  terraform -version
  ```
  #### 4. Terraform Deploy [ref](https://www.terraform.io/docs/cli/run/index.html)
  ```
  cd cs5224/infra/
  terraform init
  terraform plan
  terraform apply -auto-approve
  ```
  Pleas wait for the infrastructure creation to be completed. You may expect to have VPC, subnet, internet gateway and rounter etc. to be auto setuped
  #### 5. After Deployment 
  Wait for the instance to be ready and copy Public IPv4 DNS address and paste it to a brownser
  you should be able to see the webpage
  then follow the steps in **Test Web Application in AWS** to test
