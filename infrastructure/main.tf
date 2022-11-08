data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = [var.ubuntu_name]
  }
  owners = [var.ami_owner] # Canonical
}

data "aws_vpc" "elk_vpc" {
  filter {
    name = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public_subnet" {
  filter {
    name = "tag:Name"
    values = [var.public_subnet_name]
  }
}

