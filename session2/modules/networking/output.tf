output "public_subnets" {
  value       = "${aws_subnet.public_subnets.*.id}"
  description = "List of ids of public subnets"
}