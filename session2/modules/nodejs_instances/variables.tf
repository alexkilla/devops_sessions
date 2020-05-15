variable "environment" {
  description = "name of environment"
}

variable "ami" {
  description = "name of the ami to use (operationg system)"
}
variable "public_subnets" {
  type = list(string)
}
