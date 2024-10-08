// external alb 생성

resource "aws_alb" "application_load_balancer" {
  name = "web-external-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.ex_alb_security_group.id]
  subnets = [aws_subnet.public_subnet_1.id,aws_subnet.public_subnet_2.id]
  enable_deletion_protection = false

  tags = {
    Name = "jy-ex-alb"
  }
}

// ex-alb-tg 생성
resource "aws_alb_target_group" "alb_target_group" {
  name = "jy-alb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc_01.id
}

// ex-alb-tg 연결
resource "aws_alb_target_group_attachment" "web_attachment" {
  target_group_arn = aws_alb_target_group.alb_target_group.arn
  target_id        = aws_instance.private_web_template.id
  port = 80
}

/* listener 80 -> 443 redirection
resource "aws_alb_listener" "alb_http_listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port =80
  protocol = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port = 443
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


// listener 443 forwarding
resource "aws_alb_listener" "alb_https_listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port = 443
  protocol = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:ap-northeast-2:966600044384:certificate/ceee196f-1f8e-4c62-8fa9-d7ad64a3f278"


  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.alb_target_group.arn
  }
}
 */


// listener 80 forwarding
resource "aws_alb_listener" "alb_http_listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.alb_target_group.arn
  }
}