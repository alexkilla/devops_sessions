variable "environment" {
  description = "name of environment"
}

variable "ami" {
  description = "name of the ami to use (operationg system)"
}
variable "public_subnets" {
  type = list(string)
}

variable "public_cidrs" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "key_name" {
   type = string
 }

variable "vpc_id" { }