resource "aws_ecr_repository" "new" {
  count = length(data.aws_ecr_repository.existing.*.name) > 0 ? 0 : 1
  name  = var.ecr_repository_name
}
data "aws_ecr_repository" "existing" {
  name = var.ecr_repository_name
}