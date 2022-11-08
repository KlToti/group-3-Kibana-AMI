resource "aws_instance" "web_server" {
  ami                       = data.aws_ami.ubuntu.id
  instance_type             = "t3.medium"
  subnet_id                 = data.aws_subnet.public_subnet.id
  vpc_security_group_ids   = [aws_security_group.web-server.id]
  key_name                  = var.keypair_name

  tags = {
    Name = "public_server"
  }
}

resource "aws_security_group" "web-server" {
  name        = "ansible-web-server"
  description = "SG for Web Server"
  vpc_id      = data.aws_vpc.elk_vpc.id

  # INBOUND CONNECTIONS
  ingress {
    description = "Access to SSH app"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # INBOUND CONNECTIONS
  ingress {
    description = "Access to our Flask app"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # OUTBOUT CONNECTIONS
  egress {
    description = "Access to the internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP PROTOCOL
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ansible-web-server"
  }
}