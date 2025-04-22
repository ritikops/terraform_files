# key-paire

resource "aws_key_pair" "my-key" {
    key_name   = "terr-key-ec2"
    public_key = file("terr-key-ec2.pub")

}

#vpc and securitty group
resource "aws_default_vpc" "default" {
  # This resource is used to get the default VPC in the region
}
resource "aws_security_group" "allow_ssh" {
    vpc_id = aws_default_vpc.default.id
    name = "automate-sg"
    description = "Allow SSH inbound traffic"
  
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]     
    description = "Allow HTTP access"
  }

  ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    description = "Allow Flask access"
  }

    egress {   
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }

    tags = {
    Name = "automate-sg"
  }
}

  #ec2 instance

resource "aws_instance" "aws-instance" {
    key_name = aws_key_pair.my-key.key_name
    security_groups = [aws_security_group.allow_ssh.name]
    instance_type = "t2.micro"
    ami = var.ec2_image_id
    user_data = file("install_nginx.sh")
    root_block_device {
        volume_size = var.ec2_root_storage
        volume_type = "gp3"

    }
    tags = {
        Name = "ritik-ec2"
    }
  
}

