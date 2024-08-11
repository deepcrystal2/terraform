output "alb_dns_name" {
  description = "DNS name of ALB"
  value = aws_alb.application_load_balancer.dns_name
}

output "openvpn_public_ip" {
  value = aws_eip.eip_openvpn.public_ip
  description = "public ip of openvpn"
}