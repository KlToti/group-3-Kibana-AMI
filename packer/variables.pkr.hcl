variable "instance_type" {
    type = string
    description = "Source EC2 Instance type"
}

variable "region" {
    description = "Region wehre to launche source EC2 Instance"
}

variable "ami_owner" {
    description = "Owner of source AMI"
}

variable "source_ami_name" {
    description = "Name of source AMI"
}

variable "vpc_name" {
    description = "Name of VPC"
}

variable "subnet_name" {
    description = "Name of Subnet"
}
