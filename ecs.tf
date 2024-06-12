resource "aws_ecs_task_definition" "own_task_definition" {
  family                    = var.ecs_task_defn_family
  requires_compatibilities  = ["FARGATE"]
  network_mode              = "awsvpc"
  execution_role_arn        = var.ex_role_arn
  cpu                       = 2048
  memory                    = 4096

  
  container_definitions = templatefile("./files/ecr-task-definition.json", {
    image_url        = "${var.ecr_url}/${var.ecr_image_name}:latest"
    port_name        = var.ecs_port_name
    container_name   = var.ecs_container_name
    log_group_region = "us-east-1"
    log_group_name   = "/ecs/${var.ecs_task_defn_family}"
    log_group_prefix = "ecs"
  })
}

resource "aws_ecs_cluster" "own_cluster" {
  name = var.ecs_cluster_name
}


resource "aws_ecs_service" "own_service" {
  name             = var.ecs_service_name 
  cluster          = aws_ecs_cluster.own_cluster.arn
  task_definition  = aws_ecs_task_definition.own_task_definition.arn
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  
  force_new_deployment = true

  deployment_circuit_breaker {
    enable          = true
    rollback        = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs-alb-tg.arn
    container_name   = var.ecs_container_name
    container_port   = 3000
  }

  network_configuration {
    subnets          = data.aws_subnets.existing_subnets.ids
    assign_public_ip = true
    security_groups = [var.sg_id]
  }
}