terraform {
  backend "s3" {
    bucket = "devopsyolu-runner-terraform-state"
    key    = "runner.tfstate"
    region = "eu-west-1"
  }
}
