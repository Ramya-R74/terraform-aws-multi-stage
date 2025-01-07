variable "ami" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "volume_size" {
    type = number
}
resource "aws_default_vpc" "default" {}

resource "aws_security_group" "my_test_sg" {
  name        = "My-sg"
  description = "Allow user to connect via SG"
  vpc_id      = aws_default_vpc.default.id
  ingress {
    description = "port 22 allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = " allow all outgoing traffic "
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 80 allow"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port 443 allow"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "My-sq"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "my-remote-instance-key"
  public_key = file("/workspaces/terraform-aws-multi-stage/remote-state-lock/remote-lock.pub")
}

resource "aws_instance" "my_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.my_test_sg.name]
  tags = {
    Name = "-my-test-remote-instance"
  }

  root_block_device {
    volume_size = var.volume_size 
    volume_type = "gp3"
  }
}

output "ec2_public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "ec2_type" {
  value = aws_instance.my_instance.instance_type
}
