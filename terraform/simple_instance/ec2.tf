provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "2aef1b9c2d380bd1a4d40d87cc06928debf8096b"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-01-26 23:17:23"
    git_last_modified_by = "72487682+deborabr21@users.noreply.github.com"
    git_modifiers        = "72487682+deborabr21"
    git_org              = "deborabr21"
    git_repo             = "terragoat"
    yor_trace            = "7c6e3427-0719-496d-92d0-6576cfcbda6a"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "2aef1b9c2d380bd1a4d40d87cc06928debf8096b"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-01-26 23:17:23"
    git_last_modified_by = "72487682+deborabr21@users.noreply.github.com"
    git_modifiers        = "72487682+deborabr21"
    git_org              = "deborabr21"
    git_repo             = "terragoat"
    yor_trace            = "164ccc60-2323-4517-9b98-f3c680ee0789"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
