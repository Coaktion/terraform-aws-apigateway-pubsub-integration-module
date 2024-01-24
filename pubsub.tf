module "pubsub" {
  source          = "github.com/Coaktion/terraform-aws-apigateway-pubsub-integration-module"
  queues          = local.queues
  topics          = local.topics
  fifo            = var.fifo
  default_tags    = var.default_tags
  resource_prefix = var.resource_prefix
  account_id      = var.account_id
}
