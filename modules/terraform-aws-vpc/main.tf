resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.name}-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  cidr_block              = var.public_subnets[count.index]
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone       = element(var.azs, count.index)
  tags = {
    Name        = "${var.name}-public-${var.environment}-${count.index + 1}"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "${var.name}-${var.environment}"
    Environment = var.environment
  }
}


##### Create Public Route Table
resource "aws_route_table" "main_pbl" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  lifecycle {
    ignore_changes = [route]
  }

  tags = {
    Name        = "${var.name}-${var.environment}"
    Environment = var.environment
  }
}

##### Route Table Association for Public Subnets
resource "aws_route_table_association" "main_pbl_route_association" {
  count          = length(var.public_subnets)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.main_pbl.id
}