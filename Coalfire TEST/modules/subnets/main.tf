resource "aws_subnet" "public" {
  count                   = length(var.azs)
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${var.azs[count.index]}"
  }
}

resource "aws_subnet" "wp" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = var.wp_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "wp-${var.azs[count.index]}"
  }
}

resource "aws_subnet" "db" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = var.db_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "db-${var.azs[count.index]}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name = "public-route"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}