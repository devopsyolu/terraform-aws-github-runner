locals {
  environment = var.environment
  aws_region  = var.aws_region

  # Load runner configurations from Yaml files
  multi_runner_config_files = {
    for c in fileset("${path.module}/templates/runner-configs", "*.yaml") :

    trimsuffix(c, ".yaml") => yamldecode(file("${path.module}/templates/runner-configs/${c}"))
  }
  multi_runner_config = {
    for k, v in local.multi_runner_config_files :

    k => merge(
      v,
      {
        runner_config = merge(
          v.runner_config,
          {
            subnet_ids = lookup(v.runner_config, "subnet_ids", null)
            vpc_id     = lookup(v.runner_config, "vpc_id", null)
          }
        )
      }
    )
  }
}

resource "random_id" "random" {
  byte_length = 20
}

module "github-runner_multi-runner" {
  source  = "philips-labs/github-runner/aws//modules/multi-runner"
  version = "6.0.0"
  # insert the 5 required variables here
  multi_runner_config = local.multi_runner_config
  aws_region                        = local.aws_region
  vpc_id                            = "vpc-01bba5a6501e760e7"
  subnet_ids                        = ["subnet-0583bef60a534450c","subnet-0562d708ddbcc814a"]
  runners_scale_up_lambda_timeout   = 60
  runners_scale_down_lambda_timeout = 60
  prefix                            = local.environment
  tags = {
    cost = "runner"
  }
  github_app = {
    key_base64     = var.github_app.key_base64
    id             = var.github_app.id
    webhook_secret = random_id.random.hex
  }

  # Deploy webhook using the EventBridge
  eventbridge = {
    enable = true
    # adjust the allow events to only allow specific events, like workflow_job
    accept_events = ["workflow_job"]
  }

  # enable this section for tracing
  # tracing_config = {
  #   mode                  = "Active"
  #   capture_error         = true
  #   capture_http_requests = true
  # }
  # Assuming local build lambda's to use pre build ones, uncomment the lines below and download the
  # lambda zip files lambda_download
  webhook_lambda_zip                = "../lambdas-download/webhook.zip"
  runner_binaries_syncer_lambda_zip = "../lambdas-download/runner-binaries-syncer.zip"
  runners_lambda_zip                = "../lambdas-download/runners.zip"

  # Enable debug logging for the lambda functions
  # log_level = "debug"

  # Enable to track the spot instance termination warning
  # instance_termination_watcher = {
  #   enable         = true
  # }

  # Enable metrics
  # metrics = {
  #   enable = true
  #   metric = {
  #     enable_github_app_rate_limit    = true
  #     enable_job_retry                = false
  #     enable_spot_termination_warning = true
  #   }
  # }
}

module "webhook_github_app" {
  source  = "philips-labs/github-runner/aws//modules/webhook-github-app"
  version = "6.0.0"
  depends_on = [module.github-runner_multi-runner]

  github_app = {
    key_base64     = var.github_app.key_base64
    id             = var.github_app.id
    webhook_secret = random_id.random.hex
  }
  webhook_endpoint = module.github-runner_multi-runner.webhook.endpoint
}
