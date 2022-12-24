<<<<<<< HEAD

# Creating a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr


  tags = {
    "Name" = "myvpc"
  }
}

# Public Subnet
resource "aws_subnet" "publicSubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.publicSubnet_cidr
  availability_zone = var.az

  tags = {
    "Name" = "PublicSubnet"
  }
}

# Private Subnet

resource "aws_subnet" "privateSubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.privateSubnet_cidr
  availability_zone = var.privateAZ

  tags = {
    "Name" = "PrivateSubnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "internetGateway" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    "Name" = "internetGateway"
  }
}

# Route table
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

# Route table association
resource "aws_route_table_association" "routeAssoc" {
  route_table_id = aws_route_table.routeTable.id
  subnet_id      = aws_subnet.publicSubnet.id
}

=======

# Creating a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr


  tags = {
    "Name" = "myvpc"
  }
}

# Public Subnet
resource "aws_subnet" "publicSubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.publicSubnet_cidr
  availability_zone = var.az

  tags = {
    "Name" = "PublicSubnet"
  }
}

# Private Subnet

/*resource "aws_subnet" "privateSubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.privateSubnet_cidr
  availability_zone = var.az

  tags = {
    "Name" = "PrivateSubnet"
  }
}*/

# Internet Gateway
resource "aws_internet_gateway" "internetGateway" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    "Name" = "internetGateway"
  }
}

# Route table
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

# Route table association
resource "aws_route_table_association" "routeAssoc" {
  route_table_id = aws_route_table.routeTable.id
  subnet_id      = aws_subnet.publicSubnet.id
}

>>>>>>> 54decd396b311d70aad360b87af8521fa4de235c
