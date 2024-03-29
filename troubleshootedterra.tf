provider aws {
    region =  "us-east-1"
    access_key = "AKIAYARVJHEY25VB3AX4"
    secret_key = "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"
}

#instance creation

resource "aws_instance" "r100c96" {
  ami           = "ami-05c13eab67c5d8861" 
  instance_type = "t2.small"
  subnet_id      = aws_subnet.publicsub1.id


  tags = {
    Name = "terraform instance"
  }
}

#vpc creation
resource "aws_vpc" "terraform" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "terraform"
  }
}

resource "aws_subnet" "publicsub1" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "subentsub1"
  }
}


resource "aws_subnet" "publicsub2" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "subentsub2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name = "gw"
  }
}

resource "aws_route_table" "terraform_rw" {
  vpc_id = aws_vpc.terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "terraform_rw"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.publicsub1.id
  route_table_id = aws_route_table.terraform_rw.id
}

resource "aws_db_subnet_group" "default" {
  name       = "def"
  description = "Example DB Subnet Group"
  subnet_ids = ["subnet-010bdf46ac39eb4d5","subnet-054523a4beb799a18"]  # Specify your subnet IDs
}

resource "aws_db_instance" "testing" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "dbuser"
  password             = "dbpassword"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.default.name
}


resource "aws_s3_bucket" "b" {
  bucket = "my-tf-testtechiev-bucket"
  acl    = "private"
  tags = {
    Name        = "My tf bucket"
    Environment = "Dev"
  }
}