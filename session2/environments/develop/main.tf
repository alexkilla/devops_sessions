resource "aws_key_pair" "access_key" {
  key_name   = "develop_aws_ssh_access"
  public_key = file("../../private/ssh/develop_aws_ssh_access.pub")
}

module "ami" {
  source = "../../modules/ami"
}

module "networking" {
  source = "../../modules/networking"
}

module "node_instances" {
  key_name= "${aws_key_pair.access_key.id}"
  vpc_id= "${module.networking.vpc}"
  source = "../../modules/nodejs_instances"
  environment = "develop"
  ami = "${module.ami.ubuntu_ami}"
  public_subnets= "${module.networking.public_subnets}"
  private_subnets= "${module.networking.private_subnets}"
  public_cidrs= "${module.networking.public_cidrs}"
}




