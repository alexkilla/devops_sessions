resource "aws_nat_gateway" "private_nat" {
  allocation_id = element(aws_eip.nat_ip.*.id, count.index)
  subnet_id= element(aws_subnet.public_subnets.*.id, count.index)
  count= length(aws_subnet.public_subnets)
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.main.id
  count= length(aws_nat_gateway.private_nat)
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.private_nat.*.id, count.index)
  }
  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_route_table_association" "route_table_private" {
  # count          = "${length(var.public_subnets)}"
  count          = length(aws_nat_gateway.private_nat)
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = element(aws_route_table.route_table_private.*.id, count.index)
}

resource "aws_eip" "nat_ip" {
  count = length(aws_subnet.public_subnets)
  vpc   = true
}
