resource "aws_key_pair" "deployer" {
  key_name   = "${var.env}-terra-automate-key"
  public_key = file("/workspaces/terraform-aws-multi-stage/multi-infra/keys/multi-stage-key.pub")
}

resource "aws_instance" "ec2_instance" {
  count = var.instance_count
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.terra-multi-stage.name]
  tags = {
    Name = "${var.env}-terra-test-instance"
    Environment = var.env
  }

  root_block_device {
    volume_size = var.volume_size 
    volume_type = "gp3"
  }

}



