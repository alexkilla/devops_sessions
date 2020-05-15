module "ami" {
  source = "../../modules/ami"
}

module "node_instances" {
  source = "../../modules/nodejs_instances"
  environment = "develop"
  key_name = "develop_key"
  ami = "${module.ami.ubuntu_ami}" 
}


