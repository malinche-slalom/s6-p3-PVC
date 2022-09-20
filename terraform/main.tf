terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = var.profile
  region  = var.region
}

module "security_group" {
  source = "./modules/sg"
}

module "launch_configuration" {
  source = "./modules/launch-config"

  security_groups = ["${module.security_group.sg_name}"]
}

module "autoscaling_group" {
  source = "./modules/asg"

  launch_config = module.launch_configuration.launch_config
}

module "jenkins_server" {
  source = "./modules/jenkins-server"

  security_groups = ["${module.security_group.sg_name}"]
}
