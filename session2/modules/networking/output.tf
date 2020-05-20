output "public_subnets" {
  value       = "${aws_subnet.public_subnets.*.id}"
  description = "List of ids of public subnets"
}

output "vpc" {
  value = "${aws_vpc.main.id}"
  description= "id of the main vpc"
}