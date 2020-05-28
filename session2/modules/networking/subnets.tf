resource "aws_subnet" "public_subnets" {
  count  = 2
  vpc_id = aws_vpc.main.id

  cidr_block        = var.public_cidrs[count.index]

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count  = 2
  vpc_id = aws_vpc.main.id

  cidr_block = var.private_cidrs[count.index]

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}