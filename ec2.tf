# key-paire

resource "aws_key_pair" "my-key" {
  key_name   = "${var.env}-key-pair"
  public_key = file("/home/ritik.shah@iqinfinite.in/Desktop/Docs/modul-app/infra-app/terr-key-ec2.pub")
  tags = {
    Environment = var.env
  }

}

#vpc and securitty group
resource "aws_default_vpc" "default" {
  # This resource is used to get the default VPC in the region
}
resource "aws_security_group" "allow_ssh" {
  vpc_id      = aws_default_vpc.default.id
  name        = "${var.env}-grp-sg"
  description = "Allow SSH inbound traffic"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access"
  }

#   ingress {
#     from_port   = 8000
#     to_port     = 8000
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow Flask access"
#   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.env}-env-sg"
  }
}

#ec2 instance

resource "aws_instance" "aws-instance" {
  count = var.instance_count
  key_name        = aws_key_pair.my-key.key_name
  security_groups = [aws_security_group.allow_ssh.name]
  instance_type   = var.instance_type
  ami             = var.ec2_ami_id
#    user_data       = file("nginx-install.sh")
  root_block_device {
    volume_size = var.env == "prod" ? 10 : 8
    volume_type = "gp3"

  }
  tags = {
    Name = "${var.env}-env-instance"
  }

}


# resource "aws_instance" "my_new_instance" {
#   ami = "unknown"
#   instance_type = "unknown"

#   }
