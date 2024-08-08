output "alb_dns_name" {
  description = "DNS name of ALB"
  value = aws_alb.application_load_balancer.dns_name
}