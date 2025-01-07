# dev-infra
module "dev_infra" {
    source = "./module"
    ami = "ami-0a094c309b87cc107"
    instance_type = "t2.micro"
    instance_count = 2
    env = "dev"
    volume_size = 10
    key_name = "${var.env}-terra-automate-key"
    security_grp = "${var.env}-terra-multi-stage-sg"
}

# stage-infra
module "stage_infra" {
    source = "./module"
    ami = "ami-0a094c309b87cc107"
    instance_type = "t2.small"
    instance_count = 1
    env = "stage"
    volume_size = 10
    key_name = "${var.env}-terra-automate-key"
    security_grp = "${var.env}-terra-multi-stage-sg"
}

# prod-infra
module "prod_infra" {
    source = "./module"
    ami = "ami-0a094c309b87cc107"
    instance_type = "t2.medium"
    instance_count = 2
    env = "prod"
    volume_size = 10
    key_name = "${var.env}-terra-automate-key"
    security_grp = "${var.env}-terra-multi-stage-sg"
}

# qa-infra
module "qa_infra" {
    source = "./module"
    ami = "ami-0a094c309b87cc107"
    instance_type = "t2.nano"
    instance_count = 1
    env = "qa"
    volume_size = 8
    key_name = "${var.env}-terra-automate-key"
    security_grp = "${var.env}-terra-multi-stage-sg"
}

