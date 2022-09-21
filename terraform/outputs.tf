output "jenkins_1_url" {
  value = module.jenkins_server.jenkins_1_url
}

output "jenkins_2_url" {
  value = module.jenkins_server.jenkins_2_url
}

output "alb_dns" {
  value = module.load_balancer.alb_dns
}