packer {
    required_plugins {
        amazon = {
            version = ">= 1.1.1"
            source = "github.com/hashicorp/amazon"
            
        }
    }
}

#Datasource for AMI
data "amazon-ami" "ubuntu" {
    filters = {
        name = var.source_ami_name
    }
        owners = [var.ami_owner]
        most_recent = true

 }
