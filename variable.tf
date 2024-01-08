variable "aws_region" {
  default = "us-east-2"
}

variable "aws_access_key" {
  default = "AKIAYARVJHEYSNGIUYOM"
}

variable "aws_secret_key" {
  default = "T5YXhXjURyDGnTUmtFBIeDbHTveW/Jm9bjriw23w"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  default = "us-east-2a" 

}

variable "ami_id" {
  default = "ami-0ee4f2271a4df2d7d"
}
