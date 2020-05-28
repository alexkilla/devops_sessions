output "vpc" {
  value = "${aws_vpc.main.id}"
  description= "id of the main vpc"
}
output "public_subnets" {
  value       = "${aws_subnet.public_subnets.*.id}"
  description = "List of ids of public subnets"
}
output "private_subnets" {
  value       = "${aws_subnet.private_subnets.*.id}"
  description = "List of ids of private subnets"
}

output "public_cidrs" {
  value = var.public_cidrs
}