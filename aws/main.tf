locals {
  project_name = random_pet.pet.id
  server_port  = 8080
  ssh_port     = 22
}

module "server" {
  source = "./ec2"

  name          = local.project_name
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"

  busy_box_port    = local.server_port

  ingress_rules = {
    "Serve http port" = {
      from_port   = local.server_port
      to_port     = local.server_port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "Allow SSH" = {
      from_port   = local.ssh_port
      to_port     = local.ssh_port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress_rules = {
    "Allow all outbound" = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "random_pet" "pet" {
  length = 5
}

data "aws_caller_identity" "current" {}
