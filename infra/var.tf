variable "aws_region" {
    default = "us-east-1"
}

variable "instance_name" {
    default = "hdb-webserver"
}

variable "ami_linux" {
    type = map(string)
    default = {
        us-east-1 = "ami-013f17f36f8b1fefb"
    }
}

variable "ingressrules" {
  type    = list(number)
  default = [80, 443, 22, 8080]
}