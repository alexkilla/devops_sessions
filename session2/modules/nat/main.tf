resource "aws_internet_gateway" "main" {
  vpc_id = "${var.vpc_id}"
}

resource "aws_route_table" "route_table_public" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_route_table_association" "route_table_public" {
  # count          = "${length(var.public_subnets)}"
  count          = 2
  subnet_id      = "${element(var.public_subnets, count.index)}"
  route_table_id = "${aws_route_table.route_table_public.id}"
}

