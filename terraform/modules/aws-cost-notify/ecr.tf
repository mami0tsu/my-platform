resource "aws_ecr_repository" "this" {
  name = "${var.stage}-${var.service_name}"
}

data "aws_ecr_authorization_token" "this" {}

resource "null_resource" "this" {
  provisioner "local-exec" {
    command = <<-EOF
            docker build ${var.service_repository_url} -t ${aws_ecr_repository.this.repository_url}:latest; \
            docker login -u AWS -p ${data.aws_ecr_authorization_token.this.password} ${data.aws_ecr_authorization_token.this.proxy_endpoint}; \
            docker push ${aws_ecr_repository.this.repository_url}:latest
        EOF
  }
}
