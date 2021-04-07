data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "project-vpc" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink   = "false"
    instance_tenancy     = "default"
    
    tags = {
        Name = "project-vpc"
    }
}

resource "aws_subnet" "project-subnet-public-1" {
    vpc_id                  = aws_vpc.project-vpc.id
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone       = data.aws_availability_zones.available.names[1]
    
    tags = {
        Name = "project-subnet-public-1"
    }
}
