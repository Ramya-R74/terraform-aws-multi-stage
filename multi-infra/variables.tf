variable "ami" {
  description = "ami of my ec2 instance"
  type = string
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "instance-type" {
  description = "Type of my instance"
  type = string

}
variable "key-name" {
  description = "My instance key"
  type = string
}

variable "security-grp" {
  description = "My instance sg"
  type = string
}

variable "instance-count" {
  description = "Number of instance created"
  type = number
}

variable "env" {
  description = "Environment of the block"
  type = string
}

variable "volume-size" {
    description = "This is the size of Root EBS for AWS EC2"
    type = number
}