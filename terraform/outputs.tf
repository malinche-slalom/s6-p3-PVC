# output "jenkins_url" {
#   value = module.jenkins_server.jenkins_url
# }

output "alb_dns" {
  value = module.load_balancer.alb_dns
}