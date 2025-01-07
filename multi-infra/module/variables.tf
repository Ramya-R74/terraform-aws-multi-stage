variable "ami" {
  description = "ami of my ec2 instance"
  type = string
}

variable "instance_type" {
  description = "Type of my instance"
  type = string

}
variable "key_name" {
  description = "EC2 instance key"
  type = string
}

variable "security_grp" {
  description = "EC2 instance sg"
  type = string
}

variable "instance_count" {
  description = "Number of instance created"
  type = number
}

variable "env" {
  description = "Environment of the block"
  type = string
}

variable "volume_size" {
    description = "This is the size of Root EBS for AWS EC2"
    type = number
}