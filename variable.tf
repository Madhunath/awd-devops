variable "region" {
  default = "us-west-2"
  access_key = "AKIAYARVJHEYSNGIUYOM"
  secret_key = "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"

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  default = "us-west-2a" 
}

variable "ami_id" {
  default = "ami-0ee4f2271a4df2d7d"
}