
resource "aws_instance" "ubuntu" {
    #ami           = lookup(var.ami_linux, var.aws_region)
    ami = var.ami_hdb_webserver
    instance_type = "t2.micro"
    # VPC
    subnet_id = aws_subnet.project-subnet-public-1.id
    # Security Group
    vpc_security_group_ids = [aws_security_group.ssh-allowed.id]
    # the Public SSH key
    key_name = "cs5224"
    
    /*
    provisioner "file" {
        source      = "./hdb.service"
        destination = "/tmp/hdb.service"
    }
    
    provisioner "file" {
        source      = "./default"
        destination = "/tmp/default"
    }
    
    provisioner "file" {
        source      = "../source/hdb.zip"
        destination = "/tmp/hdb.zip"
    }
    provisioner "remote-exec" {
        inline = [
          "sudo apt-get update",
          "sudo apt-get install python3-venv -y",
          "mkdir hdb && cd hdb",
          "python3 -m venv venv",
          "source venv/bin/activate",
          "pip install flask",
          "sudo apt-get install unzip -y",
          #"wget https://cs5224-hdb-price-prediction.s3.amazonaws.com/hdb.zip",
          "sudo cp -f /tmp/hdb.zip ./hdb.zip",
          "unzip hdb.zip -d .",
          "pip install gunicorn",
          "sudo cp -f /tmp/hdb.service /etc/systemd/system/hdb.service",
          "sudo systemctl daemon-reload",
          "sudo systemctl start hdb",
          "sudo systemctl enable hdb",
          "sudo apt-get install nginx -y",
          "sudo systemctl start nginx",
          "sudo systemctl enable nginx",
          "sudo cp -f /tmp/default /etc/nginx/sites-available/default",
          "sudo systemctl restart nginx",
        ]
    }
    
    connection {
        type        = "ssh"
        host        = self.public_ip
        user        = "ubuntu"
        private_key = file("~/environment/cs5224.pem")
    }
    */
    tags = {
        "Name"      = "hdb-webserver"
        "Terraform" = "true"
    }
}
