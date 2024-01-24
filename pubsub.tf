module "pubsub" {
  source          = "github.com/Coaktion/terraform-aws-pubsub-module"
  queues          = local.queues
  topics          = local.topics
  fifo            = var.fifo
  default_tags    = var.default_tags
  resource_prefix = var.resource_prefix
  account_id      = var.account_id
}
