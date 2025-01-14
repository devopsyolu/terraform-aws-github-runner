output "webhook_endpoint" {
  value = module.github-runner_multi-runner.webhook.endpoint
}

output "webhook_secret" {
  sensitive = true
  value     = random_id.random.hex
}
