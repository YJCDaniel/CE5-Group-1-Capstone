data "aws_ecr_repository" "existing" {
  name = var.repository_name
}

resource "aws_ecr_repository" "new" {
  count = length(data.aws_ecr_repository.existing.*.name) > 0 ? 0 : 1
  name  = var.repository_name
}
