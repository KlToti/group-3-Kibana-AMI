variable "vpc_name" {
    description = "Name of VPC for EKL Project"
    type = string
}

variable "public_subnet_name" {
    description = "Name of the public Subnet"
    type = string
}

variable "ubuntu_name" {
    description = "Name of ubuntu version"
    type = string
}

variable "ami_owner" {
    description = "ID of AMI owner"
    type = string
}

variable "keypair_name" {
  
}