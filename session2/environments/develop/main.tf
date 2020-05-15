module "ami" {
  source = "../../modules/ami"
}

module "networking" {
  source = "../../modules/networking"
}

module "node_instances" {
  source = "../../modules/nodejs_instances"
  environment = "develop"
  ami = "${module.ami.ubuntu_ami}"
  public_subnets= "${module.networking.public_subnets}"
}


