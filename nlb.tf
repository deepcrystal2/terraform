// internal nlb 생성

resource "aws_lb" "network_load_balancer" {
  name = "was-internal-nlb"
  internal = true
  load_balancer_type = "network"
  security_groups = [aws_security_group.in_nlb_security_group.id]
  subnets = [aws_subnet.private_web_subnet_1.id,aws_subnet.private_web_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "jy-in-nlb"
  }
}

// in-nlb-tg 생성
resource "aws_lb_target_group" "nlb_target_group" {
  name = "jy-nlb-tg"
  port = 8080
  protocol = "TCP"
  vpc_id = aws_vpc.vpc_01.id

  health_check {
    port = 8080
    protocol = "TCP"
  }
}

// ex-alb-tg 연결
resource "aws_lb_target_group_attachment" "was_attachment" {
  target_group_arn = aws_lb_target_group.nlb_target_group.arn
  target_id        = aws_instance.private_app_template.id
  port = 8080
}

// listener 8080 forwarding
resource "aws_lb_listener" "nlb_http_listener" {
  load_balancer_arn = aws_lb.network_load_balancer.arn
  port = 8080
  protocol = "TCP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.nlb_target_group.arn
  }
}