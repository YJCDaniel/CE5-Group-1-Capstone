
resource "aws_lb" "ecs-alb" {
  name               = "ce5-grp1-ecs-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = toset(data.aws_subnets.existing_subnets.ids)

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "ecs-alb-tg" {
  name        = "ce5-drp1-ecs-target-group"
  target_type = "ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.existing_vpc.id
  health_check {
    path      = "/"
    protocol  = "HTTP"
    interval = 300
  } 
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.ecs-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs-alb-tg.arn
  }
}
