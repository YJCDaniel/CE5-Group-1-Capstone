# Creates a task definition using the files/task-definition.json
# HINT: if you would like to use your own docker image, update the container_definitions image_url
# accordingly

resource "aws_ecs_task_definition" "own_task_definition" {
  family                    = var.ecs_task_defn_family # Update accordingly
  requires_compatibilities  = ["FARGATE"]
  network_mode              = "awsvpc"
  execution_role_arn        = var.ex_role_arn
  cpu                       = 2048
  memory                    = 4096

  # For custom ECR image
  # container_definitions = templatefile("./files/task-definition.json", {
  #   image_url        = "255945442255.dkr.ecr.us-east-1.amazonaws.com/luqman-test-ecr-repo:latest"
  #   container_name   = "CE5-Group1-ecs"
  #   port_name        = "CE5-Group1-ecs-8080-tcp"
  #   log_group_region = "us-east-1"
  #   log_group_name   = "/ecs/CE5grp1taskdef"
  #   log_group_prefix = "ecs"
  # })

  # For nginx image
  container_definitions = templatefile("./files/ecr-task-definition.json", {
    image_url        = "${var.ecr_url}/${var.ecr_image_name}:latest"
    port_name        = var.ecs_port_name
    container_name   = var.ecs_container_name
    log_group_region = "us-east-1"
    log_group_name   = "/ecs/${var.ecs_task_defn_family}" # Change accordingly
    log_group_prefix = "ecs"
  })
}

resource "aws_ecs_cluster" "own_cluster" {
  name = var.ecs_cluster_name # Update in variables.tf
}

# Creates an ecs service

resource "aws_ecs_service" "own_service" {
  name             = var.ecs_service_name # Update in variables.tf
  cluster          = aws_ecs_cluster.own_cluster.arn
  task_definition  = aws_ecs_task_definition.own_task_definition.arn
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  # Force a new deployment of task definition
  force_new_deployment = true

  deployment_circuit_breaker {
    enable          = true
    rollback        = true
  }

  load_balancer {
    target_group_arn = CE5_group1_target_group.ecs-alb-tg.arn
    container_name   = var.ecs_container_name
    container_port   = 3000
  }

  network_configuration {
    subnets          = data.aws_subnets.existing_subnets.ids
    assign_public_ip = true
    security_groups = [var.sg_id]
  }
}