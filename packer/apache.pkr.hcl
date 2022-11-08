locals {
    timestamp = regex_replace(timestamp(), "[-TZ:]", "")
}

source "amazon-ebs" "ubuntu" {
    ami_name = "kibana-on-ubuntu-${local.timestamp}"
    instance_type = var.instance_type
    region = var.region
    source_ami = data.amazon-ami.ubuntu.id
    ssh_username = "ubuntu"
    vpc_filter {
        filters = {
            "tag:Name" : var.vpc_name
        }
    }
    subnet_filter {
        filters = {
            "tag:Name" : var.subnet_name
        }
    }
}

build {
    name = "ibs-builder"
    sources = [
        "source.amazon-ebs.ubuntu"
    ]
    provisioner "ansible" {
        playbook_file = "ansible/playbook.yml"
    }
}