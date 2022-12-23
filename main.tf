resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  

  tags = {
    "Name" = "myvpc"
  }
}

resource "aws_subnet" "publicSubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.publicSubnet_cidr
  availability_zone = var.az

  tags = {
    "Name" = "PublicSubnet"
  }
}

resource "aws_internet_gateway" "internetGateway" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    "Name" = "internetGateway"
  }
}

resource "aws_route_table" "routeTable" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetGateway.id
  }

  tags = {
    "Name" = "routeRT"
  }
}

resource "aws_route_table_association" "routeAssoc" {
  route_table_id      = aws_route_table.routeTable.id
  subnet_id  = aws_subnet.publicSubnet.id
}