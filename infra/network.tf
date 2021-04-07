resource "aws_internet_gateway" "project-igw" {
    vpc_id = aws_vpc.project-vpc.id
    tags = {
        Name = "project-igw"
    }
}

resource "aws_route_table" "project-public-crt" {
    vpc_id = aws_vpc.project-vpc.id
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0"
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.project-igw.id
    }
    
    tags = {
        Name = "project-public-crt"
    }
}

resource "aws_route_table_association" "project-crta-public-subnet-1" {
    subnet_id      = aws_subnet.project-subnet-public-1.id
    route_table_id = aws_route_table.project-public-crt.id
}

resource "aws_security_group" "ssh-allowed" {
  vpc_id = aws_vpc.project-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  dynamic "ingress" {
      iterator = port
      for_each = var.ingressrules
      
      content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
      }
  }
  
  tags = {
    Name = "ssh-allowed"
  }
}