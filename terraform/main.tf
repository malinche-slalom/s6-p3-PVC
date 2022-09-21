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

module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/sg"

  vpc_id = module.vpc.vpc_id
}

# module "jenkins_server_role" {
#   source = "./modules/iam/jenkins-server"
# }

module "web_server_role" {
  source = "./modules/iam/web-server"
}

module "load_balancer" {
  source = "./modules/alb"

  security_groups = ["${module.security_group.sg_id}"]
  target_id = module.autoscaling_group.instance_id
  vpc_id = module.vpc.vpc_id
  subnet_1 = module.vpc.subnet_1_id
  subnet_2 = module.vpc.subnet_2_id
}

module "launch_configuration" {
  source = "./modules/launch-config"

  security_groups = ["${module.security_group.sg_id}"]
  iam_role = module.web_server_role.name
}

module "autoscaling_group" {
  source = "./modules/asg"

  launch_config = module.launch_configuration.launch_config
  tg_arn = module.load_balancer.tg_arn
  subnet_1 = module.vpc.subnet_1_id
  subnet_2 = module.vpc.subnet_2_id
}

# module "jenkins_server" {
#   source = "./modules/jenkins-server"

#   security_groups = ["${module.security_group.sg_name}"]
#   iam_role = module.jenkins_server_role.name
# }

module "artifact_bucket" {
  source = "./modules/s3"
}
