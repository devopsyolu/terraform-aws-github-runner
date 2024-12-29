terraform {
  backend "s3" {
    bucket = "devopsyolu-runner-terraform-state"
    key    = "lambda-download.tfstate"
    region = "eu-west-1"
  }
}
