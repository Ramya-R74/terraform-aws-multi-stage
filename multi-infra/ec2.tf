resource "aws_key_pair" "deployer" {
  key_name   = "${var.env}-terra-automate-key"
  public_key = file("/workspaces/terraform-aws-multi-stage/multi-infra/keys/multi-stage-key.pub")
}

resource "aws_instance" "ec2_instance" {
  ami = var.ami
  instance_type = var.instance-type
  security_groups = aws_security_group.multi-stage-sg.name
  key_name = aws_key_pair.deployer
  
   tags = {
    Name = "${var.env}-multi-stage-instance"
    Environment = var.env
  }

  root_block_device {
    volume_size = var.volume-size 
    volume_type = "gp3"
  }

}