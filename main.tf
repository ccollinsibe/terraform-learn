provider "aws" {
  region = "eu-north-1"
}

variable "cidr_blocks" {
  description = "cidr blocks for vpc and subnets"
  type = list(object({
    cidr_block = string 
    name = string
  }))
}

resource "aws_vpc" "terraform-vpc" {
  cidr_block = var.cidr_blocks[0].cidr_block
  tags = {
    Name: var.cidr_blocks[0].name 
  }
}

resource "aws_subnet" "terraform-subnet-1" {
  vpc_id = aws_vpc.terraform-vpc.id
  cidr_block = var.cidr_blocks[1].cidr_block
  availability_zone = "eu-north-1a"
  tags = {
    Name = var.cidr_blocks[1].name
  }
}

#Environmental Variable