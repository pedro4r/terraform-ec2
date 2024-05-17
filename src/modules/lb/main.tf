resource "aws_lb" "alb" {
  name               = "free-tier-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_security_group_id]
  subnets            = [var.lb_public_subnet_1_id, var.lb_public_subnet_2_id, var.lb_public_subnet_3_id]

  tags = {
    Name = "Free Tier ALB"
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "free-tier-alb-tg-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.lb_vpc_id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "alb_tg_attachment_1" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.lb_target_id_1
}

resource "aws_lb_target_group_attachment" "alb_tg_attachment_2" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.lb_target_id_2
}

resource "aws_lb_target_group_attachment" "alb_tg_attachment_3" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = var.lb_target_id_3
}