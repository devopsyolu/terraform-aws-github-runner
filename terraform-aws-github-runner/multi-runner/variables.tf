# data "aws_ssm_parameter" "github_app_id" gibi awsden cekecegin zaman variable olarak tanimlamaya gerek yok.

# variable "github_app" {
#   description = "GitHub for API usages."

#   type = object({
#     id         = string
#     key_base64 = string
#   })
# }

variable "environment" {
  description = "Environment name, used as prefix"

  type    = string
  default = "runner"
}

variable "aws_region" {
  description = "AWS region to deploy to"

  type    = string
  default = "eu-west-1"
}
